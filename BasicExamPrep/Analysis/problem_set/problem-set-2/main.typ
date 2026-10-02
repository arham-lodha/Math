#import "template.typ": *

#show: homework.with(
  assignment: "Problem Set 2",
  name: "Arham Lodha",
  due: "August 07, 2026",
)

#problem("Carry-over from Monday")[
  Let $f : [a, b] -> RR$ be a function such that
  $ L(x) = lim_(y -> x) f(y) $
  is well defined and finite for each $x in [a, b]$ (with one-sided limits at
  $x = a, b$).

  #part[Show that $L$ is continuous on $[a, b]$.]
  #part[Show that the set ${x in [a, b] ; f(x) != L(x)}$ is at most countable.]
]

#solution()[

]

#problem()[
  Given a bounded function $f : RR -> RR$, let us introduce the oscillation
  function of $f$,
  $ omega_f (x) = lim_(delta -> 0^+) sup{|f(y) - f(z)| ; y, z in (x - delta, x + delta)}, quad x in RR. $

  #part[
    Show that the limit in the definition above exists and that $f$ is continuous
    at the point $x$ precisely when $omega_f (x) = 0$.
  ]
  #part[
    Show that the function $x |-> omega_f (x)$ is upper semi-continuous in the
    sense that the set ${x in RR ; omega_f (x) < A}$ is open, for each $A in RR$.
  ]
  #part[
    (Basic Exam, Spring 2025) Prove that the function $f$ cannot be continuous on
    the set $QQ$ of rational numbers only.
  ]
  #part[
    Does there exist a function $f : RR -> RR$ that is continuous on the set of
    irrational numbers only? Prove your assertion.
  ]
]

#solution()[
  *(a)*: Let $A_x (delta) := {abs(f(y) - f(z)) : y, z in (x - delta, x + delta)}$. Let $g_(x) (delta) = sup A_x (delta)$. Note for $0 < delta_1 <= delta_2$: $A_x (delta_1) subset.eq A_x (delta_2) => g_x (delta_1) <= g_x (delta_2)$. Thus as $delta -> 0$, $g_x$ is monotonically nonincreasing. Furthermore, $g_x >= 0$. Hence $lim_(delta -> 0^+) g_x (delta)$ exists so $omega_f (x)$ is well defined. Let $C(f) := {x in RR : f "continuous at" x}$. $forall x in C(f)$, $forall epsilon > 0$ exists $delta > 0$ such that for all $y in (x - delta , x + delta)$: $abs(f(y) - f(x)) < epsilon/2$. Thus $forall y, z in (x - delta, x + delta)$:

  $ abs(f(y) - f(z)) <= abs(f(y) - f(x)) + abs(f(x) - f(z)) < epsilon => g_(x)(delta) <= epsilon. $

  Thus $omega_f (x) = 0$. Suppose $omega_f (x) = 0$: $forall epsilon > 0$ there exists a $delta > 0$ such that $forall y, z in (x - delta, x + delta)$: $abs(f(y) - f(x)) < g_x (delta) < epsilon$. This immediately implies continuity, because $x in (x - delta, x + delta)$ so $abs(f(y) - f(x)) < epsilon$.

  *(b)*: Let $U_A := {x in RR: omega_f (x) < A}$ for $A in RR$. $forall x in U_A$:
  $forall epsilon > 0$ there exists a $partial > 0$ such that $forall delta in (0, partial)$: $g_x (delta) < A + epsilon$. Thus $forall y, z in (x - delta, x+ delta)$: $abs(f(y) - f(z)) < A + epsilon$. Effectively $exists delta > 0$ such that $abs(f(y) - f(z)) < A + epsilon$ for $y, z in (x - delta, x + delta)$.

  $forall y in (x - delta, x - delta)$, $exists delta_1 < delta - abs(x - y)$. For all $z_1, z_2 in (y - delta_1, y + delta_(1))$: $ abs(x - z_i) <= abs(x - y) + abs(y - z_i) < delta => z_1, z_2 in (x - delta, x + delta). $

  Thus by previous statement, $abs(f(z_1) - f(z_2)) < A + epsilon$. Thus $g_(y)(delta_1) < A + epsilon$. Thus $y in U_A => (x - delta, x + delta) subset U_A$. Thus $U_A$ open.

  *(c)*: $ C(f) := inter.big_(n in NN) U_(1/n) $

  Assume the contrary, $C(f) = QQ => QQ subset.eq U_(1/n)$. Thus $U_(1/n)$ is dense and open. Enumerate the rationals thus $QQ = {q_1, q_2, ...}$. Let $V_n = U_(1/n) - {q_n}$, $V_n$ is open and dense. Intersection of $V_n$ is empty but by Baire Category Theorem it is also dense, which is a contradiction.

  *(d)*: Thomae's Function.
]

