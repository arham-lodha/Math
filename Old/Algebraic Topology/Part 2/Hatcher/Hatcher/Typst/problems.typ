#import "@preview/lemmify:0.1.8": *
#import "@preview/commute:0.3.0": arr, commutative-diagram, node


#set text(lang: "en")


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
#let cup = { $⌣$ }
#let frown = { $⌢$ }
#let CP(dimension) = $CC P^(#dimension)$
#let RP(dimension) = $RR P^(#dimension)$
#let Ext(group, ring) = $op("Ext") (group, ring)$
#let Tor(group, ring) = $op("Tor") (group, ring)$
#let rank(group) = $op("rank") (group)$

#set heading(numbering: "1.")

= Cup Product
== Problem 13
*Describe $H^*(CC P^infinity slash CC P^1; ZZ)$ as a ring with finitely many multiplicative generators. How does this ring compare with $H^*(S^6 times HH P^infinity; ZZ)$*
#proof[
  All coefficents are $ZZ$ coefficents unless otherwise stated. $(CC P^(infinity), CC P^(1))$ is a good pair, thus

  $ H^n (CC P^infinity slash CC P^1) = H^n (CC P^(infinity), CC P^(1)) $

  Note $CC P^infinity slash CC P^1$ has a 0 cell and 2n cells for all $n >= 2$. Thus $H^n (CC P^infinity slash CC P^1) = 0$ for $n = 1, 2$. By the cohomological long exact sequence of pairs, $H^n (CC P^infinity, CC P^1) tilde.equiv H^(n) (CC P^infinity)$. Let $alpha in H^4(CC P^infinity slash CC P^1)$ and $beta in H^6(CC P^infinity slash CC P^1)$ be generators where $q^*(alpha) = x^2$ and $q^*(beta) = x^3$ for $x$ being the generator of $H^*(CP(infinity))$ . Let $q: CP(infinity) -> CP(infinity) slash CP(1)$ be the standard quotient map.

  $
    q^*(alpha^3 - beta^2) & = x^6 - x^6 = 0 \
  $

  Since $q$ is a isomorphism, $alpha^3 - beta^2 = 0 => alpha^3 = beta^2$. Thus,

  $ H^*(CP(infinity) / CP(1)) = (ZZ[alpha, beta]) / ((alpha^3 - beta^2)) $

  where $abs(alpha) = 4$ and $abs(beta) = 6$.

  $ H^*(S^6 times HH^infinity) & = (ZZ[a, b]) / ((b^2)) \ $

  Where $abs(a) = 4$ and $abs(b) = 6$. Both rings are not isomorphic.
]

== Problem 14
*Let $q: RP(infinity) -> CP(infinity)$ be the natural quotient map by regarding both spaces as quotients of $S^infinity$, modulo multiplication of real scalars in one case and complex scalars in the other. Show that $q^*: H^* (CP(infinity); ZZ) -> H^(*)(RP(infinity); ZZ)$ is surjective in even dimensions by showing first a geometric argument that the restriction $q: RP(2) -> CP(1)$ induces a surjection on $H^2$ and then appealing to the cup product structures. Next, form a quotient space $X = RP(infinity) union.sq CP(infinity)$ by identifying each point $x in RP(2n)$ with $q(x) in CP(n)$. Show there are ring isomorphisms $H^*(X; ZZ) tilde.equiv (Z[alpha]) / ((2alpha^(n + 1)))$ and $H^(*)(X; ZZ_2) tilde.equiv ZZ_2[alpha, beta] slash (beta^2 - alpha^(2n + 1))$, where $abs(alpha) = 2$ and $abs(beta) = 2n + 1$*.
#proof[ ]

== Problem 15
*For a fixed coefficent field $F$, define a Poincaré Series of a space $X$ to be the formal power series $p(t) = sum_(i)^() a_i t^(i)$ where $a_i = dim H^i (X; F)$ as a vector space over $F$, assuming $dim$ is finite for all i. Compute the power series for $S^n, RP(n), RP(infinity), CP(n), CP(infinity)$ *

+ $S^n$: $p(t) = 1 + t^6$
+ $RP(n)$:
  - If $F$ has characteristic 2, then $p(t) = sum_(i = 0)^(n + 1) t^i = (1 - t^(n + 1)) / (1 - t)$
  - If $"char"(F) != 2 => H^i = F <=> i mod 2 = 1$ or $i = 0$.
+ $RP(infinity)$

*Prove that $p(X) p(Y) = p(X times Y)$ *
#proof[
  By the Kunneth formula $H^*(X; F) times.circle H^*(Y; F) = H^*(X times Y; F)$. Thus
  $ H^n (X times Y; F) = plus.circle.big_(p + q = n) H^p (X; F) times.circle H^q (X; F) $

  Thus

  $
    dim H^n (X times Y; F) & = dim(plus.circle.big_(p + q = n) H^p (X; F) times.circle H^q (Y; F)) \
                           & = sum_(p = 0)^(n) (dim(H^p (X; F)))(dim(H^(n - p) (Y; F)))
  $

  Thus

  $ p(X times Y)(t) = sum_(n >= 0)^() (sum_(p = 0)^(n) (dim(H^p (X; F)))(dim(H^(n - p) (Y; F)))) t^n = p(X)(t) p(Y)(t) $
]

== Problem 16
Show that if $X$ and $Y$ are finite CW complexes such that $H^*(X; ZZ)$ and $H^*(Y; ZZ)$ contain no elements of order a power of a given prime $p$, then the same is true for $X times Y$
#proof[
  Unless otherwise specified, $ZZ$ coefficents are used. By the Cohomological UCT,

  $ H^n (X) = Ext(H_(n - 1)(X), ZZ) xor hom_(ZZ)(H_n (X),ZZ) $

  Thus no elements of order some power of $p$ in $H^n (X) =>$ no elements of some power of $p$ in $Ext(H_(n - 1)(X), ZZ)$ or $hom_(ZZ)(H_n (X),ZZ)$.

  $Ext(H_(n - 1)(X), ZZ)$ has no elements of some power of $p$: Suppose $exists m in ZZ in.rev exists g in H_(n - 1)(X) in.rev abs(lr(angle.l g angle.r)) = p^m$. WLOG, assume $m$ is maximal. Thus Since $X$ is a finite CW complex, $H_(n - 1)(X)$ is a finitely generated abelien group. Thus $H_(n - 1)(X)= ZZ^r xor ZZ_(p^m)^r_i xor #sym.dots.h$. Thus $Ext(H_(n - 1)(X), ZZ) = ZZ_(p^m)^(r_i) xor #sym.dots.h$, thus $Ext(H_(n - 1)(X), ZZ)$ has elements of order $p^m$. Thus by contrapositive, $Ext(H_(n - 1)(X), ZZ)$ has no elements of some power of $p$ then $H_(n-1)(X)$ has no elements of some power of $p$ for all $n$.


  Thus $H_(n - 1)(X)$ and $H_n (X)$ hve no elements of order $p^m$ for all $m$. By the Universal coefficent theorem for Homology, $H_(n)(X; ZZ_p) = H_n (X) times.circle ZZ_p xor Tor(H_(n-1)(X), ZZ_p) = ZZ_p^(rank(H_n (X)))$. Proof is identical for $Y$.

  $
    dim(H^n (X times Y; ZZ_p)) & = sum_(p = 0)^(n) dim(H^p (X; ZZ_p) times.circle H^(p - n) (Y; ZZ_p))) \
                               & = sum_(p = 0)^(n) dim(H_p (X; ZZ_p)) dim(H_(n - p)(Y; ZZ_p)) \
                               & = sum_(p = 0)^(n) rank(H^(p)(X)) rank(H^(n-p)(Y)) \
                               & = rank(H^(n)(X times Y))
  $

  This is true $<=> H^(*)(X times Y)$
  has no factors of order $p^m$ for all $m in NN$.
]

