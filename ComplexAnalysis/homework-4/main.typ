#import "template.typ": *

#show: homework.with(
  course: "MATH 246A",
  assignment: "Homework 4",
  name: "Arham Lodha",
  due: "TBD",
)

// ── Section 7: Power Series ──────────────────────────────────────────────────

#problem(num: "7.1")[
  Suppose $sum_(n=0)^infinity a_n (z - z_0)^n$ is a power series with nonzero coefficients. Show that its radius of convergence $R$ is given by
  $ R = lim_(n -> infinity) abs(a_n / a_(n+1)) $
  if the limit exists.
]
#solution[
  Let $L = lim_(n -> oo) abs(a_n / a_(n+1)) in [0, oo]$, and set $w = z - z_0$. Write $t_n = a_n w^n$. We show the series $sum t_n$ converges for $abs(w) < L$ and diverges for $abs(w) > L$, which means $R = L$.

  If $w = 0$ the series trivially converges, so assume $w != 0$. Since every $a_n != 0$, every $t_n != 0$, and
  $
    abs(t_(n+1) / t_n) = abs(w) abs(a_(n+1) / a_n) = abs(w) / abs(a_n / a_(n+1)).
  $
  Taking $n -> oo$ (with the conventions $abs(w)/0 = oo$ and $abs(w)/oo = 0$),
  $
    lim_(n -> oo) abs(t_(n+1) / t_n) = abs(w) / L.
  $

  *Case $abs(w) < L$.* Then $abs(w)/L < 1$ (this includes $L = oo$, where the limit is $0$). By the Ratio Test, $sum t_n$ converges absolutely.

  *Case $abs(w) > L$.* Then $abs(w)/L > 1$ (this includes $L = 0$, where the limit is $oo$). So there is $N$ with $abs(t_(n+1)) > abs(t_n)$ for all $n >= N$, hence $abs(t_n) >= abs(t_N) > 0$ for $n >= N$. Thus $t_n arrow.not 0$, and the series diverges (equivalently, by the Ratio Test).

  Hence the series converges for $abs(z - z_0) < L$ and diverges for $abs(z - z_0) > L$, so $R = L$.
]
#problem(num: "7.2")[
  Find the radius of convergence of the power series $sum_(n=1)^infinity a_n z^n$, where
  #part[$a_n = (2i)^n \/ (n + i)^2$,]
  #part[$a_n = n^2 + 5 i n + 1$,]
  #part[$a_n = n^(log n)$.]
]
#solution[
]

#problem(num: "7.3")[
  Show that the series $sum_(n=1)^infinity z^n / n$ converges for $z in CC$ if and only if $abs(z) <= 1$ and $z != 1$.
]
#solution[Checking the radius of convergence:
  $
    R & = lim_(n -> oo) abs((1 \/ n) / (1 \/ (n + 1))) \
      & = lim_(n -> oo) abs((n + 1) / (n)) \
      & = 1
  $

  Thus for all $z in DD$, the series converges. Now we need to examine the behavior of the series when $z in partial DD$. For $z = 1$, the series is the harmonic series which diverges. Now we need to understand how the series behaves $z = e^(i theta)$ for $theta in (0, 2pi)$.

  Consider $ abs(S_n) & = abs(sum_(k = 1)^(n) e^(i n theta)) \
           & = abs((e^(i theta)(1 - e^(i n theta ) ) ) / (1 - e^(i theta) )) \
           & = abs((1 - e^(i n theta) ) / (1 - e^(i theta) )) \
           & <= sqrt(2)/abs(1 - e^(i theta)) $

  Thus $S_n$ is uniformly bounded. $ sum_(k = 1)^(n) (e^(i k theta) ) / (k) & = sum_(k = 1)^(n) 1/k (S_(k) - S_(k - 1)) \
                                         & = sum_(k = 1)^(n) 1/k S_k - sum_(k = 1)^(n) 1/k S_(k - 1) \
                                         & = sum_(k = 1)^(n) S_k/k - sum_(k = 0)^(n - 1) S_k/(k + 1) \
                                         & = (S_n) / (n) - (S_(0)) / (m) + sum_(k = 1)^(n - 1) S_k (1/k - 1/(k + 1)) \
                                         & = (S_n) / (n) + sum_(k = 1)^(n - 1) S_k ((k + 1 - k) / (k(k + 1))) \
                                         & = (S_n) / (n) + sum_( k = 1)^(n - 1) S_k (1/(k(k + 1))) $

  The partial sums converge (This was just the dirichlet test).
]

