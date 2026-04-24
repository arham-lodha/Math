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
  rules: thm-rules,
) = default-theorems("thm-group", lang: "en")
#show: thm-rules

#let (conjecture, rules) = new-theorems("thm-group", ("conjecture": [Conjecture]))
#show: rules

#show: ams-article.with(
  title: [Discrete Schwarz-Pick Lemma For Circle Packings Revisted],
  authors: (
    (
      name: "Arham Lodha",
      department: [DIMACS],
      organization: [Rutgers],
      location: [Piscataway, NJ 08854],
      email: "arham.lodha@utexas.edu",
    ),
  ),
  abstract: [The Discrete Schwarz-Pick Lemma is a discrete analogue of the classical result from complex analysis, arising from the connection between circle packings and conformal maps established by Thurston. Previous works by Beardon-Stephanson and Van Eeuwen proved this lemma for circle packings where circles are tangent or intersect at non-obtuse angles, corresponding to inversive distances $I in [0,1]$. This paper extends the investigation to circle packings with obtuse intersections ($I in (-1,0)$) and disjoint packings ($I>1$). We prove that the Discrete Schwarz-Pick Lemma holds for the full range of intersecting circle packings with inversive distances in $(-1,1]$, provided an additional condition on the weights of each triangle is satisfied. The proof relies on a variational principle for circle packings with inversive distances. Conversely, we show that the lemma fails for disjoint circle packings where I≥1. This is demonstrated by constructing a specific counterexample on a triangulated disk with four vertices and providing a numerical analysis to confirm its validity beyond computational error.],
  bibliography: bibliography("refs.bib"),
)

= Introduction
In March of 1985, in the International Symposium in Celebration of the
The connection between circle packings and conformal maps, first suggested by William Thurston, has been a fruitful area of study. Thurston conjectured that the conformal map from a simply connected domain $Omega$ to the unit disk $DD$ could be approximated by circle packings, a claim famously proven by Rodin and Sullivan in 1987 @rodinandsullivan. This bridge between discrete geometry and complex analysis inspired further exploration into discrete analogues of classical theorems.

One such result was the Discrete Schwarz-Pick Lemma The lemma was first established by Beardon and Stephenson @beardon1991schwarz for circle packings where adjacent circles are tangent, corresponding to an inversive distance of $I = 1$. This was later extended by Van Eeuwen to packings with non-obtuse intersections, where $I in [0, 1]$ @jeffVanEeuwen1. However, it remained an open question whether the lemma would hold for the full range of intersecting circles, which includes obtuse intersections ($I in (-1, 1)$ )  or for packings of disjoint circles $(I>1)$. This paper addresses these open cases.

Building on a observation by Zhou @zhou2019circlepatternsobtuseexterior and Xu @xu2018rigidityinversivedistancecircle, we prove the Discrete Schwarz-Pick Lemma for inversive distances (with a additional condition) between $(-1, 1]$ and show a counter example for inversive distances greater than or equal to 1. Our primary tools include the variational principle for circle packings, introduced by Colin de Verdière @colindeverdiere and extended by Guo @guo2009localrigidityinversivedistance, and foundational results on circle packing geometries from Thurston @thurston2022geometry.

The paper is organized as follows. Section 2 establishes the main result, proving the Discrete Schwarz-Pick Lemma for intersecting circle packings with inversive distances in $(-1,1]$. Section 3 constructs a counterexample to show the lemma fails for disjoint packings with inversive distances greater than 1, supported by a numerical analysis to ensure its validity.

= Preliminaries and Notation
In this subsection, we discuss the concept of inversive distance circle packings introduced by Bowers and Stephanson @bowersandstephenson.

Let $S$  be a surface with a finite simplicial triangulation $cal(T)$. We denote the set of vertices, edges, and faces of T by $V$, $E$, and $F$, respectively. Let $V = {v_(1), #sym.dots.h, v_(N)}$ where $N = abs(V)$.

A weighted simplicial triangulation $(S, cal(T), I)$ consists of a surface with a simplicial triangulation $cal(T)$ along with a weight function $I: E -> (-1, infinity)$ that assigns an inversive distance $I_(i, j)$ to each $v_(i) v_(j) in E$. The inversive distance determines the geometry of the circles in the circle packing:
- If $I_(i, j) in (-1, 1]$ the circles corresponding to vertices $v_(i)$ and $v_(j)$ respectively intersect. There exists a unique angle $Phi_(i, j) in [0, pi)$ such that $I_(i, j) = cos(Phi_(i, j))$. $Phi_(i, j)$ is the angle formed by the tangent lines of the circles at the intersection point. See @intersectionangle for reference. The intersection is obtuse if $I_(i, j) in (-1, 0)$, orthogonal if $I_(i, j) = 0$, and acute $I_(i, j) in (0, 1)$.
- If $I_(i , j) = 1$, the circles are tangent.
- If $I_(i, j) > 1$, the circles are disjoint.

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
    })],
  caption: "Intersection Angle in Circle Packings",
)<intersectionangle>