== Problem 18
#theorem[
  For the closed orientable surface $M$ for genus $g >= 1$, for each nonzero $a in H^(1)(M ; ZZ)$, $exists b in H^(1)(M; ZZ) in.rev alpha beta != 0$. Thus $M$ is not homotopy equivalent to a wedge sum $X or Y$ of CW complexes with nontrivial reduced homology
]
#proof[
  $
    H^(*)(M; ZZ) = (ZZ[alpha_(1), beta_(1), #sym.dots.h, alpha_(2g), beta_(2g)]) / ((alpha_(i)alpha_(j), beta_(i)beta_(j), alpha_(i)beta_(j), alpha_(i)^2, beta_(i)^2, alpha_(i)beta_(i) + beta_(i)alpha_(i), beta_(i)alpha_(i)beta_(i), alpha_(i)beta_(i)alpha_(i)))
  $

  Let $a in H^(1)(M; ZZ) in.rev a!=0$, $a = sum_(i = 1)^(2g)(c_(i) alpha_(i) + d_(i) beta_(i))$. There exists some $i in [1, #sym.dots.h, 2g] in.rev alpha_(i) "or" beta_(i) != 0$. WLOG $i = 1$ and $alpha_(i) != 0$ (Argument is symmetric for $beta_(i)$). $a beta_(i) = c_(i)(alpha_(i) beta_(i))$

  Assume for contradiction, that $M = X or Y$ where $tilde(H)_(1)(X) != 0 != tilde(H)_(1)(Y) => H_(1)(X) != 0 != H_(1)(Y)$. Thus $H^(1)(M) = H^(1)(X) xor H^(1)(Y)$. Now take any two basis elements in $X$ and $Y$ and now they cannot multiply to nonzero number.
]

= Poincaré Duality
== Problem 1
== Problem 2
#theorem[Show that deleting a point from a manifold of dimension greater than 1 doesn't affect the orientablity of the manifold]
#proof[
  Let $tilde(M)$ be the orientation double cover of $M$, a d dimensional manifold for $d > 1$. $tilde(M)$ is a d dimensional manifold.

  + Suppose $M$ is orientable, then $tilde(M) = M_(+) union.sq M_(-)$ where $M_(+)$ and $M_(-)$ are two disconnected copies of $M$. $forall x in M$, the double cover $N_(x) = M - {x}$ is $tilde(N_(x)) = tilde(M) - {x_(+), x_(-)} = (M_(+) - {x_(+)}) union.sq (M_(-) - {x_(-)})$. Since $M - {x}$ is connected, $M_(+) - x_(+)$ is connected and $M_(-) - x_(-)$ is connected, thus removing a point doesn't change the connectivity of either copy. Thus $tilde(N_(x))$ still has 2 disconnected components.
  + Suppose $M$ is nonorientable, then $tilde(M)$ has 1 connected component. $tilde(N_(x))$ ($N_(x)$ defined as above) is $tilde(M) - {x_(+), x_(-)}$. The removal of two points in a d dimensional manifold doesn't change its connectivity. Thus $tilde(N)_(x)$ is connected, thus $N_(x)$ is nonorientable.
]

== Problem 3
#theorem[
  Every covering space of an orientable manifold is an orientable manifold.
]
#proof[
  Suppose $M$ is a orientable manifold with a covering $p: N -> M$. Since $M$ is orientable manifold, there is a $mu: M -> ZZ tilde.equiv H_(n)(M | x)$ satisfying "local consistency". $forall x in M$, $exists U_(x) subset M in.rev p^(-1)(x)$ consists of disjoint union of copies of $U_(x)$. $forall y in N$, consider the local homomorphism

  $ q = p|_U_y: U_y -> U_(p(y)) $

  where $U_y$ is the local neighborhood of $y$ homeomorphic to $U_(p(y))$. Let $x = p(y)$. It induces a isomorphisms in homology.

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAJAfTAAIAKAKpcAnrwA+IgJQgAvqXSZc+QigBMFanSat23PkK4APCbyMz5i7HgJFymmgxZtEnHgIBykiwpAZrKkQAzA7aznru-ACypuZyWjBQAObwRKAAZgBOEAC2SBogOBBI9iCM9ABGMIwACko2qmUw6TggjjouIDBGWADGWNi2liBZuSU0RUhkYbquaOJcwiJyvqN5iNOTiCEznd39g4SylLJAA
  #align(center, commutative-diagram(
    node((0, 1), [$H_n (U_y|y)$]),
    node((0, 2), [$H_n (U_x|x)$]),
    node((0, 0), [$H_n (N|y)$]),
    node((0, 3), [$H_n (M | x)$]),
    arr((0, 0), (0, 1), [excision], label-pos: left),
    arr((0, 1), (0, 2), [$q_(*)$], label-pos: left),
    arr((0, 2), (0, 3), [excision]),
  ))

  Let $mu_(p): N -> ZZ = H_(n)(H mid(|) y)$ where $mu_(p) = q_(*)^(-1) compose mu compose q$. By assumption $forall z in U_(x)$, $mu(z) = mu(x)$ by orientability of $M$. Thus $forall z in U_(y)$, $mu_(p)(z) = (q_(*)^(-1) compose mu compose q)(z) = q_(*)^(-1)(mu(x)) = (q_(*)^(-1) compose mu compose q)(y) = mu_(p)(y)$. Thus $mu_(p)$ has the local consistancy condition, and thus $N$ is orientable.
]

== Problem 4
#theorem[
  Given a covering space action of a group $G$  on an orientable manifold $M$  by orientation-preserving homeomorphisms, show that $M slash G$ is also orientable.
]
#proof[
  Suppose $M$ is a orientable manifold with a covering $p: N -> M$ with a group $G$ whose elements act by a covering space homeomorphisms on $G$. Thus $M$ is a covering space of $N = M slash G$. Since $M$ is orientable manifold, there is a $mu: M -> ZZ tilde.equiv H_(n)(M | x)$ satisfying "local consistency".

  $forall x in N$, $exists U_(x) subset M in.rev p^(-1)(x)$ consists of disjoint union of copies of $U_(x)$. $forall y in M$, consider the local homomorphism

  $ p|_U_y: U_y -> U_(p(y)) $

  where $U_y$ is the local neighborhood of $y$ homeomorphic to $U_(p(y))$. Let $q = (p|_U_y)^(-1)$

  Let $x = p(y)$. It induces a isomorphisms in homology.

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAJAfTAAIAKAKpcAnrwA+IgJQgAvqXSZc+QigBMFanSat23PkK4APCbyMz5i7HgJFymmgxZtEnHgIBykiwpAZrKkQAzA7aznru-ACypuZyWjBQAObwRKAAZgBOEAC2SBogOBBI9iCM9ABGMIwACko2qmUw6TggjjouIDBGWADGWNi2liBZuSU0RUhkYbquaOJcwiJyvqN5iNOTiCEznd39g4SylLJAA
  #align(center, commutative-diagram(
    node((0, 1), [$H_n (U_y|y)$]),
    node((0, 2), [$H_n (U_x|x)$]),
    node((0, 0), [$H_n (M|y)$]),
    node((0, 3), [$H_n (N | x)$]),
    arr((0, 0), (0, 1), [excision], label-pos: left),
    arr((0, 2), (0, 1), [$q_(*)$], label-pos: left),
    arr((0, 2), (0, 3), [excision]),
  ))

  Let $nu: N -> ZZ = H(N | x)$ where $nu = (p|_(U_(y)))_(*) compose mu compose q$. Thus $forall y in U_(p(x))$, $nu(y) = ((p|_(U_(y)))_(*) compose mu compose q)(y) = ((p|_(U_(y)))_(*) compose mu)(q(y)) = (p|_(U_(y)))_(*)(mu(q(y))) = (p|_(U_(y)))_(*)(mu(x)) = (p|_(U_(y)))_(*)(mu(q(p(x)))) = nu(p(x))$. The second to last inequality comes from local consistancy of $M$. Thus $N$ is orientable.
]
== Problem 5
#lemma[If $M$ is a closed connected manifold then $H_(n)(M; QQ) = QQ = H^(n)(M; QQ)$ if $M$ is orientable and $H_(n)(M; QQ) = 0 = H^(n)(M; QQ)$ if $M$ is nonorientable.]<manifoldRationals>
#proof[
  By Universal Coefficent Theorem, we have that

  $ H_(n)(X; QQ) = H_(n)(X) times.circle QQ xor Tor(H_(n - )(X), QQ) $

  By Hatcher Theorem 3.26,

  $
    H_(n)(X) = cases(
      ZZ "if" X "is orientable"\
      0 "otherwise"
    )
  $

  By Hatcher Theorem 3.28,
  $
    "Torsion Subgroup of" H_(n - 1)(X) = cases(
      0 "if" X "is orientable"\
      ZZ_(2) "otherwise"
    )
  $

  Thus $ H_(n)(X; QQ) = cases(
    QQ "if" X "is orientable"\
    0 "otherwise"
  ) $

  We can also say the same thing for cohomology by the cohomological universal coefficent theorem.
]
#theorem[If $M$ and $N$ are orientable manifolds then $M times N$ is a orientable manifold]
#proof[
  Let $m = dim M$ and $n = dim N$. Let $tilde(N) -> N$, $tilde(M) -> M$, and $tilde(M times N) -> M times N$ be the orientation double covers. $forall (x, y) in M times N$.

  Note the following $M times N - (x, y) = (M - x) times N union M times (N - y)$.

  By @manifoldRationals, $H^m (M; QQ) = QQ = H^n (N; QQ)$. By the Kunneth Formula,

  $
    H^(n + m)(M times N; QQ) & = plus.circle.big_(i = 1)^(n + m) H^(i)(M; QQ) times.circle_(QQ) H^(n + m - i)(N; QQ) \
  $

  Note for $k > m$, $H^(k)(M; QQ) = 0$ and $k > n$, $H^(k)(N; QQ) = 0$. Thus

  $ H^(n + m)(M times N; QQ) = H^(m)(M; QQ) times.circle_(QQ) H^(n)(N; QQ) = QQ $

  Thus @manifoldRationals, $M times N$ is a orientable manifold.
]
== Problem 6
Given two disjoint connected n manifolds $M_1 "and" M_2$, a connected n manifold $M_1 sharp M_2$, their connected sum, can be constructed by deleting the interiors of closed n balls $B_1 subset M_1$  and $B_2 subset M_2$  and identifying the resulting boundary spheres $diff B_1$ and $diff B_2$  via some homeomorphism between them. (Assume that each $B_(i)$  embeds nicely in a larger ball in $M_(i)$ .)

