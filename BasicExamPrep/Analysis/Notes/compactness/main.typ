#import "template.typ": *
#import "figures.typ" as figs

#show: notes.with(
  title: "Compactness",
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

= Definition
#definition("Compactness")[

]

#definition("Total Boundedness")

#definition("Cluster Point")[]

#definition("Sequential Compactness")


= Fundamental Theorem of Compactness
#theorem([Compactness $<=>$ Sequential Compactness])[

]

#lemma(
  [Compactness $=>$ Sequential Compactness],
)[Let $(X, d)$ be compact metric space, then $X$ is sequentially compact.]<maintheoremA>
#proof[
  Assume the contrary
]

#lemma([Compactness $<==$ Sequential Compactness])[
]<maintheoremB>
#proof[

  $<==$: Assume the contrary that $X$ is not compact. $G$ be a open cover of $X$ with no finite subcover.
]

#lemma([Sequential Compactness $=>$ Total Boundedness])[]<totalboundedness>

#lemma([Sequential Compactness $=>$ Completeness])[]<completeness>

#theorem("Cantor's Intersection Theorem")[
  Let $(X,d)$ be a complete metric space. Let $(V_n)_(n in NN)$ where $V_1 supset.eq V_2 supset.eq ...$ and $V_i$ is closed and nonempty such that $d(V_n) = sup_(x, y in V_n) d(x, y) -> 0$. Then $ inter.big_(n in NN) V_n $ consists of one point.
]<CantorIntersectionTheorem>
#proof[
  At most one point one point: Suppose $x, y in V_n$ for all $n$, then $d(x, y) <= d(V_n) -> 0$ so $x = y$.

  At least one point: Let $x_i in V_i$ and create a sequence $x_n$. The sequence is Cauchy (nested sets gives us this). $n, m >= N =>$ $V_n union V_m subset V_N => d(x_n, x_m) <= d(V_N) -> 0$. By Completeness, $x = lim_(n -> oo) x_n$ exists. If $n >= m => x_n in F_n in F_m$. Letting $n -> oo$ while keeping $m$ fixed and knowing $V_m$ is closed, $x_n -> x in V_m$. So $x$ is in the Intersection.
]
