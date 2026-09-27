---
name: add-toc
description: Detect and generate PDF bookmarks (chapter/section outline) for textbooks in Textbooks/ that are missing them.
---

# /add-toc — Generate textbook bookmarks

Scope: PDFs in `Textbooks/` only (artin-algebra, atiyahmacdonald, Hatcher,
lee_smooth_manifolds, Radin-Sadungraphontextbook). Course-specific textbooks
elsewhere in the repo (e.g. `ComplexAnalysis/Textbook.pdf`) are out of scope.

The plumbing lives in `Textbooks/scripts/toc_tool.py`, run through its venv:

```
Textbooks/scripts/.venv/bin/python Textbooks/scripts/toc_tool.py <subcommand> ...
```

If `Textbooks/scripts/.venv` doesn't exist yet, create it first:

```
python3 -m venv Textbooks/scripts/.venv
Textbooks/scripts/.venv/bin/pip install -r Textbooks/scripts/requirements.txt
```

The script only does mechanical PDF I/O (dump text/fonts, write bookmarks,
back up the original). **You do the judgment** — reading the printed TOC,
matching titles to real page numbers, telling headings from body text. Don't
try to replace that with a generic regex; each book's TOC page is formatted
differently and the payoff of a one-size-fits-all parser isn't there for five
books.

## Workflow, per book

1. **Check whether it needs this at all.**
   `toc_tool.py status *.pdf` — skip any book that already has bookmarks
   (artin-algebra, Hatcher, and lee_smooth_manifolds shipped with publisher
   bookmarks already; don't touch those unless asked). The status line also
   flags `[no text layer, needs --ocr]` for scanned books (atiyahmacdonald is
   scanned; everything else here has a text layer).

2. **Find the printed table of contents.**
   `toc_tool.py text <pdf> --start 1 --end 15` (add `--ocr` if flagged above)
   and look for the "Contents"/"Table of Contents" page(s). Read the chapter
   and section titles plus their *printed* page numbers directly from that
   text dump.

3. **Resolve printed page numbers to actual PDF page numbers.**
   Printed page 1 is rarely PDF page 1 — front matter (title page, preface,
   the TOC itself) comes first. Dump text around your best guess for where
   Chapter 1 starts (`toc_tool.py text <pdf> --start N --end N+2`) and confirm
   the chapter title actually appears there. Once you have one confirmed
   anchor, the offset (pdf_page = printed_page + offset) usually holds for
   the rest of the book — but spot-check a couple more entries near the
   middle/end, since offsets can drift (inserted plates, renumbered
   front matter, etc).

4. **Fall back to a heading scan if the TOC page is missing, unreadable, or
   clearly incomplete** (e.g. it only lists chapters but you also want
   sections, or OCR mangled it beyond repair):
   `toc_tool.py spans <pdf> --start N --end M --min-size 11` (add `--ocr` for
   scanned books) dumps each line with its font size and bold flag. Look for
   the size/weight tier(s) that correspond to chapter and section headings
   (distinct jump from body text size, often matching a numbering pattern
   like "Chapter 3" or "3.2 Title") and read off page numbers directly from
   the `p.N` prefix — no offset math needed here since these page numbers are
   already real PDF pages.

5. **Assemble the outline** as a JSON file:
   `[[level, title, pdf_page], ...]` — level 1 for chapters, 2 for sections,
   3 for subsections if you're going that deep. Keep it in the scratchpad
   directory, not the repo. Entries must be sorted by page number.

6. **Show the outline to Arham for a quick sanity check before writing**
   (titles + page count is enough — don't dump the whole JSON at him). This
   is the same kind of review the manual bookmark pass on
   `ComplexAnalysis/Textbook.pdf` got; skipping it is how a bad offset
   silently ships.

7. **Apply and verify:**
   ```
   toc_tool.py apply <pdf> <outline.json>
   toc_tool.py verify <pdf>
   ```
   `apply` backs up the original to `<pdf>.bak` before writing (it won't
   overwrite an existing `.bak`, so if one's already there from a prior
   attempt, check it's stale before re-running). Spot check `verify`'s output
   against the outline you built, then open the PDF and jump to a couple of
   bookmarks to confirm they land on the right page.

## Notes

- Never run `apply` without a human sanity-check of the outline first — a
  wrong page offset is silent and expensive to notice later.
- `.bak` files are working scratch, not something to commit blindly; check
  `git status` before committing so you're not accidentally shipping a stray
  backup (see git history: `ComplexAnalysis/Textbook.pdf.bak` is currently
  untracked cruft from the earlier manual pass).
