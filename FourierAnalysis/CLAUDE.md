# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

MATH 247A — Classical Fourier Analysis. Documents are written in [Typst](https://typst.app/) and compiled to PDF. The course follows Terry Tao's teaching blog, [247A, Classical Fourier Analysis](https://terrytao.wordpress.com/category/teaching/247a-classical-fourier-analysis/). See the parent `CLAUDE.md` (`../CLAUDE.md`) for build commands, the `@local/my-prelude:1.0.0` package API, and full template documentation.

## Directory Layout

- `Homework/homework-N/` — problem sets, each with `main.typ` + `template.typ`
- `Notes/` — lecture notes (`main.typ` + `template.typ` + `figures.typ` + `refs.bib`)

## Reference Notes

Tao's blog category page (linked above) currently holds a single post, "[247A, Notes 1: Rearrangement-invariant spaces](https://terrytao.wordpress.com/2026/09/20/247a-notes-1-rearrangement-invariant-spaces/)". Update this section as new posts are added to the category over the course of the term.

## Homework Template Specifics

`Homework/homework-N/template.typ` is a thin wrapper over `@local/math-homework:1.0.0` (see `../_shared/`) — problems use explicit numbering via the package's optional `num:` (matching the source notes' exercise numbers, e.g. `#problem(num: "11")[...]`) rather than auto-increment, so that homework problem numbers line up exactly with the exercise numbers in Tao's notes. Sub-parts use `#part[...]` inline inside the problem body. Solutions go in `#solution[...]` after the problem block, not nested inside it.

## Hint Policy (extends `../CLAUDE.md`)

Follow the shared Hint Policy, Proactive Review and Post-Mortem Policy in `../CLAUDE.md`, with these course-specific changes. Arham has a habit of diving into an exercise before reading the notes section it draws on, then getting stuck for a preventable reason.

- **Check the reading first (new step 0).** Before diagnosing, ask whether he's read the relevant section of the Tao's Notes post the problem draws on. If not, point him at it and suggest reading it before continuing — no mathematical hint yet. This is a prerequisite check, not a hint, and is **not** logged to `struggles.md`.
- **Transcription exception.** Transcribing into `#solution[...]` is fine when he explicitly frames it as "complete/finish this" or "fill in the details" (tedium — he already knows how it goes), as opposed to being stuck on the math. If unclear which he means, ask before writing into the file.
- **Log only genuine hints.** Don't log verifying his existing work ("is my algebra for Ex 12 right?") or catching a computational/sign slip — only technique-level stuck points (not knowing which theorem/approach applies).

Log hints to `struggles.md` and debriefs to `postmortems.md` in this directory.

## Parent Instructions

See `../CLAUDE.md` for build commands (`typst compile main.typ`), the `@local/my-prelude:1.0.0` package API, and full template documentation.
