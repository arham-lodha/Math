#import "template.typ": *
#import "figures.typ" as figs

#show: notes.with(
  title: "Arzela-Ascoli",
  author: "Arham Lodha",
  course: "bootcamp",
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
Let $C(X)$ be functions from a metric space $(X, d)$ to $RR$ or $CC$.
#definition("Bounded Class of Functions")[
  Let $(X, d)$ be a metric space. $cal(F) subset C(X)$ is bounded if and only if $exists M > 0$ such that $forall f in cal(F)$, $norm(f)_(oo) < M$
]

#definition("Equicontinous Class of Functions")[
  Let $(X, d)$ be a metric space. $cal(F) subset C(X)$ is equicontinous if and only if $forall epsilon > 0$ there exists a $delta > 0$ such that $forall f in cal(F)$ and $forall x, y in X$ such that $d(x, y) < epsilon$ then $abs(f(x) - f(y)) < epsilon$.
]

= Main Theorem
#theorem("Main Theorem")[
  Let $(X, d)$ be a compact metric space. Let $(f_n)_(n in NN)$ be a sequence of bounded, equicontinous functions then there exists a subsequence which is uniformly convergent ie convergent with respect to $abs(dot)_(oo)$.
]<Arzela-Ascoli>
#proof[
  By @PointwiseConvergenceDenseSubset, there exists a subsequence $(g_n)_(n = 1)^(oo)$ which converges pointwise on a countable dense subset $A$ of $X$. By @equicontinuity, $(g_n)_(n = 0)^(oo)$ is uniformly convergent.
]

#lemma("Pointwise Convergent Subsequence on Countable Dense Subset")[
  Let $(X, d)$ be a compact metric space. Let $(f_n)_(n in NN)$ be a sequence which is bounded then there exists a subsequence which is pointwise convergent on a countable dense subset of $X$.
]<PointwiseConvergenceDenseSubset>
#proof[
  Since $X$ is compact, its totally bounded which implies its seperable. You create a countable dense subset by taking the union of the centers of the finite set of balls with radii $1/n$. Let $A = {a_i}_(i in NN)$ be the countable dense subset. Since $(f_n)_(n in NN)$ is bounded, there exists a $M > 0$ such that $norm(f_n)_(oo) < M$ for all $n$.

  *Diagonalization Argument*: We will be defining a series of subsequences such that the $n$th subsequence has pointwise convergent on ${a_1, ..., a_n}$. Let $f_n^((0)) = f_n$. By boundedness of $f^((0))_(n)$, $(f^((0))_(n)(a_1))_(n in NN)$ is a sequence in $overline(B)_(M)(0)$, which is closed and bounded hence compact (Heine Borel), thus there exists a subsequence $(f^((1))_(n))_(n in NN) subset (f^((0))_(n))_(n in NN)$ which is such that $(f^(1)_(n) (a_1))_(n in NN)$ is convergent in $overline(B)_(M)(0)$. Assume that $(f^((m))_(n))_(n in NN)$ is a subsequence of $(f_n)_(n in NN)$ such that $(f^((m))_n (a_i))_(n in NN)$ converges for $i in {1, ..., m}$. $(f^((m))_(n)(a_(m + 1) ))$ is a sequence in $overline(B)_(M)(0)$, hence there exists a subsequence $(f^((m + 1))_n)_(n in NN)$ such that $(f^((m + 1))_(n)(a_(m + 1) ) )_(n in NN)$ converges.

  Thus there exists a sequence of subsequences $(f^((0))_(n)) supset.eq (f^((1))_(n) ) supset.eq ...$, such that $(f^((m))_n )_(n in NN)$ converges pointwise on ${a_1, ..., a_m}$. Construct the subsequence $(g_n)$ of $(f_n)$, where $g_n = f^((n))_n$. Note that $forall k>=n$, $g_k$ is a subsequence of $f^((n))_m$ and thus converges pointwise on ${a_1, ..., a_n}$. Hence $g_k$ converges pointwise on all of $A$.
]

#lemma([Equicontinous sequence + Pointwise $=>$ Uniform Convergence])[

  Let $(X, d)$ be a compact metric space. Let $(f_n)_(n in NN)$ be a sequence which is equicontinous and converges pointwise on a countable dense subset $A = {a_1, a_2, ...}$. $(f_n)_(n in NN)$ converges uniformly with respect to the $norm(dot)_oo$.
]<equicontinuity>
#proof[
  $forall epsilon > 0$, by equicontinuity there exists a $delta > 0$ such that $d(x, y) < delta => abs(f_n (x) - f_n (y)) < epsilon/6$ for all $n in NN$. $forall x in X$, by density of $A$: $exists a in A inter B_(delta) (x)$. Thus $x in B_(delta)(a)$. Thus $ X = union.big_(i = 1)^(oo) B_(delta) (a_i). $ By compactness, there exists a finite subcover of balls with radii $delta$ with centers ${c_1, ..., c_k} subset A$. By pointwise convergence and hence Cauchy convergence at $c_i$, $exists N_i$ such that $forall m >= n >= N_i$: $ abs(f_n (c_i) - f_(m) (c_i)) < epsilon/6. $ Take $N = max {N_1, ..., N_k}$.

  $forall x in X$, there exists a $c_i$ such that $d(x, c_i) < delta$. Furthermore, $forall m >= n >= N$ we have the following:


  $
    abs(f_n (x) - f_m (x)) & <= abs(f_n (x) - f_n (a_i)) + abs(f_n (a_i) - f_m (a_i)) + abs(f_m (a_i) - f_m (x)) \
                           & < epsilon/6 + epsilon/6 + epsilon/6 < epsilon/2 => norm(f_n - f_m)_(oo) <= epsilon/2 < epsilon
  $

  Hence $(f_n)_(n = 0)^(oo)$ is uniformly cauchy hence uniformly convergent.



]

