#import "@preview/lemmify:0.1.8": *

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

#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")
#let Lk(val) = $op("Lk")(val)$

= General Setup
#lemma(name: "Cursed Inequality Lemma")[
  Let $k in RR^V$ be a discrete curvature of a Euclidean or Hyperbolic polyhedral metric on a triangulated surface $(S, cal(T))$. Then for all $I in 2^V - {diameter, V}$

  $ sum_(v in I) k(v) > pi(2 abs(I) - sum_(i = 1)^3 abs(F_i (I))) $<cursed-inequality>

  holds where

  $ F_i (I) = {"set of all faces with i vertices in I"} $
]<cursed-inequality-lemma>
#proof[
  Note $F_i (I)$ and $abs(F_i (I))$ may be used interchangably depending on context.
  $
    sum_(v in I) k(v) = 2pi|I| &- sum_(triangle v_1 v_2 v_3 in F_3 (I)) a_1 + a_2 + a_3 \ &- sum_(triangle v_1 v_2 v_3 in F_2 (I)) a_1 + a_2 - sum_(triangle v_1 v_2 v_3 in F_1 (I)) a_1 \
    &= 2 pi |I| - pi F_3(I) - sum_(triangle v_1 v_2 v_3 in F_2 (I)) a_1 + a_2 - sum_(triangle v_1 v_2 v_3 in F_1 (I)) a_1 \
    &> 2 pi |I| - pi F_3(I) - pi F_2(I) - pi F_1(I) \
    &= pi(2 abs(I) - sum_(i = 1)^3 abs(F_i (I)))
  $
]

#lemma(name: "Intersection Cursed Inequality Lemma")[
  Suppose $(T, Phi)$ is a weighted generalized triangulation of a closed surface $X$ and $I subset V$ of vertices. $Phi: E -> [0, pi)$. Let $(r_(n))_(n in NN)$ be a sequence of circle packing metrics based on $(T, Phi)$ so that $lim_(n -> infinity) r_(n)(v) = 0$ for $v in I$ and $lim_(n -> infinity) r_(n) (w) > 0$ for $w in.not I$. Then

  $ lim_(n -> infinity) sum_(v in I)^() k_(r_(n))(v) = - sum_((e, v) in Lk(I))^()(pi - Phi(e)) + 2pi chi(F_(I)) $

  where $F_(I)$ is the subcomplex consisting of the cells whose vertices are in $I$ and $ Lk(I) := {(e, v) mid(|) e "is an edge so that" e inter I = diameter "and the vertex" v in I "form a" triangle} $ . Furthermore, if $Phi: E -> [0, (pi)/(2)]$ and the backgound geometry is Euclidean or Hyperbolic, then for any circle packing metric $r$ based on $(T, Phi)$ and for any proper subset $I$ of vertices $V$, we have

  $ sum_(v in I)^() k_(r)(v) > sum_((e, v) in Lk(I))^() (pi - Phi(e)) + 2 pi chi(F_(I)) $
]
#proof[
  Let $V = {v_(1), #sym.dots, v_(n)}$ be the set of vertices. Let $I subset [1, #sym.dots.h, n]$. Let $theta_(i)^(j k)$ be the interior angle at $v_(i)$ in the triangle $triangle v_(i) v_(j) v_(k)$.

  + If $triangle v_(i) v_(j) v_(k) in F_(3)$ then $lim_(n -> infinity) theta_(i)^(j k) + theta_(j)^(i k) + theta_(k)^(i j) = pi$ as the triangle will approach a euclidean triangle.
  + If $triangle v_(i) v_(j) v_(k) in F_(2)$ then $lim_(n -> infinity) theta_(i)^(j k) + theta_(j)^(i k) = pi$ as the triangle will approach a geodesic.
  + If $triangle v_(i) v_(j) v_(k) in F_(1)$ then $lim_(n -> infinity) theta_(i)^(j k) = pi - Phi(v_j v_k)$. Note $(e, v_(j) v_(k)) in Lk(I)$

  $
    lim_(n -> infinity)sum_(i in I)^() k_(r_(n))(v_(i)) & = 2pi|I| - sum_(triangle v_(i) v_(j) v_(k) in F_(1))^() theta_(i)^(j,k) - sum_(triangle v_(i) v_(j) v_(k) in F_(2))^() theta_(i)^(j,k) + theta_(j)^(i,k) - sum_(triangle v_(i) v_(j) v_(k) in F_(3))^() theta_(i)^(j,k) + theta_(j)^(i,k) + theta_(k)^(i, j) \
    &= 2 pi |I| - sum_((e, v) in Lk(I))^() (pi - Phi(e)) - pi|F_(2)| - pi |F_(3)| \
    &= 2 pi (|I| - (|F_(2)|)/(2) - (|F_(3)|)/(2)) - sum_((e, v) in Lk(I))^() (pi - Phi(e)) \
    &= 2 pi (|I| - (1)/(2)(|F_(2)| + 3|F_(3)|) + |F_(3)|) - sum_((e, v) in Lk(I))^() (pi - Phi(e)) \
    &= 2 pi chi_(F_(I)) - sum_((e, v) in Lk(I))^() (pi - Phi(e))
  $
]

