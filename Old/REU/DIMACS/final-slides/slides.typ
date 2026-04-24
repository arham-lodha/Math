// ─── Imports & slide theme ────────────────────────────────────────────────────
#import "@preview/grape-suite:2.0.0": slides
#import slides: *
#import "@preview/frame-it:1.2.0": *
#import "@preview/cetz:0.4.0"
#import "@preview/numty:0.0.5"


#let (theorem, feature, variant, syntax, definition, alert, conjecture) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be gene  rated
  theorem: ("Theorem", rgb(249, 234, 242)),
  conjecture: ("Conjecture", rgb(249, 234, 242)),

  // You can add as many as you want
  syntax: ("Syntax",),
  definition: "Definition",
  alert: ("Alert", rgb(255, 0, 0)),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)

#show: slides.with(
  title: [DIMACS REU],
  series: [Circle Packing],
  author: "Arham Lodha",
  email: link("arham.lodha@utexas.edu"),
  fontsize: 17pt,
  show-date: false,
  show-outline: false,
  show-semester: false,
  no: none,
)



#slide[
  = Triangulated Surfaces
  #definition[Triangulated Surface][Let $(S, cal(T))$ be a *triangulated surface* where $S$ is a surface and $cal(T)$ is a triangulation obtained by cutting $S$ into triangles and glueing them isometrically on edges such that the result is homeomorphic to $S$ .]

  #columns(2, [
    #figure(image("triangulatedTorus.png", width: 50%, height: auto))     #colbreak()
    #figure(image(
      "cube.png",
      width: 50%,
      height: auto,
    ))

  ])
]

#slide[
  = Circle Packing from Triangulated Surface

  #let radius = 2.75

  #let vertices = (
    (0, 0),
    (radius * 1, 0),
    (radius * 0.7071, radius * 0.7071),
    (0.0000, radius * 1.0000),
    (radius * -0.7071, radius * 0.7071),
    (radius * -1.0000, 0.0000),
    (radius * -0.7071, radius * -0.7071),
    (0.0000, -1 * radius),
    (0.7071 * radius, radius * -0.7071),
  )
  #let edges = (
    (0, 1),
    (0, 2),
    (0, 3),
    (0, 4),
    (0, 5),
    (0, 6),
    (0, 7),
    (0, 8),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6),
    (6, 7),
    (7, 8),
    (8, 1),
  )
  #let center_radius = 0.62 * radius
  #let petal_radii = .62 * center_radius
  #let radii = (
    (0, center_radius),
    (1, .62 * center_radius),
    (2, petal_radii),
    (3, petal_radii),
    (4, petal_radii),
    (5, petal_radii),
    (6, petal_radii),
    (7, petal_radii),
    (8, petal_radii),
  )

  You obtain a circle packing by taking a $(S, cal(T))$, a surface with a triangulation, and applying radius assignments to each vertex, while also enforcing intersection or distance conditions on the circles. The study of circle packing started with the condition that circles of adjacent vertices are tangent.

  #align(center + horizon, columns(2, [
    #figure(cetz.canvas({
      import cetz.draw: *

      // Circle centers and radii


      for (vertex) in vertices { circle(vertex, radius: 1pt, fill: black) }

      for (edges) in edges {
        let (v1, v2) = edges
        line(vertices.at(v1), vertices.at(v2))
      }
      for (element) in radii {
        let (i, r) = element
        circle(vertices.at(i), radius: r, stroke: 0pt) // Key fix: opacity:0
      }
    }))  #figure(cetz.canvas({
      import cetz.draw: *

      // Circle centers and radii


      for (vertex) in vertices { circle(vertex, radius: 1pt, fill: black) }

      for (edges) in edges {
        let (v1, v2) = edges
        line(vertices.at(v1), vertices.at(v2))
      }

      for (element) in radii {
        let (i, r) = element
        circle(vertices.at(i), radius: r)
      }
    }))]))


]

