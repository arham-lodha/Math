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

#let jac = $frak(N)$
#let nil = $frak(R)$
#let Max = $#math.op("Max")$
#let ox = $otimes$
#let opl = $oplus$

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
  3. $Spec[CC[x]]$: $CC[x]$ is a PID, and thus we know how the prime ideals look. The prime ideal looks $(0)$ or $(f)$ where $f in CC[x]$ monic irreducible polynomial. Since $CC$ is algebraic closed, we know that $f$ has degree greater than 1 it can be factored. Thus $f$ must be degree 1 polynomial. $lcoset(CC[x], (0))$ is a domain but not a field. $lcoset(CC[x], (x - b)) iso CC$. $Spec(CC[x])$ looks like $CC$ with a extra point $(0)$. The closed subsets of $X$ are the subsets $ V(I) := {frak(p) in Spec(CC[x]) : I subset.eq frak(p)}. $ Note that $CC[x]$ is a PID, thus any ideal is $(0), (1), ((x - b_1)^(n_1) ... (x - b_n)^(n_r))$ where $b_i in CC$ and $r >= 1$.

  $
                                                                      V((0)) = {0 = 0} & := Spec(C[[x]]) \
                                                                      V((1)) = {1 = 0} & = emptyset \
    V((x - b_1)^(n_1) ... (x - b_n)^(r_n) ) = {(x - b_1)^(n_1)... (x - b_n)^(n_r) = 0} & = {(x - b_1), ..., (x - b_n)}
  $

  Thus the closed subsets of $Spec(CC)$ looks like finite sets of $CC$ portion of $Spec[CC]$, empty set, and the whole set. Thus as a topological space, $Spec(CC)$ looks exactly like $CC$ plus a extra point. $(0)$ is called a generic point because the closure of the point is the whole space.

  #figs.spec-cx
]

#theorem("Nilradical is intersection of all prime ideals")[
  The nilradical, $nil$, is the set of nilpotent elements of a ring. $ nil = inter.big_(frak(p) in Spec(A)) frak(p) $
]
#proof[
  1. $nil subset.eq inter.big_(frak(p) in Spec(A)) frak(p):$ This is trivial because $x in nil => x^n = 0$ and thus $x = 0 in lcoset(A, frak(p))$ because $lcoset(A, frak(p))$ is a domain, hence $x in frak(p)$.
  2. $nil supset.eq inter_(frak(p) in Spec(A)) frak(p)$: We will go for a contrapositive. Suppose $x$ is not nilpotent. Then you want $frak(p) in Spec(A)$ such that $x in.not frak(p)$. Consider the poset of $P = {I subset.eq Spec(A) : x^NN in.not I}$ with the comparison relation given by $subset.eq$. Suppose $S = emptyset$ empty chain, note that $P != emptyset$ because $(0) in P$. If $S$ is a nonempty chain in $P$, let $ J = union.big_(I in S) I subset.eq A $ is a ideal. Since no interim ideal contains any positive power of $x$, $J$ doesn't contains any positive power of $x$. By Zorn's lemma there exists a maximal element $I$. Clearly $1 in.not I$, because $x in.not I$. Suppose $y in R - I$, $z in R - I$ and $y z in I$. Thus $I subset I + (y)$ and $I subset I + (z)$. So $I + (z), I + (y)$
]

#definition("Radical Ideal")[
  A ideal $I$ is *radical* if $lcoset(R, I)$ has no nilpotent elements.
]

#definition("Radical of a Ideal")[
  For a ideal $I$ in a ring $R$, the *radical* of $I$ is $ r(I) := {x in R: (exists n >= 1) x^n in I} = [R -> lcoset(R, I)]^(-1)(nil) $ where $[R -> lcoset(R, I)]^(-1) (nil)$ is the inverse image of the nilradical of $lcoset(R, I)$. Equivalently $r(I)$, is the smallest radical ideal containing $I$.
]

#corollary()[
  For any ideal $I subset.eq R$, $r(I)$ is the intersection of the prime ideals that contain $I$.
]

