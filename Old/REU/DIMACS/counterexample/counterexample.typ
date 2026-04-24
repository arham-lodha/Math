#let title = [A Counterexample to the Discrete Schwarz Lemma for Inversive Distance Circle Packings]
#let authors = [Arham Lodha]

// Title block
#align(center)[
  #block(text(17pt, weight: 700, title))
  #v(1em, weak: true)
  #text(12pt, authors)
  #v(0.5em, weak: true)
  #v(2em, weak: true)
]

= Introduction

I present a counterexample to a proposed version of the Discrete Schwarz Lemma for circle packings based on inversive distance. We define a triangulated surface with specific edge weights and provide two distinct circle packing metrics, $r$ and $R$. We then demonstrate that while these metrics satisfy the preconditions of the conjecture, they fail to satisfy its conclusion, thereby disproving it.

= The Conjecture

Let $(S, cal(T), I)$ be a closed triangulated surface, where $cal(T)$ is the triangulation and $I$ provides a weight for each edge in $cal(T)$. Let the vertex set $V$ of the triangulation be partitioned into two disjoint subsets, $V_1$ and $V_2$ where $V_(1) != diameter$ .

For any function $r: V -> (0, infinity)$ assigning a radius to each vertex, the induced length of an edge $lr(angle.l v_i, v_j angle.r)$ is given by the formula:
$ l_r (lr(angle.l v_i, v_j angle.r) ) = sqrt(r(v_i)^2 + r(v_j)^2 + 2r(v_i)r(v_j)I(lr(angle.l v_i, v_j angle.r) )) $

A function $r$ is a *circle packing metric* if the induced edge lengths $l_r$ satisfy the triangle inequality for every triangle in $T$. For any such metric $r$, there is an associated discrete curvature at each vertex, $k_r: V -> (-infinity, 2 pi]$.

*Conjecture (Discrete Schwarz Lemma for Inversive Distance):*
Let $r$ and $R$ be two circle packing metrics. If $r|_(V_2) <= R|_(V_(2))$ and $k_r|_(V_(1)) <= k_R|_(V_(1))$, then $r <= R$.

= The Counterexample

The conjecture concerns *closed surfaces*, but we demonstrate it suffices to find a counterexample on a *disk with boundary* where:
- $V_1$ = interior vertices,
- $V_2$ = boundary vertices.

*Doubling Argument*: Let $(S, cal(T), I)$ be a disk with boundary. Double $S$ along its boundary to form a closed surface $S' = S_1 union_{diff S} S_2$, inducing $cal(T) prime$ and $I'$. For the circle packing metrics:
- Radii are preserved: $r'(v) = r(v)$, $R'(v) = R(v)$ for corresponding vertices
- Curvature is preserved for $V_1$ vertices (their links are unchanged)
- The partition transfers: $V_1 prime$ = two copies of $V_1$, $V_2 prime$ = $V_2$ (boundary vertices)

If $r|_(V_(2)) <= R|_(V_(2))$ and $k_r|_(V_1) <= k_R|_(V_1)$, then:
- $r'|_(V_(2) prime) <= R'|_(V_(2) prime)$
- $k_(r prime)|_(V_(1) prime) <= k_(R prime)|_{V_1'}$

A vertex $v in V_1$ with $r(v) > R(v)$ implies $r'(v_1) > R'(v_1)$ and $r'(v_2) > R'(v_2)$ in $S'$ for $v_1, v_2 in V_1'$ the two copies of $v$. This violates the conjecture for closed surfaces.

== Specific Counterexample Construction
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
  $lr(angle.l a, b angle.r)$, $1.0$,
  $lr(angle.l a, c angle.r)$, $1.0$,
  $lr(angle.l b, c angle.r)$, $1.0$,
  $lr(angle.l a, d angle.r)$, $1.19301$,
  $lr(angle.l b, d angle.r)$, $4.14177$,
  $lr(angle.l c, d angle.r)$, $3.14727$,
))


We now define two circle packing metrics, $r$ and $R$, on this surface.

== Metric $r$

The radii and resulting discrete curvatures for the metric $r$ are:

#align(center, table(
  columns: (auto, auto, auto),
  stroke: 0.4pt,
  [*Vertex*], [*Radius* $r(v)$], [*Curvature* $k_r(v)$],
  $a$, `1.0`, `2.49300`,
  $b$, `1.0`, `4.54271`,
  $c$, `1.0`, `3.97976`,
  $d$, `1.48297`, `4.69250`,
))

== Metric $R$

The radii and resulting discrete curvatures for the metric $R$ are:

#align(center, table(
  columns: (auto, auto, auto),
  stroke: 0.4pt,
  [*Vertex*], [*Radius* $R(v)$], [*Curvature* $k_R(v)$],
  $a$, `1.09193`, `1.24905`,
  $b$, `2.45799`, `5.20030`,
  $c$, `2.22062`, `4.49970`,
  $d$, `1.47981`, `4.75891`,
))