Let $RR_(> 0) := (0, oo).$ A radius function is a positive function $r: V -> RR_(> 0)$ where we denote $r_(i) = r(v_(i))$. The radius function and inversive distance induce an edge length function $l_(r): E -> RR_(>0)$ where
$ l_(r)(v_(i) v_(j)) := sqrt(r_(i)^2 + r_(j)^2 + 2 r_(j) r_(k) I_(i, j)) $ for Euclidean background geometry and $ l_(r)(v_(i)v_(j)) := cosh^(-1)(cosh(r_(i)) cosh(r_(j)) + I_(i, j) sinh(r_(i)) sinh(r_(j))) $ for hyperbolic backgound geometry. If for every face $triangle v_(i) v_(j) v_(k) in F$, if the induced edge lengths $l_(r)$ satisfy the triangle inequality then the radius function $r$ is called a circle packing metric.

Such a metric induced a discrete curvature $K_(r): V -> (-infinity, 1]$ where $ K_(r)(v) := 2 pi - sum_(alpha > v)^() alpha $ where $alpha > v$ means all the angles incident at $v$. // FIND A BETTER WAY TO DEFINE THIS.


= Discrete Schwarz-Pick Lemma for Circle Packing with Intersections
Since this section concerns intersecting circles with inversive distances $I(e)∈(-1,1]$, it is natural to define the corresponding intersection angle function $Φ:E→[0,π)$. For each edge $e∈E$, the angle $Φ(e)$ is the unique value in $[0,π)$ such that $I(e)=cos(Φ(e))$.
== Triangle Preliminaries
Suppose $triangle v_(i) v_(j) v_(k) in F$ is a topological triangle. To simplify notation, from here on out, we will use $l_(i)$ to denote the edge length of the edge $v_(j) v_(k)$ and $I_(i) = I(v_(j) v_(k))$ to denote the inversive distance.

Let $  gamma_(i)^(j, k) & = I_(i) + I_(j) I_(k)  \
 gamma_(j)^(i, k) & = I_(j) + I_(i) I_(k)  \
gamma_(k )^(i, j) & = I_(k) + I_(i) I_(j). $

#lemma(name: [@xu2018rigidityinversivedistancecircle])[
  Suppose $I_(i), I_(j), I_(k) in (-1, 1]$ are three inversive distances where

  $ gamma_(i)^(j, k), gamma_(j)^(i, k), gamma_(k)^(i, j) >= 0. $

  For any three positive numbers $r_(i), r_(j), r_(k)$, there exists a configuration of three intersecting disks in Euclidean background geometry and Hyperbolic background geometry, unique up to isometry, having radii $r_(i), r_(j), r_(k)$ and with inversive distances of $I_(i), I_(j), I_(k)$.
]


#lemma(name: [@xu2018rigidityinversivedistancecircle])[
  For any Euclidean triangle $triangle v_(1) v_(2) v_(3)$, where $gamma_(1)^(2, 3), gamma_(2)^(1, 3), gamma_(3)^(1, 2) >= 0$ and $I: E -> (-1, 1]$. Let $theta_(i)$ be the inner angle at vertex $v_(i)$ and $r_(i) = e^(u_(i))$ for $i in {1, 2, 3}$.
  Then:

  + $(diff theta_(i))/(diff u_(j)) = (diff theta_(j))/(diff u_(i)) > 0$ for $i != j$.
  + $(diff theta_(i))/(diff u_(i)) <0$.
  + The matrix $ [(diff theta_(a))/(diff u_(b))]_(3 times 3) = mat((diff theta_(1))/(diff u_(1)), (diff theta_(1))/(diff u_(2)), (diff theta_(1))/(diff u_(3)); (diff theta_(2))/(diff u_(1)), (diff theta_(2))/(diff u_(2)), (diff theta_(2))/(diff u_(3)); (diff theta_(3))/(diff u_(1)), (diff theta_(3))/(diff u_(2)), (diff theta_(3))/(diff u_(3))) $ is symmetric and negative semi definite, with null space $ RR[1, 1, 1] = {[t,t,t] mid(|) t in RR}. $
  + The differential 1-form $sum_(i = 1)^(3) theta_(i) dif u_(i)$ is closed on $RR^3$ (and hence exact) and $ W_("cp")(u) = integral_(0)^u sum_(i = 1)^(3) theta_(i) dif u_(i) $ is a well defined concave function of $u in RR^3$ satisfying $ gradient W_("cp") = (theta_(1), theta_(2), theta_(3)) $
    Furthermore $W_(c p)$ is strictly concave when restricted to ${t u + (1 - t) hat(u) mid(|) t in RR}$, provided that $u - hat(u) != (a, a, a)$ for $a in RR$.
]<EuclideanMonotonicity>
#proof[
  Part 1 of the lemma holds by Lemma 2.5 in Xu @xu2018rigidityinversivedistancecircle. Part 2 holds because $theta_(i) + theta_(j) + theta_(k) = pi$ for ${i, j, k} = {1, 2, 3}$. Thus $ (diff theta_(i))/(diff u_(i)) + (diff theta_(j))/(diff u_(i))+ (diff theta_(k))/(diff u_(i)) = 0 $ since $(diff theta_(i))/(diff u_(j)) > 0$ for $j != i$ by 1, $(diff theta_(i))/(diff u_(i)) < 0$. Part 3 holds by Lemma 2.6 in Xu @xu2018rigidityinversivedistancecircle. Finally Part 3 holds by Lemma 2.10 in Xu @xu2018rigidityinversivedistancecircle.
]

