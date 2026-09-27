#!/usr/bin/env python3
"""PDF bookmark (outline) plumbing for textbooks in this directory.

This tool only does the mechanical parts (read text/fonts, write bookmarks,
back up the original). Deciding what the chapter/section structure actually
is — reading a printed table of contents, matching titles to real page
numbers, telling a heading from body text — is left to whoever is driving it
(see ../.claude/skills/add-toc/SKILL.md), since that judgment differs per book
and is fragile to hardcode as regexes.

Outline JSON format (input to `apply`, output of `verify`):
    [[level, title, pdf_page], ...]
  - level: 1 = chapter, 2 = section, 3 = subsection, etc.
  - pdf_page: 1-indexed PAGE NUMBER AS IT APPEARS IN THE PDF VIEWER
    (i.e. what you'd type into a page-jump box), not the printed page number
    in the book and not a 0-indexed array position.
"""

import argparse
import json
import shutil
import sys
from pathlib import Path

import pymupdf


def cmd_status(args):
    for path in args.pdfs:
        doc = pymupdf.open(path)
        toc = doc.get_toc(simple=True)
        sample_chars = sum(len(doc[i].get_text("text"))
                            for i in range(min(10, doc.page_count)))
        scanned_note = " [no text layer, needs --ocr]" if sample_chars == 0 else ""
        print(f"{path}: {doc.page_count} pages, {len(toc)} existing bookmark(s){scanned_note}")
        if toc and args.verbose:
            for level, title, page in toc:
                print(f"  {'  ' * (level - 1)}- {title!r} (p.{page})")
        doc.close()


def cmd_text(args):
    doc = pymupdf.open(args.pdf)
    start = max(args.start, 1)
    end = min(args.end or doc.page_count, doc.page_count)
    for pno in range(start, end + 1):
        page = doc[pno - 1]
        textpage = page.get_textpage_ocr(full=True) if args.ocr else None
        print(f"--- page {pno} ---")
        print(page.get_text("text", textpage=textpage))
    doc.close()


def cmd_spans(args):
    """Dump text lines with font size/weight, for heading-detection by eye."""
    doc = pymupdf.open(args.pdf)
    start = max(args.start, 1)
    end = min(args.end or doc.page_count, doc.page_count)
    for pno in range(start, end + 1):
        page = doc[pno - 1]
        textpage = page.get_textpage_ocr(full=True) if args.ocr else None
        blocks = page.get_text("dict", textpage=textpage)["blocks"]
        for block in blocks:
            for line in block.get("lines", []):
                spans = line.get("spans", [])
                if not spans:
                    continue
                text = "".join(s["text"] for s in spans).strip()
                if not text:
                    continue
                size = max(s["size"] for s in spans)
                bold = any("bold" in s["font"].lower() for s in spans)
                if args.min_size and size < args.min_size:
                    continue
                print(f"p.{pno}\tsize={size:.1f}\tbold={bold}\t{text}")
    doc.close()


def cmd_apply(args):
    pdf_path = Path(args.pdf)
    outline_data = json.loads(Path(args.outline).read_text())
    outline = [[int(lvl), str(title), int(page)] for lvl, title, page in outline_data]

    doc = pymupdf.open(pdf_path)
    for lvl, title, page in outline:
        if not (1 <= page <= doc.page_count):
            doc.close()
            sys.exit(f"error: outline entry {title!r} has page {page}, "
                      f"but {pdf_path} only has {doc.page_count} pages")
    doc.close()

    backup_path = pdf_path.with_suffix(pdf_path.suffix + ".bak")
    if not backup_path.exists():
        shutil.copy2(pdf_path, backup_path)
        print(f"backed up original to {backup_path}")
    else:
        print(f"backup already exists at {backup_path}, leaving it as-is")

    doc = pymupdf.open(pdf_path)
    doc.set_toc(outline)
    tmp_path = pdf_path.with_suffix(pdf_path.suffix + ".tmp")
    doc.save(tmp_path, garbage=3, deflate=True)
    doc.close()
    tmp_path.replace(pdf_path)
    print(f"wrote {len(outline)} bookmark(s) to {pdf_path}")


def cmd_verify(args):
    doc = pymupdf.open(args.pdf)
    toc = doc.get_toc(simple=True)
    print(json.dumps(toc, indent=2))
    doc.close()


def main():
    parser = argparse.ArgumentParser(description=__doc__,
                                      formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("status", help="show page count + existing bookmark count")
    p.add_argument("pdfs", nargs="+")
    p.add_argument("-v", "--verbose", action="store_true", help="print existing bookmarks")
    p.set_defaults(func=cmd_status)

    p = sub.add_parser("text", help="dump plain text of a page range (1-indexed, inclusive)")
    p.add_argument("pdf")
    p.add_argument("--start", type=int, default=1)
    p.add_argument("--end", type=int, default=None)
    p.add_argument("--ocr", action="store_true",
                    help="run tesseract OCR instead of reading the embedded text layer "
                         "(needed for scanned books with no text layer)")
    p.set_defaults(func=cmd_text)

    p = sub.add_parser("spans", help="dump text lines with font size/weight over a page range")
    p.add_argument("pdf")
    p.add_argument("--start", type=int, default=1)
    p.add_argument("--end", type=int, default=None)
    p.add_argument("--min-size", type=float, default=None,
                    help="only show lines with font size >= this, to cut body-text noise")
    p.add_argument("--ocr", action="store_true",
                    help="run tesseract OCR instead of reading the embedded text layer")
    p.set_defaults(func=cmd_spans)

    p = sub.add_parser("apply", help="write an outline JSON file as PDF bookmarks (backs up original)")
    p.add_argument("pdf")
    p.add_argument("outline", help="path to outline JSON: [[level, title, pdf_page], ...]")
    p.set_defaults(func=cmd_apply)

    p = sub.add_parser("verify", help="print the bookmarks currently embedded in a PDF")
    p.add_argument("pdf")
    p.set_defaults(func=cmd_verify)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
