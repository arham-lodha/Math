#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Homework 1",
  name: "Arham Lodha",
  due: "August 17, 2026",
)

#problem[
  #part[
    Let $V$ be a vector space over $RR$ of dimension $dim V < oo$, and let
    $V in.rev x |-> norm(x)$, $V in.rev x |-> norm(x)_1$ be norms on $V$. Show that
    the norms $norm(dot)$, $norm(dot)_1$ are equivalent on $V$, in the sense
    that there exist constants $C_1 > 0$, $C_2 > 0$ such that for all $x in V$,
    $ C_1 norm(x) <= norm(x)_1 <= C_2 norm(x). $
    _Hint_: You may assume that $V = RR^n$ and that one of the two norms is
    Euclidean.
  ]
  #part[
    Show that for each $d in NN$ there exists $C_d > 0$ such that for all
    polynomials $p$ of degree $<= d$,
    $ sup_([0,1]) |p(x)| <= C_d integral_0^1 |p(x)| d x. $
  ]
]

#solution[*(a)*: We will first show that any two norms on $RR^n$ are equivalent. It suffices to show equivalence between any norm $norm(dot)_1$ and $norm(dot)$, the Euclidean Norm. Suppose $norm(dot)_1 ~ norm(dot) ~ norm(dot)_2$, then $forall x in RR^n$ we have $ C_1 norm(x) <= norm(x)_1 <= C_2 norm(x) => norm(x) <= 1/C_1 norm(x)_1 "and" 1/C_2 norm(x)_1 <= norm(x) $
  and $ D_1 norm(x) <= norm(x)_2 <= D_2 norm(x). $

  Thus $ D_1/C_2 norm(x)_1 <= D_1 norm(x) <= norm(x)_2 <= D_2 norm(x) <= (D_2) / (C_1) norm(x)_1. $

  Thus $norm(x)_1 ~ norm(x)_2$. Thus we will show equivalence between any norm $norm(dot)_1$ and $norm(dot)$. Furthermore suppose we have that for all $x in S^(n - 1) subset RR^n$ that $ C_1 = C_1 norm(x) <= norm(x)_1 <= C_2 norm(x) = C_2 $. Then for all $y in RR^n$:

  $ C_1 norm(y) = C_1 norm(y) norm((y) / (norm(y))) <= norm(y) norm((y) / (norm(y)))_1 = norm(y)_1. $

  Similarly $ norm(y)_1 = norm(y) norm((y) / (norm(y)))_1 <= C_2 norm(y) norm((y) / (norm(y))) = C_2 norm(y). $

  Thus it suffices to show equivalence on strictly on $S^(n - 1)$.

  *$norm(dot)_1$ Continous with respect to $norm(dot)$*: Let $ M = (sum_(i=1)^(n) norm(e_i)_1^2)^(1/2) $

  $forall epsilon > 0$, let $delta = epsilon/M$ then for $norm(x - y) < delta$:

  $
    norm(norm(y)_1 - norm(x)_1) & = norm(norm(y - x + x)_1 - norm(x)_1) \
                                & = norm(norm(y - x)_1) \
                                & = norm(y - x)_1
  $

  Let $ y - x = sum_(i=1)^(n) a_i e_i $. Thus $ norm(y - x)_1 & <= sum_(i = 1)^(n) norm(a_i e_i)_1 \
                & <= sum_(i = 1)^(n) abs(a_i) norm(e_i)_1 \
                & <= (sum_(i=1)^(n) abs(a_i)^2)^(1/2) (sum_(i=1)^(n) norm(e_i)_1^2)^(1/2) = M norm(x - y) < epsilon. $

  $S^(n - 1)$ compact in $RR^n$. Thus $norm(dot)_1$ achieves minimum and maximum on $S^1$. Thus $exists C_1, C_2 > 0$ such that $ C_1 <= norm(x)_1 <= C_2 $ for $x in S^(n - 1).$ Thus all norms on $RR^n$ are equivalent. Let $V$ be a finite dimensional vector space with norms $norm(dot)_a$ and $norm(dot)_b$. There exists some $T: RR^n -> V$ a linear isomorphism. Define induced norms on $RR^n$ where $ norm(x)_A & := norm(T x)_a \
  norm(x)_B & = norm(T x)_b. $

  Checking the norm axioms (it suffices to check one):
  $
    norm(x + y)_(A) = norm(T x + T y)_(a) & <= norm(T x)_a + norm(T y)_a = norm(x)_A + norm(y)_A \
    norm(lambda x)_A = norm(T lambda x)_a & = abs(lambda) norm(T x)_a = abs(lambda) norm(x)_A \
              0 = norm(x)_a = norm(T x)_A & <=> T x = 0 <=> x = 0
  $

  Thus $norm(dot)_A ~ norm(dot)_B$ in $RR^n$ and $exists C_1, C_2 < 0$ where $ C_1 norm(x)_A <= norm(x)_B <= C_2 norm(x)_A . $

  $forall v in V$, let $x = T^(-1) v.$

  $ C_1 norm(v)_a = C_1 norm(x)_(A) <= norm(x)_B = norm(v)_b <= C_2 norm(x)_A = C_2 norm(v)_a. $

  Thus $norm(dot)_a ~ norm(dot)_b$.

  *(b)*: Let $V$ be the vector space of polynomials with real coefficients of degree at most d. We have the following vector space isomorphisms: $ V = (RR[x]) / ((x^(d + 1))) iso RR angle.l 1, x, x^2, ..., x^d angle.r iso RR^(d + 1). $ $norm(dot)_(oo )$ and $norm(dot)_1$ are valid norms on $V$. Since $V$ is a finite dimensional vector space, by part a, there exists a $C_2$ such that $ norm(p)_(oo) <= C_1 norm(p)_(1). $
]

