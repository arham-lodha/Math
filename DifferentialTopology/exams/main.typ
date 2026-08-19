#import "template.typ": *

#show: homework.with(
  assignment: "Exams",
  name: "Arham Lodha",
  due: "August 17, 2026",
)

// ── Usage ────────────────────────────────────────────────────────────────────
//
//  Basic problem:
//    #problem[
//      State the problem here.
//    ]
//
//  Problem with a title:
//    #problem("Lagrange's Theorem")[
//      State the problem here.
//    ]
//
//  Sub-parts (lettered a, b, c, ...):
//    #problem[
//      Prove the following:
//      #part[First sub-part.]
//      #part[Second sub-part.]
//    ]
//
//  Solution block (shaded, left-bar):
//    #solution[
//      Write your solution here.
//      Use $inline math$ or $ display math $ as needed.
//    ]
//
//  Full example:
//    #problem("Cauchy's Theorem")[
//      If $p mid(|) abs(G)$, show $G$ has an element of order $p$.
//      #part[Reduce to the case $G$ abelian.]
//      #part[Handle the abelian case by induction.]
//    ]
//    #solution[
//      *(a)* ...
//      *(b)* ...
//    ]
// ─────────────────────────────────────────────────────────────────────────────
#let dx = $dif x$
#let dy = $dif y$
#let dz = $dif z$

= Geometry-Topology Qualifying Examination — September 25, 2002

#problem[
  Suppose $P(x,y,z)$, $Q(x,y,z)$, and $R(x,y,z)$ are $C^infinity$ functions on $RR^3$ which vanish identically if $|x| >= 5$, $|y| >= 5$, or $|z| >= 5$. Prove that the volume integral
  $ integral_(-6)^(+6) integral_(-6)^(+6) integral_(-6)^(+6) d(P d y ∧ d z + Q d x ∧ d z + R d x ∧ d y) = 0. $
  (Do this directly, not by quoting Stokes' Theorem: this is a special case of the proof of Stokes' Theorem!)
]
#solution[
  $
    d(P dy and dz + Q dx and dz + R dx and dy) & = P_x dx and dy and dz + Q_y dy and dx and dz + R_z dz and dx and dy \
  $

  $ integral_([0, 6]^2) integral_(-6)^(6) P_x dx and dy and dz & = integral_(-6)^(6) (P(6) - P(-6)) dy and dz = 0. $

  Similarly for $Q$ and $R$. Thus the total integral is 0.
]

#problem(todo: true)[
  Suppose that $V = P(x,y,z) partial/(partial x) + Q(x,y,z) partial/(partial y) + R(x,y,z) partial/(partial z)$ is a $C^infinity$ vector field on $RR^3$ with $V != arrow(0)$ at the origin. Find a necessary and sufficient condition for there to exist a $C^infinity$ function $lambda(x, y, z)$ in some neighborhood of the origin such that $lambda V$ is the gradient of a $C^infinity$ function on the neighborhood.
]
#proof[

]

#problem[
  Let $T_t : RR^3 -> RR^3$ be the right-hand rule rotation around the positive $z$-axis by $t$ degrees and $S_s : RR^3 -> RR^3$ be the right-hand-rule rotation around the positive $x$-axis by $t$ degrees.
  #part[Find the infinitesimal generators of the flows $T_t$ and $S_t$, i.e., the vector fields $X$ and $Y$, respectively, on $RR^3$ whose flows are ${T_t}$ and ${S_t}$.]
  #part[Compute the commutator $T_(-t) compose S_(-t) compose T_t compose S_t$.]
  #part[Compare the result of (b) (lowest order non-identically zero term) with the Lie bracket $[X, Y]$.]
]
#proof[
  We have that:
  $
    T_t (arrow(x)) & = mat(cos(t), -sin(t), 0; sin(t), cos(t), 0; 0, 0, 1) arrow(x) \
    S_t (arrow(x)) & = mat(1, 0, 0; 0, cos(t), -sin(t); 0, sin(t), cos(t)) arrow(x)
  $

  1.
  $
    X(arrow(x_0)) & = (partial) / (partial t)[T_t (x)]_(t = 0) \
                  & = (partial) / (partial t) [mat(cos(t), -sin(t), 0; sin(t), cos(t), 0; 0, 0, 1) arrow(x)]_(t = 0) (x) \
                  & = mat(-sin(t), -cos(t), 0; cos(t), -sin(t), 0; 0, 0, 0)_(t = 0) arrow(x) \
                  & = mat(0, -1, 0; 1, 0, 0; 0, 0, 0) vec(x, y, z) = A arrow(x) \
                  & = -y partial_x + x partial_y
  $

  $
    Y(arrow(x_0)) & = mat(0, 0, 0; 0, 0, -1; 0, 1, 0) arrow(x) = B arrow(y) = -z partial_y + y partial_z
  $
  2. We have $  T_(t) & = I + A t + 1/2 t^2 A + O(t^3) \
       S_t & = I + B t + 1/2 t^2 B + O(t^3 ) \
    T_(-t) & = I - A t + 1/2 t^2 A + O(t^3) \
    S_(-t) & = I - B t + 1/2 t^2 B + O(t^3) $

  Thus $ T_(-t) S_(-t) T_(t) S_t = (I - A t + 1/2 t^2 A + O(t^3))(1 - B t + 1/2 t^2 B ) $

]