#lemma(name: [@xu2018rigidityinversivedistancecircle])[
  For any hyperbolic triangle $triangle v_(1) v_(2) v_(3)$, where $gamma_(1)^(2, 3), gamma_(2)^(1, 3), gamma_(3)^(1, 2) >= 0$ and $I: E -> (-1, 1]$. Let $theta_(i)$ be the inner angle at vertex $v_(i)$ and $u_(i) = integral_(r_(i))^infinity (diff t)/(sinh(t))$ for $i in {1, 2, 3}$.
  Then:

  + $(diff theta_(i))/(diff u_(j)) = (diff theta_(j))/(diff u_(i)) > 0$ for $i != j$.
  + $(diff theta_(i))/(diff u_(i)) <0$.
  + The matrix $ [(diff theta_(a))/(diff u_(b))]_(3 times 3) = mat((diff theta_(1))/(diff u_(1)), (diff theta_(1))/(diff u_(2)), (diff theta_(1))/(diff u_(3)); (diff theta_(2))/(diff u_(1)), (diff theta_(2))/(diff u_(2)), (diff theta_(2))/(diff u_(3)); (diff theta_(3))/(diff u_(1)), (diff theta_(3))/(diff u_(2)), (diff theta_(3))/(diff u_(3))) $ is symmetric and negative semi definite, with null space $ RR[1, 1, 1] = {[t,t,t] mid(|) t in RR}. $
  + The differential 1-form $sum_(i = 1)^(3) theta_(i) dif u_(i)$ is closed on $RR^3$ (and hence exact) and $ W_("cp")(u) = integral_(0)^u sum_(i = 1)^(3) theta_(i) dif u_(i) $ is a well defined concave function of $u in RR^3$ satisfying $ gradient W_("cp") = (theta_(1), theta_(2), theta_(3)) $
    Furthermore $W_(c p)$ is strictly concave when restricted to ${t u + (1 - t) hat(u) mid(|) t in RR}$, provided that $u - hat(u) != (a, a, a)$ for $a in RR$.
]<HyperbolicMonotonicity>
#proof[
  Part 1 of the lemma holds by Lemma 3.6 in Xu @xu2018rigidityinversivedistancecircle. By Remark 11 in Xu @xu2018rigidityinversivedistancecircle, ${i, j, k} = {1, 2, 3}$, $ (diff theta_(i))/(diff u_(i)) + (diff theta_(j))/(diff u_(i))+ (diff theta_(k))/(diff u_(i)) < 0 $ since $(diff theta_(i))/(diff u_(j)) > 0$ for $j != i$ by 1, $(diff theta_(i))/(diff u_(i)) < 0$, thus Part 2 holds.  Part 3 holds by Lemma 3.7 in Xu @xu2018rigidityinversivedistancecircle. Finally Part 3 holds by Lemma 3.9 in Xu @xu2018rigidityinversivedistancecircle.
]

== Degeneration of Circle Packing Metrics