= Köbe, Andreev, and Thurston Theorem
#lemma[
  Let $(S^(2), cal(T))$ be a simplicially-triangulated. Let $v_1, v_2, v_3 in V = V(cal(T))$ where $triangle v_1 v_2 v_3 in cal(T)$ Let $k: V -> RR$ where

  $
    k(v) := cases(
      (4 pi) / (3) "if" v in [v_1, #sym.dots.h, v_n],
      0 "otherwise"
    )
  $

  $k$ is in the space of discrete curvatures of associated with the triangulation.
]
#proof[

  Let $g: 2^V -> R$ where $forall A subset.eq V$,

  $ g(A) = sum_(v in A) k(v) $

  We need to show 2 things:

  1. *Gauss Bonnet*: $ g(V) = g({v_1, v_2, v_3}) = 2 chi(S) pi $

  2. *For all $I subset.eq V$, $g(I) > pi (2 abs(I) + sum_(i = 1)^3 F_i (I))$ *:

    + If $abs(I) < abs(V) - 2$: $g(I) > 0 = pi (2 abs(I) + sum_(i = 1)^3 F_i (I))$ by the contrapositive of 6.14 (Notes by professor).

    + If $abs(I) = abs(V) - 2$: By Theorem 6.14
      + $2 abs(I) + sum_(i = 1)^3 F_i (I) = 0$: $abs(I inter {v_1, v_2, v_3}) >= n - 2$. Thus $g(I) > 0 = 2 abs(I) + sum_(i = 1)^3 F_i (I)$.
      + $2 abs(I) + sum_(i = 1)^3 F_i (I) = 2$: Thus $I = V - {u, v}$ where u and $v$ have no edge between them. Thus $v_1, v_2, v_3 in I =>$ true
    + If $abs(I) = abs(V) - 1$: $abs(
        I inter {
          v_1, #sym.dots.h, v_n
        }
      ) >= n - 1$. Thus $g(I) >= (8pi) / (3) > 2 pi$ by 6.14 (Notes by professor).

  Thus $k$ is a discrete curvature of $(S, cal(T))$.
]

#lemma[
  Given three pairwise tangent round disks $D_1, D_2, D_3$ on the Riemann Sphere, there exists a Mobius transformation that sends $D_1 -> {z in CC mid(|) Re(z) <= -1}$, $D_2 -> DD$, and $D_3 -> {z in CC mid(|) Re(z) >= 1}$
]
#proof[
  Let $C$ be the circle that intersects the 3 tangent points. Let $M$ be the Mobius transformation which sends $C -> RR$ (x axis). $M$ is the mobius transformation that satifies the lemma.
]

#theorem(name: "Köbe-Andreev-Thurston")[
  Let $(S, cal(T))$ be a simplicially-triangulation of 2-sphere. Then there exists a circle packing $cal(P)$ on $S^2$, unique up to Mobius transformations, whose nerve is isomorphic to the 1-skeleton of $cal(T)$.
]
#proof[
  Remove a triangle $triangle v_1 v_2 v_3$ from $cal(T)$ to obtain a simplicial triangulation $cal(T)_1$ of the topological triangle $triangle = S^2 - "int"(tau)$. The triangulation has 3 boundary vertices $v_1, v_2, v_3$. Consider the double over the boundary, $(triangle union_(id mid(|)_delta) triangle, cal(T_2))$ which is a simplicial triangulation of $S^(2)$ with respect to the involution $sigma$ of $cal(T)_2$ where each $cal(T)_1$ is interchanged and $v_i$ is fixed. Let $hat(k): V -> RR$ where $hat(k)(v) = 0$ if $v != v_i$ and otherwise $k(v) = (4pi) / (3)$. By Lemma 1.1, $hat(k)$ is a valid discrete curvature of $(S^2, cal(T)_2)$. Let $r: V(cal(T)_2) -> RR$ be the circle packing metric which induces $hat(k)$. Since $cal(T)_2$ is symmetric about $sigma$ and since $hat(k) compose sigma = hat(k) => r = r compose sigma$ by uniqueness of circle packing metric. Since $hat(k)(v_1) = hat(k)(v_2) = hat(k)(v_3) => triangle v_1 v_2 v_3$ is equilateral. Furthermore, $r|_(V(cal(T)_1))$ is a circle packing metric on $(triangle, cal(T)_1)$ with zero discrete curvature on all interior vertices and $r(v_1) = r(v_2) = r(v_3)$. Thus the circle packing on the complex plane whose nerve is $cal(T)_1$, which is the same as the 1 skeleton of $cal(T)$.

  To show the uniqueness of the circle packing, suppose $P$ and $Q$ are circle packings on $S^2$ (Riemann Sphere) whose nerves are isomorphic to the 1-skeleton of $cal(T)$. Take a triangle $triangle v_1 v_2 v_3$ in $cal(T)$ and denote the corresponding dangent disks in $P$ and $Q$ by ${A_1, A_2, A_3}$ and ${B_1, B_2, B_3}$, respectively. By Lemma 1.2, there is a $M$, mobius transformation, which sends $A_i -> B_i$. We may assume $A_i$ and $B_i$ are disks of radius 1 such that $infinity$ is in the unbounded component of $CC union {infinity} - union.big_(j = 1) A_j$. Then $P - {A_1, A_2, A_3}$ and $Q - {B_1, B_2, B_3}$ comes from the circle packing metric on triangulated $(triangle, cal(T))$ with same discrete curvature and radii at boundary vertices are 1. By Rigidity Theorem for Euclidean background, the circle packing metrics are the same or $P = Q$
]

