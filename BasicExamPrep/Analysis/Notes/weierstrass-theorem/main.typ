#import "template.typ": *
#import "figures.typ" as figs

#show: notes.with(
  title: "Weierstrass Theorem",
  author: "Arham Lodha",
  course: "Bootcamp",
  instructor: "Michael Hitrik",
  cover: false, // set true for a title page
  toc: false, // set true for a table of contents
  chapter-breaks: false,
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

= Basic Definitions
#definition("Support of a function")[
  $forall f in C(RR)$, let $ "supp"(f) = overline({x in RR : f(x) != 0}) $
]

#definition("Compactly Supported Continuous Functions")[
  $ C_0 (X) := {f in C(X) : "supp"(f) "is compact"} $
]

= Main Theorem
#theorem("Weierstrass Theorem")[
  $forall f in C([a, b])$, $forall epsilon > 0$ there exists a $p$, polynomial, such that $norm(f - p)_(oo) < epsilon$.
]
#proof[
  Let $f(x) = f((1) / (b - a)(x - a))$, $f$ is now a function from $[0, 1] -> RR$. Let $ g(x) = f(x) - f(0) + (f(0) - f(1))x. $ This change in $g(0) = g(1) = 0$
]
