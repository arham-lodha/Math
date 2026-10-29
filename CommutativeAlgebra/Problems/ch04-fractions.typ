#import "prelude.typ": *
#show: standalone.with(chapter: 3)

= Rings and Modules of Fractions

#exercise[
  Let $S$ be a multiplicatively closed subset of a ring $A$, and let $M$ be a finitely generated $A$-module. Prove that $S^(-1) M = 0$ if and only if there exists $s in S$ such that $s M = 0$.
]

#exercise[
  Let $a$ be an ideal of a ring $A$, and let $S = 1 + a$. Show that $S^(-1) a$ is contained in the Jacobson radical of $S^(-1) A$.

  Use this result and Nakayama's lemma to give a proof of (2.5) which does not depend on determinants. [If $M = a M$, then $S^(-1) M = (S^(-1) a)(S^(-1) M)$, hence by Nakayama we have $S^(-1) M = 0$. Now use Exercise 1.]
]

#exercise[
  Let $A$ be a ring, let $S$ and $T$ be two multiplicatively closed subsets of $A$, and let $U$ be the image of $T$ in $S^(-1) A$. Show that the rings $(S T)^(-1) A$ and $U^(-1)(S^(-1) A)$ are isomorphic.
]

#exercise[
  Let $f: A -> B$ be a homomorphism of rings and let $S$ be a multiplicatively closed subset of $A$. Let $T = f(S)$. Show that $S^(-1) B$ and $T^(-1) B$ are isomorphic as $S^(-1) A$-modules.
]

#exercise[
  Let $A$ be a ring. Suppose that, for each prime ideal $p$, the local ring $A_p$ has no nilpotent element $!= 0$. Show that $A$ has no nilpotent element $!= 0$. If each $A_p$ is an integral domain, is $A$ necessarily an integral domain?
]

#exercise[
  Let $A$ be a ring $!= 0$ and let $Sigma$ be the set of all multiplicatively closed subsets $S$ of $A$ such that $0 in.not S$. Show that $Sigma$ has maximal elements, and that $S in Sigma$ is maximal if and only if $A - S$ is a minimal prime ideal of $A$.
]

#exercise[
  A multiplicatively closed subset $S$ of a ring $A$ is said to be *saturated* if
  $ x y in S <=> x in S "and" y in S. $
  Prove that
  + $S$ is saturated $<=> A - S$ is a union of prime ideals.
  + If $S$ is any multiplicatively closed subset of $A$, there is a unique smallest saturated multiplicatively closed subset $overline(S)$ containing $S$, and that $overline(S)$ is the complement in $A$ of the union of the prime ideals which do not meet $S$. ($overline(S)$ is called the *saturation* of $S$.)

  If $S = 1 + a$, where $a$ is an ideal of $A$, find $overline(S)$.
]

#exercise[
  Let $S, T$ be multiplicatively closed subsets of $A$, such that $S subset.eq T$. Let $phi: S^(-1) A -> T^(-1) A$ be the homomorphism which maps each $a\/s in S^(-1) A$ to $a\/s$ considered as an element of $T^(-1) A$. Show that the following statements are equivalent:
  + $phi$ is bijective.
  + For each $t in T$, $t\/1$ is a unit in $S^(-1) A$.
  + For each $t in T$ there exists $x in A$ such that $x t in S$.
  + $T$ is contained in the saturation of $S$ (Exercise 7).
  + Every prime ideal which meets $T$ also meets $S$.
]

#exercise[
  The set $S_0$ of all non-zero-divisors in $A$ is a saturated multiplicatively closed subset of $A$. Hence the set $D$ of zero-divisors in $A$ is a union of prime ideals (see Chapter 1, Exercise 14). Show that every minimal prime ideal of $A$ is contained in $D$. [Use Exercise 6.]

  The ring $S_0^(-1) A$ is called the *total ring of fractions* of $A$. Prove that
  + $S_0$ is the largest multiplicatively closed subset of $A$ for which the homomorphism $A -> S_0^(-1) A$ is injective.
  + Every element in $S_0^(-1) A$ is either a zero-divisor or a unit.
  + Every ring in which every non-unit is a zero-divisor is equal to its total ring of fractions (i.e., $A -> S_0^(-1) A$ is bijective).
]