For simplicity, if $U = {v_(j), #sym.dots.h, v_(l)} subset V$, the we will use $I$ to also denote the index set ${j, #sym.dots.h, l}$.

#lemma()[
  Let $(S, cal(T), I)$ be a closed connected simplicially-triangulated surface with weight $I: E -> (-1, 1]$. Let $Phi: E -> [0, pi)$ be the corresponding intersection angle for $I$, ie $I(e) = cos(Phi(e)).$  Let $U$ be a proper subset of vertices. Let $(r_(n))$ be a sequence of circle packing metrics based on $(S, cal(T), Phi)$ in euclidean or hyperbolic background geometry such that $forall v in U$ where $lim_(n -> infinity) r_(n)(v) = 0$ and $forall w in.not U$, $lim_(n -> infinity) r_(n)(w) = 0$. Then

  $ lim_(n -> infinity) sum_(v in U)^() K_(r_(n))(v) = 2 pi chi(F_(I)) - sum_((e, v) in "Lk"(U))^() (pi - Phi(e)) $

  where $F_(U)$ is the subcomplex consisting of simplicies whose vertices are in $U$ and $"Lk"(U) = {(e, v) mid(|) e "is an edge so" e inter U = diameter, v in U "so that" e,v "form a triangle"}$. Furthermore if $forall triangle v_(i) v_(j) v_(k)$ we have that $gamma_(i)^(j, k), gamma_(j)^(i, k), gamma_(k)^(i, j) >= 0$, then for any circle packing metric $r$ based on $(S, cal(T), Phi)$ and any proper subset $U$ of vertices $V$ we have,

  $ sum_(u in U)^() K_(r)(u) > 2 pi chi(F_(U)) - sum_((e, v) in "Lk"(U))^() (pi - Phi(e)) $

]<CursedInequality>
#proof[
  The proof follows the argument outlined in Proposition 4.1 of Chow and Luo @chow2002combinatorialricciflowssurfaces.
  Let $V(cal(T)) = {v_(1), #sym.dots.h, v_(m)}$. Recall $theta_(i)^(j k)$ is the inner angle at vertex $v_(i)$ in face $triangle v_(i) v_(j) v_(k)$. Consider $T subset F$ where $T$ has a vertex in $U$. You can partition these triangles into 3 sets, $A_(1), A_(2), "and" A_(3)$ where a triangle is in $A_(i)$ if and only if it has $i$ vertices in $U$. Thus for any circle packing metric $r$, $ sum_(u in U)^() K_(r)(u) & = 2 pi abs(I) - sum_("all triangles" \ triangle v_(i) v_(j) v_(k) in F)^() theta_(i)^(j k) \
  & =2 pi abs(U) - (sum_( v_(i) in U \ triangle v_(i) v_(j) v_(k) in A_(1))^()theta_(i)^(j k) + sum_( v_(i), v_(j) in U \ triangle v_(i) v_(j) v_(k) in A_(2))^()(theta_(i)^(j k) + theta_(j)^(i k)) + sum_(triangle v_(i) v_(j) v_(k) in A_(3))^() (theta_(i)^(j k) + theta_(j)^(i k) + theta_(k)^(i j))) $

  It is known that $(r_(n))_(n in NN)$ is a sequence of circle packing metrics where $forall v in I$, $r_(n)(v) -> 0$. Thus the following holds:

  1. If $triangle v_(i) v_(j) v_(k) in A_(3)$,  as $(r_(n)(v_(i)), r_(n)(v_(j)), r_(n)(v_(k))) -> (0, 0, 0)$, $triangle v_(i) v_(j) v_(k)$ approaches a Euclidean triangle. Thus $lim_(n -> infinity) (theta_(i)^(j k)(r_(n)) +theta_(j)^(i k)(r_(n)) +theta_(k)^(i j)(r_(n))) = pi$.
  2. If $triangle v_(i) v_(j) v_(k) in A_(2)$ and $i, j in U$, as $(r_(n)(v_(i)), r_(n)(v_(j))) -> (0, 0)$, $triangle v_(i) v_(j) v_(k)$ $triangle v_(i) v_(j) v_(k)$ approaches a geodesic segment. Thus $lim_(n -> infinity)(theta_(k)^(i j)) = 0 => lim_(n -> infinity)(theta_(i)^(j k) + theta_(j)^(i k)) = lim_(n -> infinity)(pi - theta_(k)^(i j)) = pi$.
  3. If $triangle v_(i) v_(j) v_(k) in A_(1)$ and $i in U$, then $v_(i)$ approaches the intersection point of the circles corresponding to $v_(j)$ and $v_(k)$. Thus $lim_(n -> infinity)(theta_(i)^(j k)) = pi - Phi(v_(j) v_(k))$. Additionally note $(v_(i), v_(j)v_(k)) in "Lk"(U)$.

  // TODO insert picture.

  Thus $ lim_(n -> infinity) sum_(u in U)^() K_(r_(n))(u) &= 2 pi abs(U) - (sum_((v, e) in "Lk"(U))^()(pi - Phi(e)) + abs(A_(2)) pi + abs(A_(3)) pi) \
  &= 2 pi(abs(U) - abs(A_(2))/(2) - abs(A_3)/2) - sum_((v, e) in "Lk"(U))^()(pi - Phi(e)) \
  &= 2 pi(abs(U) - (1)/(2) (abs(A_(2)) + 3 abs(A_3)) + abs(A_(3))) - sum_((v, e) in "Lk"(U))^()(pi - Phi(e)) \ $ Note $abs(A_(3))$ is the number of 3 cells in $F_(U)$, and $abs(U)$ are the number of 0 cells in $F_(U)$. By construction the number of edges in $F_(U)$ is $(1)/(2)(abs(A_(2)) + 3abs(A_(3)) )$. Thus,

  $
    lim_(n -> infinity) sum_(u in U)^() K_(r_(n))(u) & = 2 pi chi(F_(U)) - sum_((v, e) in "Lk"(U))^()(pi - Phi(e)).
  $

  For the second part of the proposition, we note that since the background geometry is hyperbolic or euclidean, that the maximum sum of interior angles of a triangle is $pi$. Thus $ sum_( v_(i), v_(j) in U \ triangle v_(i) v_(j) v_(k) in A_(2))^()(theta_(i)^(j k) + theta_(j)^(i k)) < abs(A_(2)) pi , sum_(triangle v_(i) v_(j) v_(k) in A_(3))^() (theta_(i)^(j k) + theta_(j)^(i k) + theta_(k)^(i j)) <= abs(A_(3)) pi $

  Furthermore, since $gamma_(i)^(j, k), gamma_(j)^(i, k), gamma_(k)^(i, j) >= 0$ for all triangles $triangle v_(i) v_(j) v_(k) in F(cal(T))$, by @HyperbolicMonotonicity and @EuclideanMonotonicity for monotonicity, we see that $pi - Phi(v_(i) v_(j))$ is the maximal value for $theta_(i)^(j k)$ for $triangle v_(i) v_(j) v_(k) in A_(1)$ and $v_(i) in I$. Thus this shows that $2 pi chi(F_(U)) - sum_((v_(i), e) in "Lk"(U))^()(pi - Phi(e))$ is strictly less than than $sum_(v in I)^() K_(r)(v)$.
]

