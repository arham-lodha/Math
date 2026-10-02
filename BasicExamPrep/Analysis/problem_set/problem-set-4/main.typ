#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Problem Set 4",
  name: "Arham Lodha",
  due: "August 08, 2026",
)

// ── Usage ────────────────────────────────────────────────────────────────────
//
//  Basic problem:
//    #problem[
//      State the problem here.
//    ]
//
//  Problem with a title:
//    #problem("Lagrange's Theorem")[
//      State the problem here.
//    ]
//
//  Sub-parts (lettered a, b, c, ...):
//    #problem[
//      Prove the following:
//      #part[First sub-part.]
//      #part[Second sub-part.]
//    ]
//
//  Solution block (shaded, left-bar):
//    #solution[
//      Write your solution here.
//      Use $inline math$ or $ display math $ as needed.
//    ]
//
//  Full example:
//    #problem("Cauchy's Theorem")[
//      If $p mid(|) abs(G)$, show $G$ has an element of order $p$.
//      #part[Reduce to the case $G$ abelian.]
//      #part[Handle the abelian case by induction.]
//    ]
//    #solution[
//      *(a)* ...
//      *(b)* ...
//    ]
// ─────────────────────────────────────────────────────────────────────────────

// Problem 1 (Carry-over from yesterday)
#problem[$l^infinity$ as a Complete Metric Space][
  Let $l^infinity = l^infinity (NN)$ denote the set of all bounded complex-valued sequences $x = (x_n)_(n=1)^infinity$.
  #part[
    Show that $l^infinity$ is a complete metric space when equipped with the metric
    $ d(x, y) = sup_n lr(|x_n - y_n|). $
  ]
  #part[
    Let $(epsilon_n)_(n=1)^infinity$ be a sequence of positive real numbers such that $epsilon_n -> 0$ as $n -> infinity$. Show that
    $ M = {x = (x_n) in l^infinity : lr(|x_n|) <= epsilon_n, quad n = 1, 2, dots} $
    is a compact subset of $l^infinity$.
  ]
]
#solution[
  *(a)*: Let $(x^m)_(m in NN) subset l^(oo)$ be a sequence of bounded complex valued sequences that is Cauchy. Thus $forall epsilon > 0$ there exists $N in NN$ such that $m_1 >= m_2 >= N$: $d(x^(m_1), x^(m_2)) < epsilon$. This means $forall n in NN$, $ abs(x^(m_1)_n - x^(m_2)_n) <= d(x^(m_1) , x^(m_2) ) < epsilon. $ Thus for fixed $n$, $(x^(m)_n)_(m in NN)$ is a Cauchy sequence in $CC$. By Completeness of $CC$, $ lim_(m -> oo ) x^m_n $ exists. Let $ y_n := lim_(m -> oo ) x^m_n. $

  We want to show two things regarding $y$:
  1. $y$ bounded: $exists N >= 0$ such that $d(x^m, x^n) < 1$ for $m, n >= N$ this means $forall n in NN$: $abs(x^p_n - x^N_n) < d(x^m, x^N) < 1$. Thus
  $ abs(y_n) <= abs(y_n - x^N_n) + abs(x^N_n) = lim_(p -> oo) abs(x^p_n - x^N_n) + abs(x^N_n) <= 1 + d(x^N, 0) $

  Thus $d(y, 0) < oo$.

  2. $x^m -> y$ in $l^oo$: $forall epsilon > 0$ there exists $N in NN$ such that $forall m >= n >= N$: $d(x^m, x^n) < epsilon/2$. $forall p in NN$:

  $ abs(x^m_p - x^n_p) < d(x^m, x^n) < epsilon/2 => abs(y_p - x^n_p) = lim_(m -> oo) abs(x^m_p - x^n_p) <= epsilon/2. $ Thus $d(y, x^n) <= epsilon/2 < epsilon$. Thus $x^m -> y$ as $m -> oo$.

  *(b)*: Let $(x^m)_(m in NN) subset M$ we want to show that $x^m$ has a convergent subsequence. We know for all $m in NN$ and for all $n in NN$, $abs(x^m_n) <= epsilon_n$. Thus $forall n in NN$ the sequence $(x^m_n)_(m in NN)$ is a bounded sequence. So for fixed $n in NN$ there exists a subsequence $(x^(m_i)_n)_(i in NN)$ that is convergent. So here is what you do, starting with $n = 1$ you filter out such that $(x^m_n)_(m in NN)$ is a convergent sequence and then you increment $n$ and filter out so that for all $n$ $(x^m_n)_(m in NN)$ is a convergent sequence. Thus wlog the sequence $x^m$ converges point wise to a sequence $y in l^oo$. Now we have to show $x^m -> y$ as $m -> oo$ in $l^oo$.

  $forall epsilon > 0$, there exists a $K in NN$ such that $e_n < epsilon/2$ for all $n >= K$. Thus for all $m$: $ abs(y_(n) - x^m_n) <= abs(y_n) + abs(x^m_n) <= epsilon_n + epsilon_n < epsilon. $

  Now we have to show that for the first $K - 1$ we can pick a $M$ large enough that $forall m >= M$: $abs(y_k - x^m_k) < epsilon$ for $k in [K - 1]$. We can do this because $x^m_k -> y_k$ for all $k$ as $m -> oo$. For each $k in [K - 1]$, there exists $M_k in NN$ such that $forall m >= M_k$: $abs(y_k - x^m_k) < epsilon$. Let $M = max {M_k : k in [K - 1]}$. Thus $forall m >= K$: $abs(y_k - x^m_k) < epsilon$.

  Thus $forall m >= M$ and all $n in NN$:

  $ abs(y_n - x^m_n) < epsilon => d(y, x^m) <= epsilon. $ Thus $x^m -> y$ as $m -> oo$ in $l^oo$. Thus our original sequence has a convergent subsequence. Hence $M$ is compact.

  *Alternative Proof*: In part *(a)* we proved that $l^oo$ was complete. So to prove that $M$ is compact it suffices to show that its closed and totally bounded.

  1. Totally Bounded: $forall epsilon > 0$, by convergence of $epsilon_n -> 0$ there exists a $N in NN$ such that $forall n >= N$: $epsilon_n < epsilon/4$. Thus $forall x, y in M$ $ abs(x_n - y_n) <= 2 epsilon_n < epsilon/2 < epsilon. $. We now need to show that there exists a collection $alpha^1, ..., alpha^k in M$ such that $forall x in M$ there exists a $m in {1, ..., k}$ such that for all $n in {1, ..., N - 1}$ we have that $ abs(x_n - alpha^m_n) < epsilon/2 => d(x, alpha^m) <= epsilon/2 < epsilon. $

  Note the following: $forall x in M$, $x_(1, ..., N - 1) = (x_1, ..., x_(N - 1)) in {x in CC^(N - 1) : abs(x_n) <= epsilon_n} = A$. Note $A$ is closed and bounded and hence compact in $CC^(N - 1)$. By total boundedness of compact sets, there exists $y^1, ..., y^k in A$ such that $ A = union.big_(i = 1)^k B_(epsilon/2)(y^i) $

  Define $alpha^i$ as follows: $ alpha^i_j := cases(y^i_j "if" j < N, 0 "otherwise"). $ By definition $alpha^i in M$. Furthermore for all $x in M$, note there exists a $i in {1, ..., k}$ such that for $n in {1, ..., N -1}$: $ abs(x_n - alpha_n^i) = abs(x_n - y_n^i) <= d_(CC^(N - 1))(x_(1, ..., N - 1), y^i) < epsilon/2 < epsilon $.

  Thus $forall n in NN$: $ abs(x_n - alpha_n^i) < epsilon/2 => d(x, alpha^i) <= epsilon/2 < epsilon. $

  Thus $ M = union.big_(i = 1)^k B_(epsilon)(alpha^i) $

  2. Closed: Let $(y^i)$ be a convergence sequence in $M$ where $y^i -> y$. Since for all $i$ and all $n$: $abs(y^i_n) <= epsilon_n$, $y$ respects the same inequality and hence is in $M$.

]