#theorem[Let $(X, d)$ be a compact metric space. $cal(F) subset C(X)$ is compact if and only if $cal(F)$ is equicontinous, bounded, and closed]
#proof[
  $==>$: Suppose $cal(F)$ is compact. The function $norm(dot)_(oo) : C(X) -> [0, oo )$ is continuous, hence $exists k in cal(F)$ such that $sup_(f in cal(F))norm(f)_(oo) = norm(k)_(oo)$ thus $cal(F)$ is bounded. By total boundedness $forall epsilon > 0$, there exists functions $f_1, ..., f_n in cal(F)$ such that $ cal(F) = union.big_(i = 1)^(n) B_(epsilon/3)(f_i). $ Since $f_i$ are continuous on $X$ a compact space, they are uniformly continuous. Thus $exists delta_i > 0$ such that $forall x, y in X$ where $d(x, y) < delta_i$: $abs(f_i (x) - f_i (y)) < epsilon/3$. Let $delta = min {delta_1, ..., delta_n}$. $forall g in cal(F)$, there exists a $f_i$ such that $norm(g - f_i)_(oo) < epsilon/3$. $forall x, y in X$ where $d(x, y) < epsilon$: $ abs(g(x) - g(y)) & <= abs(g(x) - f_(i) (x)) + abs(f_(i)(x) - f_(i)(y)) + abs(f_(i)(y) - g(y)) \
                   & <= 2norm(g - f) + abs(f_(i) (x) - f_(i)(y)) \
                   & < 2 (epsilon/3) + epsilon/3 = epsilon $

  $<==$: Apply @Arzela-Ascoli (Arzela-Ascoli theorem) and then sequential compactness.

  *(Alternative Proof)*: Suppose $cal(F)$ is equicontinous, bounded, and closed. $cal(F)$ is complete. So to show $cal(F)$ is compact we must show that it is totally bounded.

  $forall epsilon > 0$. By equicontinuity, there exists $delta > 0$ such that if $d(x, y) < delta$: $abs(f(x) - f(y)) < epsilon/6$ for all $f in cal(F)$. Since $X$  is compact we can cover it with $delta$ balls centered at $x_1, ..., x_k in X$. Since $cal(F)$ is bounded, there exists a $M > 0$ such that $forall f in cal(F)$: $f(X) subset.eq overline(B)_(M)(0).$ Since $overline(B)_(M)(0)$ is compact in $KK$, there exists a covering of $epsilon/12$ balls centered at $y_1, ..., y_l$. Define the function $phi_f: {1, ..., k} -> "Pow"({1, ..., l})$ where $phi_f (i) = {j in {1, ..., l} : f(x_i) in B_(epsilon / 12)(y_j)}$. Note that there are only finite number of such functions. You can say that $phi: cal(F) -> Hom({1, ..., k}, "Pow"({1, ..., l}))$ where $f -> phi_f$ defines a equivalence relation. Suppose $f, g in cal(F)$ where $phi_f = phi_g$. $forall x in X$, there exists $i in {1, ..., k}$ such that $d(x, x_i) < delta$. Furthermore since $phi_f (x_i) = phi_g (x_i) != emptyset$, then $exists y_j in phi_f (x_i) = phi_g (x_i)$. Thus:

  $
    abs(f(x) - g(x)) & = abs(f(x) - f(x_i) + f(x_i) - g(x_i) - g(x)) \
                     & <= abs(f(x) - f(x_i)) + abs(f(x_i) - g(x_i)) + abs(g(x_i) - g(x)) \
                     & <= abs(f(x) - f(x_i)) + abs(f(x_i) - y_j) + abs(y_j - g(x_i)) + abs(g(x_i) - g(x)) \
                     & < epsilon/6 + epsilon/12 + epsilon/12 + epsilon/6 \
                     & = epsilon/2 < epsilon
  $

  Thus $norm(f - g)_(oo) < epsilon$. There are finite number of equivalence classes, thus take one representative of each equivalence class as your centers of your $epsilon$ balls.

]
= Examples
