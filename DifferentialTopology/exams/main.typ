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
    Y(arrow(x_0)) & = mat(0, 0, 0; 0, 0, -1; 0, 1, 0) arrow(x) = B arrow(x) = -z partial_y + y partial_z
  $
  2. We have $  T_(t) & = e^(t A) = I + A t + 1/2 t^2 A^2 + O(t^3) \
       S_t & = e^(t B) = I + B t + 1/2 t^2 B^2 + O(t^3 ) \
    T_(-t) & = e^(-t A) = I - A t + 1/2 t^2 A^2 + O(t^3) \
    S_(-t) & = e^(-t B) = I - B t + 1/2 t^2 B^2 + O(t^3) $

  Thus $ T_(-t) S_(-t) T_(t) S_t & = I + (A B - A^2 - A B - B A - B^2 + A B + A^2 + B^2) t^2 + O(t^3) \
                          & = I + (A B - B A ) t^2 + O(t^3) \
                          & = I + [A, B]t^2 + O(t^3) $

  3. Calculating the Lie Bracket: $ [X, Y] &= (-y partial_x + x partial_y)(-z partial_y + y partial_z) - (-z partial_y + y partial_z)(-y partial_x + x partial_y) \ &= y z partial_x partial_y - y^2 partial_x partial_z - x z partial_y partial_y + x(partial_z + y partial_y partial_z) - (z(partial_x + y partial_y partial_x) - x z partial_y partial_y -y^2 partial_z partial_x +x y partial_z partial_y) \ &= x partial_z - z partial_x = -z partial_x + x partial_z = mat(0, 0, -1; 0, 0, 0; 1, 0, 0) vec(x, y, z) = -[A, B] vec(x, y, z) $

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

  Thu $q^* (psi) = d theta$. $d theta = A^*(q^*(psi)) = A^*(d theta) = d (A^* (theta)).$ Let $tilde(theta) = 1/2 [ theta + A^*(theta)]$, note $A^*(tilde(theta)) = tilde(theta)$. Thus $tilde(theta)$ factors through $Omega^1 (RR P^2)$. Thus $psi = d tilde(theta)$.


]


#problem(todo: true)[
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
  #part()[Is a $C^infinity$ map $F : T^2 -> T^2$ of degree 1 necessarily homotopic to the identity map of $T^2$ to itself? Explain/prove your answer.]
]
#solution[
  *(a)*: $tilde(F): T^2 -> RR^2$ where $tilde(F) (x, y) = F(x, y) + (1, 1)$. Note $F = q compose tilde(F)$. Let $H$ be the standard straight line homotopy from $id -> tilde(F)$. Thus $q compose H$ is the straight line homotopy from $id -> F$.

  *(b)*: Take $F: T^2 -> T^2$ antipodal map $x -> -x$. The $deg F = 1$, because $F$ consists of 2 reflections. But its induced map on $pi_1 (T^2, p)$ is $-I$, thus it cannot be homotopic to the identity map on $T^2$.
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

= Geometry-Topology Qualifying Examination — September 2010

#problem(todo: true)[
  Let $M$ be a connected smooth manifold. Show that for any two non-zero tangent vectors $v_1$ at point $x_1$ and $v_2$ at point $x_2$, there is a diffeomorphism $phi : M -> M$ such that $phi(x_1) = x_2$ and $d phi(v_1) = v_2$.
]
#solution[

]

#problem()[
  Let $X$ and $Y$ be submanifolds of $RR^n$. Prove that for almost every $a in RR^n$, the translate $X + a$ intersects $Y$ transversely.
]
#solution[
  Let $E: X -> RR^n$ be the embedding of $X$ in to $RR^n$.
  We will solve this by proving that the map $F: X times RR^n -> RR^n$ where $F(x, a) = x + a$ is transverse to $Y$. Hence by Transversality Stability and Sard's Theorem, for almost every $a in RR$ we have $F(X, a)$ is transverse to $Y$. $ d F_((x, a)) = mat(d E_(x), I). $ Note that $d F_((x, a))$ is surjective for all $x in X$ and $a in RR$. Thus $ im d F_((x, a)) (T_((x, a)) (X times RR^n)) = RR^n iso T_(x + a) RR^n. $ Thus $F$ is trivially transverse to $Y$.
]

