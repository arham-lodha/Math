// CeTZ figures for main.typ. Each is a bare canvas; wrap it in #figure in main.typ.
#import "template.typ": *

#let c-main = rgb("#2f5d8a")
#let c-point = rgb("#c2572b")
#let c-alt = rgb("#3f8a5c")
#let small(body) = text(size: 8pt, body)
#let arrowhead(c) = (end: "stealth", fill: c, scale: 0.6)

// X = R and its one-point compactification S^1, with the cycle sum_n [n, n+1].
#let fig-line-to-circle = canvas({
  import cetz.draw: *
  let u = 0.75
  for n in range(-4, 4) {
    line((n * u, 0), ((n + 1) * u - 0.04, 0), stroke: 1.3pt + c-main, mark: arrowhead(c-main))
  }
  for n in range(-4, 5) {
    line((n * u, -0.08), (n * u, 0.08), stroke: 0.5pt)
    content((n * u, -0.35), small($#n$))
  }
  content((-4 * u - 0.15, 0), $dots.c$, anchor: "east")
  content((4 * u + 0.15, 0), $dots.c$, anchor: "west")
  content((0, 0.8), $X = RR$)

  line((3.9, 0), (4.9, 0), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.5))
  content((4.4, 0.3), small[compactify])

  let (cx, r) = (7.1, 1.3)
  let pt(t) = {
    let phi = 2 * calc.atan(t / 2.2)
    (cx + r * calc.sin(phi), -r * calc.cos(phi))
  }
  circle((cx, 0), radius: r, stroke: 1.3pt + c-main)
  for n in range(-7, 8) { circle(pt(n), radius: 0.035, fill: black, stroke: none) }
  content((cx, -r + 0.3), small($0$))
  content((rel: (0.2, -0.2), to: pt(1)), small($1$), anchor: "north-west")
  content((rel: (-0.2, -0.2), to: pt(-1)), small($-1$), anchor: "north-east")
  circle((cx, r), radius: 0.08, fill: c-point, stroke: none)
  content((cx, r + 0.3), $oo$)
  content((cx, -r - 0.45), $hat(X) = S^1$)
})

// A good compact K in X-hat = S^2: its complement U_K is a contractible cap around oo.
#let fig-good-compact = canvas({
  import cetz.draw: *
  let (R, h) = (1.6, 0.85)
  let w = calc.sqrt(R * R - h * h)
  let th = calc.acos(w / R)
  circle((0, 0), radius: R, fill: c-main.lighten(85%), stroke: none)
  merge-path(fill: c-point.lighten(55%), stroke: none, {
    arc((-w, h), start: 180deg, stop: 360deg, radius: (w, 0.22 * w))
    arc((w, h), start: th, stop: 180deg - th, radius: R)
  })
  arc((-w, h), start: 180deg, stop: 360deg, radius: (w, 0.22 * w), stroke: 0.5pt)
  circle((0, 0), radius: R, stroke: 0.8pt)
  circle((0, 0), radius: (R, 0.3), stroke: (thickness: 0.4pt, dash: "dashed", paint: gray))
  circle((0, R), radius: 0.07, fill: c-point, stroke: none)
  content((0, R + 0.3), $oo$)
  content((w + 0.35, h + 0.35), $U_K$)
  content((0, -0.75), $K$)
  circle((-0.45, 0.1), radius: 0.05, fill: black, stroke: none)
  content((-0.45, -0.15), small($x$), anchor: "north")
  content((0, -R - 0.4), $hat(X) = S^2 quad (X = CC)$)

  content((2.6, 0), anchor: "west", $
    H_m (hat(X), oo) & iso H_m (hat(X), U_K) & #small[($U_K$ contracts to $oo$)] \
    & iso H_m (X, X - K) & #small[(excise $oo$)] \
    & in.rev mu_K
  $)
})

// Restricting [-1, 1] to U = [-1, 1] - {0}: subdivide infinitely towards F = {0}.
#let fig-subdivision = canvas({
  import cetz.draw: *
  let L = 4
  line((-L, 0), (L, 0), stroke: 1.3pt + c-main)
  for side in (-1, 1) {
    for k in range(0, 9) {
      let s = calc.pow(0.5, k)
      let x = side * L * s
      let ht = 0.06 + 0.2 * s
      line((x, -ht), (x, ht), stroke: 0.5pt)
    }
  }
  circle((0, 0), radius: 0.08, fill: white, stroke: 1.2pt + c-point)
  content((0, -0.45), $F = {0}$)
  content((-L / 2, -0.45), $U$)
  content((L / 2, -0.45), $U$)
  content((-L, -0.45), small($-1$))
  content((L, -0.45), small($1$))
})

// U = R - 0 and its one-point compactification, a wedge of two circles.
#let fig-figure-eight = canvas({
  import cetz.draw: *
  line((-3, 0), (-0.14, 0), stroke: 1.3pt + c-main, mark: arrowhead(c-main))
  line((0.12, 0), (3, 0), stroke: 1.3pt + c-alt, mark: arrowhead(c-alt))
  circle((0, 0), radius: 0.08, fill: white, stroke: 1.2pt + c-point)
  content((0, -0.35), small($0$))
  content((-1.5, 0.35), small($(-oo, 0)$))
  content((1.5, 0.35), small($(0, oo)$))

  line((3.5, 0), (4.4, 0), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.5))

  let (cx, r) = (7.1, 0.9)
  circle((cx - r, 0), radius: r, stroke: 1.3pt + c-main)
  circle((cx + r, 0), radius: r, stroke: 1.3pt + c-alt)
  // orientation arrows at the outer points of each loop
  line((cx - 2 * r, -0.12), (cx - 2 * r, 0.1), stroke: 1.3pt + c-main, mark: arrowhead(c-main))
  line((cx + 2 * r, 0.12), (cx + 2 * r, -0.1), stroke: 1.3pt + c-alt, mark: arrowhead(c-alt))
  circle((cx, 0), radius: 0.08, fill: c-point, stroke: none)
  content((cx, -0.62), small($oo$))
  content((cx, -1.3), $hat(U) = S^1 or S^1$)
})

// Real cartoons of complex curves: the nodal cubic and the cross xy = 0.
#let fig-singular-curves = canvas({
  import cetz.draw: *
  let s = 0.85
  let pts = range(0, 121).map(i => {
    let t = -1.5 + 3 * i / 120
    (s * (t * t - 1), s * t * (t * t - 1))
  })
  line(..pts, stroke: 1.3pt + c-main)
  circle((0, 0), radius: 0.08, fill: white, stroke: 1.2pt + c-point)
  content((0.05, -0.4), $S$)
  content((1.45, 1.1), $X^"reg"$)
  content((0.4, -2.0), small[irreducible, singular at one point])

  let (ox, L) = (6, 1.6)
  line((ox - L, 0), (ox + L, 0), stroke: 1.3pt + c-main)
  line((ox, -L), (ox, L), stroke: 1.3pt + c-alt)
  circle((ox, 0), radius: 0.08, fill: white, stroke: 1.2pt + c-point)
  content((ox + L + 0.15, 0), $X_1 = {y = 0}$, anchor: "west")
  content((ox + 0.2, L - 0.1), $X_2 = {x = 0}$, anchor: "west")
  content((ox, -2.0), small[reducible: components $X_1, X_2$])
})