#theorem()[
  For any ring $R$ and ideals $I, J subset.eq R$. $V(I) = V(J) <=> r(I) = r(J)$.
]

= Module
#definition("Left Module")[
  A *Left Module* over a ring $A$ (not necessarily commutative) is a abelian group $M$ with a action of the ring $A$ such that:
  1. $1 * m = m$ for all $m in M$
  2. $(a b) * m = a (b ast m)$
  3. $(a + b) * m = a * m + b * m$
]
#remark()[
  A right $A$-module M, written $m ast a in M$ for $m in M$ and $a in A$. They are not always equal to to the left $A$-module. For a commutative ring left and right modules are the same.
]

#example[
  For a field $k$, a $k$-vector space is a $k$-module. For a ring $A$ and $n >= 0$, $A^n$ is a $A$-modules, called the free module. A $ZZ$-module is equivalent to a abelian group. An ideal $I$ in a commutative ring determines two obvious modules: $I$ itself, $lcoset(A, I)$. In a more general setting, a left ideal is a left submodule of $A$, a right ideal is a right submodule. For $k$ a field, a $k[x]$-module is a $k$-vector space $M$ together with a $k$-linear map from $M -> M$ (action of $x$). More generally, a $k[x_1, ..., x_n]$ is a $k$ vectorspace with n maps $x_1: M -> M$, ... $x_n: M -> M$ such that the maps commute. If $E$ is a real vector bundle over a topological space $X$, then the set $M$ of continuous sections of $E$ is a module over the $C(X)$.

  #figs.bundle-sections
]

When seeing the theorem about modules , consider what it tells you about ideals, by looking at $lcoset(A, I)$.

The category of $A$ modules is a additive category, unlike (say) the category of commutative rings or commutative $A$-algebra. Thus $A$-modules form a nicer simpler category, and studying $A$-modules is nicer than studying $A$. For a commutative ring, $Hom_A (M, N)$ is a $A$-module (this is not true for a generic ring).

#definition()[
  For a $A$ linear map $phi$: $ ker(phi) & := {x in M: phi(x) = 0} \
   im(phi) & := {f(m) : m in M} \
  coker(f) & = lcoset(N, im(phi)) $
]

#theorem("Universal Property of Quotient Module")[
  Given $M$ a $A$-module and $N$ a $A$-submodule, we get a quotient module $lcoset(M, N)$ with a A linear map $phi: N -> lcoset(M, N)$ with $ker phi = N$. Equivalently, for any module $Q$, there is a 1 to 1 correspondence between $A$-linear maps $lcoset(N, M) -> Q$ and $A$ linear maps $N -> Q$ with kernel which contains $M$.

  #figs.quotient-ump
]

#theorem("Universal Property of Free Module")[
  For a commutative ring $A$ and any $n >= 0$, there is a 1 to 1 correspondence from $A$-linear maps $A^n -> M$ with n-tuples of elements of $M$.

  #figs.free-ump
]

For any ring homomorphism $A ->^f B$, we get a continuous map $  Spec B & ->^(f^*) Spec A \
frak(p) & -> f^(-1)(frak(p)). $ Thus $Spec$ is a contravariant functor.

#theorem()[
  For any ideal $I$ in a commutative ring, the ring homomorphism $A -> lcoset(A, I)$ determines a continuous map $ Spec(lcoset(A, I)) -> Spec(A) $ is a homomorphism into a closed subset of $Spec(A)$. ]
#proof[
  Follow your nose.
]

#example([
  What is $Spec(lcoset(Z, 10))$?
])[ By the theorem, the set is homomorphic to ${10 = 0} subset.eq Spec(ZZ)$ in otherwords ${(2), (10)}$ with the discrete topology. ]

#lemma()[
  Let $R$ be a domain. Then $cl({(0)}) = Spec(R)$.
]
#proof[
  Let $S$, be a closed subset which contains $(0)$. $exists I subset.eq R$ such that $S = V(I)$. So $I subset (0) => I = (0)$. Then $S = V(I) = Spec R$.
]