#problem(num: "7.4")[
  Suppose that the power series $f(z) = sum_(n=0)^infinity a_n z^n$ and $g(z) = sum_(n=0)^infinity b_n z^n$ have radii of convergence $R_1 > 0$ and $R_2 > 0$, respectively. For $n in NN_0$ define
  $ c_n = sum_(k=0)^n a_k b_(n-k). $
  Show that the power series $h(z) = sum_(n=0)^infinity c_n z^n$ (the so-called _Cauchy product_ of $f$ and $g$) converges for all $abs(z) < R := min{R_1, R_2}$ and that $h(z) = f(z) g(z)$ for all such $z$.
]
#solution[
  Fix a arbitrary $w in B(0, R)$. Since $abs(w) < R_1$ and $abs(w) < R_2$, we know that $ A = sum_(k = 1)^(oo) abs(a_n w^n) "and" B = sum_(k = 1)^(oo ) abs(b_n w^n) "converge". $

  Let $ f_n (z) & = sum_(k = 0)^(n) a_n z^k \
  g_n (z) & = sum_(k = 0)^(n) b_n z^k \
  h_n (z) & = sum_(k = 0)^(n) c_k z^k. $

  We know that $f_n -> f$ and $g_n -> g$ converge locally uniformly on $B(0, R)$. We want to show that $f_n g_n - h_n -> 0$.

  $
    (f_n g_n - h_n)(w) &= sum_(k = 0)^(n) sum_(l = 0)^(n) a_k b_l w^(k + l) - sum_(k = 0)^(n) sum_(l = 0)^(k) a_l b_(k- l) w^(k) \ &= sum_(k, l <= n \ k + l > n) a_k b_l w^(k + l)
  $

  Thus $ abs(f_n (x) g_n (x) - h_n (x)) & <= sum_(k, l <= n \ k + l > n) abs(a_k b_l w^(k + l)) \
  & <= sum_(k = ceil(n/2))^(oo) abs(a_k) (sum_(l = 1)^(oo) abs(b_l) abs(w^(l)) ) abs(w^k) + sum_(l = ceil(n/2))^(oo) abs(b_l) (sum_(k = 1)^(oo) abs(a_k) abs(w)^k) abs(w)^(l) \ &= A sum_(k = ceil(n/2))^oo abs(a_k) abs(w)^k + B sum_(l = ceil(n/2))^(oo) abs(b_l) abs(w)^k $

  We can bound the tails with $epsilon/(2A)$ and $epsilon/(2B)$ and we are done. Thus $lim_(n -> oo) (f_n (w) g_n (w) - h_n (w)) = 0$ which means that $ h(w) = lim_(n -> oo) h_n (w) = lim_(n -> oo) f_n (w) g_n (w) $
]

