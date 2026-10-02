#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Homework 2",
  name: "Arham Lodha",
  due: "August 24, 2026",
)

#problem()[
  Let $X$ be an infinite set and let $B(X)$ be the space of all bounded
  functions $X -> RR$, equipped with the norm $norm(f) = sup_(x in X) abs(f(x))$
  and the corresponding metric. Show that the metric space $B(X)$ is not
  separable.
]

#solution[
  Assume the contrary that there exists a countable dense subset of $B(X)$, $D = {d_i}_(i = 1)^(oo)$. Consider $2^(X) = Hom(X, {0, 1}) subset.eq B(X)$ Note that for $f, g in 2^X$ where $f != g$ we have that $ norm(f - g)_(oo) = 1 $ Thus $ B_(1/3)(f) inter B_(1/3) (g) = emptyset $ Since ${d_i}_(i = 1)^(oo)$, is dense, $forall f in 2^X$ there exists $d_(k_f) in B_(1/3)(f) inter D$. Since the open balls are all mutually disjoint, each open ball $B_(1/3)(f_i)$ maps to a unique $d_(k_i)$. Let $P: 2^X -> D$, where $f -> d_(k_f)$. The mapping is naturally injective. Thus we have an injective mapping from a uncountable set to a countable one. Hence we have a contradiction, and $B(X)$ is not separable.
]

#problem("Basic Exam, Spring 2019")[
  Show that each metric space can be embedded isometrically into a Banach space:
  in other words, given a metric space $(X, d)$, show that there exist a Banach
  space (i.e.\ a complete normed space) $(V, norm(dot))$ and a map
  $Phi : X -> V$ such that
  $ norm(Phi(x) - Phi(x')) = d(x, x'), quad forall x, x' in X. $
]

#solution[
  $(C(X), norm(dot)_(oo))$ is a Banach Space of bounded continuous functions from $X$ to $RR$. Fix a $x_0 in X$. Let $Phi: X -> C(X)$ be the following map $x -> [y -> d(x, y) - d(x_0, y)]$.
  1. Continuity of $Phi(x)$ for all $x in X$: $forall epsilon > 0$, $forall y, y prime in X$ such that $d(y, y prime) < epsilon$ we have that:

  $ abs(Phi (x) (y) - Phi (x) (y prime)) & = abs(d(x, y) - d(x, y prime)) & <= d(y, y prime) < epsilon $
  2. Boundedness of $Phi(x)$ for all $x in X$: $forall y in X$:
  $
    abs(Phi(x)(y)) & = abs(d(x, y) - d(x_0, y)) \
                   & <= d(x, x_0)
  $
  Thus we have that $ norm(Phi (x))_(oo) <= d(x, x_0) < oo. $

  Thus $Phi (x)$ is a well defined map. We will show that its a isometry, and a embedding. $forall x, y, z in X$:

  $ abs(Phi (x)(z) - Phi (y)(z)) & = abs(d(x, z) - d(y, z)) <= d(x, y). $

  Thus $norm(Phi (x) - Phi (y))_oo <= d(x, y)$. Furthermore note that $abs(Phi(x)(x) - Phi(y)(x)) = abs(d(x_0, x) - d(y, x) - d(x_0, x)) = d(x, y)$. Thus $norm(Phi(x) - Phi(y)) = d(x, y)$. Thus $Phi$ is a isometry and hence a embedding as well.
]

#problem()[
  Let $f in C^2(RR; RR)$ be such that
  $ f(x) >= 0 quad "and" quad f''(x) <= 0, quad "for all" x in RR. $
  Show that $f$ is constant.
]

#solution[We will show that $forall x in RR$, $f prime (x) = 0$. Fix a $x in RR$. By Taylor's formula we know that $ f(y) = f(x) + f prime (x) (y - x) - (f prime prime (xi)) / (2) (y - x)^2 $
  For all $y in RR$ and some $xi in [x, y] union [y, x]$. Note that since $f prime prime (xi) <= 0$. Thus we have that $ 0 <= f(y) <= f(x) + f prime (x) (y - x) = L_x (y). $ Assume the contrary that $f prime (x) != 0$:
  1. $f prime (x) > 0$: For $ y < - (f(x)) / (f prime (x)) + x $ we have that $ L_x (y) < 0 <= f(x) <= L_x (y) $ which is a contradiction.
  2. $f prime (x) < 0$: For $ y > -(f(x)) / (f prime (x)) + x $ we have $ L_x (y) < 0 <= f(x) <= L_x (y) $

    which is a contradiction. Hence $f prime (x) = 0$. This is true for any arbitrary $x$, hence $f$ is constant
]