#problem("Basic Exam, Spring 2017")[
  For $n >= 1$, let $f_n : [0, 1] -> RR$ be a continuous function such that
  $ |f_n (x)| <= 1 + frac(n, 1 + n^2 x^2), quad x in [0, 1], $
  and define
  $ F_n (x) = integral_0^x f_n (t) d t, quad x in [0, 1]. $
  Show that the sequence $(F_n)_(n >= 1)$ admits a subsequence that converges
  pointwise on $[0, 1]$.
]

#solution[
  $
    abs(F_n (x)) & = abs(integral_(0)^x f_(n) (t) dif t) \
                 & <= integral_(0)^(x) abs(f_(n) (t)) dif t \
                 & <= integral_(0)^(x) (1 + (n) / (1 + n^2 t^2)) dif t \
                 & = integral_(0)^(n x)(1/n + (1) / (1 + u^2)) dif u \
  $

  Solving the integral we see: $ abs(F_n (x)) & <= x + arctan(n x) <= 1 + pi /2 = M $

  Thus $(F_n)_(n = 1)^(oo)$ is bounded. By the first part of Arzela Ascoli Theorem (diagonalization argument), $F_n$ admits a subsequence which converges pointwise on $QQ inter [0, 1]$, let $G_k = F_(n_k)$ denote such a subsequence. $forall k in NN$ for $x, y in [0, 1]$:

  $
    abs(G_k (x) - G_k (y)) & = abs(integral_(y)^(x) f_(n_k)(t) dif t) \
                           & <= integral_(y)^(x) abs(f_(n_(k) )(t)) dif t \
                           & <= integral_(y)^(x) (1 + (n_k) / (1 + n_k^2 t^2)) dif t \
                           & = [1/n_k u + arctan(u)]^(n_k x)_(n_k y) \
                           & = (x - y) + arctan(n_k x) - arctan(n_k y)
  $

  Note that $ lim_(k -> oo) (arctan(n_k x) - arctan(n_k y)) = 0 $

  $forall x in [0, 1]$, $forall epsilon > 0$, by density of $QQ inter [0, 1]$ in $[0, 1]$, there exists a $q in QQ inter [0, 1]$ such that $0 < x - q < epsilon/6$. There also exists a $N_1$ such that $forall k >= N_1$: $ arctan(n_k x) - arctan(n_k q) < epsilon/6. $ Furthermore there exists a $N_2 in NN$ such that $ forall a, b >= N_2 $: $abs(G_a (q) - G_b(q)) < epsilon/3$. Let $N = max(N_1, N_2)$. Thus $forall a, b >= N$ we have that

  $
    abs(G_a (x) - G_b (x)) & <= abs(G_a (x) - G_a (q)) + abs(G_a (q) - G_b (q)) + abs(G_b (q) - G_b (x)) \
                           & < epsilon/6 + epsilon/6 + epsilon/3 + epsilon/6 + epsilon/6 = epsilon
  $

  Thus $(G_k (x))_(k = 1)^(oo )$ is Cauchy and thus $G_k$ converges pointwise to some function $ G(x) = lim_(k -> oo ) G_(k)(x) $

]