#theorem[
  If $M "and" N$ are closed then there are isomorphisms from $H_(i)(M sharp N; ZZ) tilde.equiv H_(i)(M; ZZ) xor H_(i)(N; ZZ)$ for $0 < i < n$, with one exception: If $M$ and $N$ are both nonorientable, then $H_(n - 1)(M sharp N; ZZ)$ is obtained from $H_(n - 1)(M; ZZ) xor H_(n - 1)(N; ZZ)$ by replacing one of the $ZZ_(2)$ summands with $ZZ$.
]<3.6a>
#proof[

  Let $n = dim M = dim N$. Take the LES for $(M sharp N, diff B_1) = (M sharp N, S^(n - 1))$. Thus $H_(i)(M sharp N, S^(n - 1)) = H_(i)(M sharp N slash S^(n - 1)) = H_(i)(M or N) = H_(i)(M) xor H_(i)(N)$. We have the following LES, for $i > 1$

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAJAfQAosBKHgGUAejzABaYv34gAvqXSZc+QigBMFanSat23PoI4ACOAAt6AJzTGAcrIVLseAkQDMWmgxZtEnXgI8ALL8xgAeEJbGBoH28oogGM6qROSeOj7sAHQ58U4qrigALOneen4xUoKi4lUOCUkFasgArKW6viA5WfLaMFAA5vBEoABmlhAAtkgeIDgQSOSOIONTizTzSMTLq9OIZHMLiOo7E3uah0hFp2uIJZeILXKUckA
  #align(center, commutative-diagram(
    node((0, 1), [$H_(i)(S^(n-1))$]),
    node((0, 2), [$H_(i)(M sharp N)$]),
    node((0, 3), [$H_(i)(M) xor H_(i)(N)$]),
    node((0, 4), [$tilde(H)_(i-1)(S^(n-1))$]),
    arr((0, 1), (0, 2), []),
    arr((0, 2), (0, 3), []),
    arr((0, 3), (0, 4), []),
  ))

  Note I am using the reduced sequence, but I am taking the isomorphism between reduced and unreduced for $i > 0$.

  + $i = 1$: $H_(1)(S^(n - 1)) = tilde(H)_(i - 1)(S^(n - 1)) = 0 => H_(i)(M sharp N) = M_(i)(M) xor H_(i)(N)$
  + $1 < i < n- 1$: $H_(i)(S^(n - 1)) = tilde(H)_(i - 1)(S^(n - 1)) = 0 => H_(i)(M sharp N) = H_(i)(M) xor H_(i)(N)$
  + $i = n -1$: $H_(n)(M or N) = H_(n)(M) xor H_(n)(N)$. $diff_(*): H_(n)(M or N) -> H_(n - 1)(S^1)$.
    + If both $M$ and $N$ are orientable: Then $H_(n)(M) = H_(n)(N) = ZZ$, by Theorem 3.27 in Hatcher. Then $H_(n)(M) xor H_(n)(N) = ZZ^2$. Thus $diff_(*): ZZ^2 -> H_(n - 1)(S^(n - 1)) = ZZ$. Let $[M], [N]$ be the fundamental classes of $M$ and $N$ respectively. $forall x in H_(n)(M or N), x = (a[M], b[N])$ for $a, b in ZZ$. Look $[M]$ as a chain in $(M, B_(1))$, its boundary is $S^(n - 1)$, same with $[N]$ (but since the glueing is orientation reversing), they each map to the negative of each other. But they may to generators. Thus $diff_(*): (a, b) -> a - b$. Thus $im(diff_(*)) = ZZ$. Thus $ker(i_(*)) = ZZ$, thus $H_(n - 1)(M sharp N) = H_(n - 1)(M) xor H_(n - 1)(N)$
    + If only $M$ is orientable. $H_(n)(N) = 0 => H_(n)(M or N) = H_(n)(M) = ZZ$. Take $[M] -> g$ generator of $H_(n - 1)(S^(n - 1))$. Thus $ker(i_(*)) = ZZ => H_(n - 1)(M sharp N) = H_(n - 1)(M) xor H_(n - 1)(N)$
    + If neither $M$ or $N$ is orientable: Then $H_(n)(M or N) = 0$. Thus we have the SES,

      #align(center, commutative-diagram(
        node((0, 0), [$0$]),
        node((0, 1), [$H_(n - 1)(S^(n - 1)) = ZZ$]),
        node((0, 2), [$H_(n - 1)(M sharp N)$]),
        node((0, 3), [$H_(n - 1)(M) xor H_(n - 1)(N)$]),
        node((0, 4), [$0$]),
        arr((0, 0), (0, 1), []),
        arr((0, 1), (0, 2), [$i_(*)$ ]),
        arr((0, 2), (0, 3), [$p$]),
        arr((0, 3), (0, 4), []),
      ))

      Let $t_(M)$ and $t_(N)$ be the order 2 generators of $H_(n - 1)(M)$ and $H_(n - 1)(N)$ respectively. Since $p$ is surjective, $exists tilde(t)_(M) in H_(n - 1)(H sharp N) in.rev p(tilde(t)_(M)) = (t_(M), 0)$. $p(2tilde(t)_(M)) = 2p(tilde(t)_(M)) = 2(tilde(t)_(M), 0) = (0,0)$. Thus $2tilde(t)_(M) in ker p = i_(*)(ZZ) = ZZ$. Thus $2tilde(t)_(M)$ is a nonzero multiple of $[S]$, fundamental class of $S^(n - 1)$. We can say the same about $2 tilde(t)_(N)$

]
#theorem[
  Show that $chi(M sharp N) = chi(M) + chi(N) - chi(S^n)$ if $M$ and $N$ are closed.
]
#proof[
  $
    chi(M sharp N) & = 1 + sum_(i = 1)^(n - 1) (-1)^(i)(rank(H_(i)(M)) + rank(H_(i)(N))) + (-1)^(n)(rank(H_(n)(M sharp N))) \
                   & = \
  $
]

== Problem 7
#lemma[
  Let $M$ be a closed, connected, orientable, n-manifold. $forall x in M$, $exists U_(x) subset M$ a open set homeomorphic to $RR^n$ which contains $x$. Let $f: M -> S^n$, that has the property, that $exists y in S^(n) in.rev f^(-1)(y) = {x_(1), #sym.dots.h, x_(m)}$. Let $V$, be the y neighborhood homeomorphic to $RR^(n)$. Thus $f(U_(x_(i)) - x_(i)) subset V - y$. Let $deg(f|x_(i))$, tells us that multiplication by what is the map $f_(*): H_(n)(U_(x_(i)) | x_(i)) -> H_(n)(V | y)$. $deg f = sum_(i =1)^(m) deg f|x_(i)$.
]<sumoflocaldegrees>

#proof[
  We have the following diagram.

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBoBGAXVJADcBDAGwFcYkQAJAfTAAIAKALIAfAB5csAShABfUuky58hFOVLFqdJq3bc+-AKpdRvYb3FTZ8kBmx4CRAEzrNDFm0SceAgGqneAJ7Scgp2ykRqVDRuOp7c-GCSQqS8grwAtLwAZgB6-OnkSUHB1rZKDijOUVruut78AMo5fGZBVqHlKshqjq7aHl4JkgKCJR32Xc690f11+k2JspowUADm8ESgWQBOEAC2SGogOBBIZCCMWGADcBCXUCA0ABYw9A+IYMyMjDQ49FiMdiQa6PC70ABGMEYAAVFBN2NssKsnjhQTEBgASPCMWAAOhgAEdmFhaBj2iAdvskABmX6nRDndHsNAScmUg6II4nGkzWqeADWrJCFN2HIArHSeTVYiAAFZs0VICXHemM2aeLEAvGE4mkhVUxC0lVIAAsvJlWS4ACp9eLJYgAGzmgaWm3C9mHe3OaUu622pDe7mIM0+9ianEwfFEklk92Kx32kNMjXY7XRvU0RgQqGwsIVECI5GomSUGRAA
  #align(center, commutative-diagram(
    node((1, 0), [$H_n (M|x_i)$]),
    node((0, 1), [$H_n (U_x|x_i)$]),
    node((0, 2), [$H_n (V|y)$]),
    node((1, 1), [$H_(n)(M, M - f^(-1)(y))$]),
    node((1, 2), [$H_n (S^n|y)$]),
    node((2, 1), [$H_(n) (M)$]),
    node((2, 2), [$H_n (S^n)$]),
    arr((0, 1), (1, 0), [$tilde.equiv$], label-pos: right),
    arr((1, 1), (1, 0), [$p_i$]),
    arr((0, 1), (1, 1), [$k_i$]),
    arr((2, 1), (1, 1), [$j$]),
    arr((2, 1), (1, 0), [$tilde.equiv$]),
    arr((1, 1), (1, 2), [$f_*$]),
    arr((2, 1), (2, 2), [$f_*$]),
    arr((0, 1), (0, 2), [$f_*$]),
    arr((0, 2), (1, 2), [$tilde.equiv$]),
    arr((2, 2), (1, 2), [$tilde.equiv$], label-pos: right),
  ))

  Okay a run down of the maps,
  + $f_(*)$: Induced map of $f$.
  + $k_(i)$: Induced map of inclusion of $(U_(x), U_(x) - x) +arrow.r.hook (M, M - f^(-1)(y))$
  + $p_(i)$: Induced from Inclusion.

  Isomorphisms:
  1. $H_(n)(M | x_(i)) tilde.equiv H_(n)(U_(x) | x_(i))$: This is excision, take $A = U_(x)$ and $B = M - x$. Thus $H_(n)(U_(x), U_(x) - x)= H_(n)(A, A inter B) = H_(n)(M, B) = H_(n)(M, M - x)$.
  2. $H_(n)(M) tilde.equiv H_(n)(M mid(|) x_(i))$: Theorem 3.26 from Hatcher
  3. $H_(n)(Y mid(|) y) tilde.equiv H_(n)(S^(n)mid(|)y)$: Same as 1 but for $S^(n)$ instead of $M$.
  4. $H_(n)(S^(n)mid(|)y)tilde.equiv H_(n)(S^(n))$: Both Theorem 26 from Hatcher and LES of $(S^(n), S^(n) - y)$.

  Take $A = union.big_(i=1)^m U_(i)$ and $B = M - f^(-1)(y)$. Then $H_(n)(union.big_(i=1)^m U_(i), union.big_(i=1)^m U_(i) - f^(-1)(y)) = H_(n)(A, A inter B) = H_(n)(M, B) = H_(n)(M, M - f^(-1)(y))$, by excision. Since $U_(i) inter U_(j) = diameter$ for $i != j$, $H_(n)(union.big_(i=1)^m U_(i), union.big_(i=1)^m U_(i) - f^(-1)(y)) = plus.circle.big_(i = 1)^(m) H_(n)(U_(i) | x_(i)) = ZZ^(m)$. The map $p_(i)$, is projection onto the ith component. $k_(i)$ is inclusion into the ith summand. Note $p_(i)k_(j) = 0$ for $i != j$. By the commutativity of bottom left corner, $p_(i)j(1) = 1 => j(1) = (1, #sym.dots.h, 1) = sum_(i = 1)^(m)k_(i)(1)$. Commutativity of upper square, says that $f_(*): H_(n)(M, M - f^(-1)(y)) -> H_(n)(S^(n) mid(|) y)$ takes $k_(i)(1) -> deg f|_(x_(i))$. Thus $f(j(1)) = f(sum_(i)^(m) k_(i)(1)) -> sum_(i = 1)^(m) deg f|_(x_(i))$, which by commutativity, is equal to $deg f$.
]