#problem()[
  Let $M_(n times n)(RR) tilde.equiv RR^(n^2)$ be the space of $n times n$ matrices with real coefficients.
  #part[Show that $S L(n, RR) = {A in M_(n times n)(RR) | det(A) = 1}$ is a smooth submanifold of $M_(n times n)(RR)$.]
  #part[Identify the tangent space to $S L(n, RR)$ at the identity matrix $I_n$.]
  #part(todo: true)[Show that $S L(n, RR)$ has trivial Euler characteristic.]
]
#solution[
  *(a)*: We will show that the value $1$ is a regular value for $det: M_(n times n) (RR) -> RR$. Then $S L(n, RR) = det^(-1)({1})$ is a embedded smooth manifold of $M_(n times n)(RR, n)$ by the regular value theorem. Note that $det$ is a polynomial in the entries of a given matrix and hence is smooth. Let $A in S L(n, RR)$. Let $N(T)_(i, j)$ is the $(i, j)$ minor. Thus $forall T in M_(n times n)(RR)$  we have that  $ det(T) = sum_(j = 0)^(1) (-1)^(i + j) T_(i, j) det(N(T)_(i, j)) . $ Thus $ d(det)_T (E_(i j)) = (-1)^(i + j) det(N_(i, j)(T)). $ Since $A in SL_n (RR)$, there exists at least $1$ $det (N(T)_(i, j)) != 0$. Thus $d(det)_T (E_i, j) != 0$, and $d(det)$ is a surjective map since $ker d(det) < T_(A) M_(n times n)(RR)$, thus by rank nullity $im d(det) = RR$. Thus $A$ is a regular point of $det$ function. This is true for all elements of preimage of $det^(-1)({-1})$, hence $-1$ is regular value.

  *(b)*: $ T_I (S L_n (RR)) = T_(I) (f^(-1)({1})) = T_(I) ker(d(det)_(I)) $

  $forall X in M_(n times n)(RR)$, let $X_i$ denote the $i$-th row and let $g_X (t) := I + t X$ curve. $ det(g_X (t)) & = det(e_1 + t X_1, ..., e_n + t X_n) \
               & = det(e_1, e_2 + t X_2, ..., e_n + T X_n) + det(t X_1, e_2 + t X_2, ..., e_n + t X_n) \
               & = det(I) + t sum_(i = 1)^(n) det(e_1, ..., e_(i - 1), X_i, e_(i), ..., e_n) + O(t^2) $

  Then $ (dif ) / (dif t)[det(g_X (t))]_(t = 0) & = [sum_(i=1)^(n) det(e_1, ..., e_(i - 1), X_i, e_i, ..., e_n) + O(t)]_(t = 0) \
                                         & = sum_(i=1)^(n) det(e_1, ..., e_(i - 1), X_i, e_i, ..., e_n) = tr(X) $

  Thus $ker d(det)_I = {X in Mat_(n times n)(RR) : tr(X) = 0}$. Hence $T_I SL_(n)(RR) = {X in Mat_(n times n)(RR) : tr(X) = 0 }.$

]

#problem(todo: true)[
  #part[Let $f_i : M -> N$, $i = 0, 1$, be two smooth maps between smooth manifolds $M$ and $N$, and $f_i^* : Omega^*(N) -> Omega^*(M)$, $i = 0, 1$, be the induced chain maps between the respective de Rham complexes. Define the notion of chain homotopy between $f_0^*$ and $f_1^*$. Here the co-boundary operators on the de Rham complexes are the exterior derivatives.]
  #part[Let $X$ be a smooth vector field on a compact smooth manifold $M$, and let $phi_t : M -> M$ be the flow generated by $X$ at time $t$, i.e. the solution of the differential equation $frac(d phi_t, d t)(x) = X(phi_t(x))$ with initial condition $phi_0(x) = x$. Find an explicit chain homotopy between the chain maps $phi_0^*$ and $phi_1^*$, where $phi_i^*$, $i = 0, 1$, are the induced chain maps from $Omega^*(M)$ to itself.

    _Hint:_ Use the formula that for any differential form $omega$ and vector field $X$, the Lie derivative $cal(L)_X omega = d compose i_X omega + i_X compose d omega$. Here $i_X$ is the contraction with respect to $X$.]
]
#solution[*(a)*: A chain homotopy between $f_0^(*)$ and $f_1^(*)$ is defined as follows: $exists P: Omega^n (N) -> Omega^(n- 1)(M)$ for all $n$ such that $f_0^* - f_1^* = d P + P d$.

  *(b)*:
]