#slide[
  = Radius Function and Edge Lengths
  #definition[Radius Function][
    For a triangulated surface $(S, cal(T))$, the *radius function* is a function $r: V -> (0, infinity)$
  ]

  A *radius function* induces edge lengths $l: E -> (0, infinity)$. In the case where all circles are tangent.

  $
    l_(r)(v_(i) v_(j)) := r(v_(i)) + r(v_(j))
  $

  #align(center, [
    #cetz.canvas({
      import cetz.draw: *

      // Circle centers and radii
      let v_i = (0, 0)
      let v_j = (4, 0)
      let r_i = 2.0
      let r_j = 2.
      // Calculate intersection point (p)
      let d = calc.norm(v_i.at(0) - v_j.at(0), v_i.at(1) - v_j.at(1))
      let x = (d * d + r_i * r_i - r_j * r_j) / (2 * d)
      let y = calc.sqrt(r_i * r_i - x * x)
      let p = (x, y)

      // Calculate tangent vectors
      let tan1_dir = (-y, x) // Perpendicular to radius vector (x,y)
      let tan2_dir = (-y, x - d) // Perpendicular to radius vector (x-d, y)

      // Draw circles
      circle(v_i, radius: r_i, stroke: 0.5pt + black)
      circle(v_j, radius: r_j, stroke: 0.5pt + black)

      // Draw radii
      line(v_i, p, stroke: 1pt + blue)
      line(v_j, p, stroke: 1pt + blue)
      line(v_i, v_j, stroke: 1pt + black)


      // Labels
      // label("$v_j$", v_j, offset: (0, -0.4))
      // label("$r_i$", (v_i + p) / 2, offset: (0.2, -0.2))
      // label("$r_j$", (v_j + p) / 2, offset: (-0.2, -0.2))
      // label("$\phi(v_i v_j)$", p + (0.5, 0.3))

      // Draw points
      circle(v_i, radius: 3pt, fill: black, name: "vi")
      content((v_i.at(0) - 0.25, v_i.at(1) - 0.25), [$v_i$])

      circle(v_j, radius: 3pt, fill: black)

      content((v_j.at(0) + 0.5, v_j.at(1) - 0.25), [$v_j$])

      circle(p, radius: 3pt, fill: rgb(0, 0, 255), stroke: 0pt)
    })
  ])
]

#slide[
  = Circle Packing Metrics
  #definition[Circle Packing Metric][
    For a triangulated surface $(S, cal(T))$, if a *radius function* $r$ induces edge lengths such that the triangle inequality holds for all triangles in the triangulation then $r$ is *circle packing metric*. In the case of tangent circles, all radius functions are circle packing metrics. @jeffVanEeuwen1
  ]

  #align(center, image("cpTriangle.png", width: 25%, height: auto))

]

#slide[
  = Discrete Curvature
  #definition[Discrete Curvature][
    For $r$ a circle packing metric, it induces $K_(r): V -> (-infinity, 2 pi]$ which is the *discrete curvature* where
    $ K_(r)(v_(i)) := 2pi - sum_()^() theta_(i)^(j k) $
    where the sum ranges over all triangles $triangle v_(i) v_(j) v_(k)$ with $v_(i)$ as a vertex and $theta_(i)^(j k)$ angle at the vertex in the given triangle.
  ]

  #figure(image("discretecurvature.png", width: 15%))
]

#slide[
  = Thurston's Rigidity Theorem for Circle Packings
  #theorem[Thurston's Rigidity Theorem for Circle Packings ][
    Let $(S, cal(T))$ be a closed triangulated surface. If $R "and" r$ are circle packing metrics where $ K_(R) = K_(r) $

    Then $R = lambda r$.
  ]
  Proven by Thurston @thurston2022geometry.

]


#slide[
  = Discrete Schwartz Lemma
  #theorem[Discrete Schwartz-Alfhors-Pick Lemma ][
    Let $(S, cal(T))$ be a closed triangulated surface where $V(cal(T)) = V_(1) union.sq V_(2)$. Let $R "and" r$ be circle packing metrics where $ K_(R)|_(V_(1)) & >= K_(r)|_V_(1) \
        R|_(V_(2)) & >= r|_(V_(2)) $

    Then $R >= r$.
  ]
  Proven by Beardon and Stephanson in 1991 @beardon1991schwarz. We needed a couple key things in the proof:

  - The set of circle packing metrics is $RR_(>0)^(V)$, so its nice and convex.
  - The partial derivatives of discrete curvature with respect to radii behave nicely.
  - Thurston's Rigidity Theorem

]