#exercise[
  Let $A$ be a ring.
  + If $A$ is absolutely flat (Chapter 2, Exercise 27) and $S$ is any multiplicatively closed subset of $A$, then $S^(-1) A$ is absolutely flat.
  + $A$ is absolutely flat $<=> A_m$ is a field for each maximal ideal $m$.
]

#exercise[
  Let $A$ be a ring. Prove that the following are equivalent:
  + $A \/ fN$ is absolutely flat ($fN$ being the nilradical of $A$).
  + Every prime ideal of $A$ is maximal.
  + $Spec(A)$ is a $T_1$-space (i.e., every subset consisting of a single point is closed).
  + $Spec(A)$ is Hausdorff.

  If these conditions are satisfied, show that $Spec(A)$ is compact and totally disconnected (i.e. the only connected subsets of $Spec(A)$ are those consisting of a single point).
]

#exercise[
  Let $A$ be an integral domain and $M$ an $A$-module. An element $x in M$ is a *torsion element* of $M$ if $"Ann"(x) != 0$, that is if $x$ is killed by some non-zero element of $A$. Show that the torsion elements of $M$ form a submodule of $M$. This submodule is called the *torsion submodule* of $M$ and is denoted by $T(M)$. If $T(M) = 0$, the module $M$ is said to be *torsion-free*. Show that
  + If $M$ is any $A$-module, then $M \/ T(M)$ is torsion-free.
  + If $f: M -> N$ is a module homomorphism, then $f(T(M)) subset.eq T(N)$.
  + If $0 -> M' -> M -> M'' -> 0$ is an exact sequence, then the sequence $0 -> T(M') -> T(M) -> T(M'')$ is exact.
  + If $M$ is any $A$-module, then $T(M)$ is the kernel of the mapping $x |-> 1 times.circle x$ of $M$ into $K times.circle_A M$, where $K$ is the field of fractions of $A$.

  [For iv), show that $K$ may be regarded as the direct limit of its submodules $A xi$ $(xi in K)$; using Chapter 1, Exercise 15 and Exercise 20, show that if $1 times.circle x = 0$ in $K times.circle M$ then $xi^(-1) x = 0$ in $A xi times.circle M$ for some $xi != 0$. Deduce that $xi^(-1) x = 0$.]
]

#exercise[
  Let $S$ be a multiplicatively closed subset of an integral domain $A$. In the notation of Exercise 12, show that $T(S^(-1) M) = S^(-1)(T(M))$. Deduce that the following are equivalent:
  + $M$ is torsion-free.
  + $M_p$ is torsion-free for all prime ideals $p$.
  + $M_m$ is torsion-free for all maximal ideals $m$.
]

#exercise[
  Let $M$ be an $A$-module and $a$ an ideal of $A$. Suppose that $M_m = 0$ for all maximal ideals $m supset.eq a$. Prove that $M = a M$. [Pass to the $A\/a$-module $M \/ a M$ and use (3.8).]
]

#exercise[
  Let $A$ be a ring, and let $F$ be the $A$-module $A^n$. Show that every set of $n$ generators of $F$ is a basis of $F$. [Let $x_1, ..., x_n$ be a set of generators and $e_1, ..., e_n$ the canonical basis of $F$. Define $phi: F -> F$ by $phi(e_i) = x_i$. Then $phi$ is surjective and we have to prove that it is an isomorphism. By (3.9) we may assume that $A$ is a local ring. Since $F$ is a flat $A$-module, the exact sequence $0 -> N -> F -> F -> 0$ given us an exact sequence $0 -> k times.circle N -> k times.circle F ->^(1 times.circle phi) k times.circle F -> 0$. Now $k times.circle F = k^n$ is an $n$-dimensional vector space over $k$; $1 times.circle phi$ is surjective, hence bijective, hence $k times.circle N = 0$.

  Also $N$ is finitely generated, by Chapter 2, Exercise 12, hence $N = 0$ by Nakayama's lemma. Hence $phi$ is an isomorphism.]

  Deduce that every set of generators of $F$ has at least $n$ elements.
]