= Hyperbolic Theorems
#theorem(name: "Hyperbolic Gauss Bonnet")[
  Let $(S, cal(T), l)$ be a compact triangulated hyperbolic polyhedral surface with or without boundary. Then its area is equal $sum_(v in V)k(v) - 2 pi chi(S)$.
]
#proof[
  Without loss of generality, $S$ is closed by doubling it along its boundary ie consider $S prime = S union_(id|_diff) S$ . Suppose $tau$ is a triangle and $v$ is a vertex. Then if $alpha$ is a angle in the triangluation. $alpha > tau "means" alpha$ is a angle in the triangle and $alpha > v$ $alpha$ is angle of $v$.

  $
    sum_(v in V) k(v) - 2 pi chi(S) &= 2 pi abs(V) - sum_("all angles" alpha) alpha -2 pi (abs(V) - abs(E) + abs(F) ) \
    &= 2pi|E| - 2pi|F| - sum_("all angles" alpha) alpha & (2|E| = 3|F|) \
    &= pi|F| - sum_(tau in cal(T)) sum_(alpha > tau) alpha \
    &= sum_(tau in cal(T)) (pi - sum_(alpha > tau) alpha) \
    &= sum_(tau in cal(T))"Area"(tau) \
    &= "Area"(cal(T))
  $
]

#lemma(name: "Colin De Verdiere's Variational Principle")[
  Let a hyperbolic triangle have edge lengths $l_i = r_j + r_k$, ${i, j, k} = {1, 2, 3}$, and angles $a_1, a_2, a_3$ such that $a_(i)$ is opposite to $l_i$. Suppose $r_i > 0$ and $u_i = integral_(r_i)^(infinity) (dif t) / (sinh(t))$ then

  1. $(diff a_i) / (diff u_j) = (diff a_j) / (u_i) < 0$ and $(diff a_i) / (diff u_i) > 0$
  2. $(diff(a_1 + a_2 + a_3)) / (u_i) > 0$
  3. The function $W_(c p)(u_1, u_2, u_3) = integral_(0)^(u) sum_(j = 1)^3 a_j d u_j$ is a strictly concave function of $u = (u_1, u_2, u_3)$ in $R^3_(> 0)$ satisfying $(diff W_(c p)) / (u_i) = a_i$
  4. Area of a hyperbolic triangle is strictly increasing function
]
#theorem(name: "Hyperbolic Thurston's Uniqueness Theorem")[
  Two hyperbolic circle packing metrics on a compact triangulated surface $(S, cal(T))$ with the same discrete curvatures are the same
]<Hyperbolic-Thurston-Uniqueness-Theorem>
#proof[
  Without loss of generality assume that $S$ is closed, double $S$ across boundary otherwise. Let $r$ and $R$ be circle packing metrics such that $r != R$. We want to show that $k_r != k_R$. Let $V = {v_1, #sym.dots.h, v_n}$. $forall f: V -> RR$, $f_i := f(v_i)$. Let $u, u prime in RR^V$ such that $u_i = integral_(r_i)^(infinity) (d t) / (sinh(t))$ and $u_i prime = integral_(R_i)^(infinity) (d t) / (sinh(t))$. Thus $a - b != 0$. Define $W: RR^V -> RR$ by

  $ W(x) = sum_(triangle v_i v_j v_k in F) W_(c p)(x_i, x_j, x_k) $

  Since $W_(c p)$ is strictly concave, $W$ is strictly concave. Furthermore since $(diff W_(c p)) / (diff x_i) = a_i$ where $a_i$ is the angle in $triangle v_i v_j v_k$, we have

  $ (diff W) / (diff x_i)(x) = sum_(a > v_i) a = 2pi - k_(f(x))(v_i) $

  where $f$ is the inverse function of $integral_r^infinity (sinh(t))^(-1) d t$.

  Thus $(gradient W)(x) = 2 pi (1, #sym.dots.h, 1) - k_(f(x))$

  Take $g(t) = W(t u + (1 - t) u prime)$. $g$ is strictly concave because $W$ is strictly concave thus $g prime(0) != g prime(1)$. But $g prime(t) = (gradient W)(t u + (1 - t) u prime) dot (u - u prime)=> gradient W(u) != gradient W(u prime) => k_(r) != k_R$.
]

#lemma[
  For any $epsilon > 0$, $exists N > 0$ such that if $r_1 > N, r_2 > 0, "and" r_3 > 0$ then for any hyperbolic edge lengths $l_(i) = r_j + r_k$, we have a inner angle $a_1 < epsilon$
]
#proof[
  Let $triangle v_1 v_2 v_3$ be a hyperbolic triangle. Place $triangle v_1 v_2 v_3$ in Poincare disk model where $v_1$ is the origin. Since diameters are geodesics in this model, that means $v_1 v_2$ and $v_1 v_3$ are Euclidean lines. By the construction $v_1, v_2, v_3$ are the centers of pairwise tangent hyperbolic balls of radius $r_1, r_2, r_3$ respectively. If $r_1$ is large then the euclidean radius of $B_1$ is large which means the euclidean radius of $B_2, B_3$ is small. Then $a_1 -> 0$. So as $r_1 -> infinity => a_1 -> 0 =>$ lemma follows from standard limit arguement.
]