#slide[
  = How can we generalize this?
  We can loosen the conditions on the circle packings, so the circles of adjacent no longer need to be tangent or even touch.

  #columns(2, [
    #align(center + top, "Intersection Angles")

    #figure(cetz.canvas({
      import cetz.draw: *

      let radius = 2.75

      let vertices = (
        (0, 0),
        (radius * 1, 0),
        (radius * 0.7071, radius * 0.7071),
        (0.0000, radius * 1.0000),
        (radius * -0.7071, radius * 0.7071),
        (radius * -1.0000, 0.0000),
        (radius * -0.7071, radius * -0.7071),
        (0.0000, -1 * radius),
        (0.7071 * radius, radius * -0.7071),
      )
      let edges = (
        (0, 1),
        (0, 2),
        (0, 3),
        (0, 4),
        (0, 5),
        (0, 6),
        (0, 7),
        (0, 8),
        (1, 2),
        (2, 3),
        (3, 4),
        (4, 5),
        (5, 6),
        (6, 7),
        (7, 8),
        (8, 1),
      )
      let center_radius = 0.8 * radius
      let petal_radii = 0.8 * 0.62 * radius
      let radii = (
        (0, center_radius),
        (1, petal_radii),
        (2, petal_radii),
        (3, petal_radii),
        (4, petal_radii),
        (5, petal_radii),
        (6, petal_radii),
        (7, petal_radii),
        (8, petal_radii),
      )

      // Circle centers and radii


      for (vertex) in vertices { circle(vertex, radius: 1pt, fill: black) }

      for (edges) in edges {
        let (v1, v2) = edges
        line(vertices.at(v1), vertices.at(v2))
      }

      for (element) in radii {
        let (i, r) = element
        circle(vertices.at(i), radius: r)
      }
    }))

    #colbreak()
    #align(center + top, "Inversive Distance")

    #figure(cetz.canvas({
      import cetz.draw: *

      let radius = 2.75

      let vertices = (
        (0, 0),
        (radius * 1, 0),
        (radius * 0.7071, radius * 0.7071),
        (0.0000, radius * 1.0000),
        (radius * -0.7071, radius * 0.7071),
        (radius * -1.0000, 0.0000),
        (radius * -0.7071, radius * -0.7071),
        (0.0000, -1 * radius),
        (0.7071 * radius, radius * -0.7071),
      )
      let edges = (
        (0, 1),
        (0, 2),
        (0, 3),
        (0, 4),
        (0, 5),
        (0, 6),
        (0, 7),
        (0, 8),
        (1, 2),
        (2, 3),
        (3, 4),
        (4, 5),
        (5, 6),
        (6, 7),
        (7, 8),
        (8, 1),
      )
      let center_radius = 0.3 * radius
      let petal_radii = 0.3 * radius
      let radii = (
        (0, center_radius),
        (1, petal_radii),
        (2, petal_radii),
        (3, petal_radii),
        (4, petal_radii),
        (5, petal_radii),
        (6, petal_radii),
        (7, petal_radii),
        (8, petal_radii),
      )

      // Circle centers and radii


      for (vertex) in vertices { circle(vertex, radius: 1pt, fill: black) }

      for (edges) in edges {
        let (v1, v2) = edges
        line(vertices.at(v1), vertices.at(v2))
      }

      for (element) in radii {
        let (i, r) = element
        circle(vertices.at(i), radius: r)
      }
    }))

  ])

]


