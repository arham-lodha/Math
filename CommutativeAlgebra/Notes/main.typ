#import "template.typ": *
#import "figures.typ" as figs

#show: notes.with(
  title: "Notes",
  author: "Arham Lodha",
  course: "Math 215A",
  instructor: "Burt Totaro",
  cover: false, // set true for a title page
  toc: false, // set true for a table of contents
  bibliography-file: "refs.bib",
)

// ── Usage ────────────────────────────────────────────────────────────────────
//
//  Chapters (level-1 headings) break to a new page automatically and reset
//  the shared theorem counter. Sections are level-2, subsections level-3.
//
//  Theorem environments (from @local/my-prelude):
//    #definition("Name")[ body ]   — Definition 1.1 (Name). body
//    #theorem("Name")[ body ]      — Theorem 1.2 (Name). body
//    #lemma[ body ]                — Lemma 1.3. body
//    #proposition("Name")[ body ]  — Proposition 1.4 (Name). body
//    #corollary[ body ]            — Corollary 1.5. body
//    #conjecture("Name")[ body ]   — Conjecture 1.6 (Name). body
//    #example[ body ]              — Example 1.1. body   (own counter)
//    #remark[ body ]               — Remark 1.1. body    (own counter)
//    #exercise[ body ]             — Exercise 1.1. body  (own counter)
//    #notation[ body ]             — Notation 1.1. body  (own counter)
//    #proof[ body ]                — Proof: body  ∎
//    #proof("of Thm 1.2")[ body ]  — Proof (of Thm 1.2): body  ∎
//
//  Figures: define #let bindings in figures.typ, then call #figs.name here.
//
//  Bibliography: add entries to refs.bib and cite with @key.
// ─────────────────────────────────────────────────────────────────────────────

#let spec = $#math.op("Spec")$;

= Introduction
Commutative algebra is about studying commutative rings and their modules. The course has a view to algebraic geometry.

#example("Examples of Commutative Rings")[
  $ZZ$, $k[x_1, ..., x_n]$ for $k$ field. For topological spaces, $X$ we get the commutative ring $C(X) := {f: X -> CC: f "continous"}$.
]

#theorem("Structure Theorem for Finitely Generated Rings over a PID")

#theorem([$k[x_1, ..., x_n]$ is a UFD])

= Basic Definitions

#definition("Ring")[
  A *ring* A is a triple $(A, +, times)$ where $A$ is a set and $+$ and $times$ are binary operations on $A$.
  1. $(A, +, 0)$ is a abelian group
  2. $(A, 1, times)$ is a monoid.
  3. Distributive Laws: $(a + b) times c = a times c + b times c$ and $a times (b + c) = a times b + a times c$

  A is a *commutative ring* if and only if $(A, 1, times)$ is a commutative monoid.
]

#example()[
  Examples of noncommutative rings are $M_n (k)$ where $k$ is a field, $k G$ for a nonabelian group $G$. Examples of commutative rings include $C^(oo ) (X)$ for $X$ smooth manifold.
]

If a ring is discussed, then it is commutative from now on unless otherwise stated.

Note on the definition, $1 in A$ (by definition), though this is not not always required. A zero ring: $0 = 1 in A$

#exercise()[
  Show $forall x in A$, $0 dot x = 0$ and $(-1) x = -x$
]

#definition("Unit")[
  A element $x in A$ is called a unit (or invertible) if $exists y in A$ where $x y = 1 = y x$. An exercise is showing that $y$ is unique. $A^times$ is the group of units of $A$.
]

#definition("Zero Divisor")[
  A element $x in A$ is a *zero divisor* if there exists a nonzero $y in A$ where $x y = 0$.
]

#definition("Nilpotent")[
  $x in A$ is *nilpotent* if $exists n in NN$ where $x^n = 0 in A$
]

#definition("Field")[
  $A$ is a field if $1 != 0$ and for every $x != 0$ in $A$ is a unit.
]

#definition("Integral Domain")[
  $A$ is a *integral domain* or *domain* if $1 != 0$ and $forall x, y in A$ $x y = 0 => x = 0$ or $y = 0$.
]

#definition("Reduced")[
  A ring $A$ is *reduced* if only nilpotent element in $A$ is 0.
]

We have the following inclusions:
$ "Field" subset "Domain" subset "Reduced" $

#example[
  The zero ring is reduced, but not a domain (or a field).  $ZZ_p$ is a field if and only if $p$ is prime in $ZZ$. $ZZ_n$ is not a field if and only if $n$ is not prime. If $ZZ_(p_1 ... p_n)$ is reduced if $n >= 0$ and $p_1, ..., p_n$ are distinct.
]

#definition("Subring")[
  A subring of a ring $R$, ${0, 1} subset A subset R$ is a subset where $A$ is closed under addition, additive inverses, multiplication,  (in $R$)
]

#remark[
  ${0}$ is not a subring of $ZZ$
]

Note in the category of commutative rings, $ZZ$ is an initial object.

#definition("Left and Right Ideal")[
  An right ideal $I$ in a ring $A$ is a subset where $forall k in I$, then $k A subset.eq I$. A left ideal $I$ is subset where $A k subset A$. In a commutative ring left and right ideals are equal. Kernel of a ring homomorphism is always a ring, furthermore any ideal is a kernel of a homomorphism
]