#corollary[
  Let $R$ be any commutative ring, and $frak(p) in Spec(R)$ a point. Then the closure of this point is $V(frak(p))$.
]
#proof[
  $Spec(lcoset(A, frak(p)))$ is homomorphic to a closed subset $Spec(A)$. $V(frak(p))$. But $(0) in lcoset(A, frak(p))$ comes from $frak(p)$. By 4.6 we can conclude the result, because $cl({(frak(p))}) iso cl({(0)}) = Spec(lcoset(A, frak(p))) iso V(I)$.
]

#lemma()[
  For any ring $R$, $Max R := {"maximal ideals of" R}$ is the set of closed points
]
#proof[
  Given a maximal ideal $frak(m) in Spec R$. $cl({frak(m)}) = V(frak(m)) = {frak(p) in Spec R : frak(m) subset frak(p)} = {frak(m)}$. If $frak(p) in Spec(R)$ is closed, then $V(frak(p)) = {frak(q) in Spec(R): frak(p) subset.eq frak(q)} = {frak(p)}$ hence $frak(p)$ is not contained in any other prime ideal, hence maximal ideal and must be maximal.
]

#definition("Irreducible Subspaces")[
  A topological space $X$ is irreducible if $X != emptyset$ and you can't write $X = X_1 union X_2$ proper and $X_1$ and $X_2$ closed in $X$.
]

== Operations on Modules.
#definition()[
  For a subset $S$ for a $R$-module $M$, the submodule generated by $S$ is the intersection of all submodules containing.
]

#definition("Biliear Map")
#definition("Tensor product")

== Exact Sequence Bullshit
#definition("Exact Sequence")[
  An *exact sequence* of $R$-modules (for noncommutative ring use left module) is a sequence of $R$-modules ${M_(n) }_(n in ZZ)$ with maps ${phi_n: M_n -> M_(n + 1) }_(n in ZZ)$ such that $ ker(phi_n) = im(phi_(n - 1)). $ Note this sequence my truncate, ie you may have $phi_n = 0$ for $n >= N$ or $n <= N$ for $N in ZZ$.

  #align(center)[#figs.exact-seq]
]

#definition("Short Exact Sequence (SES)")[
  A short exact sequence is an exact sequence of the form $ 0 -> A ->^f B ->^g C -> 0. $ ]

== Presentation of Modules
For a $R$ module $M$, let $(m_i)_(i in I)$ be a set of generators for $M$ (as a $R-$module). There exists a surjective map $phi: R^(oplus I) ->> M$. Let $K = ker(phi)$, an $R-$submodule of $R^(oplus I)$. Thus we have an exact sequence $ K arrow.r.hook R^(oplus I) ->> M -> 0. $ Say that $(u_j)_(j in J)$ is a set of generators for $K$, thus we have an exact sequence $ R^(oplus J) iso K arrow.hook R^(oplus I) -> M -> 0 $

== Projective Module
#definition("Projective")[
  A R-module $M$ is *Projective* if it's a summand of a free $R$-module. That is that there exists a set $I$ such $exists R$-module $N$ such that $R^(oplus I) iso M oplus N$.
]

#theorem()[
  Let $M$ be a module over a ring $R$. The following are equivalent:
  1. M is projective
  2. Every short exact sequence of $R$-modules $ 0 -> A -> B -> M -> 0 $
  3. Every SES $0 -> A -> B -> C -> 0$ every $R$-linear map $M -> C$ lifts to $B$.
]
#proof[
  2. A splitting of a SES is a map $M -> B$ such that $M -> B -> M$ is $1_(M)$. This implies $B = A oplus M$.
  3. A lift of $M -> C$ to $M -> B$ is a R linear map such that the obvious commutative diagram commutes.
]


#example()[
  1. $lcoset(ZZ, 2 ZZ)$ is not projective as a $ZZ$ module. If it was a free module would have torsion.
]

== Tensor Product
#definition("Tensor Product")

