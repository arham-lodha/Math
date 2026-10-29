#import "prelude.typ": *
#show: standalone.with(chapter: 7)

= Noetherian Rings

#exercise[
  Let $A$ be a non-Noetherian ring and let $Sigma$ be the set of ideals in $A$ which are not finitely generated. Show that $Sigma$ has maximal elements and that the maximal elements of $Sigma$ are prime ideals.

  [Let $a$ be a maximal element of $Sigma$, and suppose that there exist $x, y in A$ such that $x in.not a$ and $y in.not a$ and $x y in a$. Show that there exists a finitely generated ideal $a_0 subset.eq a$ such that $a_0 + (x) = a + (x)$, and that $a = a_0 + x dot.op (a : x)$. Since $(a : x)$ strictly contains $a$, it is finitely generated and therefore so is $a$.]

  Hence a ring in which every prime ideal is finitely generated is Noetherian (I. S. Cohen).
]

#exercise[
  Let $A$ be a Noetherian ring and let $f = sum_(n=0)^oo a_n x^n in A[[x]]$. Prove that $f$ is nilpotent if and only if each $a_n$ is nilpotent.
]

#exercise[
  Let $a$ be an irreducible ideal in a ring $A$. Then the following are equivalent:
  + $a$ is primary;
  + for every multiplicatively closed subset $S$ of $A$ we have $(S^(-1) a)^c = (a : x)$ for some $x in S$;
  + the sequence $(a : x^n)$ is stationary, for every $x in A$.
]

#exercise[
  Which of the following rings are Noetherian?
  + The ring of rational functions of $z$ having no pole on the circle $|z| = 1$.
  + The ring of power series in $z$ with a positive radius of convergence.
  + The ring of power series in $z$ with an infinite radius of convergence.
  + The ring of polynomials in $z$ whose first $k$ derivatives vanish at the origin ($k$ being a fixed integer).
  + The ring of polynomials in $z, w$ all of whose partial derivatives with respect to $w$ vanish for $z = 0$.

  In all cases the coefficients are complex numbers.
]

#exercise[
  Let $A$ be a Noetherian ring, $B$ a finitely generated $A$-algebra, $G$ a finite group of $A$-automorphisms of $B$, and $B^G$ the set of all elements of $B$ which are left fixed by every element of $G$. Show that $B^G$ is a finitely generated $A$-algebra.
]

#exercise[
  If a finitely generated ring $K$ is a field, it is a finite field. [If $K$ has characteristic 0, we have $ZZ subset.eq QQ subset.eq K$. Since $K$ is finitely generated over $ZZ$ it is finitely generated over $QQ$, hence by (7.9) is a finitely generated $QQ$-module. Now apply (7.8) to obtain a contradiction. Hence $K$ is of characteristic $p > 0$, hence is finitely generated as a $ZZ\/(p)$-algebra. Use (7.9) to complete the proof.]
]

#exercise[
  Let $X$ be an affine algebraic variety given by a family of equations $f_alpha (t_1, ..., t_n) = 0$ $(alpha in I)$ (Chapter 1, Exercise 27). Show that there exists a finite subset $I_0$ of $I$ such that $X$ is given by the equations $f_alpha (t_1, ..., t_n) = 0$ for $alpha in I_0$.
]

#exercise[
  If $A[x]$ is Noetherian, is $A$ necessarily Noetherian?
]

#exercise[
  Let $A$ be a ring such that (1) for each maximal ideal $m$ of $A$, the local ring $A_m$ is Noetherian; (2) for each $x != 0$ in $A$, the set of maximal ideals of $A$ which contain $x$ is finite.

  Show that $A$ is Noetherian.

  [Let $a != 0$ be an ideal in $A$. Let $m_1, ..., m_r$ be the maximal ideals which contain $a$. Choose $x_0 != 0$ in $a$ and let $m_1, ..., m_(r+s)$ be the maximal ideals which contain $x_0$. Since $m_(r+1), ..., m_(r+s)$ do not contain $a$ there exist $x_j in a$ such that $x_j in.not m_(r+j)$ $(1 <= j <= s)$. Since each $A_(m_i)$ $(1 <= i <= r)$ is Noetherian, the extension of $a$ in $A_(m_i)$ is finitely generated. Hence there exist $x_(s+1), ..., x_t$ in $a$ whose images in $A_(m_i)$ generate $a A_(m_i)$ for $i = 1, ..., r$. Let $a_0 = (x_0, ..., x_t)$. Show that $a_0$ and $a$ have the same extension in $A_m$ for every maximal ideal $m$, and deduce by (3.9) that $a_0 = a$.]
]

