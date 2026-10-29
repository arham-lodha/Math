// Minimal template: plain page, no header/TOC/cover (keeps live preview fast).
#import "@local/my-prelude:1.0.0": *

#let _setup(body) = {
  set text(font: "New Computer Modern", size: 11pt, lang: "en")
  show math.equation: set text(font: "New Computer Modern Math")
  set par(justify: true)
  set heading(numbering: "1.1")
  set enum(numbering: "i)")
  show: thm-init
  body
}

#let problems(title: none, body) = {
  set document(title: title)
  set page(paper: "us-letter", margin: 1in, numbering: "1")
  show: _setup
  if title != none { align(center, text(size: 18pt, weight: 700, title)) }
  body
}

// Header of every chapter file. Lets a chapter compile/preview on its own with the
// right numbering; when included from main.typ it is redundant (the counter is
// already N-1) and, since it sets no page style, causes no page break.
#let standalone(chapter: 1, body) = {
  show: _setup
  counter(heading).update(chapter - 1)
  body
}