#remark[
  Every element of a tensor product module, can be written as a finite sum of decomposable elements  $ sum_(k = 1)^(n) r_k (a_k otimes b_k) $ where $r_k in R$, $a_k in A$, $b_k in B$. A decomposable element is $a ox b$ where $a in A$ and $b in B$. In general, not every element of the tensor product is decomposable.

  It isn't clear how to check when two arbitrary finite sums of decomposable elements are equal. For example, consider $ 1 ox 1 in QQ ox_(ZZ) lcoset(ZZ, 2) $ is equal to 0. $ 1 ox 1 & = (2(1/2)) ox 1 \
         & = 2(1/2 ox 1) \
         & = 1/2 ox 2 \
         & = 1/2 ox 0 = 0 $

  For a non commutative ring $R$, can define $A ox_R B$ for a $A$ a right $R$-module and $B$ a left $R$-module. $(a r) ox b = a ox (r b)$. Broadly we want the "letters to be in the same order". In general $A ox_R B$ is a abelian group, but not an $R$-module. If $R$ is an $S-$algebra, then $A ox_R B$ is at least a $S-$module.
]

#exercise(
  "Functoriality of Tensor",
)[Tensor product of R module is a functor in each factor. That is given a $R$-linear map $M_1 -> M_2$ and an R module there is a natural map $ M_1 ox N -> M_2 ox N $]


#lemma[
  For any commutative ring $R$ A, B, C, there are natural isomorphisms. All tensor products are over $R$. $ R ox_R A iso A \ A ox B iso B ox A \ (A ox B) ox C iso A ox (B ox C) \ (A opl B) ox C iso A ox C opl B ox C $
]

The lemma implies that if $M$ and $N$ are free $R$-module of ranks $a$ and $b$, then $R^(opl a) ox R^(opl b) iso R^(opl a b)$.

#lemma[
  Let $A -> B -> C -> 0$ be a exact sequence of $R$-module, M an $R$ module Then $ A ox_R M -> B ox_R M -> C ox_R M -> 0 $ is exact.
]

#example()[
  For any element $f in R$ and a $R$-module $M$. Say we have $R ->^(times f) R -> lcoset(R, (f)) -> 0$. Lemma gives us $ M ->^(times f) M -> lcoset(R, (f)) ox_R M -> 0 $ we know that $ lcoset(R, (f)) ox_R M iso lcoset(M, f M) $
]

#remark()[
  For a PID $R$, an $R-$module is projective $<=>$ its free. By the structure theorem of finite generated Modules over a PID: $ M iso R^(opl a) opl (opl lcoset(R, (p_i^(m_i) ))) $ where $p_i$ are irreducible and $m_i >= 1$.
]

#example()[
  $QQ$ is not a projective $ZZ$-module, since $ZZ$ is a PID and $QQ$ is not free as a $ZZ$-module.
]

== Algebra and Tensor Products
#definition()[
  A $A$-algebra $B$ is  of a finite type (over $A$) if $B$ is finitely generated as a $A$ algebra. ($<-> B iso lcoset(A[x_1, ..., x_n], I)$ for some ideal $I$).
]

There is a functor from $B$-modules -> A modules called "restriction of scalars".

Using $ox$ you can also define the functor $A$-module -> $B$-modules, "extension of scalars", $M -> M ox_A B$ where $b(m ox b prime ) = m ox b b prime$. You show this is well defined using the universal property.

== Flat Modules

#lemma("Characterizing Flat Modules")[
  TFAE, for an $A$ module $M$
  1. $M$ is flat as a $A$-module
  2. For every injection $N_1 -> N_2$ of $A$-modules, $N_1 ox_A M -> N_2 ox_A M$ is a injection

]


= Localization
Inverting elements in a (comm) ring $A$ is the same as a working near a point of $Spec(A)$.

A special case of localization is going from a domain $A$ to the field $Frac(A)$.

#example()[
  Consider $CC[x]$. An element $f in CC[x]$ determines a function $f: CC -> CC$. We write $ C(x) := Frac(C[x]) = {"rational functions in one variable" in CC}. $ But $CC(x)$ only defines a function on a open set of $CC$ (specifically $CC - {"finite"}$). Another example of localizing $C[x]$, is $C[x] subset.eq R subset.eq C(X)$ where $R$ is the ring of rational functions which doesn't explode up to infinity at 0, this is the same as studying $CC$ near the origin.
]

