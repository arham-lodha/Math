# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Commutative Algebra coursework for Math 215A, taught by Burt Totaro. Documents are written in [Typst](https://typst.app/) and compiled to PDF. See the parent `CLAUDE.md` (`../CLAUDE.md`) for build commands, the `@local/my-prelude:1.0.0` package API, and full template documentation.

## Directory Layout

- `Homework/homework-N/` — problem sets, each with `main.typ` + `template.typ`
- `Notes/` — lecture notes (`main.typ` + `template.typ` + `figures.typ` + `refs.bib`)

## Reference Textbook

Atiyah–Macdonald, *Introduction to Commutative Algebra*, lives at `../Textbooks/atiyah_macdonald-commutative.pdf`. Cite it for definitions/exercises when working problems or transcribing notes.

## Homework Template Specifics

`Homework/homework-N/template.typ` is a thin wrapper over `@local/math-homework:1.0.0` (see `../_shared/`), using auto-incrementing `#problem`/`#part` counters (no explicit `num:`). Solutions/proofs go after the `#problem[...]` block, not nested inside it.

## Notes Document

Uses the `notes` template with `cover: false`, `toc: false`, `bibliography-file: "refs.bib"`. Figures are `#let` bindings in `figures.typ`, referenced in `main.typ` via `#figs.<name>`.

`refs.bib` currently holds leftover entries (Munkres' *Topology*, Hatcher's *Algebraic Topology*) copied from another course's template and not yet cited anywhere in `main.typ` — replace with actual commutative algebra references as they come up.

## Hint Policy (extends `../CLAUDE.md`)

Follow the shared Hint Policy and Proactive Review in `../CLAUDE.md` (hints apply to both `Homework/` and `Problems/`), with these changes. Arham has a habit of diving into an exercise before reading the textbook section it depends on, then getting stuck for a preventable reason.

- **Check the reading first (new step 0).** Before diagnosing, ask whether he's read the relevant chapter/section of Atiyah–Macdonald that the problem draws on. If not, point him at it and suggest reading it before continuing — no mathematical hint yet. This is a prerequisite check, not a hint, and is **not** logged to `struggles.md` even if it resolves the block.
- **One shared log.** Log hints to `struggles.md` at this directory's root, covering both `Homework/` and `Problems/`. Repeat-detection spans both.
- **Proactive Review** also runs before a new chapter/section of `Problems/main.typ`, not just a new homework set.

## Post-Mortem Policy

Chat-only debrief, extending the shared Post-Mortem Policy in `../CLAUDE.md` with an "alternative approaches" question. Never trigger proactively (not from a diff, not from a `#proof` block appearing) — only when Arham explicitly says he's done with something. **Never write into `.typ` files during a post-mortem** — this is a debrief, not a transcription pass.

There are two scopes here, since `Homework/` and `Problems/` don't work the same way — but both log to the same shared `postmortems.md` at the repo root (`CommutativeAlgebra/postmortems.md`, create if missing), one block per debrief, in whichever format matches its scope below.

### Homework sets (`Homework/homework-N/`)

Triggered by e.g. "done with HW2," "finished this pset." Cover, by asking rather than assuming:
1. **Overall struggles** — what tripped him up conceptually.
2. **Skipped problems/parts** — for each one skipped in `main.typ`, note why: too easy / not worth writing up, solved on paper but skipped typing up (tedious algebra), or still stuck (flag this — it probably belongs as `todo: true` instead of silently skipped).
3. **Alternative proof ideas** — for each problem written up (not just the struggled-with ones), ask whether he considered another route, and weigh in yourself: is there a slicker/more conceptual argument, a construction that generalizes better, or a step that's more computational than it needs to be? Algebra rewards elegance — a correct-but-brute-force proof is worth flagging even when nothing else went wrong. Don't rewrite the proof in `main.typ`; just discuss it and log the idea.
4. **Anything else worth carrying forward** — a technique to revisit, a section to reread, etc.

Log to the shared `postmortems.md`, one block per pset:

```
## YYYY-MM-DD — HWN
**Struggled with:** <freeform summary>
**Skipped:**
- <problem/part ref> — <too easy | tedious algebra (done on paper) | other reason>
**Alternative approaches:**
- <problem ref> — <the alternative idea, and why it would/wouldn't be cleaner>
**Notes:** <anything else worth carrying forward>
```

### Individual problems/sections (`Problems/main.typ`)

`Problems/main.typ` is a single running transcription of Atiyah–Macdonald exercises, organized by chapter (`=`) and named sub-section (`==`) — there's no per-set "done" moment, so the trigger is finer-grained: Arham finishes writing up an individual `#exercise`/`#proof` (e.g. "done with Exercise 14") or works through everything he's doing in a given section (e.g. "done with direct limits for now"). Cover the same questions as above, adapted to that scope:
1. **Overall struggles** — conceptually, on that exercise or across the section.
2. **Left unproved** — exercises in scope with no `#proof[...]` yet: too easy / not worth writing up, solved on paper but not typed up (tedious algebra), or still stuck. (There's no `todo: true` flag for `#exercise`, so just call out "still stuck" ones explicitly in the notes — don't invent a flag that doesn't exist in the template.)
3. **Alternative proof ideas** — same as the homework version: for each exercise written up in scope, discuss whether there's a cleaner or more conceptual argument than the one on the page — these are book exercises with well-known slick solutions, so it's worth checking his approach against the "intended" one, or against a construction elsewhere in the book that generalizes better. Discuss only; don't rewrite `main.typ`.
4. **Anything else worth carrying forward.**

Log to the shared `postmortems.md`, one block per debrief, referencing the chapter/section or exercise range covered:

```
## YYYY-MM-DD — <chapter/section or exercise range, e.g. "Ch. 1, Direct limits" or "Ex. 12–16">
**Struggled with:** <freeform summary>
**Left unproved:**
- <exercise ref> — <too easy | tedious algebra (done on paper) | still stuck | other reason>
**Alternative approaches:**
- <exercise ref> — <the alternative idea, and why it would/wouldn't be cleaner>
**Notes:** <anything else worth carrying forward>
```