// Problem 2 (Basic Exam, Spring 2018)
#problem("Isometry on a Compact Metric Space")[
  Let $(X, d)$ be a compact metric space and let $f : X -> X$ be an isometry (meaning that $d(f(x), f(y)) = rho(x, y)$ for all $x, y in X$). Prove that $f$ is a bijection.

  _Hint._ Consider $x in.not f(X)$ and follow the iterates of $f$ on $x$.
]
#solution[*(a)*: Surjectivity: Assume the contrary $f(X) != X$. Thus there exists $x in X \/ f(X)$. Create the sequence $x_0 = x$ and $x_n = f(x_(n - 1))$. For $m > n$: $ d(x_m, x_n) & = d(f^(n)(x_(m - n)), f^n (x_0)) \
              & = d(x_(m - n), x_0) . $

  Take $epsilon = d(x_0, f(X))$. Note that $forall i in NN$, $d(x_i, x_0) >= epsilon$.

  By the sequential definition of compactness, there exists a subsequence $x_(m_i)$ which is convergent hence Cauchy. Thus there exists $N in NN$ such that for all $j >= i >= N$: $ d(x_(m_j - m_i), x_0) = d(x_m_j, x_m_i) < epsilon. $ Thus $ epsilon <= d(x_(m_i - m_N) , x_0 ) = d(x_(m_j), x_(m_(i) ) ) < epsilon. $ Thus a contradiction occurs.

  *Alternative Proof*: By Total Boundedness of $X$, $forall epsilon > 0$ there exists $A = {a_1, ..., a_k} subset X$ where $ X = union.big_(i = 1)^(k) B_epsilon (a_i). $ Without loss of generality assume $d(a_i, a_j) > epsilon$ and that $k$ is the maximum number of such points.

  *(b)*: Injectivity: Suppose $f(x) = f(y)$. Then $d(x, y) = d(f(x), f(y)) = 0 => x = y$.

]