#exercise[
  Let $B$ be a flat $A$-algebra. Then the following conditions are equivalent:
  + $a^(e c) = a$ for all ideals $a$ of $A$.
  + $Spec(B) -> Spec(A)$ is surjective.
  + For every maximal ideal $m$ of $A$ we have $m^e != (1)$.
  + If $M$ is any non-zero $A$-module, then $M_B != 0$.
  + For every $A$-module $M$, the mapping $x |-> 1 times.circle x$ of $M$ into $M_B$ is injective.

  [For i) $=>$ ii), use (3.16). ii) $=>$ iii) is clear. iii) $=>$ iv): Let $x$ be a non-zero element of $M$ and let $M' = A x$. Since $B$ is flat over $A$ it is enough to show that $M'_B != 0$. We have $M' iso A \/ a$ for some ideal $a != (1)$. Since $B$ is flat over $A$, $M'_B iso B \/ a^e$. Now $a subset.eq m$ for some maximal ideal $m$, hence $a^e subset.eq m^e != (1)$. Hence $M'_B != 0$.

  iv) $=>$ v): Let $M'$ be the kernel of $M -> M_B$. But (Chapter 2, Exercise 13, with $N = M_B$) the mapping $M'_B -> M_B$ is injective. Hence $M'_B = 0$ and therefore $M' = 0$.

  v) $=>$ i): Take $M = A \/ a$.]

  $B$ is said to be *faithfully flat* over $A$.
]

#exercise[
  Let $A ->^f B ->^g C$ be ring homomorphisms. If $g compose f$ is flat and $g$ is faithfully flat, then $f$ is flat.
]

#exercise[
  Let $f: A -> B$ be a flat homomorphism of rings, let $q$ be a prime ideal of $B$ and let $p = q^c$. Then $f^*: Spec(B_q) -> Spec(A_p)$ is surjective. [For $B_p$ is flat over $A_p$ by (3.10), and $B_q$ is a local ring of $B_p$, hence flat over $B_p$ by (3.10). Hence $B_q$ is flat over $A_p$ and satisfies condition (3) of Exercise 16.]
]

#exercise[
  Let $A$ be a ring, $M$ an $A$-module. The *support* of $M$ is defined to be the set Supp$(M)$ of prime ideals $p$ of $A$ such that $M_p != 0$. Prove the following results:
  + $M != 0 <=>$ Supp$(M) != emptyset$.
  + $V(a) =$ Supp$(A \/ a)$.
  + If $0 -> M' -> M -> M'' -> 0$ is an exact sequence, then Supp$(M) =$ Supp$(M') union$ Supp$(M'')$.
  + If $M = sum_i M_i$, then Supp$(M) = union_i$ Supp$(M_i)$.
  + If $M, N$ are finitely generated, then Supp$(M times.circle_A N) =$ Supp$(M) inter$ Supp$(N)$. [Use Chapter 2, Exercise 3.]
  + If $M$ is finitely generated, then Supp$(M) = V("Ann"(M))$ (and is therefore a closed subset of $Spec(A)$).
  + If $M$ is finitely generated and $a$ is an ideal of $A$, then Supp$(M \/ a M) = V(a + "Ann"(M))$.
  + If $f: A -> B$ is a ring homomorphism and $M$ is a finitely generated $A$-module, then Supp$(B times.circle_A M) = f^(*-1)($Supp$(M))$.
]

#exercise[
  Let $f: A -> B$ be a ring homomorphism, $f^*: Spec(B) -> Spec(A)$ the associated mapping. Show that
  + Every prime ideal of $A$ is a contracted ideal $<=> f^*$ is surjective.
  + Every prime ideal of $B$ is an extended ideal $=> f^*$ is injective.

  Is the converse of ii) true?
]