#problem("Basic Exam, Fall 2017")[
  Let $(X, d)$ be a complete metric space and let $f : X -> X$ be a function.
  Writing $f^n$ for the $n$-th iterate of $f$, let us set
  $ c_n = sup_(x != y) (d(f^n (x), f^n (y)))/(d(x, y)). $
  Assume that $sum_(n=1)^(oo) c_n < oo$. Show that $f$ has a fixed point in $X$
  and that this fixed point is unique.
]
#solution()[
  Let $S_n = sum_(i=1)^(n) c_n$, by assumption $S_n -> L$ and $S_n$ monotonically nondecreasing (ie $c_n >= 0$).
  Fix $x in X$. Create the sequence $(x_i)$ where $x_0 = x$ and $x_(n + 1) = f(x_n)$. For all $m > n$:
  $ d(x_m, x_n) & <= sum_(i=n)^(m - 1) d(x_i, x_(i + 1)) \
              & = sum_(i = n)^(m - 1) d(f^i (x_0), f^i (x_1)) \
              & = sum_(i = n)^(m - 1) d(x_0, x_1) d(f^i ( x_0), f^(i) (x_1) )/d(x_0, x_1) \
              & <= d(x_0, x_1) sum_(i = n)^(m - 1) c_n = d(x_0, x_1) (S_(m - 1) - S_(n - 1)) $.

  By convergence of $S_n$, it is Cauchy. $forall epsilon$, $exists N in NN$ such that $forall m >= n >= N$: $S_m - S_n < epsilon/d(x_0, x_1)$. Let $M = N + 1$, thus for all $m >= n >= M$:

  $ d(x_m, x_n) <= d(x_0, x_1) (S_(m - 1) - S_(n - 1)) < epsilon. $

  Thus $x_i$ is Cauchy and hence by completeness of $X$, $exists y in X$ such that $x_i -> y$. We know that $forall a, b in X$ such that $a != b$

  $ d(f(a), f(b)) <= c_1 d(a, b). $

  $forall epsilon > 0$, let $delta = epsilon/c_1$, then $forall a in (y - delta, y + delta)$: $d(f(y), f(a)) <= c_1 d(y, a) < epsilon$. Thus $f$ is continous at $y$. From the sequential definition of continuity. since $x_i -> y$ then $f(x_i) -> f(y) => x_(i + 1) -> f(y)$ and by uniqueness of the limit $f(y) = y$. Thus $f$ has a fixed point in $X$.
]

#problem()[
  #part[
    Let $X$ and $Y$ be metric spaces, with $Y$ complete, and let $A subset.eq X$
    be dense in $X$. Let $f : A -> Y$ be a uniformly continuous map. Show that
    $f$ can be extended uniquely to a continuous map $tilde(f) : X -> Y$. Show
    also that the unique extension $tilde(f)$ is uniformly continuous on $X$.
  ]
  #part[
    (Basic Exam, Spring 2024) Let $f : QQ -> RR$ be a uniformly continuous
    function. Show that the closure $overline(f(QQ))$ is connected.
  ]
]

#solution()[
  *(a)*: We will define $F: X -> Y$ where $F|_A = f$. $forall x in X - A$, let $a_n$ be a sequence in $A$ which converges to $x$ (you can do this because A is dense so $B_(1/n)(x) inter A != emptyset$). Since $a_n$ is Cauchy, and $f$ is uniformly continous. $f(a_i)$ is also Cauchy. By completeness of $Y$, a unique limit exists we will define this limit to be $F(x)$. We want to show that such a limit is well defined.

  Let $b_i$ be a sequence in $A$ which converges to $x_i$. Let $L = lim_(n -> oo ) f(a_n)$ and $L prime = lim_(n -> oo) f(b_n).$ ($L prime$ exists because cauchyness, uniform continuity, and completeness). Let $c_i$ be a sequence where $c_(2 i) = a_i$ and $c_(2 i - 1) = b_i$. Note $c_i -> x$ still, and $f(c_i) -> L$ and $L prime$. By the uniqueness of the limit, $L = L prime$. Thus $F(x)$ is well defined.

  $forall epsilon > 0$, there exists $delta > 0$ such that $forall a, b in A$ where $d(a, b) < delta$ then $d(f(a), f(b)) < epsilon/3$. $forall x, y in X$ where $d(x, y) < delta/3$. Let $a_n, b_n$ be sequences in $A$ converging to $x, y$. Thus by the definition of $F$, $ F(x) & = lim_(n -> oo) f(a_n) \
  F(y) & = lim_(n -> oo) f(b_n) $. For $N$ sufficiently large, $forall n, m >= N$ $d(a_n, x) < delta/3$, $d(b_m, y) < delta/3$, $d(f(a_n), F(x)) < epsilon/3$, $d(f(b_m), F(y)) < epsilon$.

  Thus $ d(a_n, b_m) < d(a_n, x) + d(x, y) + d(y, b_m) < delta/3 + delta/3 + delta/3 < delta. $

  This means $d(f(a_n) , f(b_m)) < epsilon/3$. Thus $ d(F(x), F(y)) < d(F(x), F(a_n)) + d(F(a_n), F(b_m)) + d(F(b_m), (F(y))) < epsilon. $ Thus $F$ is uniformly continuous.

  *(b)*: By the problem above $f$ can be extended to a uniformly continuous function $F: RR -> RR$. We want to show $overline(f(QQ)) = f(overline(QQ)) = F(RR)$. Let $q_n$ be a sequence of rational numbers which converges to $r in RR$. By uniform continuity of $F$. $F(q_n) -> F(r) in overline(f(Q))$. Thus $f(overline(QQ)) subset overline(f(QQ))$. Let $q_i$ be a sequence in $f(QQ)$ which converges in $overline(f(QQ))$. Thus $q_i = f(r_i)$ for $r_i in QQ$.
]