= Verification of Counterexample

We now check the conditions of the conjecture.

=== Checking the Premises

1. *Condition on $V_2$*: We must check if $r(v) < R(v)$ for all $v in V_2 = \{a, b, c\}$.
  - $r(a) = 1.0 < 1.09193 = R(a)$
  - $r(b) = 1.0 < 2.45799 = R(b)$
  - $r(c) = 1.0 < 2.22062 = R(c)$

  The condition holds.

2. *Condition on $V_1$*: We must check if $k_r(v) \le k_R(v)$ for all $v \in V_1 = \{d\}$.
  - $k_r (d) = 4.69250 <= 4.75891 = k_R (d)$

  This condition also holds.

Both premises of the conjecture are satisfied.

=== Checking the Conclusion

The conjecture concludes that $r(v) <= R(v)$ for *all* vertices $v in V$. We have already verified this for $V_2$. We now check the vertex in $V_1$:

- For vertex $d$:
  - $r(d) = 1.48297$
  - $R(d) = 1.47981$

Here, we find that $r(d) > R(d)$.

=== Analysis of the Effects of Numerical Precision
This counterexample was generated computationally, which necessitates the analysis of the role of floating point arithmetic. We must ensure that the key result, the violation of $r(d) > R(d)$, is not a artifact of numerical error.

+ *Scale of the Violation vs Machine Precision*: The core of the counter example is the inequality $r(d) > R(d)$. The difference is $r(d) - R(d) approx 0.00316$. The computations were performed with standard IEEE 754 double precision arithmetic, which has a machine epsilon of $epsilon_("mach") = 2.22 times 10^(-16)$. This value represents the smallest number that when added to $1$, gives a different result than $1$. The observed difference is $approx 3.16 times 10^(-3)$ which is 13 orders of magnitude greater than machine epsilon, thus making it highly unlikely to be a result of random numerical noise
+ *Error Propagation in Discrete Curvature Computation*: The calculation of discrete curvature involves 4 main steps: calculation of edge lengths, verification of triangle inequality, finding corner angles using cosine law, and summing these angles:
  - *Edge Lengths*: The formula $l(lr(angle.l v, w angle.r) )^2 = r(v)^2 + r(w)^2 + 2r(v)r(w)I(lr(angle.l v, w angle.r) )$ involves multiplications and additions. For well scaled inputs, the relative error of these operations is on the order of $epsilon_("mach")$. The subsequent square root is a well condition operation that keeps the relative error on the order of $epsilon_("mach")$. Thus the relative error is on the order of $epsilon_("mach")$ to find edge lengths.
  - *Triangle Inequality Checks*: For each triangle $triangle v_(i) v_(j) v_(k)$ we do the checks $l(lr(angle.l v_(i), v_(j) angle.r) ) + l(lr(angle.l v_(i), v_(k) angle.r) ) > l(lr(angle.l v_(j), v_(k) angle.r) )$, $l(lr(angle.l v_(i), v_(j) angle.r) ) + l(lr(angle.l v_(j), v_(k) angle.r) ) > l(lr(angle.l v_(i), v_(k) angle.r) )$, and $l(lr(angle.l v_(i), v_(k) angle.r) ) + l(lr(angle.l v_(j), v_(k) angle.r) ) > l(lr(angle.l v_(i), v_(j) angle.r) )$ to verify the triangle inequality. This is a sequence of additions which contribute a relative error on the order of $epsilon_("mach")$. The check fails at less then the order of $epsilon_("mach")$. The lengths of the edges, such that any failure in the triangle inequality doesn't occur.
  - *Finding Corner Angles with Cosine Law*: The Law of Cosines, $theta = arccos((a^2 + b^2 - c^2)/(2 a b))$ is the the most sensitive step. It can suffer from catastrophic cancellation, if the triangle is nearly degenerate. This would cause a significant loss in precision. However, an analysis of the induced edge lengths for both metrics r and R shows that the triangles are well-conditioned and far from degenerate. Therefore, we do not expect a dramatic loss of precision in the angle calculations.
  - *Curvature sum*: The final curvature $k(v) = 2 pi - sum_(alpha > v)^() alpha_(i)$. At each vertex, $k_(v)$ is the sum of at most 3 angles. The total error from each angle remains small.
In summary, while all floating-point computations have inherent error, the structure of the calculations in this problem is numerically stable. The magnitude of the violation $r(d) > R(d)$ is vastly larger than the expected accumulated error. The observed result is therefore a robust feature of this specific geometric configuration and serves as a valid refutation of the conjecture.

== Conclusion
The premises hold ($r|_(V_2) <= R|_(V_2)$, $k_r|_(V_1) <= k_R|_(V_1)$), but $r(d) > R(d)$. This violates the conjecture *on the disk*. By the doubling argument, it also provides a counterexample for closed surfaces.