#exercise[
  + Let $A$ be a ring, $S$ a multiplicatively closed subset of $A$, and $phi: A -> S^(-1) A$ the canonical homomorphism. Show that $phi^*: Spec(S^(-1) A) -> Spec(A)$ is a homeomorphism of $Spec(S^(-1) A)$ onto its image in $X = Spec(A)$. Let this image be denoted by $S^(-1) X$.

  In particular, if $f in A$, the image of $Spec(A_f)$ in $X$ is the basic open set $X_f$ (Chapter 1, Exercise 17).

  + Let $f: A -> B$ be a ring homomorphism. Let $X = Spec(A)$ and $Y = Spec(B)$, and let $f^*: Y -> X$ be the mapping associated with $f$. Identifying $Spec(S^(-1) A)$ with its canonical image $S^(-1) X$ in $X$, and $Spec(S^(-1) B)$ ($= Spec((f(S))^(-1) B)$) with its canonical image $S^(-1) Y$ in $Y$, show that $S^(-1) f^*$: $Spec(S^(-1) B) -> Spec(S^(-1) A)$ is the restriction of $f^*$ to $S^(-1) Y$, and that $S^(-1) Y = f^(*-1)(S^(-1) X)$.

  + Let $a$ be an ideal of $A$ and let $b = a^e$ be its extension in $B$. Let $overline(f): A\/a -> B\/b$ be the homomorphism induced by $f$. If $Spec(A\/a)$ is identified with its canonical image $V(a)$ in $X$, and $Spec(B\/b)$ with its canonical image $V(b)$ in $Y$, show that $overline(f)^*$ is the restriction of $f^*$ to $V(b)$.

  + Let $p$ be a prime ideal of $A$. Take $S = A - p$ in ii) and then reduce mod $S^(-1) p$ as in iii). Deduce that the subspace $f^(*-1)(p)$ of $Y$ is naturally homeomorphic to $Spec(B_p \/ p B_p) = Spec(k(p) times.circle_A B)$, where $k(p)$ is the residue field of the local ring $A_p$.

  $Spec(k(p) times.circle_A B)$ is called the *fiber* of $f^*$ over $p$.
]

#exercise[
  Let $A$ be a ring and $p$ a prime ideal of $A$. Then the canonical image of $Spec(A_p)$ in $Spec(A)$ is equal to the intersection of all the open neighborhoods of $p$ in $Spec(A)$.
]

#exercise[
  Let $A$ be a ring, let $X = Spec(A)$ and let $U$ be a basic open set in $X$ (i.e., $U = X_f$ for some $f in A$: Chapter 1, Exercise 17).
  + If $U = X_f$, show that the ring $A(U) = A_f$ depends only on $U$ and not on $f$.
  + Let $U' = X_g$ be another basic open set such that $U' subset.eq U$. Show that there is an equation of the form $g^n = u f$ for some integer $n > 0$ and some $u in A$, and use this to define a homomorphism $rho: A(U) -> A(U')$ (i.e., $A_f -> A_g$) by mapping $a\/f^m$ to $a u^m \/ g^(m n)$. Show that $rho$ depends only on $U$ and $U'$. This homomorphism is called the *restriction* homomorphism.
  + If $U = U'$, then $rho$ is the identity map.
  + If $U supset.eq U' supset.eq U''$ are basic open sets in $X$, show that restricting from $U$ to $U''$ directly agrees with restricting first from $U$ to $U'$ and then from $U'$ to $U''$ (i.e., the restriction homomorphisms compose consistently).
  + Let $x (= p)$ be a point of $X$. Show that
    $ lim_(U in.rev x) A(U) iso A_p. $
  The assignment of the ring $A(U)$ to each basic open set $U$ of $X$, and the restriction homomorphisms $rho$, satisfying the conditions iii) and iv) above, constitutes a *presheaf of rings* on the basis of open sets $(X_f)_(f in A)$. v) says that the stalk of this presheaf at $x in X$ is the corresponding local ring $A_p$.
]

#exercise[
  Show that the presheaf of Exercise 23 has the following property. Let $(U_i)_(i in I)$ be a covering of $X$ by basic open sets. For each $i in I$ let $s_i in A(U_i)$ be such that, for each pair of indices $i, j$, the images of $s_i$ and $s_j$ in $A(U_i inter U_j)$ are equal. Then there exists a unique $s in A (= A(X))$ whose image in $A(U_i)$ is $s_i$, for all $i in I$. (This essentially implies that the presheaf is a *sheaf*.)
]