#problem(todo: true)[
  Let $omega = d x_1 and d x_2 + d x_3 and d x_4 + dots + d x_(2n-1) and d x_(2n)$ be a 2-form on $RR^(2n)$, where $(x_1, x_2, dots, x_(2n))$ are the standard coordinates on $RR^(2n)$. Define an $S^1$-action on $RR^(2n)$ as follows: for each $t in S^1$, define $g_t : RR^(2n) -> RR^(2n)$ by considering $RR^(2n)$ as the direct sum of $n$ copies of $RR^2$ and rotating each $RR^2$ summand an angle $t$. Let $X$ be the vector field on $RR^(2n)$ defined by $X(x) = frac(d g_t (x), d t)|_(t=0)$ for any $x in RR^(2n)$.
  #part[Find the Lie derivative $cal(L)_X omega$ and a function $f$ on $RR^(2n)$ such that $d f = i_X omega$.]
  #part[The $S^1$-action above induces an action on $S^(2n-1)$. Let $PP^(n-1)$ be the quotient space of $S^(2n-1)$ by this $S^1$-action. Show that the quotient space $PP^(n-1)$ has a natural smooth structure and that the tangent space of $PP^(n-1)$ at any point $underline(x)$ can be identified with the quotient of the tangent space $T_x S^(2n-1)$ by the line spanned by $X(x)$, for any $x in underline(x)$. Here $underline(x)$ is the orbit of $x$ under the $S^1$-action.]
  #part[Show that $omega$ descends to a well-defined 2-form on the quotient space $PP^(n-1)$ and that the 2-form so defined is closed.]
  #part[Is the closed form in (c) exact? (_Hint:_ For (c) and (d), use (a) and (b).)]
]
#solution[

]

#problem()[
  Suppose that $f : S^n -> S^n$ is a smooth map of degree not equal to $(-1)^(n+1)$. Show that $f$ has a fixed point.
]
#solution[
  Assume the contrary, that $f$ has no fixed point. First consider the following, $F: S^n times [0, 1] -> RR^n$ where $ F(x, t) & = f(x)(1 - t) - x t. $ Assume the contrary that $F(x, t) = 0$ for some $x$ and $t$. Then $f(x) (1 - t) = x t$. If we take the norm of both sides $ (1 - t) = t => t = 1/2. $ Thus $1/2 f(x) = 1/2 x => f(x) = x$, meaning $f$ has a fixed point and there is nothing to prove. Thus $F(x, t) != 0$ for all $x$ and $t$. Consider the following homotopy then $H: S^n times I -> S^n$ where $ H(x, t) := (F(x, t)) / (norm(F(x, t))). $ $H$ is well defined. Note that $ H(dot, 0) & = (F(x, 0)) / (norm(F(dot, 0))) = f(x) \
    H(x, 1) & = -x. $ Thus we have a homotopy between $f$ and $-x$. Thus $deg f = deg ([x -> -x]) = (-1)^(n + 1).$ Constradicting our initial assumption on the degree of $f$.
]

#problem()[
  #part[Let $G$ be a finitely presented group. Show that there is a topological space $X$ with fundamental group $pi_1(X) tilde.equiv G$.]
  #part[Give an example of $X$ in the case $G = ZZ * ZZ$, the free group on two generators.]
  #part()[How many connected, 2-sheeted covering spaces does the space $X$ from (b) have?]
]
#solution[
  *(a)*: $G$ is isomorphic to the following group by assumption $ chevron.l x_1, ..., x_n | r_1, ..., r_k chevron.r $
  Construct $X$ as follows as a $C W$ complex. You have a single 0 cell $e_0$, 1 cells $e_1^1, ..., e_1^n$, and 2 cells $e^1_2, ..., e^k_2$. You attach the cells using the following attaching maps:

  $ partial e_1^i -> e_0 \ partial e_2^i -> r_i (e_1^1, ..., e_1^n). $

  Note the following $X^1 = or.big_(i = 1)^n S^1$ hence $pi_1 (X) = chevron.l x_1, ..., x_n chevron.r$. Then adding the two cells with the specific attaching maps applies the corresponding relations, hence $pi_1 (X) = G$.

  *(b)*: $X = S^1 or S^1$

  *(c)*: Each connected 2-sheeted covering space corresponds to a index 2 subgroup of $pi_1 (X) = ZZ ast ZZ$. Each index 2 subgroup corresponds to the kernel of some homorphism from $ZZ ast ZZ -> ZZ_2$. These are the following homomorpisms from $ZZ ast ZZ -> ZZ_2$:

  1. $a -> 1$, $b -> 1$: The kernel is $chevron.l a^2, b^2, a b chevron.r$
  2. $a -> 1$, $b -> 0$: The kernel is $chevron.l a^2, b chevron.r$
  3. $a -> 0$, $b -> 1$: The kernel is $chevron.l b^2, a chevron.r$
  4. $a -> 0$, $b -> 0$: The kernel is $chevron.l a, b chevron.r$

  Out of all of these, 1, 2, 3 are index 2 subgroups. Note that $2$ and $3$ produce isomorphic covering spaces. Thus up to isomorphism there are only 2 two sheeted coverings of X.
]

#problem(todo: true)[
  Let $G$ be a connected topological group. Show that $pi_1(G)$ is a commutative group.
]
#solution[

]

