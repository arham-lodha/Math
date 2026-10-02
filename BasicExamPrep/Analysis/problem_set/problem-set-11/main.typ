#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Problem Set 11",
  name: "Arham Lodha",
  due: "August 19, 2026",
)

#problem("Basic Exam, Spring 2022")[
  Let $f : [0, 2pi] -> RR$ be a continuous function. Show that
  $ lim_(N -> oo) integral_0^(2pi) f(x) sin(N x) dif x = 0. $
]

#solution[
  $forall epsilon > 0$. Let $epsilon prime = (epsilon) / (4 pi)$. By Weirstrass approximation theorem, $exists p in RR[x]$ such that $norm(f - p)_(oo) < epsilon prime$. Note $p prime : [0, 2pi ] -> RR$ and thus $norm(p prime)_(oo) < oo$. There exists $M in NN$ such that $forall N >= M$ we have that $ (4 pi norm(p prime)_(oo) ) / (N) < epsilon/2 $


  $
    abs(integral_0^(2 pi) f(x) sin (N x ) dif x) &= abs(integral_0^(2pi) (f(x) - p(x) + p(x)) sin (N x) dif x) \
    &<= abs(integral_(0)^(2 pi ) (f(x) - p(x)) sin (N x) dif x) + abs(integral_0^(2 pi) p(x) sin(N x) dif x) \
    &< 2 pi epsilon prime + abs(1/N [p(x) cos(N x)]^(0)_(2 pi) + 1/N integral_0^(2 pi) p prime (x) cos(N x) dif x)\
    &= 2 pi epsilon prime + abs(1/N [p(0) - p(2 pi)] + 1/N integral_0^(2 pi) p prime (x) cos(N x) dif x) \
    &= 2 pi epsilon prime + abs(1/N integral_0^(2 pi) (cos(N x) - 1) p prime (x) dif x) \
    &<= 2 pi epsilon prime + 1/N integral_0^(2 pi) abs(cos(N x) - 1) norm(p prime)_(oo) dif x \
  $

  Note that $-1 <= cos(N x) <= 1 => -2 <= cos(N x) - 1 <= 0 => abs(cos(N x)) <= 2$. Thus

  $
    abs(integral_0^(2 pi) f(x) sin(N x) dif x) < 2 pi epsilon prime + (4 pi norm(p prime)_(oo) ) / (N) <= 2 pi epsilon prime + (4 pi norm(p prime)_oo) / (M) < epsilon/2 + epsilon/2 = epsilon
  $

  Thus we have $ lim_(N -> oo) integral_0^(2 pi) f(x) sin(N x) dif x $



]

#problem("Basic Exam, Fall 2007")[
  Let $f in C^2(RR)$ be such that $f''$ is a bounded function on $RR$.

  #part[
    Let $A > 0$. Show that
    $ abs(integral_(-A)^(A) f(x) dif x - 2 A f(0)) <= A^3/3 norm(f''), $
    where $norm(f'') = sup_(x in RR) abs(f''(x))$.
  ]

  #part[
    Let $[a, b] subset.eq RR$ be a compact interval. Show that there exists a
    constant $C > 0$ depending on $a$, $b$, and $norm(f'')$, such that for all
    $n = 1, 2, dots$,
    $
      abs(integral_a^b f(x) dif x - (b-a)/n sum_(k=1)^n f(a + (b-a)/(2n)(2k-1)))
      <= C/n^2.
    $
  ]
]

