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

// Vector bundle E -> X with a continuous section s; sections form a C(X)-module.
#let bundle-sections = [
  #figure(
    caption: [A real vector bundle $pi: E -> X$. A section $s$ picks one point $s(x)$ in each fiber $E_x$; the continuous sections form a $C(X)$-module.],
    canvas({
      import cetz.draw: *

      // Total space E and base X.
      rect((0, 2), (7, 4.4), fill: luma(245), stroke: 0.6pt)
      line((0, 0), (7, 0), stroke: 1pt)

      // Fibers over a few points of X.
      for (x, lbl) in ((1.5, $x_1$), (3.5, $x_2$), (5.5, $x_3$)) {
        line((x, 2), (x, 4.4), stroke: (paint: blue.lighten(30%), thickness: 0.7pt))
        circle((x, 0), radius: 0.05, fill: black, stroke: none)
        content((x, -0.1), anchor: "north", text(size: 9pt, lbl))
      }

      // Section s.
      let c = red.darken(20%)
      let pts = ((0.3, 2.9), (1.5, 3.2), (3.5, 3.9), (5.5, 3.1), (6.7, 2.7))
      hobby(..pts, stroke: (paint: c, thickness: 1pt))
      for p in pts.slice(1, 4) { circle(p, radius: 0.06, fill: c, stroke: none) }
      content((6.7, 3.0), anchor: "south", text(fill: c)[$s$])

      // Projection and labels.
      line((7.5, 1.8), (7.5, 0.4), mark: (end: ">"), stroke: 0.6pt)
      content((7.6, 1.1), anchor: "west", $pi$)
      content((7.2, 4.2), anchor: "west", $E$)
      content((7.2, 0), anchor: "west", $X$)
    }),
  ) <bundle-sections>
]

// Helper: a labelled arrow between two points (label sits on the `side` of it).
#let _arr(a, b, lbl, dashed: false, side: 0.3) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let len = calc.sqrt(dx * dx + dy * dy)
  let mid = ((a.at(0) + b.at(0)) / 2 - dy / len * side, (a.at(1) + b.at(1)) / 2 + dx / len * side)
  line(a, b, mark: (end: ">"), stroke: (thickness: 0.6pt, dash: if dashed { "dashed" } else { "solid" }))
  content(mid, text(size: 9pt, lbl))
}

// Theorem 4.3: universal property of the quotient module.
#let quotient-ump = [
  #figure(
    caption: [Universal property of $M \/ N$: any $f: M -> Q$ with $N subset.eq ker f$ factors uniquely through the quotient.],
    canvas({
      import cetz.draw: *
      content((0, 2.4), $M$)
      content((4, 2.4), $lcoset(M, N)$)
      content((4, 0), $Q$)
      _arr((0.4, 2.4), (3.3, 2.4), $q$, side: 0.3)
      _arr((0.3, 2.1), (3.7, 0.3), $f$, side: -0.35)
      _arr((4, 2.1), (4, 0.35), $overline(f)$, dashed: true, side: -0.3)
    }),
  ) <quotient-ump>
]

// Theorem 4.4: universal property of the free module.
#let free-ump = [
  #figure(
    caption: [Universal property of $A^n$: any choice $e_i |-> m_i$ of $n$ elements of $M$ extends uniquely to an $A$-linear map $phi$.],
    canvas({
      import cetz.draw: *
      content((0, 2.4), ${1, ..., n}$)
      content((4, 2.4), $A^n$)
      content((4, 0), $M$)
      _arr((0.9, 2.4), (3.6, 2.4), $i |-> e_i$, side: 0.3)
      _arr((0.3, 2.1), (3.7, 0.3), $i |-> m_i$, side: -0.35)
      _arr((4, 2.1), (4, 0.35), $phi$, dashed: true, side: -0.3)
    }),
  ) <free-ump>
]

// Definition of an exact sequence: exact at M_n means ker(phi_n) = im(phi_(n-1)).
#let exact-seq = [
  #figure(
    canvas({
      import cetz.draw: *
      let xs = (0, 3, 6, 9, 12)
      let nodes = ($dots$, $M_(n - 1)$, $M_n$, $M_(n + 1)$, $dots$)
      for (x, n) in xs.zip(nodes) { content((x, 0), n) }
      _arr((0.5, 0), (2.3, 0), none, side: 0.3)
      _arr((3.7, 0), (5.4, 0), $phi_(n - 1)$, side: 0.35)
      _arr((6.6, 0), (8.3, 0), $phi_n$, side: 0.35)
      _arr((9.7, 0), (11.5, 0), none, side: 0.3)
    }),
  ) <exact-seq>
]