#problem()[
  Show that if $RR^m$ and $RR^n$ are homeomorphic, then $m = n$.
]
#solution[
  Consider $RR^m \/ {x}$ which is homotopy equivalent to $S^(m - 1)$ and $RR^n \/ {y}$ which is equivalent to $S^(n - 1)$. Then $ tilde(H)_k (S^(m - 1)) & = delta(k, m - 1) ZZ \
  tilde(H)_k (S^(n - 1)) & = delta(k, n- 1) ZZ. $ Suppose $m != n$. Then $S^(m - 1)$ and $S^(n - 1)$ have different homology groups hence are not homotopic. Thus $RR^m \/ {x}$ and $RR^n \/ {y}$ are not homotopic. Hence $RR^m$ and $RR^n$ cannot be homeomorphic.
]

#problem(todo: true)[
  Let $N_g$ be the nonorientable surface of genus $g$, that is, the connected sum of $g$ copies of $RR PP^2$. Calculate the fundamental group and homology groups of $N_g$.
]
#solution[
  $N_g$ has the following cell decomposition:
  1. 0 cell: $e_0$
  2. $1$ cell: $e_1^1$, ..., $e_1^g$. Where $partial e_1^i -> e_0$.
  3. $2$ cells: $e_2$. Where $partial e_2 -> (e_1^1)^2 ... (e_1^g)^2$

  Thus $ pi_1 (N_g) & = chevron.l a_1, ..., a_g | a_1^2 ... a_g^2 chevron.r $

  We have the following Cellular Chain complex: $ 0 -> ZZ chevron.l e_2 chevron.r ->^(vec(2, dots.v, 2)) ZZ chevron.l e_1^1, ..., e_1^g chevron.r ->^0 ZZ chevron.l e_0 chevron.r -> 0 $


  Thus $ H_0 (N_g) &= ZZ chevron.l e_0 chevron.r \ H_1 (N_g) &= (ZZ chevron.l e_1^1, ..., e_1^g chevron.r) / (ZZ chevron.l 2 e_1^1, ..., 2 e_1^g chevron.r) = ZZ_2 chevron.l e_1^1, ..., e_1^g chevron.r \ H_2 (N_g) &= 0 $

]

= Geometry-Topology Qualifying Examination — March 23, 2010

#problem()[
  Let $M_n$ be the space of all $n times n$ matrices with real entries and let $S_n$ be the subset consisting of all symmetric matrices. Consider the map $F : M_n -> S_n$ defined by $F(A) = A A^t - I$, where $I$ is the identity matrix and $A^t$ is the transpose of $A$.
  #part[Show that $0_(n times n)$ (the $n times n$ matrix with all entries 0) is a regular value of $F$.]
  #part[Deduce that $O(n)$, the set of all $n times n$ matrices such that $A^(-1) = A^t$, is a submanifold of $M_n$.]
  #part[Find the dimension of $O(n)$ and determine the tangent space of $O(n)$ at the identity matrix as a subspace of the tangent space of $M_n$, which is $M_n$ itself.]
]
#solution[*(a)*: Let $E_(i, j) = [(delta(a, i) delta(b, j))]_(1 <= a, b <= n )$ be the elementary matrices. $F^(-1) ({0_(n times n)}) := {M in M_n : M^(-1) = M^T} = O(n)$. Fix $M = [m_(i, j)]_(0 <= i, j <= 1) in O(n)$. For $E_(i, j) in M_n$. Let $phi_(i, j) (t) = M + t E_(i, j)$. $ F(phi_(i, j)(t)) & = (M + t E_(i, j))(M + t E_(i, j))^T - I \
                   & = F(M) + t(M E_(j, i) + E_(i, j) M^T) + O(t^2) \
                   & = t (M E_(j, i) + E_(i, j) M^T) + O(t^2) \
                   & = t(sum_(k = 1)^(n) m_(k, j) E_(k, i) + sum_(k =1)^(n) m_(k, j) E_(i, k) ) + O(t^2) \
                   & = t(sum_(k = 1)^(n) m_(k, j) (E_(k, i) + E_(i, k)) ) + O(t^2) $

  Thus $ d F_M (E_(i, j)) = sum_(k = 1)^(n) m_(k, j) (E_(k, i) + E_(i, k)) ) $

  for all $1 <= i , j <= n$.

  $
    d F_M (sum_(j = 1)^(n) m_(l, j) E_(i, j)) &= sum_(j = 1)^(n) m_(l, j) d F_M (E_(i, j)) \ &= sum_(j = 1)^(n) sum_(k = 1)^(n) m_(l, j) m_(k, j) (E_(i, k) + E_(k, i)) \ &= sum_(l = 1)^(n) sum_(k = 1)^(n) delta(l, k) (E_(i, k) + E_(k, i)) &= E_(i, l) + E_(l, i)
  $

  For all $1 <= i, l <= n$. Hence $d F_M$ is surjective and $M$ is a regular point. Hence $0_(n times n)$ is a regular value.

  *(b)*: By the regular value theorem $O(n)$ is a submanifold of $M_n$.

  *(c)*: $ dim O(n) = dim T_I O(n). $ Note the fact that $ T_I O(n) & = ker d F_I $

  $
    F(I + t X) & = (I + t X)(I + t X)^T - I \
               & = t (X^T + X) + t^2 (XX^T)
  $
  Thus $ d F_I (X) = X^T + X. $

  If $X in ker d F_I <=> X^T + X = 0 <=> X = - X^T$ ie $X in ker d F_I <=> X$ skew symmetric. Skew Symmetric matrices have dimension $ n - 1 + n - 2 + ... + 1 & = (n(n - 1)) / (2). $ Thus $O(n)$ is a dimension $0.5 n (n - 1)$ manifold.
]