#problem(num: "7.5")[
  Let $R > 0$, and suppose that the power series $f(z) = sum_(n=0)^infinity a_n z^n$ converges for all $z in B := B(0, R)$.
  #part[Show that the power series converges uniformly on each compact subset of $B$.]
  #part[For $n in NN_0$ and $z in B(0, R)$ define
    $ S_n (z) := abs(sum_(k=0)^n a_k z^k)^2. $
    Show that on each compact subset of $B$ the function sequence ${S_n}$ converges uniformly to $abs(f)^2$.]
  #part[Show that for each $0 <= r < R$ _Parseval's formula_ is valid:
    $ 1/(2 pi) integral_0^(2 pi) abs(f(r e^(i t)))^2 dif t = sum_(n=0)^infinity abs(a_n)^2 r^(2n). $

  ]
]
#solution[
  1. Let $K$ be a compact subset of $B(0, R)$. The $x -> abs(x)$ map is continuous and must achieve its maximum on $K$, ie $exists k in K$ such that $forall x in K$, $abs(k) > abs(x)$. But note that $k in K subset.eq B(0, R)$, thus $r = abs(K) < R$.  Let $S in (r, R)$.  $ 1/S >= 1/R = limsup_(n -> oo) abs(a_n)^(1/n) $ this means for all but finitely many $n in N$ we have that $ 1/S >= abs(a_n)^(1/n) => S^(-n) >= a_n. $ Note that for $k in K$, $abs(k) < r$.
    Thus we have that for $x in K$: $ sum_(k = 0)^(oo) abs(a_n) abs(x)^(k) <= sum_(k = 0)^(oo ) S^(-k) r^k. $ By the $M$ test $ sum_(k = 0)^(oo) abs(a_n x^k) "converges uniformly on "K => sum_(k = 0)^(oo) a_n x^k "converges absolutely uniformly on "K $

  2. Let $K$ be a arbitrary compact subset of $B$.

  $
    abs(S_n - abs(f)^2) & = abs(abs(sum_(k = 0)^n a_k z^k)^2 - abs(f)^2) \
    & = abs((abs(sum_(k=0)^(n) a_k z^k) - abs(f) )(abs(sum_(k = 0)^(n) a_k z^k) + abs(f))) \
    & <= (abs(sum_(k = 0)^(n) a_k z^k) + abs(f))
    abs(sum_(k = 0)^(n) a_k z^k - f) \
    &<= (sum_(k = 0)^(n) abs(a_k z^k) + sum_(k = 0)^(oo) abs(a_k z^k) ) abs(sum_(k = 0)^(n) a_k z^k - f(z)) \
    &<= 2 sum_(k = 0)^(oo) abs(a_k z^k) abs(sum_(k = 0)^(n) a_k z^k - f(z)) \
    &<= 2 M abs(sum_( k = 0)^(n) a_k z^k - f(z)) \ &<= epsilon
  $

]

#problem(num: "7.6")[
  #part[Show that the power series
    $ sum_(n=0)^infinity i^(n+1) / (n+1)! z^n $
    converges for all $z in CC$.]
  #part[Let $g$ be the function represented by the power series in (a). Find a simple expression for $g(z)$ if $z != 0$.]
  #part[For $r > 0$ let $alpha_r : [0, 2] -> CC$ be the path defined by
    $ alpha_r (t) = cases(r e^(i pi t) & t in [0, 1], (2t - 3) r & t in [1, 2].) $
    Show that $integral_(alpha_r) g(z) dif z = 0$. _Hint:_ This follows from a general theorem that will be proved later, but show this directly.]
  #part[Show that $lim_(r -> infinity) integral_([-r, r]) g(z) dif z = i pi$.]
  #part[Show that $integral_0^infinity (sin x) / x dif x = pi / 2$.]
]
#solution[
  1. $
      R & = lim_(n -> oo) abs(((i^(n + 1) ) / ((n + 1)!)) (((n + 2)!) / (i^(n + 2) ))) \
        & = lim_(n -> oo) abs(n + 2) = oo
    $

  2. $
      sum_(n=0)^infinity i^(n+1) / (n+1)! z^n & = i sum_(n = 0)^(oo) ((i z)^(n)) / ((n + 1)!) \
                                              & = i sum_(n = 1)^(oo) ((i z)^(n - 1)) / (n!) \
                                              & = i (sum_(n = 1)^(oo) 1/(i z) (i z)^(n) / (n!) ) quad (z != 0) \
                                              & = 1/z (e^(i z) - 1)
    $

  3. Let $ G(z) & = sum_(n = 0)^(oo) (i^(n + 1) ) / ((n + 1) (n + 1)!) z^(n + 1) \
         & = sum_(n = 1)^(oo) ((i z)^n) / (n (n!)). $ $G(z)$ has a radius of convergence of $oo$, furthermore $G prime = g$. Thus since the path is a loop, by FTC we know $ integral_(a_r) g dif z = 0 $

  4.
]

