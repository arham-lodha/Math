# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This directory holds reference textbook PDFs (not coursework) used alongside
the Typst homework/notes in the rest of the `Math` repo — e.g.
`artin-algebra.pdf`, `atiyah_macdonald-commutative.pdf`, `Hatcher.pdf`,
`lee_smooth_manifolds.pdf`, `Radin-Sadungraphontextbook.pdf`. The only code
here is `scripts/toc_tool.py`, a utility for adding PDF bookmarks (outlines)
to books that don't already have them.

## Commands

Set up the tool's venv (first time only):

```
python3 -m venv scripts/.venv
scripts/.venv/bin/pip install -r scripts/requirements.txt
```

Run the tool (always through its venv, from the `Textbooks/` directory):

```
scripts/.venv/bin/python scripts/toc_tool.py status *.pdf         # page count + existing bookmark count
scripts/.venv/bin/python scripts/toc_tool.py text <pdf> --start N --end M   # dump plain text of a page range
scripts/.venv/bin/python scripts/toc_tool.py spans <pdf> --start N --end M --min-size 11  # text lines w/ font size, for heading detection
scripts/.venv/bin/python scripts/toc_tool.py apply <pdf> <outline.json>     # write bookmarks (backs up to <pdf>.bak first)
scripts/.venv/bin/python scripts/toc_tool.py verify <pdf>                  # print bookmarks currently embedded
```

`text`/`spans` take `--ocr` for scanned PDFs with no embedded text layer
(`status` flags these as `[no text layer, needs --ocr]`).

## Architecture

`toc_tool.py` deliberately does only mechanical PDF I/O: dumping text/font
spans, writing a bookmark outline via `pymupdf`, and backing up the original
before overwriting. It does **not** parse tables of contents or guess at
heading structure — matching a printed TOC's titles/page numbers to actual
PDF pages, or telling a heading from body text via font-size scan, is left to
whoever drives it, because each book's TOC/heading formatting differs enough
that a general parser isn't worth building for five books.

The outline format passed to `apply` (and printed by `verify`) is a flat JSON
list `[[level, title, pdf_page], ...]`:
- `level`: 1 = chapter, 2 = section, 3 = subsection, etc.
- `pdf_page`: 1-indexed page number as it appears in a PDF viewer's page-jump
  box — **not** the book's printed page number and not a 0-indexed array
  index. Printed page numbers from a TOC need an offset applied (front matter
  before Chapter 1) to become `pdf_page` values; that offset can drift across
  a book, so spot-check more than one entry.

The full per-book workflow (find the TOC, resolve the page offset, fall back
to a font-size heading scan when the TOC is missing/unreliable, get a human
sanity check before `apply`) is codified in the `/add-toc` skill
(`.claude/skills/add-toc/SKILL.md`) — read that before doing this work rather
than re-deriving the process. Key rule from it: never run `apply` without a
human check of the outline first, since a wrong page offset is silent and
expensive to notice later. `.bak` files produced by `apply` are working
scratch, not something to commit blindly.