#slide[
  = Triangulated Surface With Intersection Angles
  #definition[Triangulated Surface with Intersection Angles][
    A *triangulated surface with intersection angles* $(S,cal(T), Phi)$ is a triangulated surface with function $Phi: E(cal(T)) -> [0, pi)$. For a edge $v_(i) v_(j)$, if you place circles of radii $r_(i)$ and $r_(j)$ centered $v_(i)$ and $v_(j)$ respectively, then $Phi(v_(i) v_(j))$ describes the intersection angle between the two circles.
  ]

  // #align(center, [

  // ])

  #columns(2, [
    #cetz.canvas({
      import cetz.draw: *

      // Circle centers and radii
      let v_i = (0, 0)
      let v_j = (4, 0)
      let r_i = 2.0
      let r_j = 3.
      // Calculate intersection point (p)
      let d = calc.norm(v_i.at(0) - v_j.at(0), v_i.at(1) - v_j.at(1))
      let x = (d * d + r_i * r_i - r_j * r_j) / (2 * d)
      let y = calc.sqrt(r_i * r_i - x * x)
      let p = (x, y)

      // Calculate tangent vectors
      let tan1_dir = (-y, x) // Perpendicular to radius vector (x,y)
      let tan2_dir = (-y, x - d) // Perpendicular to radius vector (x-d, y)

      // Draw circles
      circle(v_i, radius: r_i, stroke: 0.5pt + black)
      circle(v_j, radius: r_j, stroke: 0.5pt + black)

      // Draw radii
      line(v_i, p, stroke: 1pt + blue)
      line(v_j, p, stroke: 1pt + blue)
      line(v_i, v_j, stroke: 1pt + black)

      // Draw tangents (extended segments)
      let tangent_len = 2.0
      line(
        (
          p.at(0) - tangent_len * tan1_dir.at(0) / calc.norm(tan1_dir.at(0), tan1_dir.at(1)),
          p.at(1) - tangent_len * tan1_dir.at(1) / calc.norm(tan1_dir.at(0), tan1_dir.at(1)),
        ),
        (
          p.at(0) + tangent_len * tan1_dir.at(0) / calc.norm(tan1_dir.at(0), tan1_dir.at(1)),
          p.at(1) + tangent_len * tan1_dir.at(1) / calc.norm(tan1_dir.at(0), tan1_dir.at(1)),
        ),
        stroke: 1pt + green,
        name: "tangent1",
      )
      line(
        (
          p.at(0) - tangent_len * tan2_dir.at(0) / calc.norm(tan2_dir.at(0), tan2_dir.at(1)),
          p.at(1) - tangent_len * tan2_dir.at(1) / calc.norm(tan2_dir.at(0), tan2_dir.at(1)),
        ),
        (
          p.at(0) + tangent_len * tan2_dir.at(0) / calc.norm(tan2_dir.at(0), tan2_dir.at(1)),
          p.at(1) + tangent_len * tan2_dir.at(1) / calc.norm(tan2_dir.at(0), tan2_dir.at(1)),
        ),
        stroke: 1pt + green,
        name: "tangent2",
      )

      // Draw angle φ between tangents
      cetz.angle.angle(
        p,
        "tangent1.end",
        "tangent2.start",
        label: $ Phi $,
        radius: 1.2,
        direction: "cw",
      )


      // Draw points
      circle(v_i, radius: 3pt, fill: black, name: "vi")
      content((v_i.at(0) - 0.25, v_i.at(1) - 0.25), [$v_i$])

      circle(v_j, radius: 3pt, fill: black)

      content((v_j.at(0) + 0.5, v_j.at(1) - 0.25), [$v_j$])

      circle(p, radius: 3pt, fill: rgb(0, 0, 255), stroke: 0pt)
    }) #colbreak()

    If $r$ is a radius assignment, then the induced edge lengths $l_(r): E -> (0, infinity)$ is given by
    $ l_(r)(v_(i) v_(j)) = sqrt(r(v_(i))^2 + r(v_(j))^2 + 2r(v_(i)) r(v_(j)) cos(Phi(v_(i) v_(j)))) $

    This follows from a basic geometric calculation using cosine law.
  ])
]

#slide[
  = Beardon-Stephenson-Eeuwen theorem
  #theorem[Beardon-Stephenson-Eeuwen theorem ][
    Let $(S, cal(T), Phi)$ be a closed triangulated surface with intersection angles where $V(cal(T)) = V_(1) union.sq V_(2)$ and $Phi: E -> [0, (pi)/(2)]$ . Let $R "and" r$ be circle packing metrics where $ K_(R)|_(V_(1)) & >= K_(r)|_V_(1) \
        R|_(V_(2)) & >= r|_(V_(2)) $

    Then $R >= r$.
  ]
  Proven by Jeff Van Eeuwen in 1994 @jeffVanEeuwen1.
]

