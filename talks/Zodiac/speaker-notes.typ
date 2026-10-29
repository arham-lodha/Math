// Printable speaker notes, generated from slides.typ at compile time:
// edit the deck, recompile this file, and the notes follow.
//   typst compile --font-path fonts speaker-notes.typ

#let accent = rgb("#9f2f20")
#let blue = rgb("#2f6f9f")
#let muted = rgb("#676052")
#let rule = rgb("#cbbda3")
#let surface = rgb("#f3ead8")

#set page(paper: "us-letter", margin: (x: 2cm, y: 1.8cm),
  footer: context {
    set text(font: ("Gill Sans", "Trebuchet MS"), size: 8pt, fill: muted)
    [Z340 speaker notes #h(1fr) #counter(page).display()]
  })
#set text(font: ("ETBembo", "Palatino"), size: 11pt)
#set par(justify: true, leading: 0.55em)
#show math.equation: set text(font: "New Computer Modern Math")

// Rough clock checkpoints for a 50-minute talk, keyed by section name.
#let checkpoints = (
  "The story": "0:00",
  "Is there a unique answer?": "≈ 7:00",
  "How do we search for the key?": "≈ 20:00",
  "What made Z340 so much harder?": "≈ 33:00",
)
#let closing = ("Takeaways": "≈ 47:00")

#let src = read("slides.typ")
#let starts = src.matches(regex("(?m)^#(slide\[|s\(|section\()"))
#let chunks = starts.enumerate().map(((i, m)) => {
  let end = if i + 1 < starts.len() { starts.at(i + 1).start } else { src.len() }
  src.slice(m.start, end)
})

#let unescape(s) = s.replace("\\\"", "\"")
#let note-of(c) = {
  let m = c.match(regex("#note\(\"((?:[^\"\\\\]|\\\\.)*)\"\)"))
  // Evaluate the string literal, then typeset it as markup (so `$...$` is math).
  if m == none { none } else { eval(eval("\"" + m.captures.at(0) + "\""), mode: "markup") }
}
#let clicks-of(c) = c.matches(regex("#(later|uncover)\b")).len()

#let ui(body, ..args) = text(font: ("Gill Sans", "Trebuchet MS"), ..args, body)

#align(center)[
  #text(size: 18pt)[How the Zodiac Z340 Cipher Was Finally Broken] \
  #ui(size: 10pt, fill: muted)[SPEAKER NOTES · 50 MIN · NUMBERS MATCH THE SLIDE FOOTERS · DROPPABLE = SKIP IF BEHIND]
]
#v(0.6em)

#for (i, c) in chunks.enumerate() {
  let n = i + 1
  if c.starts-with("#section(") {
    let m = c.match(regex("^#section\(\"([^\"]*)\"(?:, part: \"([^\"]*)\")?"))
    let name = m.captures.at(0)
    let part = m.captures.at(1)
    v(0.5em)
    block(width: 100%, inset: (x: 8pt, y: 6pt), fill: surface, stroke: (left: 3pt + blue), sticky: true,
      breakable: false)[
      #ui(size: 9pt, fill: blue)[#upper(if part != none { part } else { "" })] \
      #text(size: 13pt)[#name] #h(1fr)
      #if name in checkpoints { ui(size: 10pt, fill: accent)[at #checkpoints.at(name)] }
    ]
  } else {
    let title = if c.starts-with("#slide[") { "Title slide" } else {
      let m = c.match(regex("^#s\(\"((?:[^\"\\\\]|\\\\.)*)\""))
      if m != none { unescape(m.captures.at(0)) } else {
        c.match(regex("^#s\(\[(.*?)\]\)\[")).captures.at(0)
      }
    }
    let note = note-of(c)
    let k = clicks-of(c)
    let drop = c.contains("#droppable")
    block(width: 100%, breakable: false, above: 0.7em, below: 0.7em)[
      #grid(columns: (2.2em, 1fr), column-gutter: 6pt,
        ui(size: 13pt, fill: accent)[#n],
        [
          #text(size: 12pt, weight: "bold")[#eval(title, mode: "markup")]
          #h(1fr)
          #if title in closing { ui(size: 9pt, fill: accent)[at #closing.at(title)  ] }
          #if drop { box(inset: (x: 4pt, y: 2pt), radius: 2pt, fill: accent, ui(size: 8pt, fill: white)[DROPPABLE]); h(4pt) }
          #if k > 0 { ui(size: 9pt, fill: muted)[#k click#if k > 1 [s]] }
          #v(-0.3em)
          #if note != none { note } else { text(fill: muted, style: "italic")[No note.] }
        ],
      )
      #v(0.1em)
      #line(length: 100%, stroke: 0.4pt + rule)
    ]
  }
}
