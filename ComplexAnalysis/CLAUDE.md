# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Course

MATH 246A / MATH 246B — Complex Analysis I & II.

## Structure

Each homework set lives in `homework-N/` with `main.typ` and `template.typ`. The `experiments/` directory holds Python scripts for visualization (e.g., plotting complex-plane trajectories to build intuition for problems).

## Homework Template Specifics

Problems use explicit numbering via `num:` (matching textbook section.problem, e.g. `#problem(num: "1.6")[...]`) rather than auto-increment. Sub-parts use `#part[...]` inline inside the problem body. Solutions go in `#solution[...]` after the problem block, not nested inside it.

The `template.typ` here is a self-contained copy of the homework template — it does not import from a shared location. Edit it directly if layout changes are needed for this course.

## Python Experiments

Scripts in `experiments/` use NumPy and Matplotlib. Run with `python <script>.py` from that directory. They are standalone visualizations for specific problems; edit `Z` and `N_MAX` (or equivalent parameters) at the top of each script to explore different cases.

## Parent Instructions

See `../CLAUDE.md` for build commands (`typst compile main.typ`), the `@local/my-prelude:1.0.0` package API, and full template documentation.
