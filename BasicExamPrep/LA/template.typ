// Thin wrapper: the template lives in Math/_shared/math-notes (see _shared/README.md).
// The bibliography is built here because paths inside a package resolve relative to the package.
#import "@local/math-notes:1.0.0": *
#import "@local/math-notes:1.0.0": notes as _notes
#let notes(bibliography-file: none, ..args, body) = _notes(
  ..args,
  bibliography-content: if bibliography-file != none {
    bibliography(bibliography-file, title: "References", style: "ieee")
  },
  body,
)
