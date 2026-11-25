# CLAUDE.md

Reading notes for Arham's talk **"Borel–Moore homology, correspondences and
convolution"** in the UCLA participating seminar on Quiver Varieties (Fall 2026).

- **Talk date:** 2026-11-25, 50 minutes.
- **Earlier talks in the seminar:** quiver representations; moduli spaces, stability and GIT; framing,
  double quivers and Hamiltonian reduction; Nakajima quiver varieties (smoothness, the
  semisimplification map); the one-vertex quiver and Grassmannians; the Jordan quiver and
  Hilbert schemes; Kac–Moody algebras. This talk supplies the convolution machinery
  that Nakajima's $U(\mathfrak g)$-action is built from.
- **Background:** algebraic topology through Hatcher Ch. 1–3, including Poincaré duality
  and compactly supported cohomology. **No algebraic geometry.** Explain complex varieties
  topologically, using the analytic topology: varieties as subsets cut out by polynomials,
  irreducible components, complex dimension, smooth points, and proper maps as maps where
  preimages of compact sets are compact. Skip CG §2.1–2.5.

## Source

Chriss–Ginzburg, *Representation Theory and Complex Geometry*, §2.6 (Borel–Moore
Homology, pdf pp. 33–49) and §2.7 (Convolution in Borel–Moore Homology, pdf
pp. 50–66) of `../../Textbooks/chriss-ginzburg-ch2-mosaic.pdf`. The full book is
`../../Textbooks/chriss-ginzburg-representation-theory.pdf`. The Ch. 2 extract is
a scan with no text layer; use `toc_tool.py text --ocr` (see `Textbooks/CLAUDE.md`)
to read it.

## Files

- `main.typ`: the notes. Paper format with sections as level-1 headings.
- `template.typ`: standalone paper template. It uses colored `my-prelude` boxes
  (`formal: false`) and adds the helpers `HBM`, `HBMk`, `question` and `ref-cg`.
- `refs.bib`: bibliography.
- `speaker-notes.typ`: printable board-talk speaker notes in the Zodiac style (`#section`, `#beat`,
  `#say`, `#board`, `#pause`, `#point`, `#if-asked`). Arham types these himself. Build with
  `typst compile --font-path ../Zodiac/fonts speaker-notes.typ`.
- `figures.typ`: CeTZ figures (`fig-*`), imported by `main.typ` and placed with `#figure`.

Build: `typst compile main.typ`. On typst 0.13.1 use `angle.l/r`, not `chevron`.

## How to help (overrides the shared Hint Policy for this folder)

- **Explain only.** Answer what he asks: clear explanations, fill in the details
  CG skips, give examples and connections to quiver varieties. Don't quiz him,
  don't ration hints, and don't log to `struggles.md`.
- **He writes the notes.** Review, suggest and fix Typst in `main.typ`, but only
  write content there when he explicitly asks.

## Explanation viewer (`explain/`, git-ignored)

When Arham asks for an explanation, write it as markdown with LaTeX to
`explain/entries/YYYY-MM-DD-slug.md` (first line `# Title`), then run
`python3 explain/build.py`. `explain/index.html` (opened via `file://`) polls
`entries.js` and jumps to new entries automatically. Use `$...$` inline and
`$$...$$` display; KaTeX macros `\RR \CC \ZZ \HBM \Hc \Hom \into` are defined.
Keep a short summary in chat as well.
Add figures where they help, as inline `<figure><svg>…</svg><figcaption>…</figcaption></figure>`
blocks (one block, no blank lines; captions may contain `$...$`). Style SVGs with the
classes in `index.html` (`ink`, `acc`, `acc2`, `acc3`, `-fill`/`-soft`, `thin`/`thick`,
`lbl`, `small`, `muted`) so they follow light/dark mode, and screenshot-check them
with headless Chrome before finishing.