#theorem(name: "Characterization of Discrete Curvature for Hyperbolic Circle packing Metrics")[

  Let $(S, cal(T))$ be a closed triangulated surface. Then the set of all discrete curvatures of a hyperbolic circle packing metrics on $(S, cal(T))$ is given by

  $
    cal(K)_h = {k in (-infinity, 2pi)^V mid(|) I subset V in.rev I != diameter, #link(<cursed-inequality>)[Cursed Inequality holds]}
  $<hyperbolic-discrete-curvature>


]<characterizationOfDiscreteCurvatureForHyperbolic>
#proof[
  By the #link(<cursed-inequality-lemma>)[Cursed Inequality Lemma], $K = cal(K)_h$ contains the discrete curvature induced by all hyperbolic circle packing metrics on $(S, cal(T))$. Let $Q = R^V_(>0)$. Let $f: Q -> K$ be the function that takes a circle packing metric to the discrete curvature it induces. By #link(<Hyperbolic-Thurston-Uniqueness-Theorem>)[Thurston's Hyperbolic Discrete Curvature Uniqueness Theorem], $f$ is injective. By the hyperbolic cosine law, $f$ is continous. Since the $Q, K subset RR^V$ and are connected manifolds of dimension $abs(V)$, by the invariance of domain theorem, it suffices to prove that $f(Q)$ is a closed subset of $K$. To do this we want to show that as we approach the boundary of $Q$ when we apply f, we approach the boundary of $K$. Let $s in diff Q => exists v in V in.rev s(v) = 0 "or" s(v) = infinity$. Define

  $ I := {v in V mid(|) s(v) = 0} $

  If $I = diameter => s(v) = infinity$. As $r -> s$, $k_r (v) -> 2pi$. Thus $f(r) -> diff K$.

  If $I != diameter$, as $r -> s$

  $
    sum_(v in I) k_r (v) & = 2 pi abs(I) - sum_(v in I) sum_(a > v) a \
                         & = pi (2 |I| - sum_i F_i (I))
  $

  thus $f(r) -> diff K$
]

= Discrete Shwartz-Alfhors-Pick Lemma

#theorem(name: "Discrete Shwartz-Alfhors-Pick Lemma")[
  Let $(S, cal(T), Phi)$ be a closed connected simplicially-triangulated surface, where $Phi: E(cal(T)) -> [0, (pi)/(2)]$. Let $V(cal(T)) = V_1 union.sq V_2$ such that $V_1 != diameter$ and in the case Euclidean background, $V_2 != diameter$. Suppose $R$ and $r$ are two circle packing radius assignments on $(S, cal(T))$ with either Euclidean or hyperbolic background such that $R|_V_2 >= r|_(v_2)$ and their curvatures $k_R$ and $k_r$ satisfy $k_R|_(V_1) >= k_R|_(V_1)$. Then $R >= r$ and for any two vertices $v_1$ and $v_2$

  $ d_R (v_1, v_2) >= d_r (v_1, v_2) $
]<thm>