#exercise[
  Let $f: A -> B$, $g: A -> C$ be ring homomorphisms and let $h: A -> B times.circle_A C$ be defined by $h(x) = f(x) times.circle g(x)$. Let $X, Y, Z, T$ be the prime spectra of $A, B, C, B times.circle_A C$ respectively. Then $h^*(T) = f^*(Y) inter g^*(Z)$.

  [Let $p in X$, and let $k = k(p)$ be the residue field at $p$. By Exercise 21, the fiber $h^(*-1)(p)$ is the spectrum of $(B times.circle_A C) times.circle_A k iso (B times.circle_A k) times.circle_k (C times.circle_A k)$. Hence $p in h^*(T) <=> (B times.circle_A k) times.circle_k (C times.circle_A k) != 0 <=> B times.circle_A k != 0$ and $C times.circle_A k != 0 <=> p in f^*(Y) inter g^*(Z)$.]
]

#exercise[
  Let $(A_alpha, g_(alpha beta))$ be a direct system of rings and $B$ the direct limit. For each $alpha$, let $f_alpha: A_alpha -> B_alpha$ be a ring homomorphism such that $g_(alpha beta) compose f_alpha = f_beta$ whenever $alpha <= beta$ (i.e. the $B_alpha$ form a direct system of $A$-algebras). The $f_alpha$ induce $f: A -> B$. Show that
  $ f^*(Spec(B)) = inter_alpha f_alpha^*(Spec(B_alpha)). $
  [Let $p in Spec(A)$. Then $f^(*-1)(p)$ is the spectrum of
  $ B times.circle_A k(p) iso lim_(->) (B_alpha times.circle_A k(p)) $
  (since tensor products commute with direct limits: Chapter 2, Exercise 20). By Exercise 21 of Chapter 2 it follows that $f^(*-1)(p) = emptyset$ if and only if $B_alpha times.circle_A k(p) = 0$ for some $alpha$, i.e., if and only if $f_alpha^(*-1)(p) = emptyset$.]
]

#exercise[
  + Let $f_alpha: A -> B_alpha$ be any family of $A$-algebras and let $f: A -> B$ be their tensor product over $A$ (Chapter 2, Exercise 23). Then
    $ f^*(Spec(B)) = inter_alpha f_alpha^*(Spec(B_alpha)). $
    [Use Exercises 25 and 26.]
  + Let $f_alpha: A -> B_alpha$ be any finite family of $A$-algebras and let $B = product_alpha B_alpha$. Define $f: A -> B$ by $f(x) = (f_alpha (x))$. Then $f^*(Spec(B)) = union_alpha f_alpha^*(Spec(B_alpha))$.
  + Hence the subsets of $X = Spec(A)$ of the form $f^*(Spec(B))$, where $f: A -> B$ is a ring homomorphism, satisfy the axioms for closed sets in a topological space. The associated topology is the *constructible* topology on $X$. It is finer than the Zariski topology (i.e., there are more open sets and, or equivalently more closed sets).
  + Let $X_C$ denote the set $X$ endowed with the constructible topology. Show that $X_C$ is quasi-compact.
]

#exercise[
  (Continuation of Exercise 27.)
  + For each $g in A$, the set $X_g$ (Chapter 1, Exercise 17) is both open and closed in the constructible topology.
  + Let $C'$ denote the smallest topology on $X$ for which the sets $X_g$ are both open and closed, and let $X_(C')$ denote the set $X$ endowed with this topology. Show that $X_(C')$ is Hausdorff.
  + Deduce that the identity mapping $X_C -> X_(C')$ is a homeomorphism. Hence a subset $E$ of $X$ is of the form $f^*(Spec(B))$ for some $f: A -> B$ if and only if it is closed in the topology $C'$.
  + The topological space $X_C$ is compact, Hausdorff and totally disconnected.
]

#exercise[
  Let $f: A -> B$ be a ring homomorphism. Show that $f^*: Spec(B) -> Spec(A)$ is a continuous *closed* mapping (i.e., maps closed sets to closed sets) for the constructible topology.
]

#exercise[
  Show that the Zariski topology and the constructible topology on $Spec(A)$ are the same if and only if $A \/ fN$ is absolutely flat (where $fN$ is the nilradical of $A$). [Use Exercise 11.]
]