== Main Theorem

#theorem[
  Let $(S, cal(T), I)$ be a closed connected weighted simplicially-triangulated surface where for any topological triangle $triangle v_(i) v_(j) v_(k) in F$ we have $gamma_(i)^(j, k) >= 0, gamma_(j)^(i, k) >= 0, gamma_(k)^(i, j) >= 0$ and $I: E -> (-1, 1]$. Let $Phi$ be its corresponding intersection angle function. Let $V = V_1 union.sq V_2$ such that $V_1 != diameter$ and in the case Euclidean background, $V_2 != diameter$. Suppose $R$ and $r$ are two circle packing radius assignments on $(S, cal(T))$ with either euclidean or hyperbolic background such that $R|_V_2 >= r|_(v_2)$ and their curvatures $k_R$ and $k_r$ satisfy $K_R|_(V_1) >= K_R|_(V_1)$. Then $R >= r$.
]
#proof[
  Let $ X := {x in RR^N_(> 0) mid(|) x|_(V_(2)) >= r|_(V_(2)), K_(x)|_(V_(1)) >= K_(r)|_(V_(1))}. $ Note that $r in X$ and $R in X$ by assumption. We want to show that $forall v in V$, $r(v) = inf(x(v) mid(|) x in X)$ or $r = inf(X)$. This will imply that $R >= r$ and finish the proof.

  First we claim that $forall a, b in X$, then $c = min(a, b) in X$ . Clearly, $c|_(V_(2)) >= r|_(V_(2))$. $forall v in V_(1)$, let ${u_(1), #sym.dots.h, u_(m)}$ be the set of all vertices adjacent to it. Assume without a loss of generality, $c(v) = a(v)$. Since $c(v_(i)) <= a(v_(i))$, by part 1 of @EuclideanMonotonicity and part 1 of @HyperbolicMonotonicity, we see that $K_(c)(v) >= K_(a)(v) => K_(c)(v) >= K_(r)(v)$. Thus $c in X$.

  Now let $w = inf(X)$. $forall v in V$, let $(x_(v, n))$ be sequence in $X$ such that $ w(v) = lim_(n -> infinity) x_(v, n)(v). $ Let $(y_(n))_(n in NN)$ where $ y_(n) := min{x_(v, n) mid(|) v in V}. $ By the claim proved above, $y_(n) in X$ for all $n in NN$. Since $y_(n) <= x_(v, n)$ $forall v in V$,

  $ limsup_(n -> infinity) y_(n)(v) <= limsup_(n -> infinity) x_(v, n)(v) = lim_(n -> infinity) x_(v, n)(v) = w(v). $

  On the other hand, by the definition of infimum, $w <= y_(n)$, thus $forall v in V$ $ w(v) <= liminf_(n -> infinity) y_(n)(v). $
  Thus $ w(v) = lim_(n -> infinity) y_(n)(v). $
  To verify that $w in X$, we have to verify the three conditions.

  + $w in RR_(>0)^V$: Assume the contrary that $I = {v in V mid(|) w(v) = 0} != diameter$. By @CursedInequality, we have $ lim_(n -> infinity) sum_(v in I)^() K_(y_(n))(v) = 2 pi chi(F_(I)) - sum_((e, v) in "Lk"(I))^() (pi - Phi(e)). $ Note that $forall v in V_(2)$, $w(v) >= r(v) > 0 => I inter V_(2) = diameter => I subset V_(1)$. Thus $forall v in I$, $K_(y_(n))(v) >= K_(r)(v)$. Combining this fact and @CursedInequality we see,$ lim_(n -> infinity) sum_(v in I)^() K_(y_(n))(v) >= sum_(v in I)^() K_(r)(v) > 2 pi chi(F_(I)) - sum_((e, v) in "Lk"(I))^() (pi - Phi(e)). $ This is a contradiction. Thus $I = diameter$ and $w in RR_(> 0)^V$ and it is a valid circle packing metric for $(S, cal(T), Phi)$ .
  + $w|_(V_(2)) >= r|_(V_(2))$: $forall n in NN, y_(n)|_(V_(2)) >= r|_(V_(2))$ and since $w = lim_(n -> infinity) y_(n)$. Thus $w|_(V_(2)) >= r|_(V_(2))$.
  + $K_(w)|_(V_(1)) >= K_(r)|_(V_(1))$: $forall v in V_(1)$, $ K_(w)(v) = lim_(n -> infinity) K_(r_(n))(v) $ by the sequential definition of continuity.

  Thus $w in X$. By definition of infimum, $r|_(V_(2)) >= w|_(V_(2))$. Thus $r|_(V_2) = w|_(V_(2))$. Assume the contrary $exists v in V_(1) in.rev K_(w)(v) > K_(r)(v)$. $forall t in (0, w(v))$, let $w^t: V -> infinity$ where $ w^(t)(x) := cases(
    w(x) - t "if" x = v,
    w(x) "otherwise"
  ). $ Since $v in V_(1)$, $w^(t)|_(V_(2)) = w|_(V_(2)) >= r|_(V_2)$. Let ${u_(1), #sym.dots.h, u_(m)}$ be all the adjacent vertices to $v$. Since $w^(t)(u_(i)) = w(u_(i))$, by part 1 of @EuclideanMonotonicity and part 1 of @HyperbolicMonotonicity $K_(w^t)(v) < K_(w)(v)$ and $K_(w^t)(u_(i)) >= K_(w)(u_(i)) >= K_(r)(u_(i))$. By continuity, $exists t_0 in (0, w(v))$ small such that $K_(r)(v) <= K_(w^t)(v) <= K_(w)(v)$. Thus $w^(t_0) in X$, however $w^(t_(0))(v) < w(v)$. This is a contradiction since $w$ is a infimum. Thus $K_(w)|_(V_1) = K_(r)|_(V_1)$.

  Now we have to show that $r = w$ given the fact that $r|_(V_2) = w|_(V_2)$ and $K_(w)|_(V_1) = K_(r)|_(V_1)$. Let $A = RR$ is the background geometry is Euclidean and $A = (0, infinity)$ if the background geometry is Hyperbolic. Let $phi: (0, infinity) -> A$ where $ phi(x) := cases(
    ln(x) & "if Euclidean Background",
    integral_(x)^(infinity) (dif t)/(sinh(t)) & "if Hyperbolic Backgound"
  ) $ $phi$ is a homeomorphism so $phi^(-1)$ exists and is a continous. Let $cal(R) = {x in RR^V_(>0) mid(|) phi^(-1)(x)|_(V_(2)) = r|_(V_2)}$. Let $W: A^V -> RR$ where $ W(x) := sum_(triangle v_(i) v_(j) v_(k) in F)^() W_("cp")(x_(i), x_(j), x_(k)). $ part 1 of @EuclideanMonotonicity and part 1 of @HyperbolicMonotonicity, $ (diff W)/(diff x_(a)) & = sum_(triangle v_(a) v_(j) v_(k) in F)^() (diff W_("cp"))/(diff x_(a)) \
                        & = sum_(triangle v_(a) v_(j) v_(k) in F)^() theta_(a)^(j,k)              \
                        & = 2 pi - K_(phi^(-1)(x))(v_(a)). $ Thus $ gradient W(x) = 2 pi - K_(phi^(-1)(x)). $
  Let $F = W|_(cal(R))$. Thus $F: RR^(V_(1))_(>0) -> RR$ and $ gradient F = 2 pi - K_(phi^(-1)(x))|_(V_(1)). $ $forall x, y in cal(R)$ such that $x != y$. Take $M = {v in V mid(|) x(v) != y(v)}$ and $N = {v in V mid(|) x(v) = y(v)}$. Note $M != diameter$ since $x != y$, $V_(2) subset N$, and $M inter N = diameter$ . Since $(S, cal(T))$ is connected, then the graph of the triangulation is connected. Thus $exists (a, b) in M times N$ such that $exists triangle a b c in F$. $ (x(a) - y(a), x(b) - y(b), x(c) - y(c)) = (x(a) - y(a), 0, x(c) - y(c) ) != (0, 0, 0) $ since $x(a) != y(a)$. Thus $W_("cp")$ is strictly concave on ${t u + (1 - t) hat(u)}$ where $u = (x(a), x(b), x(c))$ and $hat(u) = (y(a), y(b), y(c))$. Thus $W_("cp")$ is strictly concave on $cal(R)$, thus $W$ and $F$ are strictly concave on $cal(R)$. Thus $gradient F$ is injective. Thus $x -> K_(phi^(-1)(x))|_(V_1)$ is injective. Thus since $K_(w)|_(V_1) = K_(r)|_V_(1) => w|_(V_(1)) = r|_(V_1) => w = r$. Thus $r = inf(X)$ and $R >= r$.

]

= Discrete Schwarz-Pick Lemma for $I >= 1$
For $I >= 1$, we conjectured that the statement of the Discrete Schwarz would hold because for such circle packings we have rigidity by Guo @guo2009localrigidityinversivedistance and Luo @luo2006rigiditypolyhedralsurfaces.
#conjecture[
  Let $(S, cal(T), I)$ be a closed connected weighted simplicially-triangulated surface where for any topological triangle $triangle v_(i) v_(j) v_(k) in F$ we have $gamma_(i)^(j, k) >= 0, gamma_(j)^(i, k) >= 0, gamma_(k)^(i, j) >= 0$ and $I >= 1$. Let $V = V_1 union.sq V_2$ such that $V_1 != diameter$ and in the case Euclidean background, $V_2 != diameter$. Suppose $R$ and $r$ are two circle packing radius assignments on $(S, cal(T))$ with either euclidean or hyperbolic background such that $R|_V_2 >= r|_(v_2)$ and their curvatures $k_R$ and $k_r$ satisfy $k_R|_(V_1) >= k_R|_(V_1)$. Then $R >= r$.
]

