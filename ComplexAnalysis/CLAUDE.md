# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Course

MATH 246A / MATH 246B — Complex Analysis I & II.

## Structure

Each homework set lives in `homework-N/` with `main.typ` and `template.typ`. The `experiments/` directory holds Python scripts for visualization (e.g., plotting complex-plane trajectories to build intuition for problems).

## Homework Template Specifics

Problems use explicit numbering via the optional `num:` (matching textbook section.problem, e.g. `#problem(num: "1.6")[...]`) rather than auto-increment. Sub-parts use `#part[...]` inline inside the problem body. Solutions go in `#solution[...]` after the problem block, not nested inside it.

`template.typ` here is a thin wrapper over `@local/math-homework:1.0.0` (see `../_shared/`). Edit the wrapper for course-specific changes; edit `_shared/` to change every course.

## Python Experiments

Scripts in `experiments/` use NumPy and Matplotlib. Run with `python <script>.py` from that directory. They are standalone visualizations for specific problems; edit `Z` and `N_MAX` (or equivalent parameters) at the top of each script to explore different cases.

## Hint Policy, Proactive Review, Post-Mortems

No course-specific deviations — follow the shared policies in `../CLAUDE.md`, which apply to both `homework-N` sets and self-directed problem sets. Log hints to `struggles.md` and debriefs to `postmortems.md` in this directory.

## Parent Instructions

See `../CLAUDE.md` for build commands (`typst compile main.typ`), the `@local/my-prelude:1.0.0` package API, and full template documentation.
