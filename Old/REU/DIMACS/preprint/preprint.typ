#import "@preview/unequivocal-ams:0.1.2": ams-article
#import "@preview/lemmify:0.1.8": *
#import "@preview/cetz:0.4.1"

#let (
  theorem,
  lemma,
  corollary,
  remark,
  proposition,
  example,
  proof,
  definition,
  rules: thm-rules,
) = default-theorems("thm-group", lang: "en")
#show: thm-rules

#let tri = $triangle$
#let triijk = $tri v_(i) v_(j) v_(k)$

#let (conjecture, rules) = new-theorems("thm-group", ("conjecture": [Conjecture]))
#show: rules
#set math.equation(numbering: "(1)")
#show ref: it => {
  let eq = math.equation
  let el = it.element
  if el != none and el.func() == eq {
    // Override equation references.
    link(el.location(), numbering(
      el.numbering,
      ..counter(eq).at(el.location()),
    ))
  } else {
    // Other references as usual.
    it
  }
}

#show: ams-article.with(
  title: [The Discrete Schwarz-Pick Lemma for Circle Packings Revisited],
  authors: (
    // (
    //   name: "Arham Lodha",
    //   department: [Mathematics Department],
    //   organization: [University of Texas at Austin],
    //   location: [Austin, Texas 75033],
    //   email: "arham.lodha@utexas.edu",
    // ),
    // (
  ),
  abstract: [The Discrete Schwarz-Pick Lemma is a discrete analogue of the classical result from complex analysis, arising from the connection between circle packings and conformal maps established by Thurston. Prior work by Beardon, Stephenson and Van Eeuwen established this lemma for circle packings where circles are tangent or intersect at acute angles, corresponding to inversive distances $I in (0,1]$. This paper extends the investigation to circle packings with inversive distances in $(-1,1]$. Within this regime, we prove that the Discrete Schwarz-Pick Lemma holds for a specific subclass of packings that satisfy a condition on the weights of each triangle. The proof relies on a variational principle for circle packings with inversive distances. In contrast, we also show that the lemma fails for packings containing both tangent $(I = 1)$ and disjoint $(I > 1)$ circles. We demonstrate this by constructing a specific counterexample on a triangulated disk with four vertices.],
  bibliography: bibliography("refs.bib"),
)

= Introduction
== Background
In March of 1985, in the International Symposium in Celebration of the Bieberbach Conjecture, William Thurston suggested the connection between circle packings and conformal maps. William Thurston conjectured that the conformal map from a simply connected domain $Omega$ to the unit disk $DD$ could be approximated by circle packings, a claim famously proven by Rodin and Sullivan in 1987 @rodinandsullivan.

Furthermore, in his work constructing hyperbolic structures on 3 manifolds, Thurston introduced the notion of circle packing metrics on triangulated surfaces with non-obtuse intersection angles @thurston2022geometry.
Thurston utilized this prescription of angles because the angles of intersecting circles are invariant under Möbius Transformations. For triangulated surfaces with Thurston's construction there are singularities at the vertices. Classic discrete curvature $K(v)$, which is defined as the angle deficit at vertex $v$, is used to describe the singularity at the vertex.

As a generalization of Thurston's Circle packings, inversive distance circle packings were introduced by Bowers and Stephenson @bowersandstephenson. This generalization allowed for circles of adjacent vertices to be disjoint with the distance between the two circles measured by inversive distance. For more information, see Bowers-Hurdal @BowersandHurdal, Stephenson @Stephensonbook, and Guo @guo2009localrigidityinversivedistance for more information.

Starting from Thurston's initial idea of approximating conformal maps by discretizing our space with the use of circle packings and the eventual proof by Rodin and Sullivan, work began on discretizing the ideas and theorems of complex analysis and Riemann Surfaces with the use of circle packings. Important theorems such as the Riemann Mapping Theorem and Uniformization got their discretized equivalents @stephenson2003circle.

The theorem of interest for this paper is the Discrete Schwarz-Pick Lemma, which is the discretized version of the Schwarz-Pick Lemma in complex analysis. Beardon and Stephenson established the Discrete Schwarz-Pick Lemma for the case of tangent circle packings using discrete Perron's method @beardon1991schwarz. Later, Van Eeuwen proved the case for intersection angles $phi$ between two adjacent circles between $0$ and $(pi)/(2)$ or inversive distance between $0$ and $1$   @jeffVanEeuwen1. The difficulty in extending these results to a broader range of inversive distances, lies in the fact that the space of circle packing metrics lacks convexity which breaks many of the arguments needed to establish this result.

This paper relies on an observation by Zhou @zhou2019circlepatternsobtuseexterior, to establish some bounds on inversive distances to reestablish convexity to the space of circle packing metrics to prove the Discrete Schwarz-Pick Lemma. The main tools are the variational principle established by Colin de Verdiere @colindeverdiere and expanded by  Guo @guo2009localrigidityinversivedistance, and foundational results on circle packing geometries by Thurston @thurston2022geometry. Additionally, the paper presents a counter example to the Discrete Schwarz-Pick Lemma for the case of $I >= 1$ (i.e. tangent or disjoint circles) which was conjectured to hold. This is surprising because of the fact that both infinitesimal @guo2009localrigidityinversivedistance and global rigidity @luo2006rigiditypolyhedralsurfaces were proven for this case. Many of the ideas that go into proving global rigidity in this case are also used to prove the Discrete Schwarz-Pick.

