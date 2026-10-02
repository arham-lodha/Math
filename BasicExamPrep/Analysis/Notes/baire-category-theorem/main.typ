#import "template.typ": *
#import "figures.typ" as figs

#show: notes.with(
  title: "Baire Category Theorem",
  author: "Arham Lodha",
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

= Theorem Statement
#theorem("BC1")[
  $(X, d)$ is a complete metric space. ${U_i}_(i in NN)$ is a collection of open dense sets. $bold(U) = inter.big_(i = 1)^(oo) U_i$ is a dense set.
]<BC1>
#proof[
  $forall x_0 in X$ and $forall r_0 > 0$. We want to show that $B_(x_(0) ) (r_(0)) inter bold(U) != emptyset$. Note because $U_1$ is a dense set, $U_1 inter B_(x_0)(r_0) != emptyset$ further more because $U_1$ is open there exists $0 < r_1 < r_0/2$ and $x_1 in U_1 inter B_(x_0)(r_0)$ where $ tilde(B)_(x_1)(r_1) subset B_(x_1)(2r_1) subset U_1 inter B_(x_0)(r_0) $

  Define the sequence $(x_i)$ and $(r_i)$ recursively. Because $U_(n+1) inter B_(x_n)(r_n)$ is open and nonempty (density of $U_(n+1)$), $exists x_(n + 1) in U_(n+1) inter B_(x_n)(r_n)$ and $r_(n+1) in (0, r_n/2)$ where $ tilde(B)_(x_(n+1) )(r_(n+1) ) subset B_(x_(n+1) )(2 r_(n+1) ) subset U_(n+1) inter B_(x_n)(r_n) $


  The sequence $x_i$ is Cauchy. This is because for $m >= n >= N$ : $ d(x_m, x_n) <= r_n <= r_N < r_0 2^(-N). $ $forall epsilon > 0$, let $N = lr(ceil(-log_2(epsilon/r_0)))$, thus $m >= n >= N$: $ d(x_m, x_n) <= r_0 2^(-N) < epsilon. $. $r_n -> 0$ geometrically. By completeness of $X$, $exists y in X$ such that $x_i -> y$. For all $n$, $x_k in tilde(B)_(x_n)(r_n)$ for $k >= n$. Since closed sets contain all limit points, $x^* in tilde(B)_(x_n)(r_n) subset U_n$ for all $n$.thus $x^(*) in bold(U) inter B_(x_(0))(r_0).$
]

#theorem("BC2")[
  $(X, d)$ is a complete metric space. ${V_i}_(i in I)$ be a collection closed sets with no interior. $ X != union.big_(i in I) V_i $
]