#problem("Basic Exam, Fall 2022")[
  Let $(x_n)$ be a sequence of distinct points in $[0,1]$ and let $(y_n)$ be a
  sequence in $RR$ such that
  $ abs(y_j - y_k) <= 10 abs(x_j - x_k), quad forall j, k in NN. $

  #part()[
    Show that for each $n in NN$, there is a function $f_n : [0,1] -> RR$ such
    that
    - $f_n (x_j) = y_j$, $1 <= j <= n$,
    - $abs(f_n (x) - f_n (x')) <= 10 abs(x - x')$, for all $x, x' in [0,1]$.
  ]

  #part()[
    Show that there is a function $f : [0,1] -> RR$ such that
    - $f(x_j) = y_j$, $forall j in NN$,
    - $abs(f(x) - f(x')) <= 10 abs(x - x')$, for all $x, x' in [0,1]$.
  ]
]

#solution[
  *(a)*: We will interpolate with peicewise linear functions. Let $a_1, ..., a_n$ be $x_1, ..., x_n$ in sorted order, furthermore apply the same rearrangement to $y_1, ..., y_n$ to get $b_1, ..., b_n$. Define $f_n$ as follows: $ f_n (x) := cases((b_(i + 1) - b_i) / (a_(i + 1) - a_(i)) (x - a_i) + b_i &"if" x in [a_i, a_(i + 1)], b_1 &"if" x in [0, a_1], b_n &"if" x in [a_n, 1]). $

  We will prove the Lipshitz constant using 4 cases:

  1. Let $I = [0, a_1]$ or $[a_n, 1]$: Suppose $x, y in I$. Then $ f(x) - f(y) = 0 <= 10 abs(x - y). $
  2. Let $I = [0, a_1]$. Suppose $x in I$ and $y in [a_i, a_(i + 1)]$ ($1 <= i <= n - 1$). $ abs(f_n (x) - f_n (y)) & <= abs(f_n (x) - f_n (a_1)) + abs(f_n (a_1) + f_n (a_i)) + abs(f(a_i) - f(y)) \
                           & <= 10 abs(a_1 - a_i) + abs((b_(i + 1) - b_i) / (a_(i + 1) - a_i) (y - a_i)) \
                           & <= 10 abs(a_1 - a_i) + 10 abs(y - a_i) \= 10 abs(a_i - a_1) + abs(y - a_i)) \
                           & = 10 abs(a_1 - y) <= 10 abs(x - y) $
  Proof is symmetric for $x in [a_n, 1]$.
  3. $x in [a_(i), a_(i + 1)]$ and $y in [a_(j), a_(j + 1)]$:
  $
    abs(f_n (x) - f_n (y)) & <= abs(f_n (x) - f_n (a_i)) + abs(f_n (a_i) - f_n (a_j)) + abs(f_n (a_j) - f_n (y)) \
    & = abs((b_(i + 1) - b_i) / (a_(i + 1) - a_i) (x - a_i)) + 10 abs(a_i - a_j) + abs((b_(j + 1) - b_j ) / (a_(j + 1) - a_j) (y - a_j))
    \ &<= 10 abs(x - a_i) + 10abs(a_i - a_j) + 10 abs(y - a_j) = 10 abs(x- y)
  $
  4. $x in [0, a_1]$ and $y in [a_n, 1]$: $ abs(f_n (x) - f_n (y)) = abs(b_1 - b_n) <= 10 abs(a_1 - a_n) <= 10 abs(x - y) $

  *(b)*: We will first prove that for all $n in NN$ that $norm(f_n)_oo <= M$ for some $M in RR$. Let $ m_n := max_(1 <= j <= n) abs(y_n). $

  1. If $x in [0, a_1]$: $f_n (x) = b_1 <= m_n.$
  2. $x in [a_n, 1]$: $f_n (x) = b_n <= m_n$.
  3. $x in [a_(i), a_(i + 1)]$: $f_n(x) <= max(b_i, b_(i + 1)) <= m_n$

  Thus $f_n (x) <= m_n$. Now we just need to get a uniform bound for $m_n$. Note that for all $j in NN$ we have that $ abs(y_j) <= abs(y_j - y_i) + abs(y_1) <= 10 abs(x_j - x_1) + abs(y_1) <= 10 + abs(y_1). $ Thus $M = 10 + abs(y_1)$ and $m_n <= M$ meaning $norm(f_n)_(oo) <= M$. Note that $forall epsilon > 0$, let $delta = epsilon/(10)$. $forall x, y in [0, 1]$ where $abs(x - y) < delta$ we have that for all $n in NN$: $abs(f_n (x) - f_n (y)) <= 10 abs(x - y) < epsilon$. Thus the sequence is equicontinous. By Arzela Ascoli, there exists a subsequence $(f_(n_k))_(k = 1)^(oo)$ which converges uniformly to a function $f$. We have to prove that the two properties hold for $f$. $forall m in NN$, there exists a $K in NN$ such that for all $k >= K$, $n_k >= m$. By the definition of $f_n$, $f_(n_k)(x_m) = y_m$. Thus the equality holds for $f$. Since $forall n in NN$, $abs(f_n (x) - f_n (x prime)) <= 10 abs(x - x prime)$ we also have the inequality for $f$ thus $abs(f(x) - f(x prime)) <= 10 abs(x - x prime).$
]