== Inversive Distance Circle Packings
In this subsection, we discuss the concept of inversive distance circle packings introduced by Bowers and Stephenson @bowersandstephenson. For all $n in NN$, let $[n] := {1, #sym.dots.h, n}$.

Let $S$ be a surface with Euclidean or hyperbolic background geometry and a finite simplicial triangulation $cal(T) = {V, E, F}$, where $V$, $E$, $F$ represent the vertices, edges, and faces of $cal(T)$. Let $N = abs(V)$ be a number of vertices. We identify the vertex set $V$ with an index set $[N]$. Thus $E subset binom([N], 2)$ is the set of edges (pairs of indices) and $F subset binom([N], 3)$ is the set of faces. We will adopt the following notation convention for convenience:

1. For generic indices represented by variables (e.g. $i, j, k in [N]$ ) we will denote an edge simply as $i j in E$ and a face as $i j k in F$.
2. For specific numerical indices, we will use formal set notation (e.g an edge ${1, 2} in E$ or a face ${1, 2, 3} in F$).


Let $I: E -> (-1, oo)$ be a function that assigns each edge ${i, j}$ a inversive distance $I_(i j) in (-1, oo)$. The triple $(S, cal(T), I)$ will be referred to as a *weighted triangulated surface*.

For all functions $f: V -> RR$, let $f_(i) := f(i)$ and thus $f$ can be viewed as the vector $(f_(1), #sym.dots.h, f_(N)) in RR^(N)$. Let $RR_(>0) := (0, oo)$. Any map $r: V -> RR_(>0)$ is called a *radius function*. The radius function on a weighted triangulated surface induces a edge length map $l_(r) : E -> RR_(>0)$ where
$ l_(r)(i j) = sqrt(r_(i)^(2) + r_(j)^(2) + 2r_(i) r_(j)I_(i j)) $<lengthEuclidean>

if the background geometry is Euclidean and $ l_(r)(i j) = cosh^(-1)(cosh(r_(i)) cosh(r_(j)) + I_(i j) sinh(r_(i)) sinh(r_(j))) $<lengthHyperbolic> if the background geometry is hyperbolic. Note that the length $l_(r)(i j)$ in @lengthEuclidean and @lengthHyperbolic is well defined if $r_(i), r_(j) > 0$ and $I_(i j) > -1$. Furthermore the inversive distance $I_(i j)$ determines the geometry of circles attached to $v_(i)$ and $v_(j)$ respectively :

- If $I_(i j) in (-1, 1]$ the circles corresponding to vertices $i$ and $j$ respectively intersect. There exists a unique angle $Phi_(i j) in [0, pi)$ such that $I_(i j) = cos(Phi_(i j))$. $Phi_(i j)$ is the angle formed by the tangent lines of the circles at the intersection point. See @intersectionangle for reference. The intersection is obtuse if $I_(i j) in (-1, 0)$, orthogonal if $I_(i j) = 0$, and acute if $I_(i j) in (0 1)$.
- If $I_(i j) = 1$, the circles are tangent.
- If $I_(i j) > 1$, the circles are disjoint.

// TODO Show three cases
#figure(
  [#cetz.canvas({
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
      label: text([$Phi_(1, 2)$], size: 9pt),
      radius: 1.2,
      direction: "cw",
    )


    // Draw points
    circle(v_i, radius: 3pt, fill: black, name: "vi")
    content((v_i.at(0) - 0.25, v_i.at(1) - 0.25), [$1$])

    circle(v_j, radius: 3pt, fill: black)

    content((v_j.at(0) + 0.25, v_j.at(1) - 0.25), [$2$])

    circle(p, radius: 3pt, fill: rgb(0, 0, 255), stroke: 0pt)
  })],
  caption: "Intersection Angle in Circle Packings",
)<intersectionangle>


If for each face ${i, j, k} in F$ the induced lengths $l_(r)$ satisfy the triangle inequalities

$
  l_(r)(i j) + l_(r)(j k) & > l_(r)(i k) \
  l_(r)(i k) + l_(r)(j k) & > l_(r)(i j) \
  l_(r)(i j) + l_(r)(i k) & > l_(r)(j k)
$

then $r$ is called a *circle packing metric*. Such a metric induces a combinatorial curvature on the surface $K_(r) := V -> (-oo, 2pi)$ where $ K_(r)(i) := 2 pi - sum_(alpha > i)^() alpha $<discretecurvatureformula> where $alpha > v$ means all the angles incident to $i$. Note that $r -> K_(r)$ is a continuous function.

== Plan of the Paper
The paper is organized as follows. In @intersectionsection we prove the Discrete Schwarz-Pick Lemma for Circle Packings for a broader range of intersection behaviors for hyperbolic and Euclidean background. In @counterexamplesection we present a counterexample to the Discrete Schwarz-Pick Conjecture for the case of tangent and disjoint circles.

= Discrete Schwarz-Pick Lemma for Circle Packing with Intersections<intersectionsection>
== Triangle Preliminaries in Euclidean background geometry

Let $(S, cal(T), I)$ be a weighted triangulated surface with Euclidean background geometry and let $r$ be a radius function, and $l_(r)$ and $K_(r)$ be the induced edge lengths and discrete curvatures respectively. Suppose $tau = i j k in F$. For this section we will temporarily adopt standard geometric conventions where $l_(i) = l_(r)(j k)$ and $I_(i) = I(j k)$ are the edge length and inversive distance of the edge opposite vertex $i$.
Let $ gamma_(tau) = (I_(i) + I_(j) I_(k), I_(j) + I_(i) I_k, I_(k) + I_(i) I_(j)) = (gamma_(tau)^(i), gamma_(tau)^(j), gamma_(tau)^(k)). $


As noted in @guo2009localrigidityinversivedistance, the edge lengths $l_(i), l_(j), l_(k)$ satisfy the triangle inequalities if and only if $ 0 & < (l_(i) + l_(j) + l_(k))(l_(j) + l_(k) - l_(i))(l_(i) + l_(k) - l_(j))(l_(i) + l_(j) - l_(k)) \
  & = ((l_(j) + l_(k))^(2) - l_(i)^(2))(l_(i) - (l_(j) - l_(k)))(l_(i) + (l_(j) - l_(k))) \
  & = ((l_(j) + l_(k))^(2) - l_(i)^(2))(l_(i)^2 - (l_(j) - l_(k))^2) \
  & = (- l_(i)^(2) + l_(j)^(2) + 2 l_(j) l_(k) + l_(k)^(2) )(l_(i)^(2) - l_(j)^(2) + 2l_(j) l_(k) - l_(k)^(2)) \
  & = -l_(i)^(4) - l_(j)^(4) - l_(k)^(4) + 2 l_(i)^(2)l_(j)^(2) + 2 l_(i)^(2) l_(k)^(2) + 2 l_(j)^(2) l_(k)^(2) $<simplifiedtriangleinequality>

Substituting the definition for edge lengths defined in @lengthEuclidean, by direct computation we have

