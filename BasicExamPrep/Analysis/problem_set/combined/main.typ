#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Combined Problem Set",
  name: "Arham Lodha",
  due: "August 24, 2026",
)

// ── Monday August 24 ─────────────────────────────────────────────────────────

#problem(todo: true, "Basic Exam, Fall 2011")[
  Let $(X, d)$ be a compact metric space and let $f : X -> X$ be a map satisfying
  $ d(f(x), f(y)) < d(x, y), quad forall x, y in X, x != y. $
  Prove that there is a unique point $x in X$ such that $f(x) = x$.
]

#solution[
  Look at $g: X -> RR$ where $g(x) = d(f(x), x)$. $X$ is compact and thus $exists z in X$ such that $g(x) <= g(y)$ for all $y in X$. Assume the contrary that $f(z) != z$. Consider $g(f(z)) = d(f(f(z)), f(z)) < d(f(z), z) = g(z)$ which is a contradiction.

  Uniqueness is straight forward because $x$, $y$ fixed points then $d(f(x), f(y)) = d(x, y)$ which contradicts the assumption.
]

#problem(todo: true, "Basic Exam, Fall 2020")[
  Find all positive values of $x$ for which the series
  $ sum_(n=0)^oo frac((x n)^n, n!) $
  converges.
]

#solution[
  $ H = limsup_(n -> oo) (n) / ((n!)^(1/n)) $

  We have Sterling's Approximation, that $n! ~ sqrt(2 pi n)(n/e)^n$.
]

#problem(todo: true, "Basic Exam, Spring 2018")[
  #part(todo: true)[
    Let $U subset.eq RR^n$ be non-empty, open, and connected. Suppose that
    $f : U -> RR$ is such that all the first order partial derivatives of $f$
    exist and vanish at each point of $U$. Prove that $f$ is constant in $U$.
  ]

  #part(todo: true)[
    Let $Omega subset.eq RR^n$ be open non-empty and let $f : Omega -> RR$ be
    such that all the first order partial derivatives of $f$ exist and are
    bounded in $Omega$. Prove that $f$ is continuous in $Omega$.
  ]
]

#solution[
  *(a)*:
  $forall x in U$, there exists a box neighborhood $B_x in.rev x$. By Taylor's Theorem we have, $ f(x + sum_(i = 1)^(k - 1) s_i e_i + t e_k ) = g_k (t; arrow(s)) = f(x + sum_(i = 1)^(k - 1) s_i e_i + t e_k ) + (partial_k f)(x + sum_(i = 1)^(k - 1) s_i e_i) t. $

  For $y in B_x$. There exists a $delta_1, ..., delta_n$ such that $ y - x = vec(delta_1, dots.v, delta_n). $

  $
    abs(f(y) - f(x)) <= sum_(i = 1)^(n) abs(g_(i -1) (delta_(i), arrow(delta)) - g_(i)(delta_(i + 1), vec(delta) )) = 0
  $

  Thus we have constant value.

  *(b)* We re\peat a similar computation to the first thing.


]

#problem(todo: true, "Basic Exam, Fall 2025")[
  Let $f : [0, oo) -> [0, oo)$ be continuous on $[0, oo)$ and continuously
  differentiable on $(0, oo)$ with $integral_0^oo |f'(x)| dif x < oo$. Prove
  that the limit
  $ lim_(n -> oo) lr((sum_(k=1)^n f(k) - integral_0^n f(x) dif x)) $
  exists.
]

#solution[
  $
    sum_(k = 1)^(n) f(k) - integral_0^n f(x) dif x
    &= sum_(k = 1)^(n) integral_(k - 1)^(k) (f(k) - f(x)) dif x \
    &= sum_(k = 1)^(n) integral_(0)^(1) (f(k) - f(x + k - 1)) dif x \
    &= sum_(k = 1)^(n) integral_0^1 integral_(x + k - 1)^k f prime (t) dif t dif x \
    &= sum_(k = 1)^(n) integral_(k - 1)^k (t - k + 1) f prime (t) dif t \
    &= sum_(k = 1)^(n) integral_(k - 1)^k (t - floor(t)) f prime (t) dif t \
    &= integral_0^n (t - floor(t)) f prime (t) dif t \
    &<= integral_0^n abs(f prime (t)) dif t
  $

  By the Direct comparison test, the limit given converges

]