#problem[
  Take as given that a $C^infinity$ 2-form $omega$ on $S^2$ is of the form $d theta$ for some $C^infinity$ 1-form $theta$ if and only if $integral_(S^2) omega = 0$. Use this to show that every $C^infinity$ 2-form $Omega$ on $RR P^2$ has the form $d Lambda$ for some $C^infinity$ 1-form $Lambda$. (Do not just quote DeRham's Theorem here.)
]
#proof[
  Let $A$ be the antipodal map of $S^2$. $q: S^2 -> RR P^2$ standard quotient map, which induces $q^*: Omega^2(RR P^2) -> Omega^2(S^2)$. Note that $q^*$ is a injective map. Note $A^*(q^*(omega)) = q^*(omega)$. But note $A$ flips the orientation of $S^2$. $forall psi in Omega^2 (RR P^2)$,

  $
    I = integral_(S^2) q^*(psi) & = integral_(S^2) A^* (q^* (psi)) \
                                & = integral_(A(S^2)) q^* (psi) = - integral_(S^2) q^* (psi) => I = 0
  $

  Thus $q^* (psi) = d theta$. $d theta = A^*(q^*(psi)) = A^*(d theta) = d (A^* (theta)).$ Let $tilde(theta) = 1/2 [ theta + A^*(theta)]$, note $A^*(tilde(theta)) = tilde(theta)$. Thus $tilde(theta)$ factors through $Omega^1 (RR P^2)$. Thus $psi = d tilde(theta)$.


]


#problem[
  #part[Suppose $F : S^1 -> RR^3$ is a $C^infinity$ function such that $d F$ is nowhere zero (on $S^1$). Prove that there is a two-dimensional subspace $P$ of $RR^3$ such that $pi_P compose F : S^1 -> RR^3$ has nowhere vanishing differential, where $pi_P =$ orthogonal projection on $P$.]
  #part[Show by example (a picture with explanation is all right) that there is such an $F$ that is also 1 to 1 (injective) but is such that, for all $P$, $pi_P compose F$ fails to be injective.]
  #part[Show that if $F : S^1 -> RR^4$ is $C^infinity$ and injective then there is a three-dimensional subspace $H$ of $RR^4$ such that $pi_H compose F$ is injective, where $pi_H =$ orthogonal projection on $H$.]
]
#proof[
  *(a)*: Since $d F_p != 0$ for all $p in S^1$. Thus $d F_p$ is a injective map. Thus $F$ is a immersion.
]

#problem[
  #part[Suppose $F : S^n -> S^n$ is fixed-point free (i.e., for all $p in S^n$, $p != F(p)$). Show that $F$ is homotopic to the antipodal map $p |-> -p$, $p in S^n$.]
  #part[Use part (a) to show that every vector field on (tangent to) $S^(2n)$, $n = 1, 2, 3, dots$, vanishes somewhere on $S^(2n)$ (i.e., has a zero).]
]
#proof[
  *(a)*: Suppose $F: S^n -> S^n$ is fixed point free. Let $H: S^n times I -> S^n$ where $ H(x, t) = (F(x) t - (1 - t) x) / (
  norm(F(x) t - (1- t) x)
  ) $

  Note since $F(x) != x$ for all $x in S^1$, $exists.not t in [0, 1]$ such that $F(x) t - (1- t) x = 0$. Thus $H$ is a homotopy between $x -> -x$ and $F$.

  *(b)*: Let $X$ be a vector field. Assume the contrary, $forall p in S^(2n)$ we have that $X(p) != p$. Since $S^(2n)$ is compact and $norm(X(dot))$ is smooth, $exists M in RR$ such that $norm(X)_(oo) < M$. Let $epsilon > 0$ be small enough such that $epsilon M < pi$. Let $F: S^(2n) times [0, 1] -> S^(2 n)$ where $F(p, t) = exp_p (t epsilon X(p))$. Thus $F$ is a homotopy between the identity map and $F(dot, 1)$ a map with no fixed point which is homotopic to antipodal map. $deg(id_(S^(2n))) = 1 = deg(F(dot, 1)) = deg([x -> -x]) = (-1)^(2n - 1) = -1$. This is a contradiction.
]