$
  & (1)/(4)(l_(i) + l_(j) + l_(k))(l_(j) + l_(k) - l_(i))(l_(i) + l_(k) - l_(j))(l_(i) + l_(j) - l_(k)) \
  & = r_(i)^(2) r_(j)^(2)(1 - I_(k)^(2)) + r_(i) r_(k)(1 - I_(j)^(2)) + r_(j)^(2)r_(k)^(2)(1 - I_(i)^(2)) \
  & + 2r_(i)r_(j)r_(k)(r_(i) gamma_(tau)^(i) + r_(j)gamma_(tau)^(j) + r_(k) gamma_(tau)^(k))
$

Thus we have the following result on the Euclidean triangle inequalities.



#lemma(name: [@xu2018rigidityinversivedistancecircle, Lemma 2.1])[
  Suppose $(S, cal(T), I)$ is a weighted triangulated surface, $r$ is a radius function, and $tau = triijk$ is a topological triangle in $F$. Then the edge lengths defined in @lengthEuclidean satisfy the triangle inequalities if and only if $ r_(i)^(2) r_(j)^(2)(1 - I_(k)^(2)) & + r_(i) r_(k)(1 - I_(j)^(2)) + r_(j)^(2)r_(k)^(2)(1 - I_(i)^(2)) \
  & + 2r_(i)r_(j)r_(k)(r_(i) gamma_(tau)^(i) + r_(j)gamma_(tau)^(j) + r_(k) gamma_(tau)^(k)) > 0 $]<euclideanconditiononradii>

The following corollary obtained in @zhou2019circlepatternsobtuseexterior directly follows from @euclideanconditiononradii.

#corollary[
  If $I_(i), I_(j), I_(k) in (-1, 1]$ and $gamma_(tau) in [0, oo)^(3)$, then the triangle inequalities are satisfied for any $(r_(i), r_(j), r_(k)) in RR_(>0)^(3)$.
]<validradiiEuclidean>

It immediately follows that if for all $tau in F$ we have that $gamma^(tau) in RR_(>=0)^(3)$, then the space of circle packing metrics on $(S, cal(T), I)$ is $RR^(N)_(>0)$.

== Infinitesimal Rigidity of Euclidean Inversive Distance Circle Packings

Let $(S, cal(T), I)$ be a weighted triangulated surface with euclidean background where $-1 < I <= 1$. Let $tau = i j k in F$ where $gamma^(tau) in RR_(>=0)^(3)$. By @validradiiEuclidean, $forall (r_i, r_j, r_k) in RR_(>0)^(3)$ induces edge lengths which form a triangle. Let $(u_(i), u_(j), u_(k)) = (ln(r_(i)), ln(r_(j)), ln(r_(k)))$. For all $a in {i, j, k}$, let $theta_(a)$ inner angle of $tau$  at the vertex $a$. We have the following useful lemma regarding the monotonicity of $theta_(a)$ with respect to $(u_(i), u_j, u_k)$, and thus $(r_i, r_j, r_k)$.

#lemma(name: [@xu2018rigidityinversivedistancecircle])[
  For all $tau = i j k in F$ where $gamma_(tau) in RR_(>=0)^(3)$, we have the following:

  + $(diff theta_(a))/(diff u_(b)) = (diff theta_(b))/(diff u_(a)) > 0$ for $a, b in {i, j, k}$ where $a != b$.
  + $(diff theta_(a))/(diff u_(a)) < 0$ for $a in {i, j, k}$ .
  + The jacobian $J_(u)(theta)$ is symmetric and negative semi definite, with null space $ RR[1, 1, 1] = {[t,t,t] mid(|) t in RR}. $
  + The differential 1-form $sum_(a in {i, j, k})^() theta_(a) dif u_(a)$ is closed on $RR^3$ (and hence exact) and $ W_(tau)(u) = integral_(0)^u sum_(a in {i, j, k})^() theta_(a) dif u_(a) $ is a well defined concave function of $u in RR^3$ satisfying $ gradient W_(tau) = (theta_(i), theta_(j), theta_(k)) $
    Furthermore, $W_(tau)$ is strictly concave when restricted to ${t u + (1 - t) hat(u) mid(|) t in RR}$, provided that $u - hat(u) != (a, a, a)$ for $a in RR$.
]<EuclideanMonotonicity>
#proof[
  Part 1 of the lemma comes from Lemma 2.5 in Xu @xu2018rigidityinversivedistancecircle. Part 2 holds because $theta_(i) + theta_(j) + theta_(k) = pi$. Thus $ (diff theta_(i))/(diff u_(i)) + (diff theta_(j))/(diff u_(i))+ (diff theta_(k))/(diff u_(i)) = 0. $ Since $(diff theta_(a))/(diff u_(b)) > 0$ for $a != b$, by part 1 we deduce that $(diff theta_(i))/(diff u_(i)) < 0$. Part 3 and 4 hold because of Lemma 2.6 and Lemma 2.10 respectively from Xu @xu2018rigidityinversivedistancecircle.
]


== Triangle Preliminaries in hyperbolic background geometry
Let $(S, cal(T), I)$ be a weighted triangulated surface with hyperbolic background geometry and let $r$ be a radius function, and $l_(r)$ and $K_(r)$ be the induced edge lengths and discrete curvatures respectively. Suppose $tau = i j k in F$, for this section we will temporarily adopt standard geometric conventions where $l_(i) = l_(r)(j k)$ and $I_(i) = I(j k)$ are the edge length and inversive distance of the edge opposite vertex $i$.
Let $ gamma_(tau) = (I_(i) + I_(j) I_(k), I_(j) + I_(i) I_k, I_(k) + I_(i) I_(j)) = (gamma_(tau)^(i), gamma_(tau)^(j), gamma_(tau)^(k)). $

Let $ S_(i) = sinh(r_(i)) "and" C_(i) = cosh(r_(i)). $

Working the algebra to a inequality similar to @simplifiedtriangleinequality, we get the following lemma regarding the circle packing metrics for our triangle $tau$.

#lemma(name: [@guo2009localrigidityinversivedistance, Lemma 3.1])[
  Suppose $(S, cal(T), I)$ is a weighted triangulated surface with hyperbolic background geometry. Let $r$ be be a radius function and $tau = i j k in F$. Then the edge lengths defined in @lengthEuclidean satisfy the triangle inequalities if and only if $ 2S_(i)^(2)S_(j)^(2)S_(k)^(2)(1 + I_(i)I_(j)I_(k)) &+ S_(i)^(2)S_(j)^(2)(1 - I_(k)^(2)) + S_(i)^(2)S_(k)^(2)(1 - I_(j)^(2)) + S_(j)^(2)S_(k)^(2)(1 - I_(i)^(2))\
  &+2S_(i) S_(j)S_(k) (S_(i)C_(j)C_(k) gamma_(tau)^(i) + C_(i)S_(j)C_(k)gamma_(tau)^(j) + C_(i)C_(j)S_(k)gamma_(tau)^(k)) > 0 $
]<hyperbolicconditiononradii>

