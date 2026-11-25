// =============================================================================
// Paper template with colored accents (talk notes)
// =============================================================================
// Standalone single-column article layout, adapted from
// BasicExamPrep/Analysis/Notes/abel-s-theorem/template.typ. Keeps the colored
// theorem boxes from @local/my-prelude (formal: false), numbered by section.
//
// Usage in main.typ:
//   #import "template.typ": *
//   #show: paper.with(title: "...", abstract: [...], bibliography-file: "refs.bib")
// =============================================================================

// Re-exports the prelude so main.typ only needs to import this template file.
#import "@local/my-prelude:1.0.0": *

#let accent = theorem-color
#let question-color = rgb("#f59e0b")

#let paper(
  title: "Untitled",
  subtitle: none,
  authors: ("Arham Lodha",),
  abstract: none,
  keywords: (),
  date: datetime.today(),
  bibliography-file: none,
  body,
) = {
  // ---- Document metadata ----
  set document(title: title, author: authors.map(a => if type(a) == dictionary { a.name } else { a }))

  // ---- Page setup ----
  set page(
    paper: "us-letter",
    margin: (x: 1.25in, y: 1in),
    numbering: "1",
    number-align: center,
    header: context {
      if counter(page).get().first() <= 1 { return }
      set text(size: 9pt, fill: rgb("#666"))
      smallcaps(title)
      h(1fr)
      counter(page).display()
      v(-0.6em)
      line(length: 100%, stroke: 0.4pt + accent.lighten(50%))
    },
    footer: context {
      if counter(page).get().first() > 1 { return }
      align(center, text(size: 9pt, counter(page).display()))
    },
  )

  // ---- Typography ----
  set text(
    font: "New Computer Modern",
    size: 11pt,
    lang: "en",
  )
  show math.equation: set text(font: "New Computer Modern Math")
  set par(justify: true, leading: 0.7em)

  // ---- Headings: colored section numbers, no page breaks ----
  set heading(numbering: "1.1")
  show heading: it => {
    let size = if it.level == 1 { 14pt } else if it.level == 2 { 12pt } else { 11pt }
    let num = if it.numbering != none {
      text(fill: accent, counter(heading).display(it.numbering))
      h(0.7em)
    }
    block(
      above: if it.level == 1 { 1.8em } else { 1.3em },
      below: 0.8em,
      sticky: true,
      text(size: size, weight: "bold")[#num#it.body],
    )
  }

  // ---- Links, citations, references ----
  show link: set text(fill: accent)
  show cite: set text(fill: accent)
  show ref: set text(fill: accent)

  // ---- Theorem numbering (colored boxes, reset per section) ----
  show: thm-init.with(formal: false)

  // ---- Title block ----
  align(center)[
    #block(text(weight: 700, size: 18pt, title))
    #if subtitle != none {
      v(0.2em)
      text(size: 11pt, fill: rgb("#555"), emph(subtitle))
    }
    #v(0.5em)
    #block(text(size: 10.5pt)[
      #authors.map(a => {
        if type(a) == dictionary {
          let line = strong(a.at("name", default: ""))
          if "affiliation" in a [#line \ #emph(a.affiliation)]
          else { line }
          if "email" in a [\ #raw(a.email)]
        } else {
          strong(a)
        }
      }).join(h(2em))
    ])
    #v(0.3em)
    #text(size: 10pt, fill: rgb("#666"), date.display("[month repr:long] [day], [year]"))
  ]
  v(0.4em)
  line(length: 100%, stroke: 1pt + accent)
  v(0.8em)

  // ---- Abstract ----
  if abstract != none {
    align(center, block(width: 85%, align(left)[
      #text(weight: "bold", fill: accent)[Abstract.] #abstract
    ]))
    v(0.8em)
  }

  // ---- Keywords ----
  if keywords.len() > 0 {
    align(center, text(size: 10pt)[#text(fill: accent)[*Keywords:*] #keywords.join(", ")])
    v(0.5em)
  }

  // ---- Body ----
  body

  // ---- Bibliography ----
  if bibliography-file != none {
    pagebreak(weak: true)
    bibliography(bibliography-file, title: "References", style: "ieee")
  }
}

// -----------------------------------------------------------------------------
// Helpers
// -----------------------------------------------------------------------------

// Open question to chase down (ask Claude / the seminar).
#let question(body) = callout("Question", body, color: question-color)
