#import "prelude.typ": *
#show: standalone.with(chapter: 5)

= Integral Dependence and Valuations

#exercise[
  Let $f: A -> B$ be an integral homomorphism of rings. Show that $f^*: Spec(B) -> Spec(A)$ is a *closed* mapping, i.e. that it maps closed sets to closed sets. (This is a geometrical equivalent of (5.10).)
]

#exercise[
  Let $A$ be a subring of a ring $B$ such that $B$ is integral over $A$, and let $f: A -> Omega$ be a homomorphism of $A$ into an algebraically closed field $Omega$. Show that $f$ can be extended to a homomorphism of $B$ into $Omega$. [Use (5.10).]
]

#exercise[
  Let $f: B -> B'$ be a homomorphism of $A$-algebras, and let $C$ be an $A$-algebra. If $f$ is integral, prove that $f times.circle 1: B times.circle_A C -> B' times.circle_A C$ is integral. (This includes (5.6) ii) as a special case.)
]

#exercise[
  Let $A$ be a subring of a ring $B$ such that $B$ is integral over $A$. Let $m$ be a maximal ideal of $B$ and let $n = m inter A$ be the corresponding maximal ideal of $A$. Is $B_n$ necessarily integral over $A_n$?

  [Consider the subring $k[x^2 - 1]$ of $k[x]$, where $k$ is a field, and let $n = (x - 1)$. Can the element $1\/(x + 1)$ be integral?]
]

#exercise[
  Let $A subset.eq B$ be rings, $B$ integral over $A$.
  + If $x in A$ is a unit in $B$ then it is a unit in $A$.
  + The Jacobson radical of $A$ is the contraction of the Jacobson radical of $B$.
]

#exercise[
  Let $B_1, ..., B_n$ be integral $A$-algebras. Show that $product_(i=1)^n B_i$ is an integral $A$-algebra.
]

#exercise[
  Let $A$ be a subring of a ring $B$, such that the set $B - A$ is closed under multiplication. Show that $A$ is integrally closed in $B$.
]

#exercise[
  + Let $A$ be a subring of an integral domain $B$, and let $C$ be the integral closure of $A$ in $B$. Let $f, g$ be monic polynomials in $B[x]$ such that $f g in C[x]$. Then $f, g$ are in $C[x]$. [Take a field containing $B$ in which the polynomials $f, g$ split into linear factors: say $f = product (x - xi_i)$, $g = product (x - eta_j)$. Each $xi_i$ and each $eta_j$ is a root of $f g$, hence is integral over $C$. Hence the coefficients of $f$ and $g$ are integral over $C$.]
  + Prove the same result without assuming that $B$ (or $A$) is an integral domain.
]

#exercise[
  Let $A$ be a subring of a ring $B$ and let $C$ be the integral closure of $A$ in $B$. Prove that $C[x]$ is the integral closure of $A[x]$ in $B[x]$. [If $f in B[x]$ is integral over $A[x]$, then
  $ f^m + g_1 f^(m-1) + ... + g_m = 0 quad (g_i in A[x]). $
  Let $r$ be an integer larger than $m$ and the degrees of $g_1, ..., g_m$, and let $f_1 = f - x^r$, so that
  $ (f_1 + x^r)^m + g_1 (f_1 + x^r)^(m-1) + ... + g_m = 0 $
  or say
  $ f_1^m + h_1 f_1^(m-1) + ... + h_m = 0, $
  where $h_m = (x^r)^m + g_1 (x^r)^(m-1) + ... + g_m in A[x]$. Now apply Exercise 8 to the polynomials $-f_1$ and $f_1^(m-1) + h_1 f_1^(m-2) + ... + h_(m-1)$.]
]