#theorem[
  For a map $f: M -> N$ between closed connected orientable $n$ manifolds with fundamental classes $[M]$ and $[N]$, the degree of $f$ is defined to be an integer $d$ such that $f_(*)([M]) = d[N]$, so the sign of the degree depends on the choice of fundamental classes. For any closed connected orientable $n"-manifold"$ $M$ there is a degree $1$ map $M -> S^n$
]
#proof[
  Fix $x in M$. Take $U_(x)$, open ball of $x$ homeomorphic to $RR^(n)$. Note that $M slash M - U_(x) = S^(n)$. Then $q: M -> M slash M - U_(x) = S^(n)$, the quotient map. Then $q^(-1)([x]) = {x}$ and $deg f|_(x) = 1$. Thus by @sumoflocaldegrees, $deg f = deg f|_(x) = 1$.
]

== Problem 8
#theorem[
  For a map $f: M -> N$ between closed connected orientable manifolds, suppose $exists B subset N$, a ball, such that $f^(-1)(B) = B_(1) union.sq #sym.dots.h union.sq B_(m)$ each which map homeomorphically to $B$. Then $deg f = sum_(i =1 )^(m) deg f|_(B_(i))$ where $deg f|_(B_(i)) = plus.minus 1$ depending on whether it preserves or reverses the orientation induced from the fundamental classes $[M]$ and $[N]$.
]<sumoflocaldegrees2>
This is just a minor extension of @sumoflocaldegrees.

== Problem 9
#corollary[
  Show that a p-sheeted covering space projection $pi: M -> N$ has degree $plus.minus p$, when $M$ and $N$ are connected, closed, orientable, manifolds.
]
#proof[
  By @sumoflocaldegrees2, $forall x in N$, $exists B$ as described above (specifically $m = p$).$pi$ either preserves or reverses orientation of 1 or all. Thus $deg pi = plus.minus p$.
]


== Problem 10
#theorem[
  Let $f: M -> N$ be degree 1 map of connected closed orientable manifolds. Then $f_(*): pi_(1)(M) -> pi_(1)(N)$ is surjective and $f_(*): H_(1)(M) -> H_(1)(N)$ is surjective.
]
#proof[
  Assume the contrary that $f_(*)$ is not surjective. Let $H = f_(*)(pi_(1)(M)) subset N$. By Proposition 1.36 in Hatcher, $exists p: tilde(N) -> N$ a covering space where $p_(*)(pi_(1)(tilde(N))) = H$. $exists tilde(f): M -> tilde(N)$ such that $f = p compose tilde(f)$.

  1. Suppose $p$ is a finite sheeted covering space, let the number of sheets be $k$. By Problem 9, $deg p = plus.minus k$. Composition of maps implies multiplication of degrees. Thus $1 = deg f = deg p * deg tilde(f) = plus.minus k deg tilde(f)$. Since $deg(tilde(f)) in ZZ => k = 1$ and $deg(tilde(f)) = 1$. Thus $tilde(N) -> N$ is a 1 sheeted covering thus $[H : pi_(1)(N)] = 1 => H = pi_1(N)$.

  2. Suppose $p$ is a infinite sheeted covering space. Then $tilde(N)$ is noncompact. Thus by Proposition 3.29 in Hatcher, $H_(n)(tilde(N)) = 0$. Thus $f_(*): H_(n)(M) -> H_(n)(N)$ factors through 0. Thus f cannot be degree 1. Thus contradiction occurs.

  Thus $f_(*): pi_(1)(M) -> pi_(1)(N)$ is surjective. Since $H_(1)$ is abelianization of $pi_1$. Thus $f_(*)$ is also a surjective homology map.
]

== Problem 11
#theorem[
  Let $M_(g)$ be a closed orientable surface of genus $g$. $exists f: M_(g) -> M_(h)$ degree 1 $<=>$ $g >= h$
]<degreeonemapoforientablesurfaces>
#proof[
  $=>$: Suppose $exists f: M_(g) -> M_(h)$ a degree 1 map. Then $f_(*): H_(1)(M_(g)) ->> H_(1)(M_(h))$ is surjective. We know,

  $
    H_(i)(M_(g)) = cases(
      ZZ "if" i = 2\
      ZZ^(2g) "if" i = 1\
      0 "otherwise"
    )
  $

  Thus there is a surjective function from $ZZ^(2g) -> ZZ^(2h)$. By rank nullity, $2g >= 2h => g >= h$.

  $arrow.l.double$: Suppose $g >= h$. Look at the canonical cell structures of $M_(g)$ and $M_(h)$. They both are 1 two cell, 1 zero cell, and 2g and 2h respectively 1 cells which form the word $a_(1)b_(1)a^(-1)_(1)b^(-1)_(1) #sym.dots.h a_(g)b_(g)a_(g)^(-1)b_(g)^(-1)$ and $a_(1)b_(1)a^(-1)_(1)b^(-1)_(1) #sym.dots.h a_(h)b_(h)a_(h)^(-1)b_(h)^(-1)$. Let $X = union.big_(i = h + 1)^g (a_(i) union b_(i))$. Then $M_(g) slash X = M_(h)$. Thus $q: M_(g) -> M_(g) / X = M_(h)$. The two cells are the fundamental classes of $M_(g)$ and $M_(h)$ and the induced map of $q$ doesn't cause any multiplication.
]