#proof[
  Let $ X := {
    x in RR_(> 0)^(V) mid(|) x|_V_2 >= r|_V_2 "and" k_x|_V_1 >= k_r|_V_1
  } $

  Note $r in X$ and by definition of $R$, $R in X$. We want to prove that $forall v in V$, $r(v) = inf{x(v) mid(|) x in X}$ i.e $r = inf{x mid(|) x in X}$. Thus by definition $R >= r$.

  1. $x, y in X => min{x, y} in X$: $forall x, y in X$, let $z = min{x, y} = (min(x_v, y_v))_(v in V)$. $forall v in V_2$, $z(v) = x(v) >= r(v)$ or $z(v) = y(v) >= r(v)$. Thus $z(v) >= r(v)$. Thus $z|_(V_2) >= r|_(V_2)$. $forall v in V_1$, without loss of generality, $w(v) = x(v)$. $forall tau = triangle v a_1 a_2 in cal(T)$, $w(a_1) <= x(a_1)$ and $w(a_2) <= x(a_2)$. By the Variational Principle for Euclidean and Hyperbolic Triangles, $(diff theta^(tau)(v)) / (diff x(a_i)) > 0 => (diff k(v)) / (diff x(a_i)) < 0$. In other words, not increasing the radii of all the vertices which share a edge with $v$ will force the discrete curvature at $v$ to increase. Since $x(a_i) >= w(a_i)$ for all such triangles while $w(v) = x(v) => k_w (v) >= k_x (v) >= k_r (v)$. Thus $z in X$.

  2. Now suppose $w = inf X$. For each $v in V$, let $(x_(n, v))_(n in NN)$ be a sequence in $X$ such that $w(v) = lim_(n) x_n (v)$. Let $V = {
      v_1, ..., v_m
    }$ and define $x_n = min{x_(n, v_i) mid(|) i in [1, #sym.dots.h, m]}$. By 1. $x_n in X$. Since $x_(n, v_i) >= x_n$, $ limsup_(n -> infinity) x_n (v) <= limsup_(n -> infinity) x_(n, v)(v) = lim_(n -> infinity) x_(n, v)(v) = w(v) $

    On the other hand, $w(v) <= x_n (v)$. Thus $ w(v) = liminf_(n -> infinity) x_n (v) $. Combining both inequalities, we see $ w = lim_(n -> infinity) x_n $

  *Now we have to show that $w in X$.*
  1. $w|_V_2 >= r|_V_2$: Assume the contrary $exists v in V_2 in.rev w(v) < r(v)$. Thus $exists x in X in.rev w(v) <= x(v) < r(v)$ by definition of infimum. But this is a contradiction, since $x in X$ and $x(v) >= r(v)$. Thus $forall v in V_2$, $w(v) >= r(v)$.
  2. $w in R^V_(>0)$: Assume the contrary that $I = {
      v in V mid(|) w(v) = 0
    } != diameter$. By 6.11 (6.12) and #link(<characterizationOfDiscreteCurvatureForHyperbolic>)[Characterization of Discrete Curvature for Hyperbolic Circle Packings], $ lim_(n -> infinity) sum_(v in I) k_x_n (v) = 2 pi chi(F_(I)) - sum_((e, v) in Lk(I))^() (pi - Phi(e)) $.

  Assume the contrary, $exists v in I inter V_2$. $forall n in NN, x_n (v) >= r(v) > 0 => w(v) = lim_(n -> infinity) x_n (v) >= r(v) > 0$. However this is a contradiction since $w(v) = 0$ since $v in I$. Thus $I inter V_2 = diameter$.

  Thus $forall v in I, k_x_n (v) >= k_r (v)$. By the Cursed Inequality,

  $ sum_(v in I) k_(x_n)(v) >= sum_(v in I) k_r (v) > 2 pi chi(F_(I)) - sum_((e, v) in Lk(I))^() (pi - Phi(e)) $

  which means,

  $
    lim_(n -> infinity) sum_(v in I) k_(x_n)(v) >= sum_(v in I) k_r (v) > 2 pi chi(F_(I)) - sum_((e, v) in Lk(I))^() (pi - Phi(e))
  $

  This is a contradiction. Thus $I = diameter$ and $w in R^V_(> 0)$.

  3. $k_w|_V_1 >= k_r|_V_1$: $k_w (v) = lim_n k_x_(n)(v) >= k_r(v)$. The first equality comes from sequential definition of continuity.

  Thus $w in X$. We now want to show that $w = r$. By 1 and definition of inf, $w|_(V_2) = r|_(V_2)$. We now want to show that $k_w|_(V_1) <= k_r|_(V_1)$. Assume the contrary, $exists v in V_1 in.rev k_w (v) > k_r (v)$. For a small $t in (0, w(v))$, define $w^t in RR^V_(>0)$ as follows. If $u in V - {
    v
  }$, $w^t (u) = w(u)$ and $w^(t)(v) = w(v) - t > 0$. Since, $v in V_2 => v in.not V_1 => w^t|_V_1 >= r|_V_1$. For $t$ small, by continuity we may assume that $k_(w^t)|_V_1 >= k_(r)|_V_1$. Thus $w^t in X$. But $w^t (v) < w(v)$ this contradicts the fact that $w = inf X$. Thus $k_w|_V_1 = k_r|_V_1$.

  We now need to show that $w = r$ using the fact that $w|_V_2 = r|_V_2$ and $k_w|_V_1 = k_r|_V_1$. Let $A = RR$ if the background geometry is Euclidean and $A = (0, infinity)$ is the background geometry is Hyperbolic. Let $phi: (0, infinity) -> A$ where

  $
    phi(x) := cases(
      ln(x) "if Euclidean Backgound",
      integral_(x)^(infinity) (d t) / (sinh(t)) "if Hyperbolic Backgound"
    )
  $

  $phi$ is a smooth bijection so $phi^(-1)$ exists. Let $cal(R) = {x in R^V_(>0) mid(|) phi^(-1)(x)|_V_2 = r|_(V_2)}$.

  You can view $cal(R) = (0, infinity)^(V_1)$. For any triangle $triangle v_1 v_2 v_3$, with angles $theta_i$ be the angle of $v_i$. Let $W_(c p)(x_1, x_2, x_3) = integral_(0)^(x) sum_(i = 1)^3 theta_i (x) dif u_i$. Let $W: A^V -> RR$ where

  $ W(x) := sum_(triangle v_i v_j v_k in cal(T)) W_(c p)(x_i, x_j, x_k) $

  Let $F = W|_(cal(R))$. Thus $F$ is a function from $(0, infinity)^(V_1) -> RR$. Thus

  $ gradient F(x) = 2 pi (1, #sym.dots.h, 1) - k_(phi^(-1)(x))|_(V_1) $

  $forall x, y in cal(R) subset.eq RR^V in.rev x != y$, $x(w) = y(w)$. Take $A = {v in V mid(|) x(v) = y(v)}$ and $B = {v in V mid(|) x(v) != y(v)}$. $A inter B = diameter$. $V_2 subset.eq A$ and since $x != y$, $B != diameter$. Since $(S, cal(T))$ is connected, then the graph formed by the triangulation is connected, which means $exists (a, b) in A times B => triangle a b c in cal(T)$. $(x(a) - y(a), x(b) - y(b), x(c) - y(c)) = (0, x(b) - y(b), x(c) - y(c)) != c(1, 1, 1)$. Thus $W_(c p)$ is strictly concave on ${t(x(a), x(b), x(c)) - (1- t)(y(a), y(b), y(c))}$. Thus $F$ is strictly concave on this set.

  Thus $F$ is strictly concave. Thus $gradient F: cal(R) -> RR^(V_1)$ is injective thus $k_(phi^(-1)(x))|_(V_1) =2pi (1, #sym.dots.1) - gradient F$ is injective. Since $k_(w)|_(V_1) = k_r|_V_1 => r|_V_1 = w|_V_1 => r = w$. Thus $R >= r$.
]

= Growing Hyperbolic Circle Packing
#lemma[
  Let $F={v; v_1, #sym.dots.h, v_n}$ be a closed combinatorial flower. Let $R = {r; r_1, #sym.dots.h, r_n}$ be its hyperbolic label (circle packing metric). Suppose $k(v) <= 0$, then $r <= -log(sin((pi) / (n)))$
]<Limit-on-interior-radius-lemma>
#proof[
  1. If $k(v) < 0$: r could increase and the hypothesis will still be satified
  2. If $r_i < infinity$: Increasing $r_i$ would decrease $k(v)$ (b/c $(diff k(v)) / (diff r_i) < 0$ ) thus permitting $r$ to be increased.

  Thus case where $k(v) = 0$ and $r_i = infinity$ gives the maximum $r$. In this case, all petals are horocycles. Thus the angle sum at $v$ is $2pi$, thus each triangle must contribute $(2pi) / (n)$. Each triangle is $triangle v v_(i - 1) v_(i)$. Let $theta_i$ denote $v$'s angle in the triangle.

  $
    cos(theta_i) = (cosh(r + r_(i - 1))cosh(r + r_i) - cosh(r_i + r_(i - 1))) / (sinh(r + r_(i - 1)) sinh(r + r_(i)))
  $

  For large $x$, $cosh(x) ~ (1) / (2)e^x ~ sinh(x)$. Thus:


  $
    (cosh(r + r_(i - 1))cosh(r + r_i) - cosh(r_i + r_(i - 1))) / (sinh(r + r_(i - 1)) sinh(r + r_(i))) &~ ((1) / (4)e^(2r + r_i + r_(i - 1)) - (1) / (2)e^(r_i + r_(i - 1))) / ((1) / (4)e^(2r + r_i + r_(i - 1))) \
    &= ((1) / (2)e^(r_i + r_(i - 1))((1) / (2)e^(2r) - 1)) / ((1) / (2)e^(r_i + r_(i - 1))((1) / (2) e^(2r))) \
    &= 1 - 2e^(-2r)
  $

  Thus as $r_i -> infinity$ and $r > 0$.

  $ theta_i = arccos(1 - 2e^(-2r)) = (2pi) / (n) $

  $ e^(-2r) = 1 - cos((2pi) / (n)) = sin^2((pi) / (n)) => r = -ln(sin((pi) / (n))) $
]
#theorem[
  Let $K$ be a combinatorial closed disk (a finite simply connected simplicial complex with nonempty boundary). Suppose there exists a circle packing $P$ for $K$ in the unit disk $DD$. Then there exists a univalent circle packing $P_K$ for $K$ in $DD$ (where circle interiors are disjoint) such that all boundary circles are horocycles (tangent to $partial DD$).
]<maximalcloseddisk>

#proof[
  We adapt the Discrete Schwartz Lemma method in reverse. We will have a set which is closed under maximums, whose supremum we will prove is the necessary circle packing metric.

  Let $Phi := { r in (0, infinity]^V mid(|) k_r (v) <= 0 "for all interior" v }$. We want to show that $R = sup(Phi)$ is the circle packing metric we need.

  1. *Nonempty*: Since $K$ has nonempty boundary and $P$ is a valid circle packing, interior vertices have angle sums exactly $2 pi$. Thus the radii $r$ from $P$ belong to $Phi$.
  2. *Closed under Maximum*: Suppose $a, b in Phi$. We want to show that $c = max(a, b) in Phi$. Suppose $v$ is a interior vertex. Without loss of generality, $c(v) = a(v)$. $forall triangle v u_1 u_2$, $c(u_i) <= a(u_i)$ and $c(u_i) <= b(u_i)$. $(diff k(v)) / (diff u_i) < 0 => k_c (v) <= k_a (v) <= 2 pi$. Thus $c in Phi$.
  3. *R finite for all internal vertices*: For all interior $v$, let $n$ be the degree of the vertices (graph theoretic). For each $r in Phi$, $k_r (v) <= 2pi$. By @Limit-on-interior-radius-lemma, $r(v) <= -ln(sin((pi) / (n)))$. Thus, $R(v) <= -ln(sin((pi) / (n)))$, $n >= 2$. Thus $R(v) <= -ln(sin((pi) / (2))) < infinity$
  4. *Solution*: For any $r in Phi$, let $v$ be a boundary you can create $r_v$ where $r_v (w) = r(w)$ for $w != v$ and $r_v (v) = infinity$. For all $w$ interior vertex, $(diff k_r_v (w)) / (diff r(v)) < 0$, so increasing $r(v)$ should decrease $k_r$. Thus $k_r_v (w) <= 0$. Thus $r_v in Phi$. Thus $R(v) = infinity$ for any boundary vertex $v$. Thus $R$ is a solution.

  We need to ask whether $R in Phi$ and if its a packing label. For all $v in K - diff K$, create a sequence $(x_(i, v))_(i in NN) subset Phi$ where $lim_(n -> infinity) x_(n, v)(v) = R(v)$.

  Then let $(x_n)_(n in NN) subset Phi$ where $x_n = max{x_(n, v) mid(|) v in K - diff K}$. Thus $lim_(n) x_n = R$. WLOG $R(v) = infinity$ for $v in diff K$.

  *WTS $k_R (v) <= 0$ for interior vertices $v$: * Since $r -> k_r$ is continous map, by the sequential definition of continuity $k_(R)(v) = lim_(n -> infinity) k_(x_n)(v) <= 0$. Thus $R in Phi$.

  *WTS R is a packing label*: Assume the contrary, there exists $v in K - diff K in.rev k_R (v) < 0$. We can create $R^(t)$ where $R^(t)(v) = R(v) + t$ and $R^(t)(w) = R(w)$. For small changes in t, $k_R (v) < k_(R^t)(v) <= 0$. Thus $R^t in Phi$, contradicting the supremality of $R$. Thus $k_R (v) = 0$. Thus $R$ is a *packing label*.

  Since each packing label guarentees a circle packing $P$ in $DD$, $R <-> P_R$ a circle packing. Since the boundary circles have infinite radii they are horocycles. We need to prove that all circles have pairwise disjoint interiors. Let $phi: K -> "carr"(P_(R))$ which maps each face of $K$ to the corresponding hyperbolic triangle in $"carr"(P)$. $phi$ is locally one to one, since vertices $v$ on the interior have $k(v) = 0$, thus the triangles with v as a center form a closed chain and thus have disjoint interiors. $phi$ can be extended to a map of $K -> overline(DD)$ where the boundary triangles of $"carr"(P)$ are "blown up" to fill $overline(DD)$. $K$ is a topological disk and for any sequence approaching the boundary, $phi$ of the sequence will approach $diff DD$, thus $phi$ is proper. Thus $phi$ is a locally one to one, proper, and continous, it is globally one to one, by the topological arguement Principle. $forall v, w in V$, let $P_(R)(v)$ and $P_(R)(w)$ be their respective disks.

  + Case 1: $v$ and $w$ are neighbors. Thus $P_(R)(V)$ and $P_(R)(w)$ are tangent by definition.
  + Case 2: $v$ and $w$ are not neighbors: Thus $v$ and $w$ are part of different flowers. Flowers of nonconnected vertices have disjoint interiors thus $P_(R)(v)$ and $P_(R)(w)$ have disjoint interiors.

  *Uniqueness*: Let $A_(R)$ be the area induced by a circle packing metric.

  $
    A(R) & = pi |F| - sum_(v in V)^() sum_(alpha > v)^() alpha \
    &= pi |F| - sum_(v in V(K - diff K))^() sum_(alpha > v)^() alpha - sum_(v in (diff K))^() sum_(alpha > v)^() alpha \
    &= pi |F| - 2pi V(K - diff K) \
    &= pi (|F| - 2V(K - diff K))
  $

  Suppose $R prime$ is another circle packing metric with the discrete curvature of the interior equal to 0, and horocycles on the boundary of $K$. Then $A_(R prime) = A_(R)$. $R prime in Phi => R prime <= R$. $exists v in V in.rev R prime(v) < R(v)$ ($v$ in interior). Area of flower strictly increasing function in center and petal radii thus $A_(R prime) < A_(R) => "contradiction"$. Thus $R$ is the unique maximal circle packing.
]
#theorem[
  Let $K$ be a combinatorial closed disk (a finite simply connected simplicial complex with nonempty boundary). There exists a univalent circle packing $P_K$ for $K$ in $DD$ (where circle interiors are disjoint) such that all boundary circles are horocycles (tangent to $partial DD$).
]
#proof[
  By @maximalcloseddisk, it suffices to show there exists some circle packing $P$ on $K$. We will construct a $P$ by induction on the number of vertices of $K$.

  *Base Case* $n = 3$: $P$ is clearly triple of mutually tangent horocycles (also $P_(K)$).

  Assume that $K$ is given with $V > 3$ vertices, and that $forall$ combinatorial closed disks with less than $V$ vertices, the hypothesis holds. Let $w in diff K$.

  + Case 1. $exists e in E(K) in.rev e in K - diff K "and" e = (w, u)$ for $u in diff K$. Cut $K$ via the edge $e$, thus $exists K_(1)$ and $K_(2)$ two complexes having postively oriented boundary edges where $e_(1) = (w_(1), u_(i)) in K_(1)$ and $e_(2) = (u_(2), w_(2)) in K_(2)$ such that $K = K_(1) union.sq_(e_(1) ~ e_(2)) K_(2)$. Since $K$ triangulates a closed disk, same with $K_(1)$ and $K_(2)$. You can "paste" the maximal packings for $K_(1)$ and $K_(2)$ to get a packing for $K$. Consider $P_(K_(1))$, the horocycles of $u$ and $w$ will be tangent, so normalization with mobius transform, will give these 2 circles on the real axis:

    $ c_(w) = {abs(z- (1)/(2)) = (1)/(2)} "and" c_(u)={abs(z + (1)/(2)) = (1)/(2) } $

    Orientation, will force $P_(K_(1))$ on the top and $P_(K_(2))$ on the bottom. Super impose the two circle packings to get one for $K$.

  + Case 2: Every interior edge $e$ from $w$ is to a interior vertex. $F_(w) := {w; v_(1), #sym.dots.h, v_(n)}$, is the combinatorial flower of $w$. Removing the open star of $w$ from $K$, leaves a reduced complex $K prime$ which triangules a topological disk with $V - 1$ vertices. Induction hypothesis gives $P_(K prime)$. Petal vertices of $F_(W)$ are boundary vertices and thus become horocycles in $P_(K prime)$. paste the disk on the sphere and add a unit circle to the bottom hemisphere for a $Q = P_(K prime) union DD$ to get a packing of $K$ on the sphere. $DD$ is the circle for $w$, note its tangent to all its neighboring vertices (but there some extraneos tangencies which don't really matter.). To wrap this up take a circle disjoint to the $"carr"(Q)$, and move it to the south hemisphere with a mobius transformation, then take the upper hemisphere (which is now a circle packing of $K$ on $DD$.)

  Once you get a circle packing apply @maximalcloseddisk to get $P_(K)$, the maximal circle packing for $K$.
]