#slide[
  = Discrete Schwartz Lemma for Intersection Angles
  #theorem[Main Theorem 1][
    Let $(S, cal(T), Phi)$ be a closed triangulated surface with intersection angles where $V(cal(T)) = V_(1) union.sq V_(2)$ and  $forall triangle v_(i) v_(j) v_(k) in F(cal(T))$ $ cos(Phi_(a)) + cos(Phi_(b)) cos(Phi_(c)) >= 0 $ for ${a, b, c} = {i, j, k}$.

    #align(center, cetz.canvas({
      import cetz.draw: *

      // Circle centers and radii
      let v_i = (0, 0)
      let v_j = (4, 0)
      let r_i = 2.5
      let r_j = 2.5
      // Calculate intersection point (p)
      let d = calc.norm(v_i.at(0) - v_j.at(0), v_i.at(1) - v_j.at(1))
      let x = (d * d + r_i * r_i - r_j * r_j) / (2 * d)
      let y = calc.sqrt(r_i * r_i - x * x)
      let p = (x, y)

      // Calculate tangent vectors
      let tan1_dir = (-y, x) // Perpendicular to radius vector (x,y)
      let tan2_dir = (-y, x - d) // Perpendicular to radius vector (x-d, y)


      // Draw radii
      line(v_i, p, stroke: 1pt + black)
      line(v_j, p, stroke: 1pt + black)
      line(v_i, v_j, stroke: 1pt + black)


      // Draw points
      circle(v_i, radius: 3pt, fill: black, name: "vi")
      content((v_i.at(0) - 0.25, v_i.at(1) - 0.25), [$v_i$])

      circle(v_j, radius: 3pt, fill: black)

      content((v_j.at(0) + 0.5, v_j.at(1) - 0.25), [$v_j$])

      circle(p, radius: 3pt, fill: black, stroke: 0pt)
      content((p.at(0) + 0.5, p.at(1) + 0.25), [$v_k$])

      content((0.5, 1), [$Phi_(j)$ ])
      content((3.5, 1), [$Phi_(i)$ ])
      content((2, -0.5), [$Phi_(k)$ ])
    }))


    Let $R "and" r$ be circle packing metrics where $K_(R)|_(V_(1)) >= K_(r)|_V_(1)$ and $R|_(V_(2))>= r|_(V_(2))$. Then $R >= r$.
  ]

]

#slide[
  = Triangulated Surface With Inversive Distances
  #definition[Triangulated Surface with Inversive Distances][
    A *triangulated surface with Inversive Distances* $(S,cal(T), I)$ is a triangulated surface with function $I: E(cal(T)) -> [1, infinity)$. For a edge $v_(i) v_(j)$, if you place circles of radii $r_(i)$ and $r_(j)$ centered $v_(i)$ and $v_(j)$ respectively, then $I(v_(i) v_(j))$ describes the inversive distance between the two circles.
  ]

  If $r$ is a radius assignment, then the induced edge lengths $l_(r): E -> (0, infinity)$ is given by
  $ l_(r)(v_(i) v_(j)) = sqrt(r(v_(i))^2 + r(v_(j))^2 + 2r(v_(i)) r(v_(j)) I(v_(i) v_(j))) $

]

#slide[
  = Discrete Schwartz Lemma for Inversive Distances
  #conjecture[Discrete Schwartz Lemma for Inversive Distances ][
    Let $(S, cal(T), I)$ be a closed triangulated surface with inversive distances where $V(cal(T)) = V_(1) union.sq V_(2)$. Let $R "and" r$ be circle packing metrics where $ K_(R)|_(V_(1)) & >= K_(r)|_V_(1) \
        R|_(V_(2)) & >= r|_(V_(2)) $

    Then $R >= r$.
  ]
]

#slide[
  = Counter Example for Discrete Schwartz Lemma for Inversive Distances

  #columns(2, [
    #figure(image("counterexample.jpeg"))
    #colbreak()
    #align(center, [
      Let $V_(1) = {v}$ and $V_(2) = {a, b, c}$.
      #table(
        columns: (auto, auto, auto),
        stroke: 0.4pt,
        [*Vertex*], [*Radius* $r(v)$], [*Curvature* $k_r(v)$],
        $a$, `1.0`, `2.49300`,
        $b$, `1.0`, `4.54271`,
        $c$, `1.0`, `3.97976`,
        $v$, `1.48297`, `4.69250`,
      )#table(
        columns: (auto, auto, auto),
        stroke: 0.4pt,
        [*Vertex*], [*Radius* $R(v)$], [*Curvature* $k_R(v)$],
        $a$, `1.09193`, `1.24905`,
        $b$, `2.45799`, `5.20030`,
        $c$, `2.22062`, `4.49970`,
        $v$, `1.47981`, `4.75891`,
      )])


  ])
]


#slide[
  #bibliography("refs.bib", title: "References")

]
#slide[
  #align(
    center + horizon,
    [*Thank you to Professor Feng Luo, Professor Hongbin Sun, Dr. Zhenghao Rao, and Mr. Kuijun Liu. Thank you to the DIMACS REU Program and Rutgers for hosting me to do this research!
      Work supported by the Rutgers Department of Mathematics with NSF Grant #2220271.*],
  )
]

