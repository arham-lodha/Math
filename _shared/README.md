# _shared

Typst packages shared by every course folder in `Math/`. Documents import them as
`@local/<name>:<version>`; run `./install.sh` once per machine to link them in.

| Package | Purpose |
|---|---|
| `my-prelude` | Theorem environments, macros, delimiters, operators. Canonical copy; `~/.config/nvim/templates/my-prelude` is what new docs are generated from. Keep the two in sync. |
| `math-homework` | `homework`, `problem` (optional `num:` for explicit numbering), `part`, `solution`, TODO highlighting |
| `math-notes` | `notes` (two-sided book layout; `chapter-breaks`, `cover`, `toc`) |

A document's `template.typ` is a thin wrapper over one of these, so `main.typ` keeps
`#import "template.typ": *`. Course-specific tweaks go in that wrapper, not in the package.

Homework wrapper:

```typst
#import "@local/math-homework:1.0.0": *
```

Notes wrapper (the bibliography is built here because file paths inside a package
resolve relative to the package, not the document):

```typst
#import "@local/math-notes:1.0.0": *
#import "@local/math-notes:1.0.0": notes as _notes
#let notes(bibliography-file: none, ..args, body) = _notes(
  ..args,
  bibliography-content: if bibliography-file != none {
    bibliography(bibliography-file, title: "References", style: "ieee")
  },
  body,
)
```

`DifferentialTopology/exams` and the two paper-style notes under
`BasicExamPrep/Analysis/Notes/` keep their own `template.typ`.
