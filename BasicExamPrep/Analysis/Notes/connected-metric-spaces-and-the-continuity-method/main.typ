#import "template.typ": *
#import "figures.typ" as figs

#show: notes.with(
  title: "Connected Metric Spaces and The Continuity Method",
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
#definition("Connectedness")[
  A metric space $X$ is connected if and only if the only subsets of $X$ which are open and closed are $X$ and $emptyset$.
]

#definition("Disconnection")[
  A disconnection of a metric space is a pair of open sets $U, V in cal(T) \/ {emptyset}$ where $U inter V = emptyset$ and $X = U union V$
]

Thus $X$ is connected $<=>$ $X$ has no disconnection.

#proposition()[
  Let $X$ be a metric space and let ${A_j}_(j in J)$ be a family of connected subsets of $X$, such that for $(j prime , j prime prime) in J times J$ there exists ${j_k}_(k = 1)^(N) subset J$ where $j_1 = j prime$ an $j_N = j prime prime$ where $A_(j_k) inter A_(j_(k + 1)) != emptyset$ then $ A = union.big_(k = 1)^N A_(j_k) $ is connected.
]

= Main Theorem
#theorem[
  A subset of $RR$ is connected if and only if its an interval
]
#proof[
  $=>$: Let $C subset.eq RR$ with at least 2 distinct elements $a < b$. If $X in (a, b)$ such that $x not in C$. Then $(-oo, x) inter C$, $C inter (x, oo)$ is a disconnection. Thus $C$ has the property that if $a, b in C$ where $a < b$ then $(a,b) in C$. This means that $C$ is a interval.

  $<==:$ Let $I subset RR$ be a nonempty interval. Assume there is a disconnection $U_1, U_2 in cal(RR)$ such that $U_j inter I != emptyset$ and $I subset.eq U_1 union U_2$. Let $a_j in I inter U_j$ we may assume $a_1 < a_2$. Let $ b = sup ([a_1, a_2] inter U_1) => a_1 <= b <= a_2 => b in [a_1, a_2] subset.eq I. $ If $b in U_1$, then $a_1 <= b < a_2$. Take $exists epsilon_1 > 0$ such that $b + epsilon_1 < a_2$ and $b + epsilon_1 in U_1$ this contradicts the supremum nature of $b$.
  Thus $b in U_2$, then $a_1 < b <= a_2$. There exists a $epsilon_2 > 0$ such that $[b_1 - epsilon, b_1 + epsilon] subset.eq U_2 inter (a_1, oo)$. By the definition of least upper bound, $b - epsilon_2$ is not an upper bound for $[a_1, a_2] inter U_1$ so there exists $c in [a_1, a_2] inter U_1$ where $a_1 < b - epsilon_2 < c <= b <= a_2$. Thus $c in U_1 inter U_2$ but impossible because $U_1 inter U_2 = emptyset$.
]

= Continuity Method:
Let $I subset RR$ be an interval and $0 <= y in C(I)$ be such that $y(t) <= A + epsilon F(y(t))$ for $t in I$ and $A > 0$, $epsilon > 0$, $F: [0, oo) -> [0, oo)$ is locally bounded: $ sup_(xi in [0, R]) F(xi) < oo, forall R > 0 $

Assume also that $y(t_0) <= 2 A$ for some $t_0 in I$.

#proposition[
  For $epsilon > 0$ small enough, $y(t) <= 2 A$ for all $t in I$.
]
#proof[
  Let $E = {t in I: y(t) <= 2A} != emptyset$ because $t_0 in E$. $E$ is closed (y is continous). We will show for $epsilon > 0$ small enough $E$ is open and hence a interval. Let $t_1 in E$, $y$ continous thus $exists delta > 0$ so that $t in (t_1 - delta, t_1 + delta)$ so $abs(y(t) - y(t_1)) < 1$. We get for $t in (t_0 - delta, t_0 + delta)$. $y(t) <= A + epsilon F(y(t))$. We know $0 <= y(t) <= y(t_1) + 1 <= 2A + 1$.

  Thus $ y(t) <= A + epsilon sup_(xi in [0, 2A + 1]) F(xi). $

  Thus for $epsilon > 0$ small enough $y(t) <= 2A$. Thus $E$ is open. Thus $E = I$.
]