// Problem 3
#problem("Diameter of Nested Closed Sets")[
  Let $X$ be a compact metric space and suppose that for every $n = 1, 2, dots$, $F_n$ is a closed non-empty subset of $X$ such that $F_n supset.eq F_(n+1)$. Show that
  $ d lr((inter.big_(n=1)^infinity F_n)) = inf_n d(F_n). $
  Here
  $ d(A) = sup_(x, y in A) d(x, y) $
  is the diameter of $A subset.eq X$.
]
#solution[Since for all $n$ $ inter.big_(n in NN) F_n subset F_n => d(inter.big_(n in NN) F_n) <= d(F_n), $ this means $ d(inter.big_(n in NN) F_n) <= inf_(n) d(F_n). $

  We want to show that $ inf_n d(F_n) <= d(inter.big_(n in NN) F_n). $ Create sequences $x_n$ and $y_n$ where $x_i, y_i in F_i$ such that $d(x_i, y_i) = d(F_i)$ (this is possible because $F_i$ is compact and thus achieves its maximum. Note $F_1$ is closed hence compact, thus by sequential definition of compactness, there exists a subsequence which is convergent. Pass to the subsequences of $x_n$ and $y_n$, thus $x_n -> x$ and $y_n -> y$. Note the following $forall n in NN$, $x_(i + n), y_(i + n) in F_n$ for all $i in NN$ and thus by the closedness of $F_n$, $x, y in F_n$. Thus $x, y in F_n$ for all $n$ and $x, y in inter F_n$. $d(dot, dot)$ is continuous so since $d(x_n, y_n) -> d(x, y)$ as $n -> oo$. Thus $ inf_(n) d(F_n) = d(x, y) <= d(inter.big_(n in NN) F_n). $ Thus we get equality as described in the problem.


]

// Problem 4 (Cf. with Basic Exam, Fall 2019)
#problem("Continuity and Compact Subsets")[
  Let $X$ and $Y$ be metric spaces. Show that a map $f : X -> Y$ is continuous if and only if its restriction to each compact subset of $X$ is continuous.
]
#solution[


]

// Problem 5 (Basic Exam, Fall 2015)
#problem("Subadditive Sequences")[
  Let $(a_n)_(n=1)^infinity$ be a sequence of positive real numbers such that
  $ a_(n+m) <= a_n + a_m, quad m, n >= 1. $
  Show that $lim_(n -> infinity) a_n / n$ exists by showing
  $ lim_(n -> infinity) a_n / n = inf_(n >= 1) a_n / n. $

  _Hint._ Treat separately $liminf$ and $limsup$.
]
#solution[


]
