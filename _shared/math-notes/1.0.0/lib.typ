// =============================================================================
// Lecture-notes template
// =============================================================================
// Two-sided book layout, chapter headings, theorem environments, and
// a tasteful header showing the current chapter on each page.
//
// Usage:
//   #import "template.typ": *
//   #show: notes.with(
//     title: "Notes on Algebraic Topology",
//     author: "Arham Lodha",
//     course: "MATH 533, Fall 2026",
//     instructor: "Prof. X",
//     cover: true,                    // title page (default: false)
//     toc: true,                      // table of contents (default: false)
//   )
//
// Bibliography: a document's local template.typ wraps `notes` and turns its
// `bibliography-file:` argument into `bibliography-content:` (see _shared/README.md),
// because file paths inside a package resolve relative to the package, not the document.
// =============================================================================

#import "@local/my-prelude:1.0.0": *

#let notes(
  title: "Untitled Notes",
  author: "Arham Lodha",
  course: none,
  instructor: none,
  formal: false,
  date: datetime.today(),
  bibliography-content: none,
  cover: false,
  toc: false,
  chapter-breaks: true,
  body,
) = {
  set document(title: title, author: author)

  // ---- Page setup: two-sided book layout ----
  set page(
    paper: "us-letter",
    margin: (inside: 1.4in, outside: 1.0in, top: 1.1in, bottom: 1.1in),
    numbering: "1",
    number-align: center,
    header: context {
      let page-num = counter(page).get().first()
      if page-num <= 1 { return }
      let chapters = query(heading.where(level: 1).before(here()))
      let chapter = if chapters.len() > 0 { chapters.last().body } else { [] }
      let nums = counter(heading).get()
      let chap-num = if nums.len() > 0 { nums.first() } else { 0 }
      set text(size: 9pt, fill: rgb("#555"))
      if calc.even(page-num) [
        #page-num #h(1fr) #upper(title)
      ] else [
        #if chap-num > 0 [Chapter #chap-num. ] #chapter #h(1fr) #page-num
      ]
    },
  )

  // ---- Typography ----
  set text(
    font: ("New Computer Modern", "Latin Modern Roman", "Libertinus Serif"),
    size: 11pt,
    lang: "en",
  )
  show math.equation: set text(font: ("New Computer Modern Math", "Latin Modern Math"))
  set par(justify: true, leading: 0.7em)

  // Headings: chapters break to a new page; sections stay on flow.
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    if chapter-breaks { pagebreak(weak: true) }
    block(below: 1.5em)[
      #text(size: 13pt, fill: rgb("#888"))[Chapter #counter(heading).display()]
      #v(0.2em)
      #text(size: 22pt, weight: 700, it.body)
    ]
  }
  show heading.where(level: 2): set block(above: 1.4em, below: 0.7em)
  show heading.where(level: 3): set block(above: 1.1em, below: 0.5em)

  // ---- Theorem counter reset ----
  show: thm-init.with(formal: formal)

  // ---- Title page ----
  if cover {
    page(numbering: none)[
      #v(2fr)
      #align(center)[
        #text(size: 26pt, weight: 700, title)
        #v(0.5em)
        #if course != none [
          #text(size: 14pt, course) \
        ]
        #if instructor != none [
          #text(size: 12pt, emph(instructor)) \
        ]
        #v(2em)
        #text(size: 14pt, author)
        #v(0.3em)
        #text(size: 11pt, fill: rgb("#666"), date.display("[month repr:long] [day], [year]"))
      ]
      #v(3fr)
    ]
  }

  // ---- Table of contents ----
  if toc {
    show outline.entry.where(level: 1): it => {
      v(0.6em, weak: true)
      strong(it)
    }
    outline(title: [Contents], depth: 3, indent: auto)
    pagebreak(weak: true)
  }

  // ---- Body ----
  body

  // ---- Bibliography ----
  if bibliography-content != none {
    pagebreak(weak: true)
    bibliography-content
  }
}