#problem[
  Let $f$ be a continuous function on the compact interval ${x in RR ; a <= x <= b}$
  such that the right-hand derivative $f'_r (x)$ exists when $a <= x < b$.
  Assume that $f'_r (x) >= C$ for all $x in [a, b)$. Show that
  $f(b) - f(a) >= C(b - a)$.

  _Hint_: Use the continuity method.
]

#solution[
  $forall epsilon > 0$, let
  $E_(epsilon) = {x in [a, b]: f(y) - f(a) >= (C - epsilon)(y - a), forall y in [a, x]}.$ Note if $x in E_(epsilon)$ $<=>$ $forall y in [a, x]$ we have that $[a, y] in E_(epsilon)$.

  1. Nonempty: $a in E$.
  2. Closed: Let $(x_n)$ be a sequence in $E subset [a, b]$ such that $x_n -> L in [a, b]$. Thus $ f(x_n) - f(a) >= (C - epsilon)(x_n - a). $ Taking the limit on both sides, we see $f(L) - f(a) >= (C - epsilon)(L - a)$. It suffices to assume that $forall n in NN$, $x_n < L$ otherwise $L in E_epsilon$ automatically. $forall x in [a, L)$, $exists N in NN$ such that $L - x_n < L - x => x_n > x$. Since $[a, x_n] subset E_(epsilon) => [a, x] subset E_epsilon$. Thus $[a, L] subset E_(epsilon)$.
  3. Open: $forall t_0 in E$. It suffices to assume that $t_0 != b$, otherwise we have nothing to prove. We have that $ (f(t_0) - f(a)) > (C - epsilon)(t_0 - a). $ Existence of $f_r prime(t_0)$ and fact that $f_r (t_0) >= C$: $exists delta > 0$ such that $forall h in (0, delta)$: $ (f(t_0 + h) - f(t_0))/(h) >= C - epsilon => f(t_0 + h) - f(t_0) >= (C - epsilon)h $

  Thus $ f(t_0 + h) - f(a) >= (C - epsilon)( t_0 + h - a). $ Furthermore, since the statement is true for all $x in [0, t_0]$ and that for $h prime in (0, h) subset (0, delta)$ the statement is true by the above for $t_0 + h prime$. We have that the statement is true for all $[a, t_0 + h]$ for $h in (0, delta)$.

  Thus if $t_0 in E_epsilon$ then $(max(a, t_0 - delta), t_0 + delta) subset.eq E_epsilon$. Thus $E_(epsilon)$ open.

  By hence $E_epsilon$ is open and closed and hence it is $[a, b]$, by connectedness. Since $forall epsilon$, $f(b) - f(a) >= (C- epsilon)(b - a) => f(b) - f(a) >= C (b - a)$.
]

#problem[
  Let $(X, d)$ be a metric space and let $E subset.eq X$. We say that a function
  $f : E -> RR$ is Lipschitz continuous with Lipschitz constant $L > 0$
  ($L$-Lipschitz for short) if
  $ |f(x) - f(y)| <= L d(x, y), quad forall x, y in E. $

  #part[
    Let $(f_alpha)_(alpha in J)$ be a collection of $L$-Lipschitz functions
    $f_alpha : E -> RR$. Show that the functions
    $ E in.rev x |-> inf_(alpha in J) f_alpha (x), quad E in.rev x |-> sup_(alpha in J) f_alpha (x) $
    are $L$-Lipschitz on $E$, if finite at one point.
  ]
  #part[
    Let $f : E -> RR$ be $L$-Lipschitz. Show that the function
    $ F(x) = inf_(y in E) (f(y) + L d(x, y)), quad x in X, $
    is an $L$-Lipschitz extension of $f$. Show also that $F$ is the largest
    $L$-Lipschitz extension of $f$, in the sense that if $G : X -> RR$ is any
    $L$-Lipschitz extension of $f$ then $G <= F$. Can you find the smallest
    $L$-Lipschitz extension of $f$?
  ]
]