#example[
  In a field $k$, the only ideals are ${0}$ and $k$. If $X$ is a topological space, $Y subset X$ is a closed (if it isn't closed you can just take closure because of continuity) subspace. Let $I = ker(C(X) ->^(|_Y) C(Y))$ is a ideal. This is a typical way to get ideals, take a space of functions which is a ring and then restrict on a closed subspace.
]

#definition("The Ideal Generated by a Set")[
  The *ideal generated by $S subset A$ a ring* denoted $(S)$:
  1. The intersection of all ideals containing $S$.
  2. The set of finite linear combinations of elements of $S$. If $S = emptyset$. Thus set is the 0 ideal.
]

For a finite set $S = {a_1, ..., a_r} subset A$ we will used the notation: $(a_1, ..., a_r) = (S)$.

#definition("Principal Ideal")[
  An ideal generated by one element.
]

Note, while the intersection of two ideals is always a ideal, the union is not always a ideal. But the sum of two ideals is a ideal, in fact the smallest ideal containing $I union J$.

#definition("Quotient Ring")[
  Standard way: $R \/ I$ is the set of cosets but not ideal
  Better way: $A \/ I$ is a ring that come with a ring homomorphism $phi: A ->> A \/ I$ with kernel $I$.

  Note for the sake of notation: For $a in A$ we can say $a in A \/ I$ to talk about $a + I in A \/ I$.
]

#definition("Maximal Ideals")[A ideal $I$ is called maximal if $A \/ I$ is a field.
]

#definition("Prime Ideals")[A ideal $I$ is a prime if $A \/ I$ is a domain
]

#definition("Radical Ideal")[
  A ideal $I$ is radical if $A \/ I$ is reduced.
]

#example("Maximal, Prime, and Radical Ideas")[
  For a field $k$, the maximal ideal in $k[x]$ (which is also a PID) is $(f)$ where $f$ an monic irreducible polynomial.

  Monic means leading coeefficent is 1. In any *domain* R, $f in R^times$ and for $g, h in R$ $f = g h => g$ or $h$ is a unit for $R$.

  Prime ideals of $k[x]$ are the maximal ideal and 0. Finally the radical ideals of $k[x]$ are $(0)$ and $(f_1, ..., f_r)$ for $1 <=r < oo$
]

#example("Prime ideals in a UFD")[
  $ZZ [x]$ is a unique factorization domain and not a pid. Consider $(0), (7), (x), (7, x) subset ZZ[x]$. Only $(7, x)$ is maximal.
]

#example()[
  Let $S$ be a set, $k$ a field, and  $A$ a ring of functiosns $S -> k$ that contains all constant function. Fix $s_0 in s$
]

In "good cases", in different points in $S$ give different maximal ideals

#example()[
  If $X$ a compact Hausdorff space, or a metrizable topological space, by the Tietze Extension Theoerm for any closed subset $Y subset X$ for any continous $f: Y -> RR$ there is a Extension $X -> RR$. Basically you can seperate points hence the ideals generated are different.
]

= Spectrum of Ring
#definition("Spectrum of a ring")[
  For a commutative ring $A$, $ Spec(A) := {"prime ideals in A"} $
]

Think of elements of $A$ as functions on the space $Spec(A)$. So $A$ turns into the ring of functions on $Spec(A)$. For each $frak(p) in Spec(A)$, there is a homomorphism $ A -> lcoset(A, frak(p)) -> Frac(lcoset(A, frak(p))). $ For a function $f in A$, the value of $f$ at $frak(p)$ is the image of $f$ in this homomorphism.

*Why are we taking the fraction field of a $lcoset(A, frak(p))$?*

== Why only prime ideals?
We want to take values in a field $k$. $A ->^("hom") k$ maps $A$ to a subring of $k$, which is a domain, hence the map has a prime ideal as a kernel.

#example("Spectrum of Basic Rings")[
  1. $Spec 0 = emptyset$
  2. If $A != 0$, then $Spec A != emptyset$ since $A$ must have a maximal ideal hence a prime ideal.
]

== Zariski Topology

We will define a topology on $Spec(A)$.
#definition([Zariski Topology of $Spec(A)$])[
  For a ideal $I subset.eq A$, denote $ V(I) := {p in Spec(A): I subset.eq p}. $ A subset of $Spec(A)$ is closed if it is equal to $V(I)$ for some $I subset.eq A$ ideal. A subset of $Spec(A)$ is open if its the complement of $V(I)$ for some $I subset.eq A$ ideal.
]

*Why does $V(I)$ consist of ideals containing $I$ rather being contained in $I$?*
Interpreting elements of $A$ as functions on $ V(I) := {"pts where all functions in I vanish"} $

=== Nonstandard Notion:
For elements $f_1, ..., f_r in A$ write ${f_1 = 0, ..., f_r = 0} subset.eq Spec(A)$ for $V((f_1, ..., f_r))$

#theorem()[
  Show that the closed and open sets defined before form a Topology.
]

#example("Some more Spec")[
  1. $Spec(QQ) = {(0)}$
  2. $Spec(RR) = {(0)}$
  3. $Spec(ZZ) = {(0)} union {(p) : p "prime"}$. $ {10 = 0} = {(2), (5)} $
]