#exercise[
  A ring homomorphism $f: A -> B$ is said to have the *going-up property* (resp. the *going-down property*) if the conclusion of the going-up theorem (5.11) (resp. the going-down theorem (5.16)) holds for $B$ and the subring $f(A)$.

  Let $f^*: Spec(B) -> Spec(A)$ be the mapping associated with $f$.
  + Consider the following statements: (a) $f^*$ is a closed mapping. (b) $f$ has the going-up property. (c) Let $q$ be any prime ideal of $B$ and let $p = q^c$. Then $f^*: Spec(B\/q) -> Spec(A\/p)$ is surjective. Prove that (a) $=>$ (b) $<=>$ (c). (See also Chapter 6, Exercise 11.)
  + Consider the following three statements: (a') $f^*$ is an open mapping. (b') $f$ has the going-down property. (c') For any prime ideal $q$ of $B$, if $p = q^c$, then $f^*: Spec(B_q) -> Spec(A_p)$ is surjective. Prove that (a') $=>$ (c') $<=>$ (b').

  [To prove (a') $=>$ (c'), observe that $B_q$ is the direct limit of the rings $B_t$ where $t in B - q$; hence, by Chapter 3, Exercise 26, we have $f^*(Spec(B_q)) = inter_t f^*(Spec(B_t)) = inter_t f^*(Y_t)$. Since $Y_t$ is an open neighborhood of $q$ in $Y$, and since $f^*$ is open, it follows that $f^*(Y_t)$ is an open neighborhood of $p$ in $X$ and therefore contains $Spec(A_p)$.]
]

#exercise[
  Let $f: A -> B$ be a flat homomorphism of rings. Then $f$ has the going-down property. [Chapter 3, Exercise 18.]
]

#exercise[
  Let $G$ be a finite group of automorphisms of a ring $A$, and let $A^G$ denote the subring of $G$-invariants, that is of all $x in A$ such that $sigma(x) = x$ for all $sigma in G$. Prove that $A$ is integral over $A^G$. [If $x in A$, observe that $x$ is a root of the polynomial $product_(sigma in G) (t - sigma(x))$.]

  Let $S$ be a multiplicatively closed subset of $A$ such that $sigma(S) subset.eq S$ for all $sigma in G$, and let $S^G = S inter A^G$. Show that the action of $G$ on $A$ extends to an action on $S^(-1) A$, and that $(S^G)^(-1) A^G iso (S^(-1) A)^G$.
]

#exercise[
  In the situation of Exercise 12, let $p$ be a prime ideal of $A^G$, and let $P$ be the set of prime ideals of $A$ whose contraction is $p$. Show that $G$ acts transitively on $P$. In particular, $P$ is finite.

  [Let $p_1, p_2 in P$ and let $x in p_1$. Then $product_sigma sigma(x) in p_1 inter A^G = p subset.eq p_2$, hence $sigma(x) in p_2$ for some $sigma in G$. Deduce that $p_1$ is contained in $union_(sigma in G) sigma(p_2)$, and then apply (1.11) and (5.9).]
]

#exercise[
  Let $A$ be an integrally closed domain, $K$ its field of fractions and $L$ a finite normal separable extension of $K$. Let $G$ be the Galois group of $L$ over $K$ and let $B$ be the integral closure of $A$ in $L$. Show that $sigma(B) = B$ for all $sigma in G$, and that $A = B^G$.
]

#exercise[
  Let $A, K$ be as in Exercise 14, let $L$ be any finite extension field of $K$, and let $B$ be the integral closure of $A$ in $L$. Show that, if $p$ is any prime ideal of $A$, then the set of prime ideals $q$ of $B$ which contract to $p$ is finite (in other words, that $Spec(B) -> Spec(A)$ has finite fibers).

  [Reduce to the two cases (a) $L$ separable over $K$ and (b) $L$ purely inseparable over $K$. In case (a), embed $L$ in a finite normal separable extension of $K$, and use Exercises 13 and 14. In case (b), if $q$ is a prime ideal of $B$ such that $q inter A = p$, show that $q$ is the set of all $x in B$ such that $x^(p^m) in p$ for some $m >= 0$, where $p$ is the characteristic of $K$, and hence that $Spec(B) -> Spec(A)$ is bijective in this case.]
]

== Noether's normalization lemma

