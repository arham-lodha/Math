#import "template.typ": *
#import "figures.typ" as figs

#show: notes.with(
  title: "Notes",
  author: "Arham Lodha",
  instructor: "Professor Wilfred Gangbo",
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

= Introduction


= Basic Definitions
#definition([$sigma$ algebra])[
  A family $cP subset.eq 2^(X)$ is a $sigma-$algebra if:
  1. $emptyset in P$
  2. $cP$ is closed under complement: $A in cP <=> A^c in cP$
  3. $cP$ is closed under *countable* union: $A_n in P => union_(n in NN) A_n in cP$
]

#remark()[
  Is there any relation between a $sigma-"algebra"$ and a algebra over a ring?
]

#exercise("Closed under countable intersection")[
  Show $cP$ is closed under countable intersection. $ inter.big_(n in NN) A_n in cP $
]
#proof[$A_n in cP => A_n^c in cP$. Then $ union.big_(n in NN) A_n^(c) in cP &=>^"De Morgan's Laws" (inter.big_(n in NN) A_n)^c in cP => inter.big_(n in NN) A_n in cP $
]

#definition("Outer Measure")[
  A function $mu: 2^X -> [0, infinity]$ is an *outer measure* if:
  1. $mu(emptyset) = 0$
  2. $mu(union.big_(i=1)^infinity A_i) <= sum_(i=1)^infinity mu(A_i)$ for any $(A_i)_(i >= 1)$ in $2^X$
  3. $B subset.eq A subset.eq X => mu(B) <= mu(A)$
]

#example[
  The counting measure $mu(A) = abs(A)$ (number of elements in $A$) is an outer measure on any set $X$.
]

#remark[
  For which $B subset.eq X$ does $mu(A) = mu(A inter B) + mu(A without B)$ hold for all $A in 2^X$? When can $B$ "nicely separate" an arbitrary test set?
]

#definition([$mu$-Measurable Set])[
  $B subset.eq X$ is *$mu$-measurable* if $forall A in 2^X$,
  $ mu(A) = mu(A inter B) + mu(A without B). $
  We write $Sigma(mu) := { A in 2^X : A "is" mu"-measurable" }$.
]

#definition("Restriction")[
  For $C subset.eq X$, the *restriction* $mu|_C : 2^X -> [0, infinity]$ is defined by
  $ mu|_C (A) = mu(A inter C). $
]

#theorem[
  Let $mu$ be an outer measure on $X$ and let $B, C subset.eq X$.
  + $B subset.eq C => mu(B) <= mu(C)$.
  + $B$ is $mu$-measurable $<=> B^c := X without B$ is $mu$-measurable.
  + $mu(B) = 0 => B$ is $mu$-measurable.
  + $X$ and $emptyset$ are $mu$-measurable.
  + $B$ $mu$-measurable $=> B$ is $mu|_C$-measurable.
]

#definition("Measure")[
  Let $cP$ be a $sigma$-algebra on $X$. A function $mu: cP -> [0, infinity]$ is a *measure* if:
  1. $mu(emptyset) = 0$
  2. $mu(union.big_(i=1)^infinity A_i) = sum_(i=1)^infinity mu(A_i)$ whenever $(A_i)_(i >= 1) subset.eq cP$ with $A_i inter A_j = emptyset$ for all $i eq.not j$ (countable additivity).
]

#example[
  Given a measure $mu$ on $(X, cP)$, define
  $ rho(A) = inf { mu(B) : B in cP, A subset.eq B }. $
  Then $rho$ is an outer measure on $X$.
]

== Algebraic Perspective:
One can take a purely algebraic perspective to this discussion of sigma algebras and measures. Let $X$ be a set. Note that $2^X$ is canonically bijective to $Hom(X, ZZ_2)$. Furthermore, $Hom(X, ZZ_2)$ is a algebra over $ZZ_2$ and the addition and multiplication operations correspond to set theoretic operations on elements of $2^X$.

Consider the following:
$
                      1_A + 1_B & = 1_(A Delta B) \
                        1_A 1_B & = 1_(A inter B) \
  1_(A) + 1_(B) + 1_(A inter B) & = 1_(A Delta B) + 1_(A inter B) = 1_((A \/ B union B \/ A) Delta A inter B) \
                                & = 1_(A union B) \
                      1_X + 1_A & = 1_(A^c)
$

There is a natural notion of ordering that we can also put on $Hom(X, ZZ_2)$, $ A subset B => 1_A 1_B = 1_A => 1_A <= 1_B. $