#solution[*(a)*: Let $g: E -> RR union {-oo}$ and $h: E -> RR union {oo}$ where $ g(x) & = inf_(alpha in J) f_(alpha) (x) \
  h(x) & = sup_(alpha in J) f_(alpha)(x). $ Suppose there exists $x_0$ such that $g(x_0) > -oo$. $forall x in E$ and $forall alpha in J$: $ abs(f_(alpha)(x) - f_(alpha) (x_0)) <= L d(x, x_0) => -L d(x, x_0) <= f_(alpha) (x) - f_(alpha)(x_0) <= L d(x, x_0). $ Thus $ f_alpha (x_0) - L d(x, x_0) <= f_alpha (x) <= L d(x, x_0) + f_(alpha)(x_0). $ Since $g(x_0) <= f_(alpha)(x_0)$, we have that $forall alpha$, $ g(x_0) - L d(x, x_0) <= f_(alpha)(x_0) => g(x_0) - L d(x, x_0) <= g(x). $ Thus $-L d(x, x_0) <= g(x) - g(x_0).$ $g(x) <= f_(alpha)(x) <= f_(alpha)(x_0) + L d(x, x_0).$ Since $f_(alpha)(x) - L d(x, x_0) <= f_(alpha)(x_0) => g(x) <= f_(alpha)(x) <= g(x_0) + L d(x_0, x).$ thus $ abs(g(x) - g(x_0)) <= L d(x, x_0). $ Note that thus $forall x in E$, $g(x)$ is finite. The proof is symmetric for $h$.

  *(b)*: Let ${g_y (x) := f(y) + L d(x, y)}_(y in E)$ be a collection of functions. $forall x, z in X$:

  $
    abs(g_y (x) - g_y (z)) & = L abs(d(x, y) - d(y, z)) \
                           & <= L abs(d(x, z) + d(z, y) - d(y, z)) \
                           & = L d(x, z).
  $

  Thus $g_y (x)$ is $L$-Lipschitz. We need to show that $F$ is finite for some $x in X$. Fix $y_0 in E$: $ F(y_0) = inf_(y in E)(f(y) + L d(y, y_0)). $  By the fact that $f$ is L Lipschitz:

  $ f(y_0) - f(y) <= L d(y, y_0) => f(y_0) <= f(y) + L d(y, y_0) => f(y_0) <= F(y_0). $ Thus $F(y_(0)) > -oo$. Thus $F$ is L Lipschitz by part a.

  Suppose $G: X -> RR$ be a $L$-Lipschitz extension of $f$. Fix a $x in X$. $forall y in E$ we have $ G(x) - G(y) & = G(x) - f(y) <= L d(x, y) => G(x) <= f(y) + L d(x, y). $ Thus $forall y in E$: $G(x) <= f(y) + L d(x, y)$. Thus $ G(x) <= inf_(y in E) (f(y) + L d(x, y)) = F(x) => G <= F. $

  The smallest $L$-Lipschitz extension of $f$ is $ H(x) = sup_(y in E)(f(y) - L d(x, y)). $
]

#problem[
  Let $f : [0, oo) -> RR$ be continuous and assume that for each $x >= 0$ the
  sequence $f(n x)$ tends to $0$ as $n -> oo$. Show that $f(t) -> 0$ as
  $t -> oo$.

  _Hint_: Given $epsilon > 0$, consider
  $ F_n = {x >= 0 : forall p >= n, |f(p x)| <= epsilon}, quad n = 1, 2, dots $
]