== Problem 12
#theorem[
  Let $F$ be a free group with a basis $x_(1), #sym.dots.h, x_(2k)$, the product $[x_(1), x_(2)] #sym.dots.h [x_(2k - 1), x_(2k)]$ is not equal to a product of fewer than $k$ commutators $[v_(i), w_(i)]$ of $v_(i), w_(i) in F$
]
#proof[
  Assume the contrary that $F$ is a free group with a basis $x_(1), #sym.dots.h, x_(2k)$ and the product $[x_(1), x_(2)] #sym.dots.h [x_(2k - 1), x_(2k)] = product_(i = 1)^(n) [v_(i), w_(i)]$ where $n < k$.

  $
    pi_(1)(M_(k)) & = lr(angle.l a_(1), b_(1), #sym.dots.h, a_(k), b_(k) mid(|) product_(i = 1)^k [a_(i), b_(i)] angle.r) \
    pi_(1)(M_(j)) & = lr(angle.l c_(1), d_(1), #sym.dots.h, c_(j), d_(j) mid(|) product_(i = 1)^j [c_(i), d_(i)] angle.r)
  $

  Let $phi: F -> pi_(1)(M_(k))$ where $x_(2 i - 1) -> a_(i)$ and $x_(2 i) -> y_(i)$. $v_(i)$ and $w_(i)$ are words in $x_(i)$, thus let $V_(i) = phi(v_(i))$ and $W_(i) = phi(w_(i))$.

  $
    product_(i = 1)^(j)[V_(i), W_(j)] & = product_(i = 1)^(j)[phi(v_(i)), phi(w_(j))] \
    & = phi(product_(i = 1)^(j)[v_(i), w_(j)]) \
    & =phi(product_(i = 1)^(k)[x_(2 i - 1), x_(2i)])
    &= product_(i = 1)^(k)[phi(x_(2 i - 1)), phi(x_(2i))]\
    &= product_(i = 1)^(k)[a_(i), b_(i)] \
    &= 1
  $

  Thus $exists tilde(phi): pi_(1)(M_(j)) -> pi_(1)(M_(k))$ such that $c_(i) -> V_(i)$ and $d_(i) -> W_(i)$. Let $f: M_(j) -> M_(k)$, be the map that maps the 2 cell of $M_(j)$ to the loop $product_(i = 1)^(j)[V_(i), W_(j)]$ in $M_(k)$. Since the loop is homotopic to $product_(i = 1)^(k)[a_(i), b_(i)]$, it wraps over $M_(k)$. It maps the 1 face of $M_(j) -> M_(k)$. Thus $f$ is degree 1 and its induced map is $tilde(phi)$. By @degreeonemapoforientablesurfaces, $n >= k$. This is a contradiction.
]

== Problem 13
#theorem[
  Let $M_(h) prime subset M_(g)$ be a compact subsurface with genus $h$, with 1 boundary circle. $M_(h) prime = M_(h) - "open disk"$. If $h > g / 2$, then there is no retraction from $M_(g) -> M_(h) prime$.
]
#proof[
  $forall g / 2 < h < g$, assume the contrary $exists r: M_(g) -> M_(h) prime$ a retraction. Note $g - h < h$, and $M_(h) prime prime = M_(g) - M_(h) prime$ is a genus $g - h$ compact surface.

  $
    pi_(1)(M_(h)) = F_(2h) = lr(angle.l a_(1), b_(1), #sym.dots.h, a_(h), b_(h) angle.r)
  $

  and

  $
    pi_(1)(M_(h) prime prime) = F_(2(g - h)) = lr(angle.l c_(1), d_(1), #sym.dots.h, c_(g - h), d_(g - h) angle.r)
  $

  There are natural maps caused by inclusions of $pi_(1)(M_h)$ into $pi_(1)(M_(g))$ and same with $pi_(1)(M_(g - h))$. Because of these maps,

  $ (product_(i = 1)^(h)[a_(i), b_(i)])(product_(i = 1)^(g - h)[c_(i), d_(i)]) = 1 $

  Let $C_(i) = r_(*)(c_(i))$ and $D_(i) = r_(*)(d_(i))$.

  $
    1 & = phi((product_(i = 1)^(h)[a_(i), b_(i)])(product_(i = 1)^(g - h)[c_(i), d_(i)])) \
    & = (product_(i = 1)^(h)[a_(i), b_(i)])(product_(i = 1)^(g - h)[C_(i), D_(i)]) => (product_(i = 1)^(g - h)[C_(i), D_(i)])^(-1) = product_(i = 1)^(g - h)[D_(g - h - i), C_(g - h - i)] = product_(i = 1)^(h)[a_(i), b_(i)]
  $

  This is a contradiction by problem 12.
]

== Problem 14
Let $X$ be the Hawaiian Earring
#proposition[
  If $f_(n): I -> X$ is a loop based at the origin winding around the $n$th circle, show that the infinite product of commutators $product_(i >= 1)[f_(2i - 1), f_(2i)]$ defines a loop in $X$ that is nontrivial in $H_(1)(X)$.
]
#proof[
  Assume the contrary that $exists (f_(i))$ loops of the Hawaiian earing where $f_(i) != 1$ is a loop which winds around the $i$th circle such that $F =product_(n=1)^(infinity) [f_(2 i - 1), f_(2 i)] in H_1(X)$ is trivial. Thus $exists g in C_(2)(X)$ such that $diff g = F$. Any two cell is a finite linear combination of 2 singular maps $sigma_(j): Delta^2 -> X$. Thus $g = sum_(i = 1)^(n) a_(i) sigma_(j)$. Then the support $s(g) = union.big_(1 <= i <= n) sigma_(j)(Delta^2)$. Since $Delta^2$ is compact, then $sigma_(j)(Delta^2)$ is compact, thus $s(g)$ is compact since the finite union of compact sets is compact.

  $[f_(2i - 1), f_(2i)]$ is a curve which winds around $C_(2 i - 1)$, $C_(2 i)$, $C_(2 i - 1)$, $C_(2 i)$ again. Thus $im([f_(2 i - 1), f_(2 i)]) = C_(2i - 1) union C_(2 i)$. Thus $s(F) = im(F) = union.big_(n >= 0)im([f_(2 n - 1), f_(2 n)]) = union.big_(n >= 0) C_(2i - 1) union C_(2 i) = X$. Since $F = diff g => s(f) subset g(f)$. But $s(f) = X$ and $s(g) subset X$. Contradiction.
]

== Problem 15
#theorem[
  For a $n$-manifold $M$ and a compact subspace $A subset M$, $H_(n)(M, M - A; R) tilde.equiv Gamma_(R)(A)$, of section of the covering space $M_(R) -> M$ over $A$, that is maps, $A -> M_(R)$ whose composition with $M_(R) -> M$ is identity.
]
#proof[
  Let $f: H_(n)(M mid(|) A) -> Gamma_(R)(A)$ where $alpha -> [x -> alpha_(x)]$ where $alpha_(x)$ is the image of $alpha$ in $H_(n)(M mid(|) x)$. Thus $forall alpha, beta in H_(n)(M mid(|) A)$ such that $[x -> alpha_(x)] = [x -> beta_(x)]$. you can extend both sections to $M$, and since they are equal, by 2.27 there must $exists! gamma$ which maps to them both. Thus $alpha = beta$. $f$ being a homomorphism is immediate. $forall gamma in Gamma_(R)(A)$, $tilde(gamma)$ is the extension of $gamma$ as a element of $Gamma_(R)(M)$. By 2.27 in Hatcher $exists! alpha in H_(n)(M divides A)$ such that $f(a) = gamma$.
]

== Problem 16
#theorem[
  $forall alpha in C_(k)(X; R), beta in C^(l)(X; R), gamma in C^m(X; R)$,  $ (alpha frown beta) frown gamma = alpha frown (beta cup gamma) $

  Thus $H_(*)(X; R)$ is a right $H^(*)(X; R)$ module.
]
#proof[$forall alpha in C_(k)(X; R), beta in C^(l)(X; R), gamma in C^m (X; R)$,

  $
    (alpha frown beta) frown gamma &= (beta(alpha|[v_(0), #sym.dots.h, v_(l)]) alpha|[v_(l), #sym.dots.h, v_(k)]) frown gamma \
    &= gamma(beta(alpha|[v_(0), #sym.dots.h, v_(l)]) alpha|[v_(0), #sym.dots.h, v_(m)]) alpha|[v_(m), #sym.dots.h, v_(k)] \
    &= beta(alpha|[v_(0), #sym.dots.h, v_(l)]) times gamma(alpha|[v_(l), #sym.dots.h, v_(l + m)]) alpha|[v_(l + m), #sym.dots.h, v_(k)] \
    &= (beta cup gamma)(alpha[v_(0), #sym.dots.h, v_(l + m)]) alpha|[v_(l + m), #sym.dots.h, v_(k)] \
    &= alpha frown ( beta cup gamma)
  $

  $H_(*)(X; R)$ is a graded $H^*(X; R)$ module as $frown$ gets associativity from above and inherits distributivity.
]

== Problem 17
#theorem[
  Direct limit of exact sequences is exact.
]
#proof[Suppose there is a exact sequence $A_(i) ->^(f_(i)) B_(i) ->^(g_(i)) C_(i)$. There are a compatible set of homomorphisms $alpha_(i, j): A_(i) -> A_(j)$, $beta_(i, j): B_(i) -> B_(j)$, $gamma_(i, j): C_(i) -> C_(j)$, such that the following diagram commutes:

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRAEEB9LEAX1PSZc+QigCM5KrUYs2AIW58BIDNjwEiAJknV6zVohABhRf0FqRRMmKl7ZhrgCsl54RvGkbumQZALnZipC6qLI2l7S+mwmAVIwUADm8ESgAGYAThAAtkhkIDgQSADM1Ax0AEYwDAAKwZaG6VgJABY4IN5RhoxozXScABRYpI4AlC4gGdlIEvmFiAAsHfYglTh9g8NjgZM5iNqzSACspRVVtRbuIAwwqW1Lvgl0WVnrQ6PjO7nUBdP3bKmmZSfRAzH57P6GBKAtKZXYlA4LCETTgBIGwpCLBHHSLLKE8XgUXhAA
  #align(center, commutative-diagram(
    node((0, 0), [$A_i$]),
    node((0, 1), [$B_i$]),
    node((0, 2), [$C_i$]),
    node((1, 0), [$A_j$]),
    node((1, 1), [$B_j$]),
    node((1, 2), [$C_j$]),
    arr((0, 0), (1, 0), [$alpha_(i,j)$], label-pos: right),
    arr((0, 1), (1, 1), [$beta_(i,j)$]),
    arr((0, 2), (1, 2), [$gamma_(i,j)$], label-pos: left),
    arr((0, 0), (0, 1), [$f_i$]),
    arr((0, 1), (0, 2), [$g_i$]),
    arr((1, 0), (1, 1), [$f_j$]),
    arr((1, 1), (1, 2), [$g_i$]),
  ))

  This forms a directed system of exact sequences. Let $f: lim_(<-) A_(i) -> lim_(<-) B_(i)$ where $[(i, a)] -> [(i, f_(i)(a))]$ and $g: lim_(<-) B_(i) -> lim_(<-) C_(i)$ where $[(i, b)] -> [(i, g_(i)(c))]$. Suppose $[(i, x)] = [(i, y)] in lim_(<-) A_(i)$. WLOG $j >= i$. $exists k >= j$ such that $alpha_(i,k)(x) = alpha_(j, k)(y) => f_(k)(alpha_(i, k)(x)) = f_(k)(alpha_(i, k)(y))$. By the commuting diagram:

  $ beta_(i, k)(f_(i)(x)) = f_(k)(alpha_(i, k)(x)) = f_(k)(alpha_(i, k)(y)) = beta_(j, k)(f_(j)(y)) $

  Thus by definition of direct limit, $f([i, x]) = [(i, f_(i)(x))] = [(j, f_(j)(y))] = f([j, y])$. Thus $f$ is well defined. For the same argument $g$ is well defined.

  1. *$ker(g) subset im(f)$* $forall [(i, x)] in ker(g)$, thus $g([(i, x)]) = [(i, g_(i)(x))]$, and $exists j>= i in.rev [(i, g_(i)(x))] = [(j, 0)]$ . Note that $[(i, x)] = [(j, beta_(i, j)(x))] = [(j, x prime)]$. Thus $x prime in ker(g_(j))$. By exactness of $g_(j)$, $exists y in A_(j) in.rev f_(j)(y) = x prime$. Thus $f([j, y]) = [(j, x prime)]$
  2. *$im(f) subset ker(g)$*: $forall [(i, a)] in lim_(<-) A_(i)$, $g(f([(i, a)])) = g([(i, f_(i)(a))]) = [(i, g_(i)(f_(i)(a)))] = [(i, 0)]$. Thus $im(f) subset ker(g)$.

  Thus $ lim_(<-)(A_(i)) ->^(f) lim_(<-)B_(i) ->^g lim_(<-)C_(i) $ is exact.
]
#theorem[
  If ${C^(i), f^(i j)}$ is a directed system of chain complexes, with $f^(i j): C^i -> C^j$ chain maps, then $ H_(n)(lim_(i -> infinity) C^i ) = lim_(i -> infinity) H_(n)(C^i) $
]
#proof[
  Let $Z_(n)^i = ker(delta_(n)^i : A_(n)^i -> A_(n + 1)^i)$ (cycles) and $B_(n)^i = im(delta_(n + 1)^i)$ (boundaries). Thus we have a exact sequence,

  $ 0 -> Z_(n)^i -> C_(n)^i ->^(delta_(n)) B_(n - 1)^i -> 0 $
]

== Problem 18
#theorem[
  Directed limit of torsion free abelian groups is torsion free.
]

== Problem 19
== Problem 20
#theorem[
  $H_(c)^0(X; G) = 0$ if $X$ is path connected and noncompact
]
#proof[
  $ H_(c)^0(X; G) := lim_(-->) H^0(X|K; G) $

  We have $G$ coefficents from now on. Let $K$ be a compact subset of $X$. Then we have the LES,

  $ #sym.dots.h <- H^1(X) <- H^(0)(X - K) <-^(i^*) H^0(X) <-^(j^*) H^0(X|K) <- 0 $

  $j^*$ is injective. $H^0(X) tilde.equiv G$, since $X$ is path connected. $forall [x] in H^0(X)$, $x$ is a constant function. $i^*([x]) = [x compose i]$, so it takes a constant function and restricts the domain to $X - K$. $forall k in ker(i^(*))$, $i([k]) = [k compose i] = 0 =>$k is a constant function whose restriction to $X - K$ is 0. Thus $k = 0$. Thus $im(j^*) = ker(i^*) = 0 => H^0(X|K) = 0$. Thus $H_(c)^(0)(X; G) = 0$.
]