#problem()[
  Let $epsilon > 0$. Show that there exists a constant $C = C_epsilon > 0$ such
  that for all $f in C^2([-epsilon, epsilon])$, we have
  $ abs(f'(0)) <= C norm(f)^(1\/2) (norm(f'')^(1\/2) + norm(f)^(1\/2)). $
  Here
  $
    norm(f) = sup_(abs(x) <= epsilon) abs(f(x)), quad
    norm(f'') = sup_(abs(x) <= epsilon) abs(f''(x)).
  $
]

#solution[
  $forall x in [-epsilon, epsilon]$ there exists a $xi in [0, x] union [x, 0]$ where $ f(x) = f(0) + f prime (0) x + 1/2 f prime prime (0) x^2. $
  Thus we have $ -f prime (0)x = f(0) - f(x) + 1/2 f prime prime (0) x^2 \ abs(f prime (0)) <= 1/abs(x) abs(f(0)) + 1/abs(x) abs(f (x)) + 1/2 abs(f prime (0) x) \ <= 2 norm(f)/abs(x) + 1/2 abs(x) norm(f prime prime) $ for $abs(x) != 0$.

  Suppose $norm(f prime prime) = 0$, then $abs(f prime (0)) <= 2/abs(x) norm(f)$ for all $x in [-epsilon , epsilon] - {0}$, Thus $abs(f prime (0)) <= 2/epsilon norm(f)$ and $C_1 = 2/epsilon$. If $norm(f prime prime) > 0$. Consider the function $g: (0, oo) -> oo$ where $ g(t) &= 2/t norm(f) + 1/2 t norm(f prime prime) \ g prime (t) &= -2/t^2 norm(f) + 1/2 norm(f prime prime) = 0 \ 1/2 norm(f prime prime) &= 2/t^2 norm(f) \ t^2 &= (4 norm(f)) / (norm(f prime prime)) \ t &= (2 norm(f)^(1/2) ) / (norm(f prime prime)^(1/2) ) \ g((2 (norm(f))^(1/2)) / (norm(f prime prime)^(1/2) )) &= norm(f prime prime)^(1/2) norm(f)^(1/2) + norm(f)^(1/2) norm(f prime prime)^(1/2) = 2 norm(f)^(1/2) norm(f prime prime)^(1/2) $

  Thus if $ (2 norm(f)^(1/2) ) / (norm(f prime prime)^(1/2) ) <= epsilon $
  we have that $ abs(f prime (0)) <= 2 (norm(f) norm(f prime prime))^(1/2) <= 2 norm(f)^(1/2)(norm(f)^(1/2) + norm(f prime prime)^(1/2)). $

  If $ (2norm(f)^(1/2))/norm(f prime prime)^(1/2) > epsilon => norm(f prime prime)^(1/2) < (2) / (epsilon) norm(f)^(1/2) , $ note that $g$ is a decreasing function from (0, t). Thus consider we have that $ abs(f prime (0)) & <= 2 epsilon^(-1) norm(f) + (epsilon)/2 norm(f prime prime) \
                   & <= 2 epsilon^(-1) norm(f) + 2 epsilon^(-1) norm(f)^(1/2) norm(f prime prime)^(1/2) \
                   & <= 2 epsilon^(-1) norm(f)^(1/2) (norm(f)^(1/2) + norm(f prime prime)^(1/2) ) $


  Let $C_(epsilon) = max(2 epsilon^(-1), 2).$ Thus $ abs(f prime (0)) <= C_(epsilon ) norm(f)^(1/2) (norm(f)^(1/2) + norm(f prime prime)^(1/2) ) $


]

#problem("Basic Exam, Fall 2015")[
  Let $X = RR without {0}$. Find a metric $rho$ on $X$ with the following
  properties:

  - $(X, rho)$ is a complete metric space.
  - If ${x_n}_(n=1)^oo$ is a sequence in $X$ and $x in X$, then
    $ lim_(n -> oo) abs(x_n - x) = 0 <==> x_n -> x quad "in" (X, rho). $

  Prove both properties, as well as all of your other assertions, in full detail.
]