#problem(todo: true)[
  Show that $T^2 times S^n$, $n >= 1$, is parallelizable, where $S^n$ is the $n$-sphere, $T^2 = S^1 times S^1$ is the two torus, and a manifold of dimension $k$ is said to be parallelizable if there are $k$ vector fields $V_1, ..., V_k$ on it with $V_1(p), ..., V_k (p)$ linearly independent for all points $p$ of the manifold.
]
#solution[
  Note the following $ T(T^2 times S^n) iso T^2 times RR times RR times T (S^n) $

  Since $T(T^2)$ is parallelizable (use $partial_x, partial_y$ as vector fields). Note the following that $RR times S^n iso RR^(n + 1) \/ {0}$ where $(t, x) -> e^(t) x$. Thus $RR^2 times T(S^n) = T(RR times S^n) = T(RR^(n + 1) \/ {0}) = (RR^(n + 1) \/ {0}) times RR^(n + 1)$ were our vector fields are $partial_(z_1), ..., partial_(z_(n + 1))$ where $(z_1, ..., z_(n +1))$ are the corrdinates of $RR^(n + 1)$. Pull back the vector fields using the diffeomorphism to get the (n + 1) linearly independent vectors of $T(RR times S^(n))$. We have $T^2 times T(RR times S^n) = T^2 times (RR^(n + 1) \/ {0}) times RR^(n + 1) = T^2 times RR times S^n times RR^(n + 1) = T^2 times S^n times RR^(n + 2)$ where the second last equality comes from the diffeomorphism.

]

#problem(todo: true)[
  Suppose $pi : M_1 -> M_2$ is a $C^infinity$ map of one connected differentiable manifold to another. And suppose for each $p in M_1$, the differential $pi_* : T_p M_1 -> T_(pi(p)) M_2$ is a vector space isomorphism.
  #part[Show that if $M_1$ is connected, then $pi$ is a covering space projection.]
  #part[Give an example where $M_2$ is compact but $pi : M_1 -> M_2$ is not a covering space (but has the $pi_*$ isomorphism property).]
]
#solution[
]

#problem(todo: true)[
  Let $cal(F)^k (M)$ denote the differentiable ($C^infinity$) $k$-forms on a manifold $M$. Suppose $U$ and $V$ are open subsets of a differentiable manifold.
  #part[Explain carefully how the usual exact sequence
    $ 0 -> cal(F)(U union V) -> cal(F)(U) plus.circle cal(F)(V) -> cal(F)(U sect V) -> 0 $
    arises.]
  #part[Write down the "long exact sequence" in de Rham cohomology associated to the short exact sequence in part (a) and describe explicitly how the map
    $ H^k_(d e R)(U sect V) -> H^(k+1)_(d e R)(U union V) $
    arises.]
]
#solution[]

#problem(todo: true)[
  Explain carefully why the following holds: if $pi : S^N -> M$, $N > 1$, is a covering space with $M$ orientable, then every closed $k$-form on $M$, $1 <= k < N$, is exact. (Suggestion: Recall that the covering transformations in this situation form a group $G$ with $S^N \/ G tilde.equiv M$.)
]
#solution[
]

#problem()[
  Calculate the singular homology of $RR^n$, $n > 1$, with $k$ points removed, $k >= 1$. (Your answer will depend on $k$ and $n$.)
]
#solution[
  $X = RR^n \/ {x_1, ..., x_k}$ deformation retracts to a $or.big_(i = 1)^k S^(n - 1)$. $ H_m (X) iso H_m (or.big_(i = 1)^k S^(n - 1)) iso plus.o.big_(i = 1)^k H_m (S^(n - 1)) = cases(ZZ^k "if" m = n - 1, 0 "otherwise") $ for $m > 0$. For $H_0 (X) = ZZ$, since $X$ connected.
]

#problem(todo: true)[
  #part[Explain what is meant by adding a handle to a 2-sphere, for a two dimensional orientable surface in general.]
  #part[Show that a 2-sphere with a positive number of handles attached cannot be simply connected.]
]
#solution[]