#exercise[
  Let $M$ be a Noetherian $A$-module. Show that $M[x]$ (Chapter 2, Exercise 6) is a Noetherian $A[x]$-module.
]

#exercise[
  Let $A$ be a ring such that each local ring $A_p$ is Noetherian. Is $A$ necessarily Noetherian?
]

#exercise[
  Let $A$ be a ring and $B$ a faithfully flat $A$-algebra (Chapter 3, Exercise 16). If $B$ is Noetherian, show that $A$ is Noetherian. [Use the ascending chain condition.]
]

#exercise[
  Let $f: A -> B$ be a ring homomorphism of finite type and let $f^*: Spec(B) -> Spec(A)$ be the mapping associated with $f$. Show that the fibers of $f^*$ are Noetherian subspaces of $B$.
]

== Nullstellensatz, strong form

#exercise[
  Let $k$ be an algebraically closed field, let $A$ denote the polynomial ring $k[t_1, ..., t_n]$ and let $a$ be an ideal in $A$. Let $V$ be the variety in $k^n$ defined by the ideal $a$, so that $V$ is the set of all $x = (x_1, ..., x_n) in k^n$ such that $f(x) = 0$ for all $f in a$. Let $I(V)$ be the ideal of $V$, i.e. the ideal of all polynomials $g in A$ such that $g(x) = 0$ for all $x in V$. Then $I(V) = r(a)$.

  [It is clear that $r(a) subset.eq I(V)$. Conversely, if $f in.not r(a)$, then there is a prime ideal $p$ containing $a$ such that $f in.not p$. Let $overline(f)$ be the image of $f$ in $B = A\/p$, let $C = B_(overline(f)) = B[1\/overline(f)]$, and let $m$ be a maximal ideal of $C$. Since $C$ is a finitely generated $k$-algebra we have $C\/m iso k$, by (7.9). The images $x_i$ in $C\/m$ of the generators $t_i$ of $A$ thus define a point $x = (x_1, ..., x_n) in k^n$, and the construction shows that $x in V$ and $f(x) != 0$.]
]

#exercise[
  Let $A$ be a Noetherian local ring, $m$ its maximal ideal and $k$ its residue field, and let $M$ be a finitely generated $A$-module. Then the following are equivalent:
  + $M$ is free;
  + $M$ is flat;
  + the mapping of $m times.circle M$ into $A times.circle M$ is injective;
  + $Tor_1^A (k, M) = 0$.

  [To show that iv) $=>$ i), let $x_1, ..., x_n$ be elements of $M$ whose images in $M\/m M$ form a $k$-basis of this vector space. By (2.8), the $x_i$ generate $M$. Let $F$ be a free $A$-module with basis $e_1, ..., e_n$ and define $phi: F -> M$ by $phi(e_i) = x_i$. Let $E = "ker"(phi)$. Then the exact sequence $0 -> E -> F -> M -> 0$ gives us an exact sequence
  $ 0 -> k times.circle_A E -> k times.circle_A F ->^(1 times.circle phi) k times.circle_A M -> 0. $
  Since $k times.circle F$ and $k times.circle M$ are vector spaces of the same dimension over $k$, it follows that $1 times.circle phi$ is an isomorphism, hence $k times.circle E = 0$, hence $E = 0$ by Nakayama's Lemma ($E$ is finitely generated because it is a submodule of $F$, and $A$ is Noetherian).]
]

#exercise[
  Let $A$ be a Noetherian ring, $M$ a finitely generated $A$-module. Then the following are equivalent:
  + $M$ is a flat $A$-module;
  + $M_p$ is a free $A_p$-module, for all prime ideals $p$;
  + $M_m$ is a free $A_m$-module, for all maximal ideals $m$.

  In other words, flat $=$ locally free. [Use Exercise 15.]
]

#exercise[
  Let $A$ be a ring and $M$ a Noetherian $A$-module. Show (by imitating the proofs of (7.11) and (7.12)) that every submodule $N$ of $M$ has a primary decomposition (Chapter 4, Exercises 20–23).
]