= Combinatorial Open Discs
#lemma(name: "Ring Lemma")[
  For each integer $k >= 3$ there exists a constant $c_(k) > 0$ such that $F$ is a univalent k-flower of circles on the euclidean or hyperbolic plane having a central circle radius of $r_(0)$ then $r$ of each petal satifies $r >= c(k) r_(0)$

  $ c(k) = [((5 - 2 sqrt(5) )/(5))((3 + sqrt(5) )/(2))^(k) + ((5 + 2 sqrt(5) )/(5))((3 - sqrt(5) )/(2))^(k) - 1 ]^(-1) $
]

Let $X$ be a combinatorial open disk. Let ${X_(i)}_(i in NN)$ be a sequence of finite simply connected complexes where:
- $v_(1) in X_(1)$
- $X_(i)$ is a combinatorial closed disk
- $X_(i) subset X_(i + 1)$ as a simplicial complex
- $X_(i) -> X$ or for any finite subcomplex $L$ of $X$, $exists N in NN in.rev L subset X_(N)$

Any sequence ${X_(i)}_(i in NN)$ will suffice, but we can take the easiest one where $X_(1)$ is the combinatorial flower of $v_1$ and $X_(i)$ is created by taking $X_(i - 1)$ adding all neighboring vertices of $X_(i)$ and filling in islands as needed.