== Problem 21
#theorem[
  For a space $X$, let $X^+$ be its one point compactification. If the added point $infinity$, has a neighborhood in $X^+$ that is a cone with $infinity$ as the cone point, then $H^n_(c)(X; G) -> H^n (X^+, infinity; G)$ is a isomorphism for all $n$.
]
#proof[

  $ H_(c)^0(X; G) := lim_(-->) H^0(X|K_i; G) $

  Let $K$ be any compact set of $X$. $H^(n)(X, X - K) = H^n (X^+ - infinity, X^+ - K - infinity) = H^n (X^+, X^+ - K)$, by excision. Take $U_(K) = X^+ - K$ and use the LES of $(X^+, U_(K))$.

  $
    #sym.dots.h <- tilde(H)^n (U_(K)) <- tilde(H)^(n)(X^(+)) <- tilde(H)^(n)(X^+|K) <- tilde(H)^(n - 1)(U_(K)) <- #sym.dots.h
  $

  Consider $K$ compacts sets of $X^+$ that are complements of neighborhoods of $infinity$, such the complments of $K$ are subneighborhoods of the cone neighborhood.Thus $tilde(H)^(n)(U_(K)) = 0$ for all $n$. Thus $tilde(H)(X^(+)|K) tilde.equiv tilde(H)^(n)(X^(+)) = H^(n)(X^(+), infinity)$. Thus

  $ H^(0)_(c)(X; G) = lim_(-->) H^n (X^+, X^+ - K) = lim_(-->)H^(n)(X^(+), infinity) = H^(n)(X^(+), infinity) $
]

== Problem 22
#theorem[
  $ H_c^n (X times RR; G) tilde.equiv H_(c)^(n - 1)(X ; G) $
]
#proof[Let $K subset X$ be a compact set in $X$. Then $K times [-N, N]$ is compact in $X times RR$. Look at $ A & = X times (-1, infinity) \
  B & = X times (-infinity, -1) $

  Thus $A union B = X times RR$. Let $ C & = A - (K times [-N, N]) \
  D & = B - (K times [-N, N]) $

  $(A, C)$ and $(B, C)$ deformation retract to $(X, X)$ where each copy of $X$ is identified with a homeomorphic copy of $X$ is $X times RR$. $(A inter B, C inter D)$ deformation retracts to $(X, X - K)$. We have the following relative Mayer Vitoris Sequence

  $
    #sym.dots.h -> H^n (X times RR, X times RR - (K times [-N, N])) -> H^n (A, C) xor H^(n)(B, D) ->^+ H^n (A inter B, C inter D) -> #sym.dots.h
  $

  Since $(A, C)$ and $(B, C)$ deformation retract to $(X, X)$, then $H^(n)(A, C) = 0 = H^n (B, D)$. Thus we have a isomorphism between $H^n (A inter B, C inter D) = H^n (X, X - K)$

]

== Problem 23

== Problem 24
#theorem[
  Let $M$ be a closed connected 3 manifold, and write $H_(1)(M; ZZ)$ as $ZZ^r xor F$ where $r = rank(H_(1)(M; ZZ))$ and $F$ is a finite group. $H_(2)(M; ZZ) = ZZ^r$ if $M$ is orientable and $ZZ^(r - 1) xor ZZ_(2)$ if $M$ is non-orientable. In particular, $r >= 1$ when nonorientable.
]
#proof[
  By Corollary 3.37, $chi(M) = 0$. Thus $ chi(M) = sum_(n = 0)^(3) (-1)^n rank(H_(n)(M; ZZ)) & = 1 - r + rank(H_(2)(M; ZZ)) + bb(1)_("orientable") = 0 $

  Thus $ rank(H_(2)(M; ZZ)) = cases(r & "M is orientable", r - 1 & "otherwise") $

  By Corollary 3.28, the torsion subgroup of $H_(2)(M; ZZ)$ is $0$ if orientable and $ZZ_(2)$ otherwise. Thus $ H_(2)(M; ZZ) = cases(
    ZZ^r & "orientable", ZZ^(r - 1) xor ZZ_(2) & "nonorientable"
  ) $
]

== Problem 25
#theorem[
  If a closed orientable manifold $M$ of dimension $2k$ has $H_(k - 1)(M; ZZ)$ torsionfree then $H_(k)(M; ZZ)$ is also torsionfree
]
#proof[
  By the Universal coefficent theorem for cohomology,

  $ 0 -> Ext(H_(k - 1)(M; ZZ), ZZ) -> H^(k)(M; ZZ) -> hom(H_(k)(M; ZZ), ZZ) -> 0 $

  splits. If $H_(k - 1)(M; ZZ)$ is torsion free its free, thus $Ext(H_(k - 1)(M; ZZ), ZZ)$ is free. Furthermore, $hom(H_(k)(M; ZZ), ZZ)$ is free. Thus $H^k (M; ZZ)$. By Poincare Duality, $H^k (M; ZZ) = H_(k)(M; ZZ)$ is free.
]

== Problem 26
#proposition[

]
#proof[
  All coefficents are $ZZ$ coefficients unless otherwise stated. Let $M = S^2 times S^8 sharp S^4 times S^6$
  By Poincare Duality, $H^(k)(M) = H_(n - k)(M)$.
  By @3.6a, $H_(i)(M) = H_(i)(S^2 times S^8) xor H_(i)(S^4 times S^6)$ for $0 < i < 10$. Thus $ H^(k)(M) & = H_(n - k)(S^2 times S^8) xor H_(10 - k)(S^4 times S^6) $ for $0 < k < 10$.

  As a CW complex, $S^2 times S^8$ has a 0 cell, a 2 cell, a 8 cell, and a 10 cell. $ H_(i)(S^2 times S^8) := cases(
    ZZ "if" i in [0, 2, 8, 10], 0 "otherwise"
  ) $

  Similarly, as a CW complex, $S^4 times S^6$ has a 0 cell, 4 cell, 6 cell, and a 10 cell. Thus $ H_(i)(S^4 times S^6) := cases(
    ZZ "if" i in [0, 4, 6, 10], 0 "otherwise"
  ) $

  Thus $ H^k (M) := cases(ZZ "if" k in {0, 2, 4, 6, 8, 10}, 0 "otherwise"). $ Note $H^10 (M ) = H_(0)(M) = ZZ$ and $H^0 (M) = ZZ$ by connectivity. Let $alpha_(k)$ be the generator of $H^k (M)$. Let $[M]$ be the fundamental class of $M$. Look at the cohomology pair $( M, S^9)$ where $S^9$ is the specific $S^9$ which producted the connected sum.

  $
    #sym.dots.h <- H^k (S^(9)) <- H^k (M) <- H^(k) (M, S^9) = H^(k) ((S^2 times S^8) or (S^4 times S^6)) <- H^(k - 1)(S^9) <- #sym.dots.h
  $

  For $0 < k < 9$, $H^k (M) -> H^k (S^2 times S^8) xor H^k (S^4 times S^6)$ is a isomorphism. Thus $alpha_(2) cup alpha_(4) = 0$, $alpha_(2) cup alpha_(2) = 0$, and $alpha_(2) cup alpha_6 = 0$. By *perfect pairing*, $alpha_(4) cup alpha_(6) = alpha_(6) cup .4 = alpha_(10) = alpha_(2) cup alpha_(8) = alpha_(8) cup alpha_(2)$. Thus $ H^*(M) := (ZZ[alpha_(2), alpha_(4), alpha_(6), alpha_(8), alpha_(10)])/(alpha_(i)^2, alpha_(i) alpha_(j) (i + j != 10)) $
]