#problem(todo: true)[
  *FIX ANSWER*!
  #part[Define the degree $deg f$ of a $C^infinity$ map $f : S^2 -> S^2$ and prove that $deg f$ as you present it is well-defined and independent of any choices you need to make in your definition.]
  #part[Prove in detail that for each integer $k$ (possibly negative), there is a $C^infinity$ map $f : S^2 -> S^2$ of degree $k$.]
]
#solution[*(a)*: $S^2$ as a CW complex is a 0 cell $e_0$, and a 2 cell $e_2$ (whose boundary maps to the 0 cell). $H_0 (S^2) = ZZ chevron.l e_0 chevron.r$ and $H_2 (S^2) = ZZ chevron.l e_2 chevron.r$  and $H_1 (S^2) = 0$. Thus any map $f: S^2 -> S^2$ induces a map on homology, and since in both the domain and range $H_2 (S^2)$ has a unique generator $e_2$. $f(e_2) = lambda e_2$. $deg f = lambda$.

  *(b)*: Let $f_0: S^2 -> S^2$ where $S^2 -> (1, 0, 0)$. Because $f_0(S^2) subset S^2 / (-1, 0, 0)$ which deformation retracts to $(1, 0, 0)$ and hence $H_2 (f_0(S^2)) = 0$ ie $f_0 (e_2) = 0$ and $deg (f_0) = 0$.
  Note that the antipodal map $A(x) = -x$ has degree -1. Note that $deg (g compose f) = deg g deg f$. Thus it suffices to find a map $g_k : S^2 -> S^2$ such that $deg g_k = k$ for all $k in NN$. Identify $S^2$ with $CC P^1$. Consider the map $g_k (z) = z^k$. By local degree, $g^(-1)_k ({1})$ are the $k$ roots of unity and $g_k$ is orientation perseving. Hence $deg g_k = k$.
]

#problem(todo: true)[
  Explain how Stokes' Theorem for manifolds with boundary gives, as a special case, the classical divergence theorem (about $integral.triple_U "div" V \, d("vol")$), where $U$ is a bounded open set in $RR^3$ with smooth boundary and $V$ is a $C^infinity$ vector field on $RR^3$.
]
#solution[]

#problem(todo: true)[
  #part[Show that every map $F : S^n -> S^1 times dots.c times S^1$ ($k$ copies of $S^1$) is null-homotopic (homotopic to a constant map).]
  #part[Show that there is a map $F : S^1 times dots.c times S^1$ ($n$ copies) $-> S^n$ such that $F$ is not null-homotopic.]
  #part[Show that every map $F : S^n -> S^(n_1) times S^(n_2) times dots.c times S^(n_k)$, $n_1 + dots.c + n_k = n$, $n_j > 0$, $k >= 2$, has degree 0. (You may use any definition of degree you like, and you may assume $F$ is $C^infinity$.)]
]
#solution[
  *a*: For $n > 1$: $TT^k = RR^k \/ ZZ^k$. Thus $pi_1 (TT^k) = ZZ^k$. $F_*: 0 = pi_1 (S^n) -> pi_1 (TT^k) = ZZ^k$. By the lifting criterion $tilde(F): S^n -> RR^k$ exists where $F = p compose tilde(F)$. Consider the straight line homotopy $tilde(H)(x, t) = (1- t) tilde(F)(x)$. Then let $H = p compose tilde(H)$. Then $H(0, x) = p((1-0) tilde(F)(x)) = F(x)$, $H(1, x) = p((1- x)tilde(F)(x)) = p(0) = [0]$. Thus $F$ is null-homotopic.

  *(b)*:

  *(c)*:
]

= Geometry-Topology Qualifying Examination — Fall 2012

#problem(todo: true)[
  #part[Show that the Lie group $S L_2 (RR) = {A in M_(2 times 2)(RR) | det(A) = 1}$ is diffeomorphic to $S^1 times RR^2$.]
  #part[Show that the Lie group $S L_2 (CC) = {A in M_(2 times 2)(CC) | det(A) = 1}$ is diffeomorphic to $S^3 times RR^3$.]
]
#solution[]

#problem(todo: true)[
  For $n >= 1$, construct an everywhere non-vanishing smooth vector field on the odd-dimensional real projective space $RR PP^(2n - 1)$.
]
#solution[]

#problem(todo: true)[
  Let $M^m subset RR^n$ be a smooth submanifold of dimension $m < n - 2$. Show that its complement $RR^n \\ M$ is connected and simply connected.
]
#solution[]

#problem(todo: true)[
  #part[Show that for any $n >= 1$ and $k in ZZ$, there exists a continuous map $f : S^n -> S^n$ of degree $k$.]
  #part[Let $X$ be a compact, oriented $n$-dimensional manifold. Show that for any $k in ZZ$, there exists a continuous map $f : X -> S^n$ of degree $k$.]
]
#solution[]