#solution[For $p in NN$, let $g_p: [0, oo ) -> RR$ where $g_p (x) = f(p x)$. For a fixed $epsilon > 0$, consider $ F_n := {x >= 0 : forall p >= n, abs(f(p x)) <= epsilon} & = {x >= 0 : forall p >= n, -epsilon <= f(p x) <= epsilon} \
                                                          & = inter.big_(p >= n) g_p^(-1)([-epsilon, epsilon]) $

  $g_(p)^(-1)([-epsilon, epsilon])$ is closed, which implies that $F_n$ is closed since its a intersection of closed sets. Note $0 in F_1$. Note that $F_(i) subset.eq F_(i + 1)$ and $ union.big_(n in NN) F_n = [0, oo). $ Take the contrapositive of the Baire Category Theorem, thus $exists N in NN$ with nonempty interior. Thus $forall n >= N$, $exists [a, b] in F_n$. Thus $forall x in F_N$, $abs(g_(n)(x)) = abs(f(n x)) < epsilon$. Thus $forall n >= N$ and $forall y in [n a, n b] => y / n in [a. b]$, we have that $abs(f(y)) <= epsilon$. Thus $ "if" y in union.big_(i = 1)^(oo) [(N + i) a, (N + i) b] => abs(f(y))< epsilon. $ Let $I_n = [(N + n) a,(N + n) b].$ Let $h: NN -> RR$ be the function which tells the gap between $I_(i + 1)$ and $I_(i)$.

  $ h(n) & := (N + n + 1)a - (N + n)b. $ If $h(n) > 0$: then there is no overlap between $I_(n + 1)$ and $I_n$. If $h(n) <= 0$, then there is overlap between $I_(n +1)$ and $I_n$. $                        h(n) (N + n + 1) a - (N + n)b & = n a - n b + (N + 1) a - N b <= 0 \
  -n (b - a) <= a - N(b - a) => n >= N - (a) / (b - a) $

  Thus for all $n >= ceil(N - (a) / (b - a)) = M$, $I_n inter I_(n + 1) != oo$. Furthermore note $abs(I_n) = n (b - a)$, thus as $n -> oo$, $abs(I_n) -> oo$. Thus you stitch together the intervals and you see $y in union.big_(n >= M) I_m = [M(a), oo) => norm(f(y)) < epsilon.$ Thus $f -> 0$ as $t -> oo$.

]

#problem("Basic Exam, Spring 2017")[
  Let $(X, d)$ be a bounded metric space and let $C(X)$ denote the space of
  bounded continuous real-valued functions on $X$ endowed with the supremum
  norm. Suppose $C(X)$ is separable.

  - Show that for every $epsilon > 0$ there exists a countable set
    $Z_epsilon subset.eq X$ such that
    $
      forall x in X quad exists z in Z_epsilon quad "such that" quad forall y in X, quad |d(x, y) - d(z, y)| < epsilon.
    $
  - Deduce that $X$ is separable.
]

#solution[
  $forall x in X$, let $d_x := X -> RR$ where $d_(x) (y) = d(x, y)$. By definition of $X$, $exists M > 0$ such that $forall (y, z) in X^2$, $d(y, z) <= M => d_x <= M$. $forall epsilon > 0$ and $forall y in X$, let $delta = epsilon$ then for all $y_1 in B_(delta)(y)$ we have $ abs(d_x (y) - d_x (y_1)) & = abs(d(x, y) - d(x, y_1)) <= d(y, y_1) < delta <= epsilon. $ Thus $d_x in C(X)$. Let $S = {d_x : x in X}$. $S$ subspace of $C(X)$ and hence seperable. Thus there exists a countable dense set $D$ of $S$. By definition of $S$, $ D = {d_x : x in A} $ for a countable subset $A subset X$. Thus $forall epsilon > 0$ and $forall x in X$, there exists $z in A$ such that $ norm(d_x - d_z)_(oo) < epsilon. $ Thus $A = Z_epsilon$ for all $epsilon > 0$.

  $forall x in X$, and $forall delta > 0$ by the previous problem $exists a in A$ such that for all $y in X$: $ abs(d(x, y) - d(a, y)) < delta. $

  Let $y = x$: $ abs(d(x, x) - d(a, x)) = d(a, x) < delta => a in A inter B_(delta)(x). $

  Thus $A$ is a countable dense subset of $X$ and hence $X$ is seperable.
]
