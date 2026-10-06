// =============================================================================
// figures.typ — figures and diagrams for these notes
// =============================================================================

#import "@local/my-prelude:1.0.0": *

// A simple labelled figure example.
#let example-square = [
  #figure(
    caption: [A commutative square.],
    rect(inset: 16pt)[
      $ mat(delim: #none,
          A, arrow.r^f, B;
          arrow.b^g, , arrow.b^h;
          C, arrow.r^k, D) $
    ],
  ) <example-square>
]

// Add more figures below.

// Spec C[x]: the closed points (x - b) form a copy of C, and the generic
// point (0) is smeared over the whole plane (its closure is everything).
#let spec-cx = [
  #figure(
    caption: [$op("Spec")(CC[x])$: closed points $(x - b)$ for $b in CC$, plus the generic point $(0)$, whose closure is all of $op("Spec")(CC[x])$.],
    canvas({
      import cetz.draw: *

      let (p1, p2, p3, p4) = ((0, 0), (6, 0), (7.5, 2.6), (1.5, 2.6))
      let g = (3.75, 4.1)

      // Faint lines from (0) to the corners (closure is the whole space);
      // drawn first so the plane hides the parts behind it.
      for c in (p1, p2, p3, p4) {
        line(g, c, stroke: (paint: blue.lighten(40%), thickness: 0.4pt, dash: "dashed"))
      }

      // The plane C, drawn in perspective.
      line(p1, p2, p3, p4, close: true, fill: luma(245), stroke: 0.6pt)

      // Closed points (x - b).
      let pts = (
        ((1.4, 0.55), $(x)$),
        ((2.9, 1.9), $(x - i)$),
        ((4.6, 0.75), $(x - 1)$),
        ((5.4, 2.05), $(x + 2)$),
      )
      for (pt, lbl) in pts {
        circle(pt, radius: 0.06, fill: black, stroke: none)
        content((pt.at(0) + 0.08, pt.at(1)), anchor: "west", padding: 3pt, text(size: 9pt, lbl))
      }

      // The generic point (0), off the plane.
      circle(g, radius: 0.08, fill: blue.darken(30%), stroke: none)
      content((g.at(0) + 0.1, g.at(1)), anchor: "west", padding: 3pt, text(fill: blue.darken(30%))[$(0)$ #text(size: 9pt)[(generic point)]])

      // Labels.
      content((7.4, 0.3), anchor: "west", $CC$)
    }),
  ) <spec-cx>
]