// Colimits: a cocone on a diagram F, and the universal property of colim F.
#let colimit-ump = [
  #figure(
    caption: [The colimit $L = colim F$ with legs $iota_i$. Any other cocone $(T, g_i)$ on $F$ factors uniquely through $L$ via the dashed map $u$; every triangle commutes.],
    canvas({
      import cetz.draw: *
      content((-1, 3), $F(i)$)
      content((5, 3), $F(j)$)
      content((2, 1.2), $L$)
      content((2, -1.3), $T$)
      _arr((-0.4, 3), (4.4, 3), $F(alpha)$, side: 0.3)
      _arr((-0.6, 2.7), (1.7, 1.4), $iota_i$, side: 0.3)
      _arr((4.6, 2.7), (2.3, 1.4), $iota_j$, side: -0.3)
      _arr((-0.8, 2.65), (1.7, -1.05), $g_i$, side: -0.3)
      _arr((4.8, 2.65), (2.3, -1.05), $g_j$, side: 0.3)
      _arr((2, 0.9), (2, -1.0), $u$, dashed: true, side: -0.25)
    }),
  ) <colimit-ump>
]

// Pushout: the colimit of B <- A -> C.
#let pushout = [
  #figure(
    caption: [A pushout square. $P$ receives $B$ and $C$ compatibly over $A$, and any other such $T$ factors uniquely through $P$.],
    canvas({
      import cetz.draw: *
      content((0, 3), $A$)
      content((3.5, 3), $B$)
      content((0, 0), $C$)
      content((3.5, 0), $P$)
      content((6.8, -2.4), $T$)
      _arr((0.35, 3), (3.15, 3), $f$, side: 0.3)
      _arr((0, 2.65), (0, 0.35), $g$, side: 0.3)
      _arr((3.5, 2.65), (3.5, 0.35), none, side: 0.3)
      _arr((0.35, 0), (3.15, 0), none, side: 0.3)
      _arr((3.75, 2.7), (6.65, -2.05), $beta$, side: -0.3)
      _arr((0.35, -0.2), (6.4, -2.35), $gamma$, side: 0.3)
      _arr((3.8, -0.25), (6.5, -2.1), $u$, dashed: true, side: -0.3)
    }),
  ) <pushout>
]

// A sequential direct system X_0 -> X_1 -> X_2 -> ... with its legs into the colimit.
// `nodes`: the first few objects; `maps`: labels on the horizontal maps;
// `legs`: labels on the legs into `target`.
#let seq-colim(nodes, maps, legs, target, caption, label-name) = [
  #figure(
    caption: caption,
    canvas({
      import cetz.draw: *
      let n = nodes.len()
      let gap = 3.4
      let tx = (n - 1) * gap / 2
      for (k, x) in nodes.enumerate() { content((k * gap, 2.2), x) }
      content((n * gap - 0.3, 2.2), $dots.c$)
      content((tx, 0), target)
      for (k, m) in maps.enumerate() {
        _arr((k * gap + 0.45, 2.2), ((k + 1) * gap - 0.45, 2.2), m, side: 0.3)
      }
      _arr(((n - 1) * gap + 0.45, 2.2), (n * gap - 0.75, 2.2), none, side: 0.3)
      for (k, l) in legs.enumerate() {
        let x = k * gap
        let s = if x < tx { -0.45 } else if x > tx { 0.55 } else { -0.8 }
        _arr((x + (tx - x) * 0.12, 1.9), (tx + (x - tx) * 0.12, 0.35), l, side: s)
      }
    }),
  ) #label(label-name)
]

#let direct-system = seq-colim(
  ($M_1$, $M_2$, $M_3$),
  ($mu_(12)$, $mu_(23)$),
  ($mu_1$, $mu_2$, $mu_3$),
  $M = colim M_i$,
  [A direct system indexed by $NN$ and its direct limit. The legs satisfy $mu_j compose mu_(i j) = mu_i$.],
  "direct-system",
)

#let localization-colim = seq-colim(
  ($A$, $A$, $A$),
  ($dot f$, $dot f$),
  ($a |-> a$, $a |-> a slash f$, $a |-> a slash f^2$),
  $A[1 / f]$,
  [$A[1/f]$ as a direct limit: the $n$-th copy of $A$ is "$f^(-n) A$", and multiplication by $f$ is the inclusion $f^(-n) A subset.eq f^(-n-1) A$.],
  "localization-colim",
)

// Limits: a cone over a diagram F, and the universal property of lim F (dual of colimit-ump).
#let limit-ump = [
  #figure(
    caption: [The limit $L = lim F$ with projections $pi_i$. Any other cone $(T, g_i)$ over $F$ factors uniquely through $L$ via the dashed map $u$; every triangle commutes.],
    canvas({
      import cetz.draw: *
      content((2, 4.3), $T$)
      content((2, 1.8), $L$)
      content((-1, 0), $F(i)$)
      content((5, 0), $F(j)$)
      _arr((-0.4, 0), (4.4, 0), $F(alpha)$, side: -0.3)
      _arr((1.7, 1.6), (-0.6, 0.3), $pi_i$, side: -0.3)
      _arr((2.3, 1.6), (4.6, 0.3), $pi_j$, side: 0.3)
      _arr((1.7, 4.05), (-0.8, 0.35), $g_i$, side: -0.3)
      _arr((2.3, 4.05), (4.8, 0.35), $g_j$, side: 0.3)
      _arr((2, 4.0), (2, 2.1), $u$, dashed: true, side: -0.25)
    }),
  ) <limit-ump>
]