The following corollary obtained in @zhou2019circlepatternsobtuseexterior directly follows from @hyperbolicconditiononradii.

#corollary(name: [@xu2018rigidityinversivedistancecircle])[
  If $I_(i), I_(j), I_(k) in (-1, 1]$ and $gamma_(tau) in [0, oo)^(3)$, then the triangle inequalities are satisfy for any $(r_(i), r_(j), r_(k)) in RR_(>0)^(3)$. Thus $Omega_(tau) = RR_(>0)^(3)$.
]<validradiiHyperbolic>

== Infinitesimal Rigidity of Hyperbolic Inversive Distance Circle Packings

Let $(S, cal(T), I)$ be a weighted triangulated surface with hyperbolic background geometry where $-1 < I <= 1$. Let $tau = i j k in F$ where $gamma^(tau) in RR_(>=0)^(3)$. By @validradiiHyperbolic, $forall (r_i, r_j, r_k) in RR_(>0)^(3)$ induces edge lengths which form a triangle. Let $ u = (u_(i), u_(j), u_(k)) = (ln(tanh(r_(i)/(2))), ln(tanh(r_(j)/(2))), ln(tanh(r_(k)/(2)))) $. Let $theta_(a)$ inner angle of $tau$ at the vertex $v_(a)$ for $a in {i, j, k}$. We have the following useful lemma regarding the monotonicity of $theta_(a)$ with respect to $(u_(i), u_j, u_k)$, and thus $(r_i, r_j, r_k)$.


#lemma(name: [@xu2018rigidityinversivedistancecircle])[
  For all $tau = i j k in F$ where $gamma_(tau) in RR_(>=0)^(3)$, we have the following:

  + $(diff theta_(a))/(diff u_(b)) = (diff theta_(b))/(diff u_(a)) > 0$ for $a, b in {i, j, k}$ where $a != b$.
  + $(diff theta_(a))/(diff u_(a)) < 0$ for $a in {i, j, k}$ .
  + The jacobian $J_(u)(theta)$ is symmetric and negative semi definite, with null space $ RR[1, 1, 1] = {[t,t,t] mid(|) t in RR}. $
  + The differential 1-form $sum_(a in {i, j, k})^() theta_(a) dif u_(a)$ is closed on $RR^3$ (and hence exact) and $ W_(tau)(u) = integral_(0)^u sum_(a in {i, j, k})^() theta_(a) dif u_(a) $ is a well defined concave function of $u in RR^3$ satisfying $ gradient W_(tau) = (theta_(i), theta_(j), theta_(k)) $
    Furthermore, $W_(tau)$ is strictly concave when restricted to ${t u + (1 - t) hat(u) mid(|) t in RR}$, provided that $u - hat(u) != (a, a, a)$ for $a in RR$.
]<HyperbolicMonotonicity>
#proof[
  // TODO Proofread
  Part 1 of the lemma holds by Lemma 3.6 in Xu @xu2018rigidityinversivedistancecircle. By Remark 11 in Xu @xu2018rigidityinversivedistancecircle, $ (diff theta_(i))/(diff u_(i)) + (diff theta_(j))/(diff u_(i))+ (diff theta_(k))/(diff u_(i)) < 0 $ since $(diff theta_(a))/(diff u_(b)) > 0$ for $a != b$ by 1, $(diff theta_(a))/(diff u_(a)) < 0$, thus Part 2 holds.  Part 3 holds by Lemma 3.7 in Xu @xu2018rigidityinversivedistancecircle. Finally, Part 3 holds by Lemma 3.9 in Xu @xu2018rigidityinversivedistancecircle.
]

