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
#solution[
]

#problem(num: "7.4")[
  Suppose that the power series $f(z) = sum_(n=0)^infinity a_n z^n$ and $g(z) = sum_(n=0)^infinity b_n z^n$ have radii of convergence $R_1 > 0$ and $R_2 > 0$, respectively. For $n in NN_0$ define
  $ c_n = sum_(k=0)^n a_k b_(n-k). $
  Show that the power series $h(z) = sum_(n=0)^infinity c_n z^n$ (the so-called _Cauchy product_ of $f$ and $g$) converges for all $abs(z) < R := min{R_1, R_2}$ and that $h(z) = f(z) g(z)$ for all such $z$.
]
#solution[
]

#problem(num: "7.5")[
  Let $R > 0$, and suppose that the power series $f(z) = sum_(n=0)^infinity a_n z^n$ converges for all $z in B := B(0, R)$.
  #part[Show that the power series converges uniformly on each compact subset of $B$.]
  #part[For $n in NN_0$ and $z in B(0, R)$ define
    $ S_n (z) := abs(sum_(k=0)^n a_k z^k)^2. $
    Show that on each compact subset of $B$ the function sequence ${S_n}$ converges uniformly to $abs(f)^2$.]
  #part[Show that for each $0 <= r < R$ _Parseval's formula_ is valid:
    $ 1/(2 pi) integral_0^(2 pi) abs(f(r e^(i t)))^2 dif t = sum_(n=0)^infinity abs(a_n)^2 r^(2n). $]
]
#solution[
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
    $ 1/(2 pi i) integral_gamma (w - 1/w)^n (dif w) / w = cases(0 & n in NN_0 "odd", (-1)^(n\/2) binom(n, n\/2) & n in NN_0 "even".) $]
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