#exercise[
  Let $k$ be a field and let $A != 0$ be a finitely generated $k$-algebra. Then there exist elements $y_1, ..., y_r in A$ which are algebraically independent over $k$ and such that $A$ is integral over $k[y_1, ..., y_r]$. (The result is still true if $k$ is finite, but a different proof is needed.)

  We shall assume that $k$ is *infinite*. Let $x_1, ..., x_n$ generate $A$ as a $k$-algebra. We can renumber the $x_i$ so that $x_1, ..., x_r$ are algebraically independent over $k$ and each of $x_(r+1), ..., x_n$ is algebraic over $k[x_1, ..., x_r]$. Now proceed by induction on $n$. If $n = r$ there is nothing to do, so suppose $n > r$ and the result true for $n - 1$ generators. Let $x_n$ be algebraic over $k[x_1, ..., x_(n-1)]$, then there exists a polynomial $f != 0$ in $n$ variables such that $f(x_1, ..., x_(n-1), x_n) = 0$. Let $F$ be the homogeneous part of highest degree in $f$. Since $k$ is infinite, there exist $lambda_1, ..., lambda_(n-1) in k$ such that $F(lambda_1, ..., lambda_(n-1), 1) != 0$. Put $x'_i = x_i - lambda_i x_n$ $(1 <= i <= n - 1)$. Show that $x_n$ is integral over the ring $A' = k[x'_1, ..., x'_(n-1)]$, and hence that $A$ is integral over $A'$. Then apply the inductive hypothesis to $A'$ to complete the proof.

  From the proof it follows that $y_1, ..., y_r$ may be chosen to be linear combinations of $x_1, ..., x_n$. This has the following geometrical interpretation: if $k$ is algebraically closed and $X$ is an affine algebraic variety in $k^n$ with coordinate ring $A != 0$, then there exists a linear subspace $L$ of dimension $r$ in $k^n$ and a linear mapping of $k^n$ onto $L$ which maps $X$ onto $L$. [Use Exercise 2.]
]

== Nullstellensatz (weak form)

#exercise[
  Let $X$ be an affine algebraic variety in $k^n$, where $k$ is an algebraically closed field, and let $I(X)$ be the ideal of $X$ in the polynomial ring $k[t_1, ..., t_n]$ (Chapter 1, Exercise 27). If $I(X) != (1)$ then $X$ is not empty. [Let $A = k[t_1, ..., t_n]\/I(X)$ be the coordinate ring of $X$. Then $A != 0$, hence by Exercise 16 there exists a linear subspace $L$ of dimension $>= 0$ in $k^n$ and a mapping of $X$ onto $L$. Hence $X != emptyset$.]

  Deduce that every maximal ideal in the ring $k[t_1, ..., t_n]$ is of the form $(t_1 - a_1, ..., t_n - a_n)$ where $a_i in k$.
]

#exercise[
  Let $k$ be a field and let $B$ be a finitely generated $k$-algebra. Suppose that $B$ is a field. Then $B$ is a finite algebraic extension of $k$. (This is another version of Hilbert's Nullstellensatz. For other proofs, see (5.24), (7.9).)

  Let $x_1, ..., x_n$ generate $B$ as a $k$-algebra. The proof is by induction on $n$. If $n = 1$ the result is clearly true, so assume $n > 1$. Let $A = k[x_1]$ and let $K = k(x_1)$ be the field of fractions of $A$. By the inductive hypothesis, $B$ is a finite algebraic extension of $K$, hence each $x_2, ..., x_n$ satisfies a monic polynomial equation with coefficients in $K$, i.e. coefficients of the form $a\/b$ where $a$ and $b$ are in $A$. If $f$ is the product of the denominators of all these coefficients, then each of $x_2, ..., x_n$ is integral over $A_f$. Hence $B$ and therefore $K$ is integral over $A_f$.

  Suppose $x_1$ is transcendental over $k$. Then $A$ is integrally closed, because it is a unique factorization domain. Hence $A_f$ is integrally closed (5.12), and therefore $A_f = K$, which is clearly absurd. Hence $x_1$ is algebraic over $k$, hence $K$ (and therefore $B$) is a finite extension of $k$.
]

#exercise[
  Deduce the result of Exercise 17 from Exercise 18.
]