== Problem 27
Look at Bilinear forms in Algebra II

== Problem 28
#theorem[
  Show that a nonsingular symmetric or skew symmetric bilinear form over a field, $FF$ , of the form $FF^n times FF^n -> FF$, cannot be identically $0$ when restricted to $V subset FF^n$ a $k$-dimensional subspace for $k > (n)/(2)$
]
#proof[
  Let $f: FF^n times FF^n -> FF$ be a  nonsingular symmetric or skew symmetric bilinear form. Let $V subset FF^n$ and $V times V subset ker f$. Assume the contrary $dim V = k > (n)/(2)$. Let $v_(1), #sym.dots.h, v_(k) in V$ be a basis for $V$. Extend this basis to $FF^n$. Thus $[b_(1), #sym.dots.h, b_(n)] = [v_(1), #sym.dots.h, v_(k), w_(1), #sym.dots.h, w_(n - k)]$ is a basis for $V$. Let $B = [f(b_(i), b_(j))]_(1 <= i, j <= n)$. $ B = mat(0_(k times k), *; *, *) = mat(0_(k times k), *; 0, 0_((n - k) times (n - k))) + mat(0_(k times k), 0; *, *) $.

  Thus $ rank(B) & <= rank(mat(0_(k times k), *; 0, 0_((n - k) times * (n - k)))) + rank(mat(0_(k times k), 0; *, *)) \
          & <= (n - k) + (n - k) = 2(n - k) \
          & < n. $ Thus by rank nullity, $dim ker(B) >= 1.$ Thus there is $x != 0$ such that $B x = 0$. But $ f(b_(i), sum_(i = 1)^(n) x_(i) b_(i)) = 0, $ thus $forall y in FF^n$, $f(y, x) = 0 => x$ is a null vector. Thus $f$ is not nonsingular.
]

== Problem 29
#theorem[
  If a closed orientable surface $M_(g)$ of genus $g$ retracts onto a graph $X subset M_(g)$, then $rank(H_1(X)) <= g$
]
#proof[
  Suppose $X subset M_(g)$ is graph. Use $RR$ coefficients unless otherwise indicated.   Suppose $r: M_(g) ->> X$ is a retraction. Thus $r^(*): H^(1)(X) ->> H^(1)(M_(g))$ is a injection and $i^(*): H^(1)(M_(g)) -> H^(1)(X)$ is a surjective. Look at the bilinear form induced by the cup product.

  $
    H^(1)(M_(g)) times H^(1)(M_(g)) & -> RR \
                             (a, b) & -> (a cup b)[M_(g)]
  $

  The cup product pairing is nonsingular by Proposition 2.38. $forall a, b in H^(1)(X)$, $ (r^(*)a cup r^(*)b)[M_(g)] = r^(*)(a cup b)[M_(g)] = r^(*)(0)[M_(g)] = 0 $ since X is a graph and $H^(2)(X) = 0$. Thus the bilinear form is identically 0 on $H^(1)(X) <= H^(1)(M_(g))$. By Problem 28, $dim H^(1)(X) <= (1)/(2)dim H^(M_(g)) = g$. $dim H_(1)(X) = dim H^(1)(X)$ and $H_(1)(X; ZZ) = H_(1)(X) times.circle ZZ$. Thus $rank(H_(1)(X; ZZ)) <= g$.
]

== Problem 30
#theorem[Boundary of a R orientable Manifold is also R-orientable]
#proof[
  Let $M$ be a $R$-orientable manifold with boundary. $exists W subset M$ containing $diff M$ where $phi: diff M times [0, 1) -> W$ is a homemorphism where $phi|_(diff M times {0}) = id_(diff M)$. Fix a $epsilon in (0, 1)$. $forall x in diff M$, let $V subset W$ be a neighborhood of $v$. Let $U = phi(V times [0, epsilon)) subset W$. By R-orientablility of M, $U - diff U$ is R orientable because $U -diff U= V times (0, epsilon)$ is R-orientable. $V times (0, epsilon) -> V$ projection is a homotopy equivalence so it induces an isomorphism on homology. Thus a local orientation is defined for $V$. Since $M - diff M$ is orientable this process is coherant and consistant for any choice of $x$.
]

= General Kunneth's Formula
== Problem 1
#theorem[

]
#proof[
  Assume $ZZ$ coefficents are being used. $H^i (RR P^m times RR P^(n)) = plus.circle.big_(n = 0)^(i) H^(i)(RR P^(m)) times.circle H^(n - i)(RR P^(n))$. $forall m in NN$, $ H^(i)(RR P^m) & = cases(
                    ZZ "if" i= 0 "or" i = m "and" i equiv 1 mod 2,
                    ZZ_(2) "if" i = 0 mod 2, 0 "otherwise"
                  ) $

  Thus $ H^(i)(RR P^m times RR P^(n)) = cases() $
]

== Problem 2
#theorem[

  Let $C$ and $C prime$ be chain complexes and I be a chain complex consisting of $ZZ$ in dimension 1 and $ZZ^(2) = ZZ[v_1, v_2]$ in dimension 0, with a boundary map taking a generator $e$ to the difference of $v_2 - v_1$ for dimension 0. A chain map $f: I times.circle C -> C prime$ is the same as a chain homotopy between the two chain maps $f_(i): C -> C prime$ where $c -> f(v_(i) times.circle c)$. [The chain homotopy is $h(c) = f(e times.circle c)$ ]
]
#proof[
  We need to show $diff h + h diff = f_2 - f_1$. Take $forall a in C$, $(f_(2) - f_(1))(a) = f(v_(2) times.circle a) - f(v_(1) times.circle a) = f((v_(2) - v_1) times.circle a) = f(diff e times.circle a)$.

  $
    (diff h + h diff)(a) & = diff f(e times.circle a) + f(e times.circle diff a) \
                         & = f(diff(e times.circle a)) + f(e times.circle diff a) \
                         & = f(diff e times.circle a + (-1)^1 e times.circle diff a + e times.circle diff a) \
                         & = f(diff e times.circle a) = (f_2 - f_1)(a)
  $

  Thus $h$ is a chain homotopy.

  Let $h$ be a chain homotopy between $f_1$ and $f_2$. $I$ has 3 generators, $v_1$, $v_2$, and $e$. Let $f: I times.circle C -> C prime$ where $forall c in C$

  $
    f(v_1 times.circle c) & = f_1(c) \
    f(v_2 times.circle c) & = f_(2)(c) \
      f(e times.circle c) & = h(c)
  $

  $
    f(diff(e times.circle c)) & = f((v_(2) - v_1) times.circle c - e times.circle diff c) \
                              & = f_2(c) - f_1(c) - h(diff c) \
                              & = (f_(2) - f_1)(c) - (h diff)(c) \
                              & = diff h(c) = diff f(e times.circle c)
  $

  $
    f(diff(v_1 times.circle c)) & = f(v_1 times.circle diff c) \
                                & = f_1(diff c) \
                                & = diff f_1(c) \
                                & = diff f(v_1 times.circle c )
  $

  $ f(diff(v_2 times.circle c)) & = f_2(diff c ) = diff f_2(c) = diff f(v_2 times.circle c). $
]