#solution[
  We define our metric as follows:
  $ rho(x, y) & = abs(1/x - 1/y) + abs(x - y) $

  - *Nonnegativity and Symmetry*: This is inherited from the absolute value.
  - *$rho(x, x) = 0$*: $abs(1/x - 1/x) + abs(x- x)= 0$.
  - *Triangle Inequality*:

  $
    rho(x, y) & = abs(1/x - 1/y) + abs(x - y) \
              & = abs(1/x - 1/y - 1/z + 1/z) + abs(x - y - z + z) \
              & <= abs(1/x - 1/z) + abs(1/y - 1/z) + abs(x - z) + abs(y - z) \
              & = rho(x, z) + rho(z, y)
  $

  Suppose $(x_n)_(n = 0)^(oo )$ is Cauchy in $(X, rho)$. Thus $forall epsilon > 0$, there exists a $N >= 0$ such that $$

  $
    epsilon & > abs((1) / (x_m) - (1) / (x_n)) + abs(x_m - x_n) \
            & = abs(x_n - x_m) / (abs(x_m x_n)) + abs(x_m x_n)(abs(x_n - x_m)) \
            & = ((1 + abs(x_m x_n))abs(x_n - x_m))/abs(x_m x_n) > abs(x_m - x_n)
  $

  Thus $(x_n)$ Cauchy in $(RR, abs(dot))$. Let $x$ be the limit in $(RR, abs(dot))$. There exists a $N in NN$ such that $forall m >= N$ $abs(x_m - x) < epsilon$.

  $
    rho(x_m, x) = abs((1) / (x_m) - (1) / (x)) + abs(x_m - x) & = ((1 + abs(x_m x))abs(x_m - x)) / abs(x_m x) \
                                                              & <= abs(x_m - x) < epsilon
  $

  Thus $x_m -> x$. Hence $(X, rho)$ is complete.

  Suppose $ lim_(n -> oo) abs(x_n - x) = 0 $ for $(x_n)$ in $X$ and $x in X$. By the above calculation $x_n -> x$ in $(X, rho)$. Suppose $x_n -> x$ in $(X, rho)$. Then $forall epsilon > 0$ there exists a $N in NN$ such that $rho(x_n, x)$ for all $n >= N$. Thus $ abs(x_n - x) <= ((abs(x_n x) + 1) abs(x_n - x)) / (abs(x_n x)) = rho(x_n, x) < epsilon . $ Thus $ lim_(n -> oo ) abs(x_n - x) = 0 $
]


#problem("cf. Basic Exam, Fall 2025")[
  Let $f : [a, b] -> RR$ be differentiable on the compact interval $[a, b]$
  (with one-sided derivatives at the end points), such that $f'(a) != f'(b)$.
  Show that $f'(x)$ assumes all values between $f'(a)$ and $f'(b)$ in the
  interval $a < x < b$.

  _Hint_: Consider the function $x |-> f(x) - mu x$ for a suitable $mu$.
]

#solution[
  Without loss of generality, $f prime (a) < f prime (b)$. Suppose $mu in [f prime (a), f prime (b)]$. Consider $g(x) = f(x) - mu x$. Then $g$ is also differentiable on $[a, b]$ and $g prime (x) = f prime (x) - mu$. Note that $g prime (a) < 0$ and $g prime (b) > 0$. $g$ is a continous function on a compact set so it much acheive its extreme value. Thus the point with the extreme value must be in the interior or at the end points. Suppose $exists x$ such that $g(x) >= g(y)$ for all $y in [a, b]$: $g prime (x) = 0 => f prime (x) = mu$, and we are done.

  *Endpoints*: Suppose $g(a) <= g(y)$ for all $y in [a, b]$. By assumption $g prime (a) < 0$, thus $exists delta > 0$ such that for all $y in [a, a + delta)$: $ abs((g(y) - g(a)) / (y - a) - g prime (a)) < abs(g prime (a)) => (g(y) - g(x)) / (y - x) < 0 => g(y) < g(x) $

  Thus we have a contradiction and the minimum cannot be achieved at $x = a$. By a similar argument the minimum cannot be acheived at $x = b$. Thus the maximum of $g$ is acheived at $x = a$ and $x = b$. Thus $forall x in (a, b)$, $g(x) <= g(a) = g(b)$. Look at the function $h(x) = g(x) - g(a)$. $h$ is differentiable on $(a, b)$ and continous on $[a, b]$ and $h(a) = 0 = h(b)$. By Rolle's Theorem, $exists c in (a, b)$ such that $h prime (c) = 0 => g prime (c) = 0$. Thus $f prime (c) = mu$.
]