Regardless of how $X_(i)$ is constructed. By @maximalcloseddisk, $exists R_(j)$, the maximal hyperbolic packing label for $X_(j)$ and $P_(j)$ its associated maximal hyperbolic packing, normalized such that $v_(1)$ is the center of $DD$.

Consider $(R_(j))$ sequence, $R_(j + 1)|_(X_(j)) <= R_(j)$. Thus the sequence is monotone decreasing at each vertex. Focusing on $v_(1)$, one of two mutually exclusive events hold:

*Type Dichotomy*:
1. $R_(j)(v_(1)) -> r_(1) > 0$ as $j -> infinity$
2. $R_(j)(v_(1)) -> 0$ as $j -> infinity$

Suppose ${L_(j)}$ is another sequence of subcomplexes exhausting $K$, and ${S_(j)}$ the associated maximal labels. For each i, $L_(i) subset K_(k)$ for sufficiently large $k$ and in turn $K_(k) subset L_(n)$ for sufficiently large $n$. By maximality of various labels, $S_(n)(v) <= R_(k)(v) <= S_(i)(v)$. Thus the sequences ${R_(j)}$ and ${S_(j)}$ are intertwined so since $R_(j)$ is monotonically decreasing and $S_(j)$ is monotonically decreasing, they must converge to the same limit. Thus type Dichotomy is invariant under choice of different subcomplexes.