#exercise[
  Let $A$ be a subring of an integral domain $B$ such that $B$ is finitely generated over $A$. Show that there exists $s != 0$ in $A$ and elements $y_1, ..., y_n$ in $B$, algebraically independent over $A$ and such that $B_s$ is integral over $B'_s$, where $B' = A[y_1, ..., y_n]$.

  [Let $S = A - \{0\}$ and let $K = S^(-1) A$. Then $S^(-1) B$ is a finitely generated $K$-algebra and therefore by the normalization lemma (Exercise 16) there exist $x_1, ..., x_n$ in $S^(-1) B$, algebraically independent over $K$ and such that $S^(-1) B$ is integral over $K[x_1, ..., x_n]$. Let $z_1, ..., z_m$ generate $B$ as an $A$-algebra. Then each $z_j$ (regarded as an element of $S^(-1) B$) is integral over $K[x_1, ..., x_n]$. By writing an equation of integral dependence for each $z_j$, show that there exists $s in S$ such that $x_i = y_i \/ s$ $(1 <= i <= n)$ with $y_i in B$, and such that each $s z_j$ is integral over $B'$. Deduce that this $s$ satisfies the conditions stated.]
]

#exercise[
  Let $A, B$ be as in Exercise 20. Show that there exists $s != 0$ in $A$ such that, if $Omega$ is an algebraically closed field and $f: A -> Omega$ is a homomorphism for which $f(s) != 0$, then $f$ can be extended to a homomorphism $B -> Omega$.

  [With the notation of Exercise 20, $f$ can be extended first of all to $B'$, for example by mapping each $y_i$ to $0$; then to $B'_s$ (because $f(s) != 0$), and finally to $B_s$ (by Exercise 2, because $B_s$ is integral over $B'_s$).]
]

#exercise[
  Let $A, B$ be as in Exercise 20. If the Jacobson radical of $A$ is zero, then so is the Jacobson radical of $B$.

  [Let $v != 0$ be an element of $B$. We have to show that there is a maximal ideal of $B$ which does not contain $v$. By applying Exercise 21 to the ring $B_v$ and its subring $A$, we obtain an element $s != 0$ in $A$. Let $m$ be a maximal ideal of $A$ such that $s in.not m$, and let $k = A\/m$. Then the canonical mapping $A -> k$ extends to a homomorphism $g$ of $B_v$ into an algebraic closure $Omega$ of $k$. Then $g(v) != 0$ and $"ker"(g) inter B$ is a maximal ideal of $B$.]
]

#exercise[
  Let $A$ be a ring. Show that the following are equivalent:
  + Every prime ideal in $A$ is an intersection of maximal ideals.
  + In every homomorphic image of $A$ the nilradical is equal to the Jacobson radical.
  + Every prime ideal in $A$ which is not maximal is equal to the intersection of the prime ideals which contain it strictly.

  [The only hard part is iii) $=>$ ii). Suppose ii) false, then there is a prime ideal which is not an intersection of maximal ideals. Passing to the quotient ring, we may assume that $A$ is an integral domain whose Jacobson radical $fN$ is not zero. Let $f$ be a non-zero element of $fN$. Then $A_f != 0$, hence $A_f$ has a maximal ideal, whose contraction in $A$ is a prime ideal $p$ such that $f in.not p$, and which is maximal with respect to this property. Then $p$ is not maximal and is not equal to the intersection of the prime ideals strictly containing $p$.]

  A ring $A$ with the three equivalent properties above is called a *Jacobson ring*.
]

#exercise[
  Let $A$ be a Jacobson ring (Exercise 23) and $B$ an $A$-algebra. Show that if $B$ is either (i) integral over $A$ or (ii) finitely generated as an $A$-algebra, then $B$ is Jacobson. [Use Exercise 22 for (ii).]

  In particular, every finitely generated ring, and every finitely generated algebra over a field, is a Jacobson ring.
]

