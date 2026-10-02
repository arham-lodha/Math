#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "ProblemSet9",
  name: "Arham Lodha",
  due: "August 17, 2026",
)

#problem("Basic Exam, Spring 2022")[
  Let $(a_n)$ be a sequence of positive reals such that
  $ a = lim_(n -> oo) n a_n $
  exists with $a in (0, oo)$. Prove that $f(x) = sum_(n=0)^oo a_n x^n$ is convergent
  with $f(x)$ continuously differentiable for all $x in (-1, 1)$. Then show
  $ lim_(x -> 1^-) f'(x)(1 - x) = a. $
]

#solution[

]

#problem("Basic Exam, Fall 2021")[
  Let ${a_n}$ be a sequence in $RR$ that decreases to $0$ and let ${b_n}$ be a
  sequence with bounded partial sums, i.e. there exists $M in RR$ such that for all $n$,
  $ abs(sum_(k=1)^n b_k) <= M. $
  Show that $sum_(n=1)^oo a_n b_n$ converges.
]

#solution[
  Let $ B_n = sum_(k = 1)^(n) b_k "and" B_0 = 0. $
  Thus $ S_n = sum_(k = 1)^(n) a_k b_k & = sum_(k = 1)^(n) a_k (B_(k) - B_(k - 1)) \
                                & = sum_(k = 1)^(n) a_k B_k - sum_(k = 1)^(n) a_k B_(k - 1) \
                                & = a_n B_n + sum_(k = 1)^(n - 1) a_k B_k - sum_(k = 0)^(n - 1) a_(k + 1) B_(k) \
                                & = a_n B_n + sum_(k = 1)^(n - 1) (a_k - a_(k + 1)) B_k $

  $forall epsilon > 0$. Since $a_n -> 0$, $exists N_1 in NN$ such that $forall n >= N_1$: $abs(a_n) < (epsilon) / (3 M)$. Furthermore, $exists N_2 in NN$ such that $forall m >= n >= N_2$ we have that $abs(a_m - a_n) < (epsilon) / (3 M)$. Thus $forall m >= n >= max(N_1, N_2)$:

  $
    abs(S_m - S_n) &= abs(a_m B_m + sum_(k = 1)^(m - 1) (a_k - a_(k + 1)) B_k - a_n b_n - sum_(k = 1)^(n - 1) (a_k - a_(k + 1)) B_k) \
    &<= M abs(a_m) + M abs(a_n) + abs(sum_(k = n)^(m - 1) (a_k - a_(k + 1)) B_k) \
    &<= M abs(a_m) + M abs(a_n) + M abs(sum_(k = n)^(m - 1) (a_k - a_(k + 1))) \
    &= M abs(a_m) + M abs(a_n) + M abs(a_n - a_m) < epsilon
  $

  Thus $S_n$ is cauchy hence $S_n$ is convergent.
]

#problem("Basic Exam, Spring 2018")[
  Prove that for each $p in NN$, the infinite series
  $ sum_(n=1)^oo frac(sin(pi n \/ p), n) $
  converges.
]

#solution[

]

#problem[
  Assume that a positive series $sum_(n=1)^oo a_n$ converges and that the sequence
  $(n a_n)_(n=1)^oo$ is decreasing. Show that
  $ lim_(n -> oo) (n log n) a_n = 0. $
]

#solution[

]