#definition()[
  $A$, a ring, a subset $S subset.eq A$ is called *multiplicatively closed* if $S$ is a submonoid $(A, dot)$ (identity, associativity, not necessarily inverses).
]

#theorem[
  For a multiplicatively closed subset $S subset.eq A$, there is a comm ring $A[S^(-1)]$ with a ring homomorphism $f: A -> A[S^(-1)]$ such that
  1. $forall s in S$, $s ->_f s in (A[S^-1])^times$
  2. $A[S^(-1)]$ is universal for property $(1)$, thus for any comm ring $B$ and a ring hom $g: A -> B$ such that every element of $S$ maps to a unit in $B$. There exists a unique homomorphism from $A[S^(-1)] -> B$ such that the diagram commutes.
]
#proof[
  Show that $a t - b s = 0 <=> a/s = b/t$ is not sufficient .

]

#example[
  if $A$ is a domain. and $0 in.not S => A subset.eq A[S^(-1)] subset.eq Frac(A) .$ if $0 in S => A[S^(-1)] = 0$. For any comm ring $A$. Given that $f in A$, $S = {1, f, f^2, ...}$. We write $A[1/f] = A[S^(-1)]$. Given any $frak(p) subset.eq A$, prime ideal. Let $S = A - frak(p)$ (this is multiplicatively closed if and only $frak(p)$ is prime). Thus $A_(frak(p)) = A [ A - frak(p)]$ "localization of $A$ at prime ideal $frak(p)$".

  $ZZ[1/2] = {(n) / (2^i) : n in ZZ, i >= 0}$ is a localization of $ZZ$. Compare
  this to $ZZ_((2)) = {a/p : a in ZZ, b "is odd"}.$ Let $k$ be a field. $  k[x][1/x] & = {(f(x)) / (x^n) : f in k[x], n >= 0} = k[x, x^(-1)] subset.eq k(x) \
  k[x]_((x)) & = {(f(x)) / (g(x)) : f, g in k[x], g(0) = 0} $

  An element of $k[x, x^-1]$ gives a function from $k - {0} -> k$. Wheres $f in k[x]_((x))$ gives a function from a open neighborhood of $0$ to $k$.
]

#theorem()[
  Let $S$ be a multiplicatively closed subset of a ring $A$ with respect to $S$. Then the prime ideals of $A[S^(-1)]$ are in one to one correspondence with prime ideals of $A$ that are disjoint to $S$.
]

== Local Ring
#definition()[
  A ring is local if it contains only 1 maximal ideal.
]

#lemma[
  A ring A is local if and only if the nonunits form a ideal
]
#proof[

]


== Colimits
Many constructions so far (direct sums, quotients, cokernels, $A ox_R B$, $A[S^(-1)]$) are instances of a single universal construction: gluing a diagram of objects together along its maps.

#definition("Diagram")[
  Let $C$ be a category and $S$ a small category. A *diagram in $C$ of shape $S$* is a functor $F: S -> C$. Concretely, it is an object $F(i)$ for each $i in S$ and a morphism $F(alpha): F(i) -> F(j)$ for each arrow $alpha: i -> j$ in $S$, compatibly with composition and identities.
]

#definition("Cocone, Colimit")[
  A *cocone* on $F$ is an object $T$ of $C$ together with morphisms $g_i: F(i) -> T$ for every $i in S$ such that $g_j compose F(alpha) = g_i$ for every $alpha: i -> j$.

  A *colimit* of $F$ is a cocone $(L, iota_i)$ which is universal: for every cocone $(T, g_i)$ there is a unique morphism $u: L -> T$ with $u compose iota_i = g_i$ for all $i$. We write $L = colim_(i in S) F(i)$.

  #figs.colimit-ump
]