== Counterexample for $I >= 1$ on the disk with boundary

The conjecture concerns closed surfaces, but a counterexample on a triangulated disk with a boundary is sufficient. By a standard doubling argument, any such counterexample on a disk can be extended to a closed surface.

Let $(S, cal(T), I)$ be a disk with boundary with interior vertices $V_(1)$ and boundary vertices $V_(2)$. Construct a closed surface $S prime$ by taking two copies of $S$ and identifying their boundaries with the identity map. This induces a triangulation $T prime$ and inversive distance function $I prime$ on $S prime$. Given two metrics $r$ and $R$ on $(S, cal(T), I)$, we define corresponding metrics $r prime$ and $R prime$ on $(S prime, cal(T) prime, I prime).$ If the premises of the conjecture (ie $r(v) <= R(v)$ for all $v in V_(2)$ and $K_(r)(v) <= K_(R)(v)$ for all $v in V_(1)$) hold on the disk, they will also hold on the doubled surface. Therefore if we find an interior vertex $d in V_(1)$ such that $r(d) > R(d)$, this violation will carry over to the corresponding vertices in the doubled surface $S prime$ and thus refuting the conjecture for closed surfaces.


== Construction of the Counterexample
We now construct such a disk:

- *Vertices*: The vertex set is $V = \{a, b, c, d\}$.
- *Partition*: We partition the vertices as $V_1 = \{d\}$ and $V_2 = \{a, b, c\}$.
- *Triangulation*: The surface consists of three triangles: $(a, b, d)$, $(a, c, d)$, and $(b, c, d)$.
- *Inversive Distance Edge Weights*: The weights $I$ are given as follows:

#align(center, table(
  columns: (auto, auto),
  inset: 6pt,
  align: center,
  table.header([*Edge*], [*Inversive Distance $(I)$*]),
  $a b$, $1.0$,
  $a c$, $1.0$,
  $b c$, $1.0$,
  $a d$, $1.19301$,
  $b d$, $4.14177$,
  $c d$, $3.14727$,
))

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
      content((0, radius + .3), [#text([$a$], size: text-size)])

      circle((radius * calc.cos(210deg), radius * calc.sin(210deg)), radius: 2pt, stroke: red, fill: red)
      content((radius * calc.cos(210deg) - .2, radius * calc.sin(210deg) - .2), [#text([$b$], size: text-size)])

      circle((radius * calc.cos(330deg), radius * calc.sin(330deg)), radius: 2pt, stroke: red, fill: red)
      content((radius * calc.cos(330deg) + .2, radius * calc.sin(330deg) - .2), [#text([$c$], size: text-size)])

      circle((0, 0), radius: 2pt, stroke: blue, fill: blue)
      content((.3, .3), [#text([$d$], size: text-size)])
    })],
  caption: [Triangulation of Counter Example],
)

We now define two circle packing metrics, $r$ and $R$, on this surface. The radii and resulting discrete curvatures for the metric $r$ are:

#align(center, table(
  columns: (auto, auto, auto),
  stroke: 0.4pt,
  [*Vertex*], [*Radius* $r(v)$], [*Curvature* $k_r (v)$],
  $a$, `100.0`, `2.49300`,
  $b$, `100.0`, `4.54271`,
  $c$, `100.0`, `3.97976`,
  $d$, `148.29698`, `4.69250`,
))

The induced edge lengths from this circle packing metric are:

#align(center, table(
  columns: (auto, auto),
  stroke: 0.4pt,
  [*Edge* $e$], [*Edge Length* $l_(r)(e)$],
  $a b$, `200.0`,
  $a c$, `200.0`,
  $b c$, `200.0`,
  $a d$, `259.56903`,
  $b d$, `393.49002`,
  $c d$, `354.03124`,
))

The radii and resulting discrete curvatures for the metric $R$ are:

#align(center, table(
  columns: (auto, auto, auto),
  stroke: 0.4pt,
  [*Vertex*], [*Radius* $R(v)$], [*Curvature* $k_R (v)$],
  $a$, `109.19267`, `1.24905`,
  $b$, `245.79886`, `5.20030`,
  $c$, `222.06186`, `4.49970`,
  $d$, `147.98050`, `4.75891`,
))

The induced edge lengths from this circle packing metric are:

#align(center, table(
  columns: (auto, auto),
  stroke: 0.4pt,
  [*Edge* $e$], [*Edge Length* $l_(R)(e)$],
  $a b$, `354.99153`,
  $a c$, `331.25453`,
  $b c$, `467.86072`,
  $a d$, `269.02721`,
  $b d$, `619.36753`,
  $c d$, `527.30776`,
))




== Verification of the Counterexample
We now check the conditions of the conjecture.

=== Checking Initial Assumptions
+ *Condition on $V_2$*: We must check if $r(v) < R(v)$ for all $v in V_2 = \{a, b, c\}$.
  - $r(a) = 100.0 < 109.19267 = R(a)$
  - $r(b) = 100.0 < 245.79886 = R(b)$
  - $r(c) = 100.0 < 222.06186 = R(c)$

  The condition holds.

+ *Condition on $V_1$*: We must check if $k_r(v) \le k_R(v)$ for all $v \in V_1 = \{d\}$.
  - $k_r (d) = 4.69250 <= 4.75891 = k_R (d)$

  This condition also holds.

Both premises of the conjecture are satisfied.

=== Violation of the Conclusion

The conjecture concludes that $r(v) <= R(v)$ for *all* vertices $v in V$. We have already verified this for $V_2$. We now check the vertex in $V_1$:

- For vertex $d$:
  - $r(d) = 148.29698$
  - $R(d) = 147.98050$

Here, we find that $r(d) > R(d)$.

== Analysis of the Effects of Numerical Precision
This counterexample was generated computationally, which necessitates the analysis of the role of floating point arithmetic. We must ensure that the key result, the violation of $r(d) > R(d)$, is not a artifact of numerical error.

The core of the counter example is the inequality $r(d) > R(d)$. The difference is $r(d) - R(d) approx 0.00316$. The computations were performed with standard IEEE 754 double precision arithmetic, which has a machine epsilon of $epsilon_("mach") = 2.22 times 10^(-16)$. This value represents the smallest number that when added to $1$, gives a different result than $1$. The observed difference is $approx 3.16 times 10^(-3)$ which is 13 orders of magnitude greater than machine epsilon, thus making it highly unlikely to be a result of random numerical noise

The calculation of discrete curvature involves 4 main steps: calculation of edge lengths, verification of triangle inequality, finding corner angles using cosine law, and summing these angles.

The formula to calculate edge lengths $l(v w)^2 = r(v)^2 + r(w)^2 + 2r(v)r(w)I(v w)$ involves multiplications and additions. For well scaled inputs, the relative error of these operations is on the order of $epsilon_("mach")$. The subsequent square root is a well condition operation that keeps the relative error on the order of $epsilon_("mach")$. Thus the relative error is on the order of $epsilon_("mach")$ to find edge lengths.

To verify the triangle inequality, for each triangle $triangle v_(i) v_(j) v_(k)$ we do the checks $l(v_( i) v_(j) ) + l(v_(i) v_(k) ) > l(v_(j) v_(k) )$, $l(v_(i) v_(j) ) + l(v_(j), v_(k) ) > l(v_(i), v_(k))$, and $l(v_(i), v_(k)) + l(v_(j), v_(k)) > l(v_(i), v_(j))$ to verify the triangle inequality. This is a sequence of additions which contribute a relative error on the order of $epsilon_("mach")$. The check fails at less then the order of $epsilon_("mach")$. The lengths of the edges, such that any failure in the triangle inequality doesn't occur.

To calculate the interior angles we use the law of cosines, $theta = arccos((a^2 + b^2 - c^2)/(2 a b))$, which is the the most sensitive step. It can suffer from catastrophic cancellation, if the triangle is nearly degenerate. This would cause a significant loss in precision. However, an analysis of the induced edge lengths for both metrics r and R shows that the triangles are well-conditioned and far from degenerate. Therefore, we do not expect a dramatic loss of precision in the angle calculations.

The final curvature $k(v) = 2 pi - sum_(alpha > v)^() alpha_(i)$. At each vertex, $k_(v)$ is the sum of at most 3 angles. The total error from each angle remains small.

In summary, while all floating-point computations have inherent error, the structure of the calculations in this problem is numerically stable. The magnitude of the violation $r(d) > R(d)$ is vastly larger than the expected accumulated error. The observed result is therefore a robust feature of this specific geometric configuration and serves as a valid refutation of the conjecture.

== Conclusion of Counterexample
The premises hold ($r|_(V_2) <= R|_(V_2)$, $k_r|_(V_1) <= k_R|_(V_1)$), but $r(d) > R(d)$. This violates the conjecture on the disk. By the doubling argument, it also provides a counterexample for closed surfaces.

= Acknowledgements
The research of this author is supported the National Science Foundation of the United States of America under Grant \#2220271. This work was done with the support of the DIMACS REU at Rutgers University, under the mentorship of Professor Feng Luo, Professor Hongbin Sun, Dr. Zhenghao Rao, and Mr. Kuijin Liu.




