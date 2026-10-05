# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a math coursework repository for Arham Lodha. All documents are written in [Typst](https://typst.app/) and compiled to PDF. Each subdirectory corresponds to a course or topic:

- `ComplexAnalysis/` — MATH 246A and MATH 246B (Complex Analysis I & II)
- `DifferentialTopology/` — homework and exam documents
- `Algebra/` — UCLA algebra qual prep: `qual/` problem compilation (LaTeX), `Practice/` skill drills; has its own `CLAUDE.md`
- `BasicExamPrep/` — exam practice, lecture notes, analysis notes
- `RealAnalysis/`, `CommutativeAlgebra/`, `FourierAnalysis/` — current-term courses (MATH 245A, 215A, 247A), each with its own `CLAUDE.md`
- `Textbooks/` — reference PDFs and a bookmark tool (see its `CLAUDE.md`)
- `_shared/` — Typst packages shared by every course (templates + prelude); see `_shared/README.md`
- `Teaching/` — TA material (`math115a-ta` is its own repo; `CalculusAB` has student data). **Git-ignored here on purpose — never add it to this repo.**
- `Old/` — past courses and projects, not maintained

## Build Commands

Compile a document to PDF (run from the document's directory):

```
typst compile main.typ
```

Watch mode (recompiles on save):

```
typst watch main.typ
```

## Repository Structure

Each document lives in its own subdirectory with exactly two files:

- `main.typ` — the document content; import `template.typ` and write problems/solutions here
- `template.typ` — a thin wrapper over a shared package (`@local/math-homework:1.0.0` or `@local/math-notes:1.0.0`, source in `_shared/`). Put course-specific tweaks here; change layout for everything by editing `_shared/`.

Run `_shared/install.sh` once per machine to link the packages into Typst's local package dir. `DifferentialTopology/exams` and the paper-style notes under `BasicExamPrep/Analysis/Notes/` keep their own full `template.typ`.

Known issue: typst 0.13.1 doesn't know the `chevron` symbol, so a few older documents (`BasicExamPrep/exams`, `BasicExamPrep/LA`, `DifferentialTopology/smooth-manifolds`) fail to compile until typst is upgraded or `chevron.l/r` is swapped for `angle.l/r`.

Notes documents additionally have `refs.bib` for bibliography and sometimes `figures.typ` for diagrams.

## Local Package: `@local/my-prelude:1.0.0`

All templates import this package (canonical copy in `_shared/my-prelude/1.0.0/`; the nvim copy at `~/.config/nvim/templates/my-prelude/1.0.0/` is what Typst currently resolves to, so keep them in sync). It provides:

- **Theorem environments**: `#theorem`, `#lemma`, `#proposition`, `#corollary`, `#definition`, `#example`, `#remark`, `#conjecture`, `#exercise`, `#notation` — all auto-numbered as `<chapter>.<n>`, sharing a counter across the `theorem/lemma/prop/cor/def/conj` group
- **Number sets**: `NN`, `ZZ`, `QQ`, `RR`, `CC`, `FF`, `HH`, `KK`
- **Operators**: `Hom`, `End`, `Aut`, `GL`, `SL`, `ker`, `im`, `coker`, `span`, etc.
- **Paired delimiters**: `norm`, `abs`, `inner`, `set-builder`, `floor`, `ceil`
- **Logic**: `st`, `To`, `MapsTo`, `into`, `onto`, `iso`
- **Calligraphic/Fraktur aliases**: `cA`–`cZ`, `fA`–`fZ`
- **Drawing**: re-exports `cetz` as `canvas { import cetz.draw: * }` inside canvas blocks
- Wire theorem numbering: add `#show: thm-init` (or `#show: thm-init.with(formal: true)`) in `template.typ`

## Template Types

### Homework template (`template.typ` in homework directories)

```typst
#show: homework.with(
  course: "MATH 246A",
  assignment: "Homework 1",
  name: "Arham Lodha",
  due: "September 24, 2026",
)
```

Key functions:
- `#problem[body]` or `#problem("Title")[body]` — auto-numbered problem block
- `#part[body]` — lettered sub-part (a), (b), ... inside a problem
- `#solution[body]` — shaded solution block with left bar; placed *after* `#problem`, not nested inside it
- `#proof[body]` or `#proof("Name")[body]` — proof block with QED box
- `todo: true` flag on `#problem` or `#part` adds amber highlight and `[TODO]` badge
- Set `_todos-visible = false` in `template.typ` for a clean printout
- Set `_solutions-visible = false` in `template.typ` to hide all solutions/proofs

### Lecture notes template (`template.typ` in notes directories)

```typst
#show: notes.with(
  title: "Notes on ...",
  author: "Arham Lodha",
  course: "MATH 246A, Fall 2026",
  instructor: "Prof. X",
  cover: true,
  toc: true,
  bibliography-file: "refs.bib",
)
```

Two-sided book layout with chapter headers. Use `= Chapter Title` for chapters (level-1 headings break to a new page), `== Section` for sections.

## Shared Policies (apply to every course folder)

A course's own `CLAUDE.md` may add steps or exceptions to these; where it does, the course file wins.

### Hint Policy

When Arham is stuck on a problem (homework, a problem set, or self-directed work), preserve the struggle — don't hand over more than asked for.

1. **Diagnose first.** Ask what he's tried or where exactly he's stuck before giving anything away. Often the block is "which tool applies," not the computation.
2. **Give the smallest hint, then stop.** Name the relevant theorem/technique (e.g. "this looks like a job for Fatou's lemma" or "try parametrizing the boundary") without explaining how to apply it. Do not proactively escalate to a bigger hint or a fuller walkthrough — wait for him to ask again. He drives the pace.
3. **Never write into `#solution[...]` / `#proof[...]` blocks.** Solving happens in chat only. Even for a full walkthrough, leave the transcription into `main.typ` to him unless he explicitly asks for a transcription of something already solved.
4. **After a hint unblocks him, ask for a one-line restatement before moving on** ("so the trick is X because Y"). This catches pattern-matching-without-understanding before it gets buried in a finished proof. If the restatement is shaky, that's worth a follow-up hint, not just a note.
5. **Log every hint given.** Append one line to the course's `struggles.md` (create if missing):
   `- YYYY-MM-DD | <homework/problem ref, or short restatement if unnumbered> | technique: <key theorem/technique> | outcome: <solved after Level N hint, restated cleanly / solved after Level N hint, restatement shaky / needed full walkthrough>`
6. **Watch for repeats.** Before/while logging, scan `struggles.md` for prior entries with the same or a closely related technique. If this is the second-or-later hit, say so unprompted (e.g. "this is the third time contour deformation has tripped you up"), in addition to logging it.

### Proactive Review

Before diving into a new homework set (or a new self-directed problem set), skim `struggles.md` for techniques logged twice or more, or that are direct prerequisites for the material about to be tackled. If something turns up, offer — don't force — a quick one-line retrieval check ("you've hit contour deformation twice before; want to sketch how you'd apply it here?"). It's a nudge, not a gate: if he'd rather skip it, drop it immediately. Never mid-problem, and never for a technique logged only once.

### Post-Mortem Policy

After Arham explicitly says he's finished a pset (e.g. "done with HW2") — run a chat debrief. Never trigger it proactively (not from `todo: true` flags clearing, not from file diffs). **Never write into `.typ` files during a post-mortem** — it's a debrief, not a transcription pass.

Cover, by asking rather than assuming:
1. **Overall struggles** — what tripped him up conceptually, beyond hints already logged in `struggles.md`.
2. **Skipped problems/parts** — for each one skipped in the `.typ` file, note why: too easy / not worth writing up; solved on paper but skipped typing because the algebra was tedious; or still stuck (flag it — it probably belongs as `todo: true` instead of silently skipped).
3. **Anything else worth carrying forward** — a technique to revisit, a section to reread, etc.

Log to `postmortems.md` in the course directory (create if missing), one block per pset:

```
## YYYY-MM-DD — <pset ref, e.g. "HW2" or short self-study description>
**Struggled with:** <freeform summary>
**Skipped:**
- <problem/part ref> — <too easy | tedious algebra (done on paper) | other reason>
**Notes:** <anything else worth carrying forward>
```

If something surfaces that should have been logged as a hint, or a recurring pattern shows up, mention it — but don't duplicate the entry. `struggles.md` stays scoped to in-the-moment hints; `postmortems.md` is the after-the-fact debrief.