Every element of $Hom(X, ZZ_2)$ is idempotent ($f^2 = f$, since $0, 1 in ZZ_2$ are the only idempotents of $ZZ_2$ and squaring is pointwise). A commutative ring in which every element is idempotent is called a *Boolean ring*, so the dictionary above is really the statement that $2^X$, with $union, inter, Delta, (dot)^c$, *is* (canonically) a Boolean ring. This is the starting point of *Stone's representation theorem*: every Boolean ring arises this way, as a ring of subsets of some set.

#remark[
  Ring addition $A + B$ is symmetric difference, *not* union, so union is not the additive structure of the ring. It is instead the derived *join*
  $ A or B := A + B + A B, $
  as one checks on indicators: a point in exactly one of $A, B$ contributes $1+0+0$ or $0+1+0$, a point in both contributes $1+1+1=1$, and a point in neither contributes $0$ — matching $1_(A union B)$ in every case.
]

Furthermore, we can add the $sigma$ portion of the vocabulary to $Hom(X, ZZ_2)$ by allowing sums over a countable number of elements. Some care is needed here: an infinite ring-sum $sum_(i=1)^infinity A_i$ is not *a priori* meaningful, since $ZZ_2$ carries no topology to make such a sum converge. It becomes meaningful exactly when the $A_i$ are pairwise *orthogonal*, $A_i A_j = 0$ for $i eq.not j$ (i.e. pairwise disjoint) — then at each $x in X$ at most one term is nonzero, so the sum is well-defined pointwise, and orthogonality forces $ sum_(i=1)^infinity A_i = or.big_(i=1)^infinity A_i $ (the sum agrees with the union). With this understanding, consider the following substructure.

#definition()[
  $cP subset.eq Hom(X, ZZ_2)$ is a $sigma$-algebra if $cP$ is a subalgebra closed under countable orthogonal sums: whenever $(A_n)_(n >= 1) subset.eq cP$ satisfy $A_n A_m = 0$ for $n eq.not m$,
  $ sum_(n=1)^infinity A_n in cP. $
]

Now to define a notion of outer measure.

#definition("Outer Measure")[
  $mu: Hom(X, ZZ_2) -> [0, infinity]$ is an *outer measure* if
  1. $mu(0) = 0$.
  2. $mu(or.big_(i=1)^infinity A_i) <= sum_(i=1)^infinity mu(A_i)$ for any $(A_i)_(i >= 1)$ — subadditivity. Note the left side is the *join* $or.big$, not the ring sum: the $A_i$ need not be orthogonal.
  3. $A B = A => mu(A) <= mu(B)$ — monotonicity, i.e. $A <= B => mu(A) <= mu(B)$.
]

#definition([$mu$-Measurable Set])[
  $B in Hom(X, ZZ_2)$ is *$mu$-measurable* if for all $A$,
  $ mu(A) = mu(A B) + mu(A(1+B)). $
  Here $1+B$ is the complement of $B$ (from $1_X + 1_A = 1_(A^c)$ above), so $A(1+B)$ is the indicator of $A without B$, and the right-hand side is a genuine ring sum since $A B$ and $A(1+B)$ are orthogonal.
]

The notion of a measure in this context is extremely natural, though it is worth being precise about what kind of map it is:

#definition("Measure")[
  Let $cP$ be a $sigma$-algebra in $Hom(X, ZZ_2)$. A map $mu: cP -> [0, infinity]$ is a *measure* if $mu(0) = 0$ and, for every pairwise orthogonal family $(A_i)_(i >= 1) subset.eq cP$,
  $ mu(sum_(i=1)^infinity A_i) = sum_(i=1)^infinity mu(A_i). $
]

#remark[
  A measure is *not* a ring homomorphism $cP -> [0, infinity]$ — it need not (and generally does not) respect multiplication, i.e. $mu(A B) eq.not mu(A) mu(B)$ in general. It is instead an *additive valuation*: a map turning orthogonal ring-sums (which, by the remark above, coincide with joins/unions) into honest sums of real numbers. A Boolean ring equipped with such a valuation is called a *measure algebra*. This algebraic reformulation is not merely decorative: the *Loomis–Sikorski theorem* says every $sigma$-complete Boolean algebra carrying a measure is, up to the ideal of null sets, a quotient of a genuine measure space $(Y, Sigma, nu)$ — so "measure theory on abstract Boolean rings" and "measure theory on sets" are the same theory.
]