#problem(todo: true)[
  #part[Discuss carefully how to obtain the long exact sequence in homology from a short exact sequence of chain complexes. (Include definitions of the maps in the long exact sequence.)]
  #part[If the short exact sequence is
    $ 0 -> C_1 -> C_2 -> C_3 -> 0, $
    prove exactness of the long exact sequence at $H_k (C_3)$ [in $dots H_k (C_2) -> H_k (C_3) -> H_(k-1) (C_1) dots$].]
]

#problem[
  #part[Suppose $F : T^2 -> T^2$ (where $T^2 = S^1 times S^1$) is a continuous function such that $F(p) = p$ for some $p in T^2$ and
    $ F_* : pi_1(T^2, p) -> pi_1(T^2, p) $
    is the identity map. Is $F$ necessarily homotopic to the identity map from $T^2$ to itself?]
  #part(todo: true)[Is a $C^infinity$ map $F : T^2 -> T^2$ of degree 1 necessarily homotopic to the identity map of $T^2$ to itself? Explain/prove your answer.]
]
#solution[
  *(a)*: $tilde(F): T^2 -> RR^2$ where $tilde(F) (x, y) = F(x, y) + (1, 1)$. Note $F = q compose tilde(F)$. Let $H$ be the standard straight line homotopy from $id -> tilde(F)$. Thus $q compose H$ is the straight line homotopy from $id -> F$.

  *(b)*:
]

#problem[
  #part[Discuss the representation of $CC P^n$ as a cell complex.]
  #part[Use part (a) to find the homology of $CC P^n$: prove carefully that your calculation is correct.]
]
#solution[
  *(a)*: You have a $0$-cell, $2$-cell, ..., $2n$-cell. To attach the cells, you attach cell $2(n - 1)$ to cell $2n$ by attaching the boundary to $2(n - 1)$ cell directly.

  *(b)*: You have the complex neighborhood of s:

  $ 0 -> C_(2n) = ZZ -> 0 -> C_(2(n -1 )) = ZZ -> ... ->^(d_(3) ) C_2 = ZZ ->^(d_(2) ) 0 ->^(d_1) C_0 = ZZ ->0 $

  Thus we have $0 ->^(d_(2k)) C_(2k) ->^(d_(2k - 1)) -> 0 => H_(2k)(CC P^n) = ZZ$ for $H_(2 k - 1)(CC P^n) = 0$.
]

#problem[
  #part[Let $X$ be the space obtained by attaching two discs to $S^1$, the first disc being attached by $S^1 = partial D_1 -> S^1$ being the 7 times around (counterclockwise) map, e.g., $z -> z^7$, $|z| = 1$, $z in CC$, and the second being attached by $S^1 = partial D_2 -> S^1$ being the 5 times around map $z -> z^5$. Find the homology of $X$.]
  #part[Can $X$ be made a $C^infinity$ manifold? Why or why not?]
]
#proof[*(a):*
  We have this cellular chain complex:

  $ 0 -> ZZ^2 ->^(mat(7, 5)) ZZ ->^0 ZZ -> 0. $

  Thus $   H_0 (X) & = ZZ \
  H_(1) (X) & = (ZZ) / (7 ZZ + 5 ZZ) = 0 \
    H_2 (X) & = ZZ lr(chevron.l vec(-5, 7) chevron.r) = ZZ $

  $7x + 5y = 0 => 7x = - 5y => x = -5/7 y$

  *(b):* $X$ consists of finitely many cells, and hence is compact. Furthermore it has a dimension $d = 2$. Assume the contrary, that $X$ is a 2 dimensional $C^(oo)$ manifold. Fix a $p in S^1 subset X$. There exists a neighborhood of $p$, $N$ such that $N$ is diffeomorphic to $U$ in $RR^2$. Because the attaching maps of the disks are $z -> z^7$ and $z -> z^(5)$ respectively, $p$ has exactly 7 preimages on the boundary of disk 1 and 5 preimages on the boundary of disk 2. Therefore the neighborhood $N$ contains an open interval $I subset S^1$, where the $7$ half disks from the first disk and the 5 half disks from the 2nd disk are all glued together at the interval $I$. Now if we look at $N \\ I$, it has 12 connected components. Wherase $U \\ I$, a arc in $RR^2$, has exactly 2 connected components. Thus $U$ and $N$ cannot be homeomorphic hence diffeomorphic. Thus a contradiction occurs and $X$ cannot be a $C^(oo)$manifold.

]

== Reflection
I want to review the following topics:
1. Local Degree (Poincare Duality in Hatcher + Differential topology). Broadly degree theory - Hatcher Problems + Differential Topology Perspective.
2. Cellular Homology
3. Integrability and Frobenius Theorem