#problem(todo: true)[
  Assume that $Delta = {X_1, ..., X_k}$ is a $k$-dimensional distribution spanned by vector fields on an open set $Omega subset M^n$ in an $n$-dimensional manifold. For each open subset $V subset Omega$ define
  $ cal(Z)_V = {u in C^infinity (V) | X_1 u = 0, ..., X_k u = 0} $
  Show that the following two statements are equivalent:
  #part[The distribution $Delta$ is integrable.]
  #part[For each $x in Omega$ there exists an open neighborhood $x in V subset Omega$ and $n - k$ functions $u_1, ..., u_(n - k) in cal(Z)_V$ such that the differentials $d u_1, ..., d u_(n - k)$ are linearly independent at each point in $V$.]
]
#solution[]

#problem(todo: true)[
  On $RR^n - {0}$ define the $(n-1)$-forms
  $
    sigma & = sum_(i = 1)^n (-1)^(i - 1) x^i d x^1 and dots.c and hat(d x^i) and dots.c and d x^n \
    omega & = 1 / (|x|^n) sum_(i = 1)^n (-1)^(i - 1) x^i d x^1 and dots.c and hat(d x^i) and dots.c and d x^n
  $
  #part[Show that $omega = r^* compose i^* (sigma)$, where $i : S^(n - 1) -> RR^n - {0}$ is the natural inclusion of the unit sphere and $r(x) = x / (|x|) : RR^n - {0} -> S^(n - 1)$ the natural retraction.]
  #part[Show that $sigma$ is not a closed form.]
  #part[Show that $omega$ is a closed form that is not exact.]
]
#solution[]

#problem(todo: true)[
  Let $n >= 0$ be an integer. Let $M$ be a compact, orientable, smooth manifold of dimension $4n + 2$. Show that $dim H^(2n + 1)(M; RR)$ is even.
]
#solution[]

#problem(todo: true)[
  Show that there is no compact three-dimensional manifold $M$ whose boundary is the real projective space $RR PP^2$.
]
#solution[]

#problem(todo: true)[
  Consider the coordinate axes in $RR^n$:
  $ L_i = {(x_1, ..., x_n) | x_j = 0 "for all" j != i} $
  Calculate the homology groups of the complement $RR^n \\ (L_1 union dots.c union L_n)$.
]
#solution[]

#problem(todo: true)[
  #part[Let $X$ be a finite CW complex. Explain how the homology groups of $X$ are related to the homology groups of $X times S^1$.]
  #part[For each integer $n >= 0$, give an example of a compact smooth manifold of dimension $2n + 1$ such that $H_i (X) = ZZ$ for all $i = 0, ..., 2n + 1$.]
]
#solution[]

= Geometry-Topology Qualifying Examination — September 2011

#problem(todo: true)[
  Let $M$ be an (abstract) compact smooth manifold. Prove that there exists some $n in ZZ^+$ such that $M$ can be smoothly embedded in the Euclidean space $RR^n$.
]
#solution[]

#problem(todo: true)[
  Prove that the real projective space $RR PP^n$ is a smooth manifold of dimension $n$.

  *FIX PROOF*
]
#solution[
  $
    RR PP^n = {[x_1 : ... : x_(n + 1)] : (x_1, ..., x_n, x_(n + 1)) != 0, [x_1: ... : x_(n + 1)] ~ [k x_1: ... : k x_(n + 1)]}.
  $
  Define $ U_i := {[x_1: ...: x_(i - 1): 1: x_(i + 1): ...: x_(n + 1)]: (x_1, ..., x_(i - 1), x_(i + 1), ..., x_(n + 1)) in RR^n} $

  Thus $U_i$ is homeomorphic $RR^n$ where $                                     phi_i : RR^n & -> U_i \
  (x_1, ..., x_(i - 1), x_(i + 1), ..., x_(n + 1)) & -> [x_1 : ... : x_(i - 1) : 1 : x_(i + 1) : ... : x_(n + 1)] $

  is the diffeomorphism. $ U_i inter U_j = {[x_1, ..., x_(i - 1), 1, x_(i + 1), ..., x_(j - 1), 1, x_(j + 1), ..., x_(n + 1)]: (x_1, ..., x_(i - 1), x_(i + 1), ..., x_(j - 1), x_(j + 1), ..., x_(n + 1)) in RR^(n - 1)} $

  Note that $phi_i^(-1)(U_i inter U_j) = RR^(j - 1) times (RR - {0}) times RR^(n - j - 1)$

  $
    (phi_j^(-1) compose phi_i)(x_1, ..., x_(i - 1), x_(i + 1), ..., x_n) &= phi_j^(-1)[x_1, ..., x_(i - 1), x_(i + 1), ..., x_j, ..., x_n] \ &= phi_j^(-1)([x_1/x_j, ..., (x_(j - 1)) / (x_j), 1, (x_(j + 1)) / (x_j), ..., (x_n) / (x_j)]) \ &= ((x_1) / (x_j), ..., (1) / (x_j), ..., (x_(j - 1)) / (x_j), (x_(j + 1)) / (x_j), ..., (x_n) / (x_j))
  $

  This is smooth. So the transition functions are smooth. Hence $RR PP^n$ is a smooth manifold of dimension $n$.

]