#exercise[
  Let $A$ be a ring. Show that the following are equivalent:
  + $A$ is a Jacobson ring;
  + Every finitely generated $A$-algebra $B$ which is a field is finite over $A$.

  [i) $=>$ ii). Reduce to the case where $A$ is a subring of $B$, and use Exercise 21. If $s in A$ is as in Exercise 21, then there exists a maximal ideal $m$ of $A$ not containing $s$, and the homomorphism $A -> A\/m = k$ extends to a homomorphism $g$ of $B$ into the algebraic closure of $k$. Since $B$ is a field, $g$ is injective, and $g(B)$ is algebraic over $k$, hence finite algebraic over $k$.

  ii) $=>$ i). Use criterion iii) of Exercise 23. Let $p$ be a prime ideal of $A$ which is not maximal, and let $B = A\/p$. Let $f$ be a non-zero element of $B$. Then $B_f$ is a finitely generated $A$-algebra. If it is a field it is finite over $B$, hence integral over $B$ and therefore $B$ is a field (5.7). Hence $B_f$ is not a field and therefore has a non-zero prime ideal, whose contraction in $B$ is a non-zero ideal $p'$ such that $f in.not p'$.]
]

#exercise[
  Let $X$ be a topological space. A subset $X_0$ of $X$ is *locally closed* if it is the intersection of an open set and a closed set, or equivalently if it is open in its closure.

  The following conditions on a subset $X_0$ of $X$ are equivalent: (1) Every non-empty locally closed subset of $X$ meets $X_0$; (2) For every closed set $E$ in $X$ we have $overline(E inter X_0) = E$; (3) The mapping $U |-> U inter X_0$ of the collection of open sets of $X$ onto the collection of open sets of $X_0$ is bijective.

  A subset $X_0$ satisfying these conditions is said to be *very dense* in $X$.

  If $A$ is a ring, show that the following are equivalent:
  + $A$ is a Jacobson ring;
  + The set of maximal ideals of $A$ is very dense in $Spec(A)$;
  + Every locally closed subset of $Spec(A)$ consisting of a single point is closed.

  [ii) and iii) are geometrical formulations of conditions ii) and iii) of Exercise 23.]
]

== Valuation rings and valuations

#exercise[
  Let $A, B$ be two local rings. $B$ is said to *dominate* $A$ if $A$ is a subring of $B$ and the maximal ideal $m$ of $A$ is contained in the maximal ideal $n$ of $B$ (or, equivalently, if $m = n inter A$). Let $K$ be a field and let $Sigma$ be the set of all local subrings of $K$. If $Sigma$ is ordered by the relation of domination, show that $Sigma$ has maximal elements and that $A in Sigma$ is maximal if and only if $A$ is a valuation ring of $K$. [Use (5.21).]
]

#exercise[
  Let $A$ be an integral domain, $K$ its field of fractions. Show that the following are equivalent: (1) $A$ is a valuation ring of $K$; (2) If $a, b$ are any two ideals of $A$, then either $a subset.eq b$ or $b subset.eq a$.

  Deduce that if $A$ is a valuation ring and $p$ is a prime ideal of $A$, then $A_p$ and $A\/p$ are valuation rings of their fields of fractions.
]

#exercise[
  Let $A$ be a valuation ring of a field $K$. Show that every subring of $K$ which contains $A$ is a local ring of $A$.
]

#exercise[
  Let $A$ be a valuation ring of a field $K$. The group $U$ of units of $A$ is a subgroup of the multiplicative group $K^*$ of $K$.

  Let $Gamma = K^* \/ U$. If $xi, eta in Gamma$ are represented by $x, y in K$, define $xi >= eta$ to mean $x y^(-1) in A$. Show that this defines a total ordering on $Gamma$ which is compatible with the group structure (i.e., $xi >= eta => xi omega >= eta omega$ for all $omega in Gamma$). In other words, $Gamma$ is a totally ordered abelian group. It is called the *value group* of $A$.

  Let $v: K^* -> Gamma$ be the canonical homomorphism. Show that $v(x + y) >= min(v(x), v(y))$ for all $x, y in K^*$.
]

#exercise[
  Conversely, let $Gamma$ be a totally ordered abelian group (written *additively*), and let $K$ be a field. A *valuation of $K$ with values in $Gamma$* is a mapping $v: K^* -> Gamma$ such that (1) $v(x y) = v(x) + v(y)$, (2) $v(x + y) >= min(v(x), v(y))$, for all $x, y in K^*$. Show that the set of elements $x in K^*$ such that $v(x) >= 0$ is a valuation ring of $K$. This ring is called the *valuation ring* of $v$, and the subgroup $v(K^*)$ of $Gamma$ is the *value group* of $v$.

  Thus the concepts of valuation ring and valuation are essentially equivalent.
]