#solution[
  *(a)*:
  $forall x in [-A, A]$ there exists a $c in [0, x] union [x, 0]$ where $                                                 f(x) & = f(0) + f prime (0) x + 1/2 f prime prime (c) x^2 \
                           f(x) - f(0) - f prime (0) x & = 1/2 f prime prime (c) x^2 \
  integral_(-A)^A [f(x) - f(0 ) - f prime (0)x ] dif x & = 1/2 f prime prime (c) integral_(-A)^A x^2 dif x \
                 integral_(-A)^A f(x) dif x - 2 f(0) A & = 1/6 f prime prime (c) 2 A^3 \
            abs(integral_(-A)^A f(x) dif x - 2 f(0) A) & <= 1/3 norm(f)_(oo) A^3 $
  *(b)*: Note the following chain of equalities.
  $
    integral_a^b f(x) dif x &= sum_(k = 1)^(n) integral_0^((b - a) / (n)) f(x + (k - 1) / (n) (b - a) + a) dif x \
    &= sum_(k = 1)^(n) integral_(-(b - a) / (2n))^((b - a) / (2n)) f(x + a + (b - a) / (2n) (2k - 1)) dif x
  $

  Let $t_n (k) = a + (b - a) / (2n) (2k - 1)$ and let $A = (b - a) / (2n)$.

  We can rewrite the difference as:
  $
    integral_a^b f(x) dif x - (b-a)/n sum_(k=1)^n f(t_n (k)) &= sum_(k = 1)^(n) integral_(-A)^(A) f(x + t_n (k)) dif x - sum_(k=1)^n 2A f(t_n (k)) \
    &= sum_(k = 1)^(n) [integral_(-A)^(A) f(x + t_n (k)) dif x - 2A f(t_n (k))]
  $

  For each $k$, define $g_k (x) = f(x + t_n (k))$. Since $f$ has a bounded second derivative, so does $g_k$, and $norm(g_k prime prime) <= norm(f prime prime)_(oo)$.
  Applying the result from part (a) to $g_k (x)$ with $A = (b - a) / (2n)$, we get:

  $
    abs(integral_(-A)^(A) g_k (x) dif x - 2A g_k (0)) <= A^3 / 3 norm(g_k prime prime) <= 1/3 ((b - a) / (2n))^3 norm(f prime prime)_(oo)
  $

  Summing this bound over all $k = 1, dots, n$ using the triangle inequality yields:

  $
    abs(integral_a^b f(x) dif x - (b-a)/n sum_(k=1)^n f(t_n (k))) &<= sum_(k = 1)^(n) abs(integral_(-A)^(A) f(x + t_n (k)) dif x - 2A f(t_n (k))) \
    &<= sum_(k=1)^n 1/3 ((b - a) / (2n))^3 norm(f prime prime)_(oo) \
    &= n dot 1/3 (b - a)^3 / (8 n^3) norm(f prime prime)_(oo) \
    &= ((b - a)^3 norm(f prime prime)_(oo)) / 24 dot 1 / n^2
  $

  Thus, there exists a constant $C = ((b - a)^3 norm(f prime prime)_(oo)) / 24$ dependent only on $a$, $b$, and $norm(f prime prime)$ such that the inequality holds.]

#problem[
  Determine whether the series
  $ sum_(n=1)^oo (e - (1 + 1/n)^n) / (1 + 1/2 + 1/3 + dots.c + 1/n) $
  is convergent or divergent.
]

#solution[

]

#problem("Basic Exam, Fall 2022")[
  Suppose that $f : [0, 1] -> RR$ satisfies
  $ sum_(j=1)^n abs(f(t_j) - f(t_(j-1)))^2 < 100 $
  for every choice of $n in NN$ and of $0 <= t_0 < t_1 < dots.c < t_n <= 1$.
  Show that $f$ is Riemann integrable over the interval $[0, 1]$.
]

#solution[
  1. $f$ is bounded in $[0 ,1]$: Take ${0, x, 1}$. $ abs(f(x) - f(0))^2 + abs(f(1) - f(x))^2 < 100 => abs(f(x) - f(0))^2 < 100 => -10 < f(x) - f(0) < 10 $
    Thus $forall x in [0, 1]$ we have $-10 + f(0) < f(x) < 10 + f(0)$.

  2. *Number of discontinuities of $f$*: $forall epsilon > 0$. Assume the contrary that $f$ has more than $100/epsilon^2$ jumps of size greater than $epsilon/2$, ie there are $100/epsilon^2$ points $x$ where $delta_x > 0$ small enough such that $y in (x - delta_x, x)$ and $z in (x, x + delta_x)$ such that $abs(f(y) - f(z)) > epsilon$. Take $m = ceil(100/epsilon^2) + 1$ such points $x_1 < ... < x_m$. Let $s_i in (x_i - delta_(x_i) , x_i)$ and $t_i in (x_i, x_i + delta)$. Then we have the following: $ abs(f(0) - f(s_i))^2 + sum_(i=1)^(m) abs(f(s_i) - f(t_i))^2 + sum_(i = 1)^(m - 1) abs(f(t_i) - f(s_(i + 1) ))^2 + abs(f(t_m) - f(1))^2 &>= sum_(i=1)^(m) abs(f(s_i) - f(t_i))^2 \ &>= (100) / (epsilon^2) epsilon^2 = 100. $ Thus we have a contradiction. Thus there are only a countable number of discontinuities. Hence by Lebesgue criterion $f$ is Riemann integrable.
]

#problem[
  Suppose $f : [0,1] -> RR$ is monotone increasing. Show that f is Riemann integrable.
]