== Degeneration of Circle Packing Metrics
Let $(S, cal(T), I)$ be a closed connected weighted triangulated surface with Euclidean or hyperbolic ground geometry where $-1 < I <= 1$. Let $Phi: E -> [0, pi)$ be the corresponding intersection angle for $I$, ie $I(e) = cos(Phi(e)).$ $forall J subset V$, let $F_(J)$ be the subcomplex of $cal(T)$ consisting of the 2-simplices whose vertices are in $J$ and $ "Lk"(J) = {(tau, v) in F times J mid(|) {v} = tau inter J}. $.
#lemma()[
  Let $J$ be some subset of $V$.  Let $(r_(n))_(n in NN)$ be a sequence of circle packing metrics for $(S, cal(T), I)$ ($-1 < I <= 1$) where if $j in J$ $ lim_(n -> oo)r_(n) (j) = 0 $ and if $k in.not J$, $ lim_(n -> oo)r_(n) (k) > 0. $ Then

  $
    lim_(n -> infinity) sum_(j in J)^() K_(r_(n))(j) = 2 pi chi(F_(J)) - sum_((tau, v) in "Lk"(J))^() (pi - Phi(tau backslash {v}))
  $
]<CursedInequalityI>
#proof[
  This proof follows the argument outlined in Proposition 4.1 in Chow and Luo @chow2002combinatorialricciflowssurfaces. $forall tau in F$ and $forall i in tau$, $theta_(i)^(tau)$ be the inner angle of $i$ in triangle $tau$. Let $T_(1)$, $T_(2)$, and $T_(3)$ be the sets of triangles with one, two, and three vertices in $J$. Thus for any circle packing metric $r$, we have following:

  $
    sum_(j in J)^() K_(r)(j) & = 2 pi abs(J) - sum_(j in J)^() sum_(tau in F \ j in tau)^() theta_(j)^(tau) \
    & = 2 pi abs(J) - sum_(tau in F)^()sum_(j in tau inter J)^() theta_(j)^(tau) \
    & =2 pi abs(J) - (sum_(tau in T_(1) \ i in tau inter J)^() theta_(i)^(tau) + sum_(tau in T_(2) \ i, j in tau inter J "distinct")^() theta_(i)^(tau) + theta_(j)^(tau) + sum_(tau in T_(3) \ tau = i j k)^() theta_(i)^(tau) + theta_(j)^(tau) + theta_(k)^(tau))\
  $

  Note there is bijection between $T_(1)$ and $"Lk"(J)$, so we have the following equivalence:

  $ sum_(tau in T_(1) \ i in tau inter J)^() theta_(i)^(tau) = sum_((i, tau) in "Lk"(J))^() theta_(i)^(tau) $

  Given that $forall i in J$, $r_(n)(i) -> 0$ we know the following:

  + $forall tau = i j k in T_(3)$ as $(r_(n)(i), r_(n)(j), r_(n)(k)) -> (0, 0, 0)$, $i j k$ approaches a Euclidean triangle. Thus $theta_(i)^(tau) + theta_(j)^(tau) + theta_(k)^(tau) -> pi$.
  + $forall tau in T_(2)$ and $i, j in tau inter J$ distinct as $(r_(n)(i), r_(n)(j)) -> (0, 0)$, $i j k$ approaches a geodesic segment. Thus $theta_(k)^(tau) -> 0 => theta_(i)^(tau) + theta_(j)^(tau) -> pi$.
  + $forall tau = i j k in T_(1)$ and $i in tau inter J$, then $i$ approaches the intersection point of the circles corresponding to $j$ and $k$. Thus $theta_(i)^(tau) -> pi - Phi(j k) = pi - Phi(tau backslash {i})$.

  Putting all that together, we see:


  $
    lim_(n -> oo) sum_(j in J)^() K_(r_(n))(j) &= 2 pi abs(J) - (sum_((i, tau) in "Lk"(J))^() pi - Phi(tau backslash {i}) + abs(T_(2)) pi + abs(T_(3)) pi ) \
    &= 2 pi (abs(J) - (1)/(2)abs(T_2) - (1)/(2)abs(T_3)) - sum_((i, tau) in "Lk"(J))^() pi - Phi(tau backslash {i}) \
    &= 2 pi (abs(J) - (1)/(2)(abs(T_2) + 3abs(T_3)) + abs(T_3) ) - sum_((i, tau) in "Lk"(J))^() pi - Phi(tau backslash {i}) \
  $

  $abs(J)$ is the number of vertices in $F_(J)$. $abs(T_3)$ is the number of 2-simplicies in $F_(J)$. By construction, the number of edges is $(1)/(2)(abs(T_2) + 3abs(T_3))$. Thus $ lim_(n -> infinity) sum_(j in J)^() K_(r_(n))(j) = 2 pi chi(F_(J)) - sum_((tau, v) in "Lk"(J))^() (pi - Phi(tau backslash {v})) $

]

We get the following corollary from the lemma above.

#corollary[
  If $forall tau in F$ we have that $gamma^(tau) in RR_(>=0)^(3)$, then $forall r: V -> RR^(3)_(>0)$ circle packing metrics $ sum_(j in J)^() K_(r)(v_j) > 2 pi chi(F_(J)) - sum_((tau, v) in "Lk"(J))^() (pi - Phi(tau backslash {v})) $
]<CursedInequalityII>
#proof[Since the background geometry is Euclidean or Hyperbolic, we know that the maximum sum of interior angles of a triangle is $pi$. Thus for any circle packing metric $r$, $ sum_(tau in A_(2) \ i, j in tau inter J "distinct")^() theta_(i)^(tau) + theta_(j)^(tau) < pi abs(T_2) "and" sum_(tau in A_(3) \ i, j, k in tau inter J "distinct")^() theta_(i)^(tau) + theta_(j)^(tau) + theta_(k)^(tau) < pi abs(T_3) . $

  Furthermore since $forall tau in F$ we have that $gamma^(tau) in RR_(>0)$, we can apply @EuclideanMonotonicity and @HyperbolicMonotonicity to get monotonicity of interior angles. $forall tau in A_(1)$ where $i in tau inter J$, we know that $theta_(i)^(tau)$ is monotonically increasing, thus $pi - Phi(tau backslash {v})$ is the upper bound for $theta_(i)^(tau)$. Thus we have:

  $
    sum_(j in J)^() K_(r)(j) > 2 pi abs(J) - (sum_((i, tau) in "Lk"(J))^() pi - Phi(tau backslash {i}) + abs(T_(2)) pi + abs(T_(3)) pi )
  $

  Proceeding similarly to @CursedInequalityI, we see that $ sum_(j in J)^() K_(r)(v_j) > 2 pi chi(F_(J)) - sum_((tau, v) in "Lk"(J))^() (pi - Phi(tau backslash {v})) $

]