#remark[
  Equivalently, for every object $T$ there is a bijection, natural in $T$, $ Hom_C (colim F, T) iso {"cocones on" F "with vertex" T}. $ As with every universal property, a colimit (if it exists) is unique up to unique isomorphism. Reversing all arrows gives the dual notion of a *limit* (products, kernels, fibre products, inverse limits).
]
=== Examples in $A$-modules
In the category of $A$-modules every (small) colimit exists. The basic shapes:

#example("Coproduct")[
  If $S$ is discrete (objects only, no non-identity arrows), a cocone is just a family of maps $M_i -> T$, and $ colim_(i in S) M_i = plus.circle.big_(i in S) M_i $ with $iota_i$ the canonical inclusions. (In sets this is the disjoint union; in commutative rings the coproduct of $B$ and $C$ is $B ox_ZZ C$.)
]

#definition()[
  A *directed set* is a poset $P$ such that $P != emptyset$ such that $forall a, b in P$ there exists $c in P$ such that $c >= a$ and $c >= b$

  A *directed system* of objects in a category $C$ in a functor $P -> C$ (any poset $P$ gives a category where objects are the elements of $P$ and $Hom(a, b)$ empty when $a > b$ and a set with 1 element otherwise).

  A *direct limit* of a directed system in a category $C$ is a colimit, if it exists.
]

#example()[
  In Sets, let $F: P -> Set$ be a directed system. For the sake of example $P = NN$, $S_1 ->^(f_1) S_2 ->^(f_2) ....$ The direct limit of this diagram: $ lim_(->) (S_i, f_i) = lcoset(union.sq.big_(a in P) F(a), ~) $ where $x in F(a)$ and $y in F(b)$ there exists $c >= a$ and $c >= b$ such that $x$ and $y$ map to the same element of $F(x)$.

]

== Limits
Given any diagram in category $C,$ $F: S -> A$. The limit of $F$ is a object $D$ in $C$ with the morphism $D: A_i$ with formphisms $D -> F$ (1 for every object $a in S$ such that all diagrams commute) and $D$ is universal with that property.



#definition("Cone, Limit")[
  Dually, a *cone* over $F$ is an object $T$ with morphisms $g_i: T -> F(i)$ such that $F(alpha) compose g_i = g_j$ for every $alpha: i -> j$. A *limit* of $F$ is a universal cone $(L, pi_i)$: for every cone $(T, g_i)$ there is a unique $u: T -> L$ with $pi_i compose u = g_i$ for all $i$. We write $L = lim_(i in S) F(i)$, so $Hom_C (T, lim F) iso {"cones over" F "with vertex" T}$.

  #figs.limit-ump
]

#example[
  In $A$-modules, limits are computed inside the product: $ lim F = {(x_i) in product_i F(i) : F(alpha)(x_i) = x_j "for all" alpha: i -> j}. $
  - Discrete $S$: the product $product_i M_i$.
  - $f, g: M arrows.rr N$: the equalizer $ker(f - g)$; with $g = 0$, the kernel $ker f$.
  - $B ->^f D <-^g C$: the fibre product $B times_D C = {(b, c) : f(b) = g(c)}$.
  - $dots.c -> M_3 -> M_2 -> M_1$: the inverse limit, e.g. $ZZ_p = lim ZZ \/ p^n$.
]


#definition()[
  A inverse system in a category $C$ is a functor $S^(op)->C$ where $S$ is a directed system, op reverses all arrows.

  Ex: $A_3 -> A_2 -> A_1$ is a inverse system
]

#example[
  In Sets, or $R$modules, or Comm ring etc. $ lim_(<-) M_(alpha) = {(m_alpha) product_(alpha in "ob"(S)) : "for every" a <= b, m_A -> m_b } $
]


== Adjoint Functoriality
Given a category $A$ and $B$, a functor $F: A -> B$ is left adjoint to $G: B -> A$ (we say G is right adjoint to $F$) if there is a natural bijection of sets $Hom_(B)(F(X), Y) <-> Hom_A (X, G(Y)).$ for all $X in A$ and $Y in B$.


The forgetful functor $R$-modules to Sets is a right adjoint functor to the free functor from sets to $R$ modules $I -> R^(ox I)$.