Fix any vertex $v in K$, and choose a edge path $gamma in K$ from $v_1 -> v$. If it has N edges, we can represent it as a string of successive vertices from $v_1 -> v$. Thus $gamma = lr(angle.l v_1, v_2, #sym.dots.h, v_(N) angle.r) "where" v_(N) = v$. There exists $d in ZZ$ so each $v_(n) in gamma$ has at most $d$ petals in its flower and there is an integer $J$ so large that $gamma in K_(j)$ for $j >= J$. Two uses of the ring lemma give us,

$ c(d)R_(j)(v_(n + 1)) <= R_(j)(v_(n)) <= (1)/(c(d))R_(j)(v_(n + 1)) & "for" j >= J $

thus we have

$ c(d)^N R_(j)(v_(1)) <= R_(j)(v) <= (1)/(c(d)^N) R_(j)(v_(1)) $

thus $R_(j)(v_(1))$ decreases monotonically iff $R_(j)(v)$ decreases monotonically.

Thus the outcome is independent of the choice of $v_1$ and that the sequence ${K_(j)}$, so it reflects an intresic property of $K$ in $DD$ and the complex will be labeled as hyperbolic if $1$ and parabolic (or euclidean) if 2.

_*Key Observation*: If $K$ is a parabolic combinatorial disk, there is no circle packing of $K$ in the hyperbolic plane._

== Hyperbolic Existence
Assume $K$ is hyperbolic and an exhaustion ${K_(i)}$ has been chosen. Let ${Z_(i)}$ be the collection of hyperbolic centers for $P_(j)$, so $Z_(j)(v)$ is the center of the circle of $v$ for sufficiently large $j$. Let $ {{P_(j)^((k))}: k = 0, 1, #sym.dots.h} & "where" & {P_(j)^((k+1))} subset {P_(j)^((k))} $
be a family of subsequences where $subset$ means subsequence.

Enumerate the vertices ${v_(1), v_(2),#sym.dots.h}$. Define the following ${P_(j)^((1))} := {P_(j)}$. Note that $v_(1)$ is always centered at the origin thus ${Z_(j)^(1)(v_(1))}$ converges to 0.

Assume by induction that successive sequences ${{P_(j)^((k))} : k = 1, #sym.dots.h, n - 1}$ have been extracted with the property that for each $k$, ${Z^(k)_j (v_(k))}$ is a convergent series of complex numbers.

The centers ${Z_(j)^((n - 1))(n)}$ lie in the closed unit disk, so by the Bolzano Weierstrass Theorem, one can extract a subsequence ${P_(j)^((n))} subset {P_(j)^((n - 1))}$ so that ${Z_(j)^((n))}$