#problem(num: "7.7")[
  Let $DD = {z in CC : abs(z) < 1}$.
  #part[Show that for each $t in [0, 2 pi]$ the function $P_t$ defined as
    $ P_t (z) = (e^(i t) + z) / (e^(i t) - z) quad "for" z in DD $
    can be represented by a power series that is centered at $z_0 = 0$ and converges on $DD$.]
  #part[Let $u : partial DD -> RR$ be a continuous function. Show that the function $f : DD -> CC$ defined as
    $ f(z) = 1/(2 pi) integral_0^(2 pi) (e^(i t) + z) / (e^(i t) - z) u(e^(i t)) dif t quad "for" z in DD $
    is holomorphic. _Hint:_ Find a power series representation of $f$ on $DD$.]
]
#solution[
]

#problem(num: "7.8")[
  Define $gamma : [0, 2 pi] -> CC$ as $gamma(t) = e^(i t)$ for $t in [0, 2 pi]$.
  #part[Show that
    $
      1/(2 pi i) integral_gamma (w - 1/w)^n (dif w) / w = cases(0 & n in NN_0 "odd", (-1)^(n\/2) binom(n, n\/2) & n in NN_0 "even".)
    $]
  The _Bessel function_ $J_0 : CC -> CC$ is defined as
  $ J_0 (z) = 1/(2 pi i) integral_gamma exp(z/2 (w - 1/w)) (dif w) / w $
  for $z in CC$.
  #part[Show that $J_0$ is represented by the power series
    $ J_0 (z) = sum_(n=0)^infinity (-1)^n / (n!)^2 (z/2)^(2n) $
    convergent for all $z in CC$ and is hence an entire function, that is, holomorphic on $CC$.]
]
#solution[
]

#problem(num: "7.9")[
  #part[Show that the function $J_0$ defined in Problem 7.8 satisfies _Bessel's differential equation_
    $ z J_0''(z) + J_0'(z) + z J_0 (z) = 0 $
    for $z in CC$.]
  #part[Suppose $f(z) = sum_(n=0)^infinity a_n z^n$ is a power series that converges for $z in CC$ and the function $f$ represented by this power series satisfies Bessel's differential equation. Show that if $f(0) = 1$ and $f'(0) = 0$, then $f = J_0$. _Hint:_ Find a recursive relation that the coefficients $a_n$ must satisfy.]
]
#solution[
]

#problem(num: "7.10")[
  The periodic oscillations of a thin membrane (such as a drum) can be modeled as follows: in rest position the membrane occupies a region $U$ in the $x$-$y$ plane. Its movement under periodic (undampened) oscillations is described by a function $u = u(x, y, t)$ measuring the (small) deflection of the membrane in the $z$-direction in a three-dimensional $x$-$y$-$z$ coordinate system over the point $(x, y) in U$ at time $t$. The motion of the membrane is then governed by the two-dimensional _wave equation_
  $ u_(t t) = u_(x x) + u_(y y) $
  with the boundary condition $u = 0$ on $partial U$ (with a suitable unit of time depending on material constants of the membrane). Here we denote by a subscript differentiation with respect to the variables $t, x, y$.
  #part[Suppose $u$ is a solution of the wave equation of the form $u(x, y, t) = f(t) v(x, y)$ with sufficiently smooth functions $f$ and $v$, where $f != 0$ is a periodic function with $f(0) = 0$. Show that then there exist constants $A in RR$ and $lambda > 0$ such that
    $ u(x, y, t) = A sin(lambda t) v(x, y), $
    where
    $ Delta v + lambda^2 v = 0. $]
  #part[Suppose that the membrane is circular, say $U = DD$. Suppose that $u(x, y, t) = f(t) g(r)$ is a solution of the wave equation, where $f$ is as in (a) and $g$ only depends on the radius $r$ in polar coordinates in the $x$-$y$-plane. Show that $g$ then satisfies the differential equation
    $ r g''(r) + g'(r) + lambda^2 r g(r) = 0. $]
  #part[Find solutions $g$ of the equation in (b) in terms of $lambda$ and the Bessel function $J_0$ (see Problem 7.9). Which condition on $lambda$ guarantees that $u(x, y, t) = f(t) g(r)$ as in (b) for one of these solutions $g$ satisfies the boundary condition $u = 0$ on $partial DD$?]
]
#solution[
]