#exercise[
  Let $A$ be a Noetherian ring, $p$ a prime ideal of $A$, and $M$ a finitely generated $A$-module. Show that the following are equivalent:
  + $p$ belongs to $0$ in $M$;
  + there exists $x in M$ such that $"Ann"(x) = p$;
  + there exists a submodule of $M$ isomorphic to $A\/p$.

  Deduce that there exists a chain of submodules
  $ 0 = M_0 subset M_1 subset ... subset M_r = M $
  such that each quotient $M_i \/ M_(i-1)$ is of the form $A \/ p_i$, where $p_i$ is a prime ideal of $A$.
]

#exercise[
  Let $a$ be an ideal in a Noetherian ring $A$. Let
  $ a = inter_(i=1)^r b_i = inter_(j=1)^s c_j $
  be two minimal decompositions of $a$ as intersections of *irreducible* ideals. Prove that $r = s$ and that (possible after re-indexing the $c_j$) $r(b_i) = r(c_i)$ for all $i$. [Show that for each $i = 1, ..., r$ there exists $j$ such that
  $ a = b_1 inter ... inter b_(i-1) inter c_j inter b_(i+1) inter ... inter b_r. $]

  State and prove an analogous result for modules.
]

#exercise[
  Let $X$ be a topological space and let $cal(F)$ be the smallest collection of subsets of $X$ which contains all open subsets of $X$ and is closed with respect to the formation of finite intersections and complements.
  + Show that a subset $E$ of $X$ belongs to $cal(F)$ if and only if $E$ is of the form $U inter C$, where $U$ is open and $C$ is closed.
  + Suppose that $X$ is irreducible and let $E in cal(F)$. Show that $E$ is dense in $X$ (i.e., that $overline(E) = X$) if and only if $E$ contains a non-empty open set in $X$.
]

#exercise[
  Let $X$ be a Noetherian topological space (Chapter 6, Exercise 5) and let $E subset.eq X$. Show that $E in cal(F)$ if and only if, for each irreducible closed set $X_0 subset.eq X$, either $overline(E inter X_0) != X_0$ or else $E inter X_0$ contains a non-empty open subset of $X_0$. [Suppose $E in.not cal(F)$. Then the collection of closed sets $X' subset.eq X$ such that $E inter X' in.not cal(F)$ is not empty and therefore has a minimal element $X_0$. Show that $X_0$ is irreducible and then that each of the alternatives above leads to the conclusion that $E inter X_0 in cal(F)$.]

  The sets belonging to $cal(F)$ are called the *constructible* subsets of $X$.
]

#exercise[
  Let $X$ be a Noetherian topological space and let $E$ be a subset of $X$. Show that $E$ is open in $X$ if and only if, for each irreducible closed subset $X_0$ in $X$, either $E inter X_0 = emptyset$ or else $E inter X_0$ contains a non-empty open subset of $X_0$. [The proof is similar to that of Exercise 21.]
]

#exercise[
  Let $A$ be a Noetherian ring, $f: A -> B$ a ring homomorphism of finite type (so that $B$ is Noetherian). Let $X = Spec(A)$, $Y = Spec(B)$ and let $f^*: Y -> X$ be the mapping associated with $f$. Then the image under $f^*$ of a constructible subset $E$ of $Y$ is a constructible subset of $X$.

  [By Exercise 20 it is enough to take $E = U inter C$ where $U$ is open and $C$ is closed in $Y$; then, replacing $B$ by a homomorphic image, we reduce to the case where $E$ is open in $Y$. Since $Y$ is Noetherian, $E$ is quasi-compact and therefore a finite union of open sets of the form $Spec(B_g)$. Hence reduce to the case $E = Y$. To show that $f^*(Y)$ is constructible, use the criterion of Exercise 21. Let $X_0$ be an irreducible closed subset of $X$ such that $f^*(Y) inter X_0$ is dense in $X_0$. We have $f^*(Y) inter X_0 = f^*(f^(*-1)(X_0))$, and $f^(*-1)(X_0) = Spec((A\/p) times.circle_A B)$, where $X_0 = Spec(A\/p)$. Hence reduce to the case where $A$ is an integral domain and $f$ is injective. If $Y_1, ..., Y_n$ are the irreducible components of $Y$, it is enough to show that some $f^*(Y_i)$ contains a non-empty open set in $X$. So finally we are brought down to the situation in which $A, B$ are integral domains and $f$ is injective (and still of finite type); now use Chapter 5, Exercise 21 to complete the proof.]
]