== Main Theorem
#theorem[
  Let $(S, cal(T), I)$ be a closed connected weighted triangulated surface where $I in (-1, 1]$. Let $Phi$ be its corresponding intersection angle function. Let $A, B subset [N]$ where $N = A union.sq B$ and $A != diameter$ and in the case Euclidean background, $B != diameter$. If $forall tau in F$ we have that $gamma^(tau) in RR_(>=0)^(3)$, then for any circle packing metrics $R$ and $r$ for $(S, cal(T), I)$ where $R|_B >= r|_B$ and $K_R|_A >= K_r|_A$ it means that $R >= r$.

  // TODO Restriction is a bit odd
]
#proof[

  Let $ X := {x in RR_(>0)^(N) | x|_(B) >= x|_(B) "and" K_(x)|_(A) >= K_(r)|_(A)}. $

  Note that $r, R in X$ by assumption. We want to show that $forall v in V$, $ r(v) = inf{x(v) : x in X}. $ This will imply that $R >= r$ and finish the proof.

  $forall a, b in X$, let $c_(i) = min(a_(i), b_(i))$, thus $c = min(a, b) := (c_(1), #sym.dots.h, c_(N))$. Clearly, $c_(j) >= r_(j)$ for all $j in B$. $forall v in V_(A)$, let ${u_(1), #sym.dots.h, u_(m)}$ the set of vertices adjacent to $v$. Assume without a loss of generality that, $c(v) = a(v)$. By assumption $c(u_(i)) <= a(u_(i))$, thus by part 1 of @EuclideanMonotonicity and part 1 of @HyperbolicMonotonicity, $K_(c)(v) >= K_(a)(v)$. Thus $K_(c)(v) >= K_(a)(v) >= K_(r)(v)$. Thus $c in X$ and $X$ is closed under minimums.

  Let $w = inf X$ (component-wise). $forall v in V$, let $(x_(n)^(v))_(n in NN)$ be a sequence in $X$ such that $ w(v) = lim_(n -> oo) x_(n)^(v)(v). $ Let $(y_(n))_(n in NN)$ be a sequence where $ y_(n) := min{x_(n)^(v) mid(|) v in V}. $ By closure under minimums, $y_(n) in X$ for all $n in NN$. Since $forall n in NN$ and $v in V$ $y_(n) <= x_(n)^(v)$, that means $ limsup_(n -> oo) y_(n)(v) <= limsup_(n -> oo)x_(n)^(v)(v) = lim_(n -> oo)x_(n)^(v)(v) = w(v). $ At the same time since $w$ is the componentwise infimum that means that $forall n in NN$ $y_(n)(v) >= w(v)$ which means $ w(v) <= liminf_(n -> oo) y_(n)(v) => lim_(n -> oo) y_(n)(v) = w(v). $

  We will use this sequence $y_(n)$ to verify that $w in X$. We have to check that $w in RR_(>0)^(N)$, $w|_(B) >= r|_(B)$, and $K_(w)|_(A) >= K_(r)|_(A)$.

  Assume the contrary that $w in.not RR_(>0)^(N)$ thus $exists v in V$ such that $w(v) = 0$. Let $J := {j in [N] mid(|) w(v_(j)) = 0}$. By @CursedInequalityI, we have that $ lim_(n -> infinity) sum_(i in J)^() K_(y_(n))(v_(i)) = 2 pi chi(F_(J)) - sum_((tau, v) in "Lk"(J))^() (pi - Phi(tau backslash {v})). $ Note that $forall v in B$, $w(v) >= r(v) > 0 => J inter B = diameter$ which means $J subset A$. Thus $forall j in J$, $ K_(y_(n))(v_(j)) >= K_(r)(v_(j)) $ which means $ lim_(n -> oo) sum_(j in J)^() K_(y_(n))(v_(j)) >= sum_(j in J)^()K_(r)(v_(j)). $ Applying @CursedInequalityII for $sum_(j in J)^()K_(r)(v_(j))$ we see that $ lim_(n -> oo) sum_(j in J)^() K_(y_(n))(v_(j)) >= sum_(j in J)^()K_(r)(v_(j)) > 2 pi chi(F_(J)) - sum_((tau, v) in "Lk"(J))^() (pi - Phi(tau backslash {v})) $ which is a contradiction. Thus by contradiction $w in RR_(>0)^(N)$ and $w$  is a circle packing metric for $(S, cal(T), I)$.

  $forall n in NN$, we know that $y_(n)|_(B) >= r|_(B)$ and $ w = lim_(n -> oo) y_(n) $ which implies that $w|_(B) >= r|_(B)$. By the definition of infimum, $r|_(B) >= w|_(B)$. Thus $r|_(B) = w|_(B)$.

  Since $r -> K_(r)$ is a continuous function, $forall i in A$,

  $ K_(w)(v_(i)) = lim_(n -> oo) K_(y_(n))(v_(i)) $ by the sequential definition of continuity. $K_(y_(n))(v_(i)) >= K_(r)(v_(i)) => K_(w)(v_(i)) >= K_(r)(v_(i))$. Thus $w = X$.

  We know that $w = X$ and $w|_(B) = r|_(B)$, we just need to show that $w|_(A) = r|_(A)$. Assume the contrary that $exists i in A$ such that $K_(w)(v_(i)) > K_(r)(v_(i))$. $forall t in (0, w(v_(i)))$, let $s_(t) : V -> RR_(>0)^(+)$ where $ s_(t)(v) = cases(
    w(v) - t "if" v = v_(i),
    w(v) "otherwise"
  ) $

  Since $i in A$, $s_(t)|_(B) = w|_(B) >= x|_(B)$. Let $U subset V$ be the subset of adjacent vertices to $i$. Since $s_(t)|_(U) = w|_(U)$ and $s_(t)(i) < w(i)$. By Part 1 of both @EuclideanMonotonicity and @HyperbolicMonotonicity, we $K_(s_(t))(i) < K_(w)(i)$ and $K_(s_(t))(j) > K_(w)(j) >= K_(r)(j)$ for all $j in U$. By continuity, $exists t_(0) in (0, w(i))$ such that $K_(r)(i) <= K_(s_(t))(i) < K_(w)(i)$. Thus $s_(t_(0)) in X$, however note that $s_(t_(0))(i) < w(i)$. This is a contradiction since $w$ is a componentwise infimum. Thus by contradiction $K_(w)|_(A) = K_(r)|_(A)$.

  Now we have to show that $r = w$ using the facts that $r|_(B) = w|_(B)$ and $K_(r)|_(A) = K_(w)|_(A)$. Let $ S = cases(
    RR "if background geometry is Euclidean",
    (0, oo) "if background geometry is hyperbolic"
  ) $

  Let $phi: (0, oo) -> S$ where $ phi(x) := cases(ln(x) "if background geometry is Euclidean", ln(tanh((x)/(2))) "if background geometry is hyperbolic") $

  $phi$ is a homeomorphism so $phi^(-1)$ exists and is a continuous. Let $cal(R) := {x in RR_(>0)^(N) : phi^(-1)|_(B) = r|_(B)}.$ Let $W: S^(N) -> RR$ where $ W(x) := sum_(tau = i j k in F)^() W_(tau)(x_(i), x_(j), x_(k)) $

  where $W_(tau)$ is defined in @EuclideanMonotonicity and @HyperbolicMonotonicity. $forall i in V$,

  $
    (diff W)/(diff x_(a)) & = sum_(tau = i j k in F)^() (diff W_(tau))/(diff x_(a)) \
                          & = sum_(tau = a j k in F)^() (diff W_(tau))/(diff x_(a)) \
                          & = sum_(tau = a j k in F)^() theta_(a)^(tau) \
                          & = 2 pi - K_(phi^(-1)(x))(a),
  $

  where the second to last equality comes from Part 2 of @EuclideanMonotonicity and @HyperbolicMonotonicity and the last equality comes from the definition of discrete curvature. Thus $ gradient W(x) = 2 pi - K_(phi^(-1)(x)). $ Let $F = W|_(cal(R))$, thus $F: RR_(>0)^(A) -> RR$ and $ gradient F(x) = 2 pi - K_(phi^(-1)(x))|_(A). $ $forall x, y in cal(R)$ such that $x x != y$, take $M = {i in V mid(|) x(i) != y(i)}$ and $N = {i in V mid(|) x(i) = y(i)}.$ Note $M != diameter$, since $x != y$, $B subset N$ and $M inter N = diameter$. Since $(S, cal(T))$ is connected, then the graph of the triangulation is connected. Thus $exists (i, j) in M times N$ such that $exists k in V$ such that $i j k in F$. By definition $ (x(i) - y(i), x(j) - y(j), x(k) - y(k)) != (0,0,0) $ because $x(i) != y(i)$. Thus $W_(i j k)$ is strictly concave on ${t u + (1 + t) hat(u)}$ where $u = (x(i), x(j), y(k))$ and $hat(u) = (y(i), y(j), y(k))$. Thus $W_(tau)$ is strictly concave on $cal(R)$, thus $W$ and $F$ are strictly concave on $cal(R)$. Which implies that $gradient F$ is injective and $x -> K_(phi^(-1)(x))|_(A)$ is injective. Thus since $K_(w)|_(A) = K_(r)|_(A) => w|_(A) = r|_(A) => w = r$. Thus $r = inf(X)$ and $R >= r$.
]

