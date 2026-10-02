// =============================================================================
// Homework / problem-set template
// =============================================================================
// Each problem is a top-level call to `#problem`. Sub-parts use `#part`.
// Solutions can be wrapped in `#solution[ ... ]` for clear visual separation.
//
// Usage:
//   #import "template.typ": *
//   #show: homework.with(
//     course: "MATH 533",
//     assignment: "Problem Set 4",
//     name: "Arham Lodha",
//     due: "April 25, 2026",
//   )
//
// TODO highlighting:
//   #problem(todo: true)[...]  — highlights entire problem in amber
//   #part(todo: true)[...]     — highlights just that sub-part
//   Set _todos-visible = false below to print a clean copy.
// =============================================================================

#import "@local/my-prelude:1.0.0": *

// ── Toggle this to false to hide all TODO highlights ─────────────────────────
#let _todos-visible = true
// ─────────────────────────────────────────────────────────────────────────────

#let _todo-fill   = rgb("#fff8e1")
#let _todo-stroke = rgb("#f5a623") + 2.5pt
#let _todo-label  = text(fill: rgb("#c87000"), size: 9pt, weight: 700)[[TODO]]

#let _problem-counter = counter("problem")
#let _part-counter    = counter("part")

#let problem(todo: false, num: none, ..args) = {
  let pos = args.pos()
  let body = pos.last()
  let title = if pos.len() >= 2 { pos.at(0) } else { none }
  if num == none { _problem-counter.step() }
  _part-counter.update(0)
  let header = [
    #text(weight: 700, size: 12pt)[
      Problem #if num != none { num } else { context _problem-counter.display() }
      #if title != none [: #title]
    ]
    #if todo and _todos-visible [ #h(0.5em)#_todo-label]
  ]
  if todo and _todos-visible {
    block(
      above: 1.4em, below: 0.8em,
      fill: _todo-fill,
      stroke: (left: _todo-stroke),
      inset: (left: 10pt, right: 6pt, y: 8pt),
      radius: 2pt,
      width: 100%,
    )[
      #header
      #v(0.3em)
      #body
    ]
  } else {
    block(above: 1.4em, below: 0.8em)[
      #header
      #v(0.3em)
      #body
    ]
  }
}

#let part(todo: false, body) = {
  _part-counter.step()
  let label = context {
    let n = _part-counter.get().first()
    let letters = ("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
    let l = if n <= letters.len() { letters.at(n - 1) } else { str(n) }
    [(#l)]
  }
  if todo and _todos-visible {
    block(
      above: 0.6em, below: 0.4em,
      fill: _todo-fill,
      stroke: (left: _todo-stroke),
      inset: (left: 10pt, right: 6pt, y: 5pt),
      radius: 2pt,
      width: 100%,
    )[
      #label #h(0.4em) #body #h(0.6em)#_todo-label
    ]
  } else {
    block(above: 0.6em, below: 0.4em)[
      #label #h(0.4em) #body
    ]
  }
}

#let solution(body) = block(
  above: 0.6em, below: 0.6em,
  fill: rgb("#f5f5f5"),
  stroke: (left: rgb("#999") + 2pt),
  inset: (x: 10pt, y: 8pt),
  radius: 2pt,
  width: 100%,
  [#emph[Solution.] #body],
)

#let homework(
  course: "Course",
  assignment: "Problem Set",
  name: "Arham Lodha",
  due: none,
  formal: false,
  date: datetime.today(),
  body,
) = {
  set document(title: assignment + " — " + course, author: name)

  set page(
    paper: "us-letter",
    margin: (x: 1in, y: 1in),
    numbering: "1 / 1",
    number-align: center,
    header: context {
      let p = counter(page).get().first()
      if p > 1 [
        #set text(size: 9pt, fill: rgb("#666"))
        #name #h(1fr) #course — #assignment
      ]
    },
  )

  set text(
    font: ("New Computer Modern", "Latin Modern Roman", "Libertinus Serif"),
    size: 11pt,
    lang: "en",
  )
  show math.equation: set text(font: ("New Computer Modern Math", "Latin Modern Math"))
  show math.equation.where(block: true): set align(center)
  set par(justify: true, leading: 0.65em)

  show: thm-init.with(formal: formal)

  // ---- Header block ----
  block[
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      [
        #text(size: 14pt, weight: 700, name) \
        #text(size: 11pt, course)
      ],
      [
        #text(size: 14pt, weight: 700, assignment) \
        #if due != none [
          #text(size: 11pt)[Due: #due]
        ] else [
          #text(size: 11pt, date.display("[month repr:long] [day], [year]"))
        ]
      ],
    )
  ]

  line(length: 100%, stroke: 0.5pt + rgb("#888"))
  v(0.5em)

  body
}