#problem(todo: true)[
  Let $M$ be a compact, simply connected smooth manifold of dimension $n$. Prove that there is no smooth immersion $f : M -> T^n$, where $T^n = S^1 times dots.c times S^1$ is the $n$-torus.
]
#solution[

]

#problem(todo: true)[
  Give a topological proof of the Fundamental Theorem of Algebra: any non-constant single-variable polynomial with complex coefficients has at least one complex root.
]
#solution[]

#problem(todo: true)[
  Let $f : M -> N$ be a smooth map between two manifolds $M$ and $N$. Let $alpha$ be a $p$-form on $N$. Show that $d(f^* alpha) = f^*(d alpha)$.
]
#solution[
  Let $g in Omega^(0)(N)$ be a 0 form. Let $X$ be a vector field  $ d(f^* ( g))(X) & = d(g compose f)(X) \
                 & = X(g compose f) $

  $
    f^* (d g)[X] & = d g (f_* X) \
                 & = (f_* X)[g] \
                 & = X(g compose f)
  $

  Since this is true for all vector fields $X$ we have that $d (f^* (g)) = f^*(d g).$

  Assume this is true for forms $n = 1, ..., k$. We want to prove this is true for a $k + 1$ form. $nu$ is a $k$ form and $g in Omega^0 (N)$.

  $
    d(f^* (g and nu )) & = d((f^* g) and (f^* nu)) \
                       & = d(f^* g) and f^* nu + f^* g and d(f^* nu) \
                       & = f^* (d g) and f^* nu + f^* g and f^* (d nu) \
                       & = f^*(d g and nu + g and d nu )
  $

  $ f^* (d(g and nu)) & = f^* (d g and nu + g and d(nu)) $

  For all $alpha in Omega^(k + 1) (N)$ is a linear combination of $g and nu$ and since both $d$ and $f$ are linear it is true for all $Omega^(k + 1) (N)$.

  Thus by induction this is true for all $p$-forms on $N$.
]

#problem(todo: true)[
  #part[What are the de Rham cohomology groups of a smooth manifold?]
  #part[State de Rham's theorem.]
]
#solution[]

#problem(todo: true)[
  Consider the form $omega = (x^2 + x + y) dy and dz$ on $RR^3$. Let $S^2 = {x^2 + y^2 + z^2 = 1} subset RR^3$ be the unit sphere, and $i : S^2 -> RR^3$ the inclusion.
  #part[Calculate $integral_(S^2) omega$.]
  #part[Construct a closed form $alpha$ on $RR^3$ such that $i^* alpha = i^* omega$, or show that such a form $alpha$ does not exist.]
]
#solution[]

#problem(todo: true)[
  #part[Let $M$ be a Möbius band. Using homology, show that there is no retraction from $M$ to $partial M$.]
  #part[Let $K$ be a Klein bottle. Show that there exist homotopically nontrivial simple closed curves $gamma_1$ and $gamma_2$ on $K$ such that $K$ retracts to $gamma_1$, but does not retract to $gamma_2$.]
]
#solution[]

#problem(todo: true)[
  Let $X$ be the topological space obtained from a pentagon by identifying its edges as in the picture:
  #align(center)[
    #canvas(length: 3cm, {
      import cetz.draw: *
      let r = 1.2
      let verts = range(5).map(i => {
        let theta = (90 - i * 72) * calc.pi / 180
        (r * calc.cos(theta), r * calc.sin(theta))
      })
      line(..verts, close: true, fill: luma(220), stroke: 0.5pt)
      for i in range(5) {
        let a = verts.at(i)
        let b = verts.at(calc.rem(i + 1, 5))
        line(a, b, mark: (end: ">", size: .15, fill: black), stroke: 1pt)
      }
    })
  ]
  Calculate the homology and cohomology groups of $X$ with integer coefficients.
]
#solution[]

#problem(todo: true)[
  Let $X, Y$ be topological spaces and $f, g : X -> Y$ two continuous maps. Consider the space $Z$ obtained from the disjoint union $Y union.sq (X times [0, 1])$ by identifying $(x, 0) tilde f(x)$ and $(x, 1) tilde g(x)$ for all $x in X$. Show that there is a long exact sequence of the form:
  $ dots -> H_n (X) -> H_n (Y) -> H_n (Z) -> H_(n-1) (X) -> dots $
]
#solution[]