= The Discrete Schwarz-Pick Lemma for $I >= 1$<counterexamplesection>
// See if you can move the values under 1. To get I > 0.
For $I>=1$, it was conjectured that the Discrete Schwarz-Pick Lemma would hold for all $I >= 1$, because for such circle packings it is known that rigidity holds, for hyperbolic (respectively Euclidean) geometry discrete curvature determines (respectively up to scale) the circle packing metric, by work done by Luo @luo2006rigiditypolyhedralsurfaces. In such circle packings, circles corresponding to adjacent vertices are allowed to be disjoint or tangent.

#conjecture[
  Let $(S, cal(T), I)$ be a closed connected weighted triangulated surface in Euclidean or hyperbolic geometry such that $I >= 1$. Let $V = A union.sq B$ such that $A != diameter$ and $B != diameter$, if the background geometry is Euclidean. Then for all circle packing metrics $R$ and $r$ on $(S, cal(T), I)$ where $R|_(B) >= r|_(B)$ and $K_(R)|_(A) >= K_(r)|_(A)$, $R >= r$.
]<generalconjecture>

== Counterexample for the Conjecture
The statement of the conjecture concerns closed surface, but a counterexample on a triangulated disk is sufficient. By a standard doubling argument, any such counterexample can be extended to a closed surface.

Let $(S, cal(T), I)$ be a disk with boundary with interior vertices $A$ and boundary vertices $B$. Construct a closed surface $S prime$ by taking two copies of $S$ and identifying their boundaries with the identity map. This induces a triangulation $cal(T)prime$ and inversive distance $I prime$ on $S prime$. Given to circle packing metrics $r$ and $R$ on $(S, cal(T), I)$, we can define corresponding circle packing metrics $r prime$ and $R prime$ on $(S prime, cal(T) prime, I prime)$. If the premises of the conjecture (ie $r|_(B) <= R|_(B)$ and $K_(r)|_(A) <= K_(r)|_(A)$) hold on the disk, they will hold on the doubled surface. Therefore if we find a interior vertex $i in A$ such that $r(i) > R(i)$, this violation will carry over to the doubled surface and thus refute the conjecture for the closed surface.

#conjecture[
  Let $(S, cal(T), I)$ be a connected weighted triangulated disk in Euclidean geometry such that $I >= 1$. Let $A$ be the interior vertices and $B$ be the boundary vertices. Then for all circle packing metrics $R$ and $r$ on $(S, cal(T), I)$ where $R|_(B) >= r|_(B)$ and $K_(R)|_(A) >= K_(r)|_(A)$, $R >= r$.
]<diskconjecture>

Thus if @generalconjecture holds for Euclidean background geometry then @diskconjecture holds for Euclidean background geometry. Additionally if we find a counterexample for @diskconjecture, then we have a counterexample for @generalconjecture for Euclidean background geometry.

== Construction of the Counterexample
#let I24 = 4
#let I34 = 3
#let all = 1

We will now construct a weighted triangulated surface with Euclidean background geometry with $I >= 1$ which can be doubled to create a counterexample for the conjecture. Let $V = [4]$, $A = {4}$, and $B = [3]$. Thus $A union.sq B = V$. Let the edges be $E = {{1, 2}, {1, 3}, {2, 3}, {1, 4}, {2, 4}, {3, 4}}$ and let the faces be $F = {{1, 2, 4}, {1, 3, 4}, {2, 3, 4}}$. Let $I: E -> [1, oo]$ where $ I(e) := cases(
  #I24 "if" e = (2, 4),
  #I34 "if" e = (3, 4),
  1 "otherwise"
). $ Thus $(DD, {V, E, F}, I)$ is a weighted triangulated disk.