#exercise[
  Let $Gamma$ be a totally ordered abelian group. A subgroup $Delta$ of $Gamma$ is *isolated* in $Gamma$ if, whenever $0 <= beta <= alpha$ and $alpha in Delta$, we have $beta in Delta$. Let $A$ be a valuation ring of a field $K$, with value group $Gamma$ (Exercise 31). If $p$ is a prime ideal of $A$, show that $v(A - p)$ is the set of elements $>= 0$ in an isolated subgroup $Delta$ of $Gamma$, and that the mapping so defined of $Spec(A)$ into the set of isolated subgroups of $Gamma$ is bijective.

  If $p$ is a prime ideal of $A$, what are the value groups of the valuation rings $A\/p$, $A_p$?
]

#exercise[
  Let $Gamma$ be a totally ordered abelian group. We shall show how to construct a field $K$ and a valuation $v$ of $K$ with $Gamma$ as value group. Let $k$ be any field and let $A = k[Gamma]$ be the group algebra of $Gamma$ over $k$. By definition, $A$ is freely generated as a $k$-vector space by elements $x_alpha$ $(alpha in Gamma)$ such that $x_alpha x_beta = x_(alpha + beta)$. Show that $A$ is an integral domain.

  If $u = lambda_1 x_(alpha_1) + ... + lambda_n x_(alpha_n)$ is any non-zero element of $A$, where the $lambda_i$ are all $!= 0$ and $alpha_1 < ... < alpha_n$, define $v_0(u)$ to be $alpha_1$. Show that $v_0: A - \{0\} -> Gamma$ satisfies conditions (1) and (2) of Exercise 31.

  Let $K$ be the field of fractions of $A$. Show that $v_0$ can be uniquely extended to a valuation $v$ of $K$, and that the value group of $v$ is precisely $Gamma$.
]

#exercise[
  Let $A$ be a valuation ring and $K$ its field of fractions. Let $f: A -> B$ be a ring homomorphism such that $f^*: Spec(B) -> Spec(A)$ is a *closed* mapping. Then if $g: B -> K$ is any $A$-algebra homomorphism (i.e., if $g compose f$ is the embedding of $A$ in $K$) we have $g(B) = A$.

  [Let $C = g(B)$; obviously $C supset.eq A$. Let $n$ be a maximal ideal of $C$. Since $f^*$ is closed, $C_n$ dominates $A_m$, whence $A_m = A$. Also the local ring $C_n$ dominates $A_m$. Hence by Exercise 27 we have $C_n = A$ and therefore $C subset.eq A$.]
]

#exercise[
  From Exercises 1 and 3 it follows that, if $f: A -> B$ is integral and $C$ is any $A$-algebra, then the mapping $(f times.circle 1)^*: Spec(B times.circle_A C) -> Spec(C)$ is a closed map.

  Conversely, suppose that $f: A -> B$ has this property and that $B$ is an integral domain. Then $f$ is integral. [Replacing $A$ by its image in $B$, reduce to the case where $A subset.eq B$ and $f$ is the injection. Let $K$ be the field of fractions of $B$ and let $A'$ be a valuation ring of $K$ containing $A$. By (5.22) it is enough to show that $A'$ contains $B$. By hypothesis, $Spec(B times.circle_A A') -> Spec(A')$ is a closed map. Apply the result of Exercise 34 to the homomorphism $B times.circle_A A' -> K$ defined by $b times.circle a' |-> b a'$. It follows that $b a' in A'$ for all $b in B$ and all $a' in A'$; taking $a' = 1$, we have what we want.]

  Show that the result just proved remains valid if $B$ is a ring with only finitely many minimal prime ideals (e.g., if $B$ is Noetherian). [Let $p_i$ be the minimal prime ideals. Then each composite homomorphism $A -> B -> B\/p_i$ is integral, hence $A -> product (B\/p_i)$ is integral, hence $A -> B\/fN$ is integral (where $fN$ is the nilradical of $B$), hence finally $A -> B$ is integral.]
]
