# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

UCLA PhD Algebra Qualifying Exam prep. Two parts: `qual/` is a compilation of past UCLA algebra quals (2000–2026), and `Practice/` holds separate skill-targeted practice problems. Practice documents are written in [Typst](https://typst.app/); see the parent `../CLAUDE.md` for build commands, the `@local/my-prelude:1.0.0` API, and template documentation.

## Directory Layout

- `qual/` — LaTeX source (`ucla_algebra_quals.tex`) and compiled PDF of past qual problems. **Reference material: don't edit problems unless asked.** Source: https://ww3.math.ucla.edu/past-qualifying-exams/
- `Practice/<Topic>/` — `main.typ` + `template.typ` per topic, mirroring the qual chapters: `Group`, `Ring`, `Module`, `Field` (Field & Galois), `LinearAlgebra`, `Commutative`, `Representation`, `Homological`.
- `struggles.md`, `postmortems.md` — shared logs (see policies below).

## The `qual/` Compilation

- 8 topic chapters, each with Standard (★), Moderate (★★), Challenging (★★★) sections; within a tier, chronological. Appendices: "Problems by Exam" and "Top Problems by Interest" (three-diamond ◇◇◇ ratings).
- Each problem: `\begin{problem}{Exam: <Term> <Year>, <#> \quad|\quad Difficulty: … \quad|\quad Interest: …}`. Cite problems by "Term Year, #N" (e.g. "Spring 2015 #8"); numbering styles vary by year (`A1`, `G8`, `PROBLEM 1`, `Problem 4`, `\#\,8`).
- `\hiderecenttrue` (near the top of the `.tex`) hides Spring 2021+ exams so they stay fresh as practice exams. Flip to `\hiderecentfalse` only if Arham asks. Don't read or quote hidden problems unprompted — grep with that in mind.
- 2000–2011 exams were OCR'd and contain artifacts (`Al` for `A1`, `Do,` for `D_{2n}`, etc.); interpret charitably and flag ambiguity.
- Build (from `qual/`): `pdflatex ucla_algebra_quals.tex` twice (plus `makeindex ucla_algebra_quals` for the index).

## Practice Problems

Each `Practice/<Topic>/main.typ` uses `@local/math-homework:1.0.0` via a thin `template.typ`. Conventions:

- One named **skill** per set (e.g. Sylow counting, Eisenstein/irreducibility, Galois groups of quartics, Jordan form, localization and primary decomposition), as a `==` header or comment, with problems graded ★–★★★ to mirror the qual tiers.
- Each problem notes the skill and 1–3 related qual problems (by "Term Year #N") so Arham can see where it shows up.
- Sources: original problems, plus exercises cited by chapter/exercise number (don't copy long text verbatim) from:
  - Aluffi, *Algebra: Chapter 0* (`../Textbooks/Aluffi_Algebra.pdf`)
  - Dummit & Foote, *Abstract Algebra* (`../Textbooks/David_S_Dummit_Richard_M_Foote_Abstract_Algeb_230928_225848.pdf`)
  - Lang, *Algebra* (`../Textbooks/algebra-serge-lang.pdf`)
  - Artin, *Algebra* (`../Textbooks/artin-algebra.pdf`)
  - Atiyah–Macdonald (`../Textbooks/atiyah_macdonald-commutative.pdf`) for commutative topics.
- **Selection priority: match the difficulty of the qual tier being targeted; when in doubt, harder is better.** Prefer Lang and Aluffi exercises and original problems pitched at ★★–★★★ over routine Dummit & Foote / Artin drills. Use easy textbook exercises only to fill ★ gaps in a skill. Per problem, say which source it comes from and why it fits the tier.
- Use `#problem("Title")[…]`. Practice problems ship **without** `#solution`/`#proof` content. Arham writes those; use `todo: true` for ones he's stuck on.
- Draft problems only when asked for a skill/topic; don't pre-populate sets.

## Hint Policy (extends `../CLAUDE.md`)

Follow the shared Hint Policy and Proactive Review in `../CLAUDE.md`; it applies to both `qual/` problems (worked in chat) and `Practice/`. Differences:

- **Check the reading first (new step 0).** Before diagnosing, ask whether he's reviewed the relevant textbook section (Aluffi, Dummit & Foote, Lang, or Artin; Atiyah–Macdonald for commutative topics). If not, point him there — no mathematical hint yet. Not logged to `struggles.md`.
- **Log format**: reference the source plainly, e.g. `Spring 2015 #8` or `Practice/Group, Sylow set, #3`, and name the technique consistently so repeat-detection works across qual and practice. Repeats are spanned across both.
- **Proactive Review** also runs before starting a new `Practice/<Topic>` set or a new qual chapter/tier.
- Never hand over a qual problem's full solution unprompted; for solved problems, the techniques that cracked them are what matter.

## Post-Mortem Policy

Chat-only debrief, extending the shared policy in `../CLAUDE.md`. Triggered only when Arham says he's done with something (a practice set, a qual chapter/tier, an individual problem). Never proactively; **never write into `.typ` files**. Cover:

1. **Overall struggles.**
2. **Left unproved / skipped** — too easy, tedious algebra (done on paper), or still stuck.
3. **Alternative approaches** — discuss whether a slicker or more conceptual argument exists; qual problems often have an intended short solution.
4. **Qual connections** — which other qual problems use the same skill, and what a grader would expect to see written.
5. **Anything else worth carrying forward.**

Log to `postmortems.md`:

```
## YYYY-MM-DD — <scope, e.g. "Practice/Group Sylow set" or "Group ★★ quals">
**Struggled with:** <freeform summary>
**Left unproved:**
- <problem ref> — <too easy | tedious algebra (done on paper) | still stuck | other reason>
**Alternative approaches:**
- <problem ref> — <the alternative idea, and why it would/wouldn't be cleaner>
**Qual connections:** <related qual problems / skills>
**Notes:** <anything else worth carrying forward>
```