== Problem 3
#theorem[
  Show that the splitting in the topological Kunneth formula cannot be natural by con-
  sidering the map $f times 1 1 : M(ZZ_(m),n) times M(ZZ_(m),n) -> S^(n + 1) times M(ZZ_(m),n)$ where f collapses
  the n skeleton of $M(Z_(m),n)=S^(n) union e^(n + 1)$ to a point.
]
#proof[
  Let $f times id_(M(ZZ_(m), n)) = M(ZZ_(m), n) times M(ZZ_(m), n) -> S^(n + 1) times M(ZZ_(m), n)$ where f collapses the n skeleton of $M(ZZ_(m), n)$. Thus $f_(*): H_(n)(M(ZZ_(m), n)) = ZZ_(m) -> H_(n)(S^(n + 1)) = 0$. Let $X = M(ZZ_(m), n) = Y$
  We have the following splitting sequence, $ 0 -> plus.circle.big_(i)(H_(i)(X) times.circle_(R) H_(n - i)(Y)) -> H_(n)(X times Y) -> plus.circle.big_(i) Tor(H_(i)(X), H_(n - i - 1)(Y)) -> 0 $

  Note $ H_i (M(Z_m, n)) := cases(ZZ_m "if" i = n, 0 "otherwise") $

  Thus $Tor(H_(n)(X), H_((2n + 1) - n - 1)(Y)) = Tor(H_(n)(X), H_(n)(Y)) = Tor(ZZ_(m), ZZ_(m)) = ZZ_(m)$. Thus $H_(2n + 1)(X times Y) = H_(n)(X) times.circle 0 + 0 times.circle H_(n)(Y) xor ZZ_(m) =ZZ_(m)$

  In the target space we have the following split exact sequence:

  $
    0 -> plus.circle.big_(i)(H_(i)(S^(n)) times.circle_(R) H_(n - i)(M(ZZ_(m), n))) -> H_(n)(S^(n) times M(ZZ_(m), n)) -> plus.circle.big_(i) Tor(H_(i)(S^(n)), H_(n - i - 1)(M(ZZ_(m), n))) -> 0
  $

  Thus $Tor(H_(n)(S^(n + 1)), H_((2 n + 1) - n - 1)(M(ZZ_(m), n))) = Tor(0, ZZ_(m)) = 0$ and $Tor(H_(n + 1)(S^(n + 1)), H_((2n + 1) - (n + 1) - 1)(Y)) = 0$ . $H_(n + 1)(S^n) xor H_((2n + 1) - n - 1)(Y) = ZZ xor ZZ_(m) = ZZ_(m)$. Thus $H_(2 n + 1)(S^(n) times Y) = ZZ_(m)$.

  Thus we have the following commutative diagram if the Kunneth splitting was natural:

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRABUIAnACgAkA+mB4ANAJSkABIOEBNMWJABfUuky58hFAEZyVWoxZtBPAExhJAaknaxoyXgC28SfOWqQGbHgJEy2-XpmVkQObn4hHgBlAD0eC2tbCWlI+UUVNW9NIl0A6iCjUJNzKxs7WPjS2wcsZzhXdP0YKABzeCJQADMuCEckMhAcCCRTagY6ACMYBgAFdR8tEC4sFoALHBB8wxCw3k6BACopCYmeW0P0j27e-uohpF0DYLY4AXsnFzcMkGu+xFHBsNEABmLbPUIAEle0TiCTKNTqDQhmxA4yms3m2VCyzWG2+vwedyBoKehRAPH2BwRLhOZwUh2UFCUQA
  #align(center, commutative-diagram(
    node((0, 0), [$ZZ_(m) = Tor(H_n (X), H_n (Y))$]),
    node((0, 1), [$H_(2n + 1)(X times Y) = ZZ_(m)$]),
    node((1, 0), [$Tor(H_n (S^(n + 1)), H_n (Y)) = 0$]),
    node((1, 1), [$H_(2n + 1)(S^(n + 1) times Y) = ZZ_(m)$]),
    arr((0, 0), (1, 0), [$Tor(f_*, bb(1)_*)$], label-pos: right),
    arr((0, 0), (0, 1), [$s_(X times Y)$]),
    arr((1, 0), (1, 1), [$s_(S^(n + 1) times Y)$], label-pos: right),
    arr((0, 1), (1, 1), [$(f times bb(1))_*$]),
  ))

  where $s_(X times Y)$ is a isomorphism and $Tor(f_(*), bb(1)_(*))$ is the 0 map. It suffices to show that $(f times 1)_(*)$ is not the 0 map.


  Let $u in H_(n + 1)(X, S^(n)) tilde.equiv ZZ$ be the generator corresponding to the relative cycle $(n + 1)-$cell of $X$. Let $v in H_(n)(X) tilde.equiv ZZ_(m)$ be the generator corresponding to the cycle of $S^(n)$. The cross product gives us a map $times: H_(n + 1)(X, S^n) times.circle H_(n)(Y) -> H_(2n + 1)(X times Y, S^n times Y) tilde.equiv ZZ_(m)$ where $u times.circle v$ is the generator of $H_(2n + 1)(X times Y, S^n times Y)$ and generator of $H_(2n + 1)(X times Y)$ maps to $u times.circle v$ under inclusion. $f_(*)$ takes the relative cycle of the n+1 cell to the same thing so its a isomorphism. By the naturality of the cross product $(f times 1)_(*) compose times.circle = times.circle compose (f_(*) times.circle 1_(*))$. Lets track $u times.circle v$. $(f times 1)_(*)(u times.circle v) = (f times 1)_(*)(u times v)$. $times.circle((f_(*) times.circle 1_(*))(u times.circle v)) = times.circle(f_(*)(u) times.circle v) = f_(*)(u) times.circle v = u prime times.circle v$. $u prime$ is the generator of $H_(n + 1)(S^(n + 1))$. Thus $u prime times.circle v$ is the generator of $H_(2n + 1)(S^(n + 1) times Y)$. Thus $(f times 1)_(*)$ sends generator to generator and thus must be a isomorphism and cannot be 0 map. Thus by contradiction Kunneth Splitting is not natural.
]

== Problem 4
#theorem[
  Cross product of the fundamental classes of closed $R-$orientable maninfolds $M$ and $N$ is the fundamental class of $M times N$
]
#proof[
  Let $m$ and $n$ be the dimensions of $M$ and $N$.
  We have the following splitting sequence, $ 0 -> plus.circle.big_(i) H_(i)(M) times.circle H_((m + n) - i)(N) -> H_(m + n)(M times N) -> plus.circle.big_(i) Tor(H_(i)(M), H_((m + n) - i + 1)(N)) -> 0 $

  Since $forall i < m$, $m + n - i > m => H_((m + n) - i)(N) = 0$. Similarly, $forall i > m$, $H_(i)(M) = 0$. Thus if $i != m$, $H_(i)(M) times.circle H_((m + n) - i)(N) = 0$. Thus $ plus.circle.big_(i) H_(i)(M) times.circle H_((m + n) - i)(N) = H_(m)(M) times.circle H_(n)(N) $

  Since $forall i < m + 1$, $m + n - i + 1 > n => H_((m + n) - i + 1)(N) = 0$. Thus if $i > m$ and $i < m + 1$, $Tor(H_(i)(M), H_((m + n) - i + 1)(N)) = 0$. Thus $forall 0 <= i <= (m + n)$ $Tor(H_(i)(M), H_((m + n) - i + 1)(N)) = 0$. Thus $H_(m + n)(M times N) = H_(m)(M) times.circle H_(n)(N)$. $[M] times.circle [N]$ is a generator of $H_(m)(M) times.circle H_(n)(N)$. Thus under the cross product isomorphism where $[M] times.circle [N] -> M times N$  it is a generator of $H_(n + m)(M times N)$ and thus its fundamental class.
]

== Problem 5
#theorem[
  Show that slant products $ slash: H_(n)(X times Y; R) times H^(j)(Y; R) & -> H_(n - j)(X; R), & (e^(i) times e^(j), phi) -> phi(e^(j))e^(i) \
  backslash: H^(n)(X times Y; R) times H_(j)(Y; R) & -> H^(n - j)(X; R), &(phi, e^(j)) -> (e^(i) -> phi(e^(i)times e^(j))) $

  are well defined
]
#proof[
  1. Note ${e^(i) times e^(n - i) mid(|) i in [0, #sym.dots.h, n]}$ is a basis for $C_(n)(X times Y)$. $forall i in [0, #sym.dots.h, n]$ and $phi in C^(j)$

  $ (e^(i) times e^(n - i)) slash phi = phi(e^(n - i))e^(i) = cases(phi(e^(j)) e^(i) "if " n - i = j, 0 "otherwise") $

  Thus $ partial_(X)((e^(i) times e^(n - i)) slash phi) &= partial_(X)(phi(e^(n - i)) e^(i)) \ &= phi(e^(n - i)) partial_(X)(e^(i))\ &= (partial_(X)(e^(i)) times e^(n - i)) slash phi\
  &= (diff_(X times Y)(e^(i) times e^(n - i))) slash phi - (-1)^(i) (e^(i) times diff_(Y)(e^(n - i))) slash phi \
  &= diff_(X times Y)(e^(i) times e^(n - i))) slash phi - (-1)^(i) phi(diff_(Y)(e^(n - i)))e^(i) \
  &= diff_(X times Y)(e^(i) times e^(n - i))) slash phi + (-1)^(i + 1) (delta phi)(e^(n - i))e^(i) \
  &= diff_(X times Y)(e^(i) times e^(n - i))) slash phi + (-1)^(i + 1) (e^(i) times e^(n - i)) slash delta phi \ $

  The formula holds by linearity to all $c in C_(n)(X times Y)$. $forall c in C_(n)(X times Y)$ cycles (ie $diff_(X times Y)(c) = 0$) and $forall in C^(j)(Y)$ cocycles (ie $delta phi = 0$), $ partial_(X)(c slash phi) = partial(c) slash phi + (-1)^(i + 1)c slash delta phi = 0 + 0 $

  Thus the slant product of a cycle and cocycle is a cycle. $forall w in C_(n + 1)(X times Y)$ and $forall in C_(n)(X times Y)$ cycles,

  $
    (z + diff w) slash phi & = z slash phi + (diff w) slash phi \
                           & = z slash phi + (diff_(X)(w slash phi) - (-1)^(n - j)w slash delta phi) \
                           & = z slash phi + diff_(X)(w slash phi)
  $

  Thus $[(z + diff w) slash phi] = [z slash phi + diff_(X)(w slash phi)] = [z slash phi]$

  $forall phi in C^(n)(Y)$ cycles and $forall psi in C^(n - 1)(Y)$:

  $
    z slash (phi + delta psi) & = z slash phi + z slash delta psi \
                              & = z slash phi + (-1)^(n - j)(diff(c) slash psi - partial_(X)(c slash psi)) \
                              & ~ z slash phi
  $

  Thus $[z slash (phi + delta psi)] = [z slash phi]$. Thus $slash$ is well defined. The arguement is symmetric for $backslash$.
]
