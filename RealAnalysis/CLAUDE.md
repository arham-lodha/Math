# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Real Analysis coursework for Professor Wilfred Gangbo (MATH 245A). Documents are written in [Typst](https://typst.app/) and compiled to PDF. See the parent `CLAUDE.md` for full build commands, template reference, and the `@local/my-prelude:1.0.0` package API.

## Directory Layout

- `notes/` — lecture notes (two-sided book layout, `main.typ` + `template.typ` + `figures.typ` + `refs.bib`)
- `unprocessed_notes/` — raw scanned PDFs of handwritten notes, not yet typeset
- `Homework/homework-N/` — problem sets, each with `main.typ` + `template.typ`, transcribed from the assignment sheet at https://www.math.ucla.edu/~wgangbo/Academics/ass-245A.pdf

## Homework Template Specifics

`Homework/homework-N/template.typ` is a thin wrapper over `@local/math-homework:1.0.0` (see `../_shared/`). Problems use the package's optional `num:` argument to match the exercise numbers on the assignment sheet exactly (e.g. `#problem(num: "1.6")[...]`), with a trailing `*` on `num` for exercises marked (∗) on the sheet. Only starred exercises are collected and graded (two or three per set); the rest are suggested practice. Sub-parts use `#part[...]` inline inside the problem body. Solutions go in `#solution[...]` after the `#problem[...]` block, not nested inside it.

## Notes Document

The notes use the `notes` template with `cover: false` and `toc: false`. Key settings to change:

```typst
#show: notes.with(
  title: "Notes",
  author: "Arham Lodha",
  instructor: "Professor Wilfred Gangbo",
  cover: false,   // true → adds a title page
  toc: false,     // true → adds a table of contents
  bibliography-file: "refs.bib",
)
```

Figures are defined in `figures.typ` as `#let` bindings and called in `main.typ` as `#figs.<name>`. Add new figures there rather than inline in `main.typ`.

## Workflow for Typesetting Handwritten Notes

When transcribing PDFs from `unprocessed_notes/` into `notes/main.typ`:

1. Read the scanned PDF to extract content.
2. Add new chapters/sections using `= Chapter Title` / `== Section Title`.
3. Wrap definitions, theorems, lemmas, proofs in the appropriate environments from `@local/my-prelude`.
4. Add bibliography entries to `refs.bib` and cite with `@key`.
5. Run `typst compile main.typ` from `notes/` to verify the build.

## Hint Policy, Proactive Review, Post-Mortems

No course-specific deviations — follow the shared policies in `../CLAUDE.md`. Hints apply to anything in `Homework/`; log them to `struggles.md` and debriefs to `postmortems.md` in this directory.