#exercise[
  With the notation and hypotheses of Exercise 23, $f^*$ is an open mapping $<=> f$ has the going-down property (Chapter 5, Exercise 10). [Suppose $f$ has the going-down property. As in Exercise 23, reduce to proving that $E = f^*(Y)$ is open in $X$. The going-down property asserts that if $p' subset.eq p$ and $p in E$, then $p' in E$: in other words, that if $X_0$ is an irreducible closed subset of $X$ and $X_0$ meets $E$, then $E inter X_0$ is dense in $X_0$. By Exercises 20 and 22, $E$ is open in $X$.]
]

#exercise[
  Let $A$ be Noetherian, $f: A -> B$ of finite type and *flat* (i.e., $B$ is flat as an $A$-module). Then $f^*: Spec(B) -> Spec(A)$ is an open mapping. [Exercise 24 and Chapter 5, Exercise 11.]
]

== Grothendieck groups

#exercise[
  Let $A$ be a Noetherian ring and let $F(A)$ denote the set of all isomorphism classes of finitely generated $A$-modules. Let $C$ be the free abelian group generated by $F(A)$. With each short exact sequence $0 -> M' -> M -> M'' -> 0$ of finitely generated $A$-modules we associate the element $(M') - (M) + (M'')$ of $C$, where $(M)$ is the isomorphism class of $M$, etc. Let $D$ be the subgroup of $C$ generated by these elements, for all short exact sequences. The quotient group $C\/D$ is called the *Grothendieck group* of $A$, and is denoted by $K(A)$. If $M$ is a finitely generated $A$-module, let $gamma(M)$, or $gamma_A (M)$, denote the image of $(M)$ in $K(A)$.
  + Show that $K(A)$ has the following universal property: for each additive function $lambda$ on the class of finitely generated $A$-modules, with values in an abelian group $G$, there exists a unique homomorphism $lambda_0: K(A) -> G$ such that $lambda(M) = lambda_0 (gamma(M))$ for all $M$.
  + Show that $K(A)$ is generated by the elements $gamma(A\/p)$, where $p$ is a prime ideal of $A$. [Use Exercise 18.]
  + If $A$ is a field, or more generally if $A$ is a principal ideal domain, then $K(A) iso ZZ$.
  + Let $f: A -> B$ be a *finite* ring homomorphism. Show that restriction of scalars gives rise to a homomorphism $f_!: K(B) -> K(A)$ such that $f_! (gamma_B (N)) = gamma_A (N)$ for a $B$-module $N$. If $g: B -> C$ is another finite ring homomorphism, show that $(g compose f)_! = f_! compose g_!$.
]

#exercise[
  Let $A$ be a Noetherian ring and let $F_1 (A)$ be the set of all isomorphism classes of finitely generated *flat* $A$-modules. Repeating the construction of Exercise 26 we obtain a group $K_1 (A)$. Let $gamma_1 (M)$ denote the image of $(M)$ in $K_1 (A)$.
  + Show that tensor product of modules over $A$ induces a commutative ring structure on $K_1 (A)$, such that $gamma_1 (M) dot.op gamma_1 (N) = gamma_1 (M times.circle N)$. The identity element of this ring is $gamma_1 (A)$.
  + Show that tensor product induces a $K_1 (A)$-module structure on the group $K(A)$, such that $gamma_1 (M) dot.op gamma(N) = gamma(M times.circle N)$.
  + If $A$ is a (Noetherian) local ring, then $K_1 (A) iso ZZ$.
  + Let $f: A -> B$ be a ring homomorphism, $B$ being Noetherian. Show that extension of scalars gives rise to a ring homomorphism $f^!: K_1 (A) -> K_1 (B)$ such that $f^! (gamma_1 (M)) = gamma_1 (B times.circle_A M)$. [If $M$ is flat and finitely generated over $A$, then $B times.circle_A M$ is flat and finitely generated over $B$.] If $g: B -> C$ is another ring homomorphism (with $C$ Noetherian), then $(g compose f)^! = f^! compose g^!$.
  + If $f: A -> B$ is a finite ring homomorphism then
  $ f_! (f^! (x) y) = x f_! (y) $
  for $x in K_1 (A)$, $y in K(B)$. In other words, regarding $K(B)$ as a $K_1 (A)$-module by restriction of scalars, the homomorphism $f^!$ is a $K_1(A)$-module homomorphism.

  *Remark.* Since $F_1(A)$ is a subset of $F(A)$ we have a group homomorphism $epsilon: K_1(A) -> K(A)$, given by $epsilon(gamma_1(M)) = gamma(M)$. If the ring $A$ is finite-dimensional and *regular*, i.e., if all its local rings $A_p$ are regular (Chapter 11) it can be shown that $epsilon$ is an isomorphism.
]