#figure(
  [#cetz.canvas({
    import cetz.draw: *

    let radius = 3
    let text-size = 15pt

    line((0, radius), (radius * calc.cos(210deg), radius * calc.sin(210deg))) // ab
    line((0, radius), (radius * calc.cos(330deg), radius * calc.sin(330deg))) // ac
    line(
      (radius * calc.cos(210deg), radius * calc.sin(210deg)),
      (radius * calc.cos(330deg), radius * calc.sin(330deg)),
    ) // bc
    line((0, radius), (0, 0)) // ad

    line((0, 0), (radius * calc.cos(210deg), radius * calc.sin(210deg))) // bd

    line((0, 0), (radius * calc.cos(330deg), radius * calc.sin(330deg))) // cd


    circle((0, radius), radius: 2pt, stroke: red, fill: red)
    content((0, radius + .3), [#text([$1$], size: text-size)])

    circle((radius * calc.cos(210deg), radius * calc.sin(210deg)), radius: 2pt, stroke: red, fill: red)
    content((radius * calc.cos(210deg) - .2, radius * calc.sin(210deg) - .2), [#text([$2$], size: text-size)])

    circle((radius * calc.cos(330deg), radius * calc.sin(330deg)), radius: 2pt, stroke: red, fill: red)
    content((radius * calc.cos(330deg) + .2, radius * calc.sin(330deg) - .2), [#text([$3$], size: text-size)])

    circle((0, 0), radius: 2pt, stroke: blue, fill: blue)
    content((.3, .3), [#text([$4$], size: text-size)])
  })],
  caption: [Triangulation of Counterexample],
)

#let re = (100, 100, 100, 155);
#let Re = (110, 240, 220, 150);

Let $r, R: V -> RR_(>0)$, where $ r_(E) = #re "and" R_(E) = #Re. $ Note we are using the vector definition of functions from $V$ to $RR$.

// === Hyperbolic Case

// #let rh = (1, 1, 1, 1.55);
// #let Rh = (1.10, 2.40, 2.20, 1.50);

// Let $r_(H), R_(H): V -> RR_(>0)$, where $ r_(H) = #rh "and" R_(H) = #Rh. $ Note we are using the vector definition of functions from $V$ to $RR$.

== Verification of Counterexample
=== Verification of Circle Packing Metrics
To verify that such construction forms a valid counterexample, we first need to verify that $r$, $R$  are valid circle packing metrics. To do this we have to calculate the edge lengths using @lengthEuclidean. The induced edge lengths for $r$ is

#align(center, table(
  columns: (auto, auto),
  stroke: 0.4pt,
  [*Edge* $e$], [*Edge Length* $l_(r)(e)$],
  ${1, 2}$, `200.0`,
  ${1, 3}$, `200.0`,
  ${2, 3}$, `200.0`,
  ${1, 4}$, `255.0`,
  ${2, 4}$, [$sqrt(100^2 + 155^2 + 2(155)(100)(4)) approx 397.52358$],
  ${3, 4}$, [$sqrt(100^2 + 155^2 + 2(155)(100)(3)) approx 356.40567$],
))

and the induced edge lengths for $R$

#align(center, table(
  columns: (auto, auto),
  stroke: 0.4pt,
  [*Edge* $e$], [*Edge Length* $l_(R)(e)$],
  ${1 , 2}$, `350.0`,
  ${1, 3}$, `330.0`,
  ${2, 3}$, `460.0`,
  ${1, 4}$, `260.0`,
  ${2, 4}$, [$sqrt(240^2 + 150^2 + 2(150)(240)(4)) approx 606.71245$],
  ${3, 4}$, [$sqrt(220^2 + 150^2 + 2(220)(150)(3)) approx 518.55569$],
))

// The induced edge lengths for $r_(H)$ are

// #align(center, table(
//   columns: (auto, auto),
//   stroke: 0.4pt,
//   [*Edge* $e$], [*Edge Length* $l_(r_(H))(e)$ (up to 5 decimal places)],
//   $a b$, `2`,
//   $a c$, `2`,
//   $b c$, `2`,
//   $a d$, `2.55`,
//   $b d$, `3.35734`,
//   $c d$, `3.15348`,
// ))

// and the induced edge lengths for $R_(H)$

// #align(center, table(
//   columns: (auto, auto),
//   stroke: 0.4pt,
//   [*Edge* $e$], [*Edge Length* $l_(R_(H))(e)$ (up to 5 decimal places)],
//   $a b$, `3.5`,
//   $a c$, `3.3`,
//   $b c$, `4.6`,
//   $a d$, `2.6`,
//   $b d$, `4.78121`,
//   $c d$, `4.36209`,
// ))

We have to use the edge lengths to verify the triangle inequality. For side lengths $l_1, l_2,$ and $l_3$, to see if the lengths $l_1$, $l_2$, and $l_3$ form a triangle it suffices to see if they satisfy the following inequality:

$ (l_1 + l_2 + l_3)(l_1 + l_2 - l_3)(l_1 + l_3 - l_2)(l_2 + l_3 - l_1) > 0 $

If we plug in the values for $l_(r)$ and $l_(R)$ for each triangle we can see they satisfy the triangle inequality. Thus $r$ and $R$ are valid circle packing metrics.

== Computation of Discrete Curvature
To compute the induced discrete curvature at a vertex, we first need to compute the inner angle of each triangle the vertex is a part of. To compute the inner angle at a vertex $a$, we can use the Euclidean cosine law. Let $A$ be the length of edge opposite to $a$ and $B$ and $C$ the length of the other edges. $ cos(theta_(a)) = (B^2 + C^2 - A^2)/(2 B C) => theta_(a) = arccos((B^2 + C^2 - A^2)/(2 B C)) $

Once we calculate the inner angles of each triangle the given vertex is a part of, we can plug the values into the discrete curvature formula @discretecurvatureformula.

Thus the induced discrete curvatures for $r$ is

#align(center, table(
  columns: (auto, auto),
  stroke: 0.4pt,
  [*Vertex* $e$], [*Discrete Curvature* $K_(r)(e)$ (up to 5 decimal places)],
  $1$, `2.37781`,
  $2$, `4.59519`,
  $3$, `4.00207`,
  $4$, `4.73289`,
))

Thus the induced discrete curvatures for $R$ is

#align(center, table(
  columns: (auto, auto),
  stroke: 0.4pt,
  [*Vertex* $e$], [*Discrete Curvature* $K_(R)(e)$ (up to 5 decimal places)],
  $1$, `1.21223`,
  $2$, `5.21346`,
  $3$, `4.51403`,
  $4$, `4.76824`,
))



== Verification of Counterexample
By the definition of $r$ and $R$, we see that $r|_(B) = (100, 100, 100) <= R|_(B) = (110, 240, 220)$. Additionally, $K_(r)(4) <= K_(R)(4)$, but $r(4) > R(4)$.

== Conclusion of the Counterexample
The premises hold $(r|_(B) <= R|_(B), K_(r)|_(A) <= K_(R)|_(A))$ but $r(4) > R(4)$. This violates the conjecture on the disk. By a doubling argument, it also provides a counterexample for a closed surface.

// = Acknowledgements
// The research of this author is supported by the National Science Foundation of the United States of America under Grant \#2220271. This work was done with the support of the DIMACS REU at Rutgers University, under the mentorship of Professor Feng Luo, Professor Hongbin Sun, Dr. Zhenghao Rao, and Mr. Kuijin Liu, whose discussions proved pivotal in proving these results about the Discrete Schwarz-Pick Lemma.

