#import "template.typ": *
#import "figures.typ" as figs

#show: paper.with(
  title: "Taylors Formula",
  authors: (
    (name: "Arham Lodha", affiliation: "Your Institution", email: "you@example.com"),
  ),
  abstract: [
    Write your abstract here. State the problem, the contribution, and the
    main result in 4–8 sentences.
  ],
  keywords: ("keyword1", "keyword2"),
  bibliography-file: "refs.bib",
)

= Theorem
#theorem("Taylors Formula")[
  Let $f in C^n ([a, x])$ for some $n >= 1$. Then $ f(x) & = sum_(k = 0)^(n - 1) (f^((k)) (a)) / (k!) (x - a)^(k) + R_n (x) $ where $ R_n (x) = R_n (x, f, a) = integral_(a)^(x) ((x - t)^(n - 1) ) / ((n - 1)!) f^((n)) (t) dif t $
]
#proof[
  For $n >= 2$
  $
    f(x) & = f(a) + integral_(a)^(x) f prime (t) dif t \
         & = f(a) + integral_(a)^(x) f prime (t) d(t + C) \
         & = f(a) + [f prime (t) (t + C)]^x_a - integral_(a)^x (t + C) f prime prime (t) dif t
  $

  Let $C = -x$:

  $
    f(x) & = f(a) + f prime (t) (x - x) - f prime (t) (a - x) + integral_a^x (x - t) f prime prime (t) dif t \
         & = f(a) + f prime (t) (x - a) + integral_a^x (x - t) f prime prime (t) dif t \
  $

  Assume that for all $n <= k$, we have that $ f(x) = sum_(m = 0)^(n - 1) (f^((m))(a) ) / (m!) (x - a)^m + integral_(a)^(x) ((x - t)^(n - 1) ) / ((n - 1)!) f^((n))(t) dif t $

  Suppose $f in C^(k + 1)([a, b]) subset C^(k)([a, b])$:
]

= Mean Value Theorem for integrals
#proposition("Mean Value Theorem for Integrals")[
  Let $f, g in C([a, b];RR)$ such that $g >= 0$ or $g <= 0$. Then $exists xi in (a, b)$ such that $ integral_(a)^(b) f(x) g(x) dif x & = f (xi ) integral_(a)^(b) g(x) dif x $
]<MVT>
#proof[
  Without loss of generality $f$ not constant, $g >= 0$, and $g equiv.not 0$. Let $ M & = sup_(x in [a, b]) f(x) \
  m & = inf_(x in [a, b]) f(x) $
  Thus $m <= f(x) <= M => m g(x) <= f(x) g(x) <= M g(x)$. Thus $ m integral_(a)^(b) g(x) dif x <= integral_(a)^(b) f(x) g(x) dif x <= M integral_(a)^(b) g(x) dif x. $

  We get $ integral_(a)^(b) f(x) g(x) dif x = lambda integral_(a)^(b) g(x) dif x $

  Thus $lambda in [m, M]$. For closed interval we are done by IVT, but we want open interval.

  1. $m < lambda < M$: $exists c, d in [a. b]$ such that $m = f(c)$ and $M = f(d)$. By IVT, applied to to $[c, d]$ we can find some $xi in (c, d)$ such that $lambda = f(c)$
  2. $lambda = m$ or $lambda = M$: Without loss of generality suppose $lambda = M$. Thus $ 0 & = integral_(a)^(b) (M - f(x)) g(x) & = 0 => (M - f(x))g(x) = 0 "a.e" => M - f(x) = 0 "a.e". $ Thus $f(x) equiv M$ by continuity.
]

= Remainder Theorem
#theorem("Taylor's Remainder Formula")[
  Suppose $f in C([a, b]; RR)$
]
#proof[
  $ R_n (x) & = integral_(a)^(x) ((x - t)^(n - 1) ) / ((n - 1)!) f^((n))(t) dif t $

  Applying @MVT we see that $exists xi in (a, x)$ such that

  $
    R_n (x) & = f^(n) (xi) integral_(a)^(x) ((x - t )^(n - 1) ) / ((n - 1)!) dif t \
            & = f^((n))(xi) lr(((x - t)^(n) ) / (n!) (-1)|)_a^x \
            & = f^((n))(xi) (x - a)^n / (n!)
  $
]

#example[
  Let $f in C^(2) (RR)$ be such that $f(x) >= 0$ for all $x >= RR$ where $ sup(f prime prime)_(oo ) < oo . $ $forall x in RR$ we have that $ abs(f prime (x)) <= sqrt(2 norm(f prime prime)_(oo) f(x)). $

  This is a sharp estimate. For example when $f(x) = x^2$. Then $abs(f prime (x)) = 2 abs(x)$ an $ norm(f)_(oo) = 2. $ Thus $ sqrt(2 norm(f prime prime)_(oo ) f(x)) & = sqrt(4 x^2) = 2 abs(x) = abs(f prime (x)) $
]
#proof[
  $ 0 <= f(x + y) & = f(x) + f prime (x) y + y^2/2 f prime prime (xi) $

  where $xi in (x, x + y) union (x + y, x)$.

  $ f(x + y) & <= f (x) + f prime (x) y + (norm(f prime prime)_(oo )) / (2) y^2 $

  If $norm(f prime prime)_(oo) <= 0$, thus $ 0<= y^2 + (2 f prime (x)) / (norm(f prime prime)_oo) + (2 f(x)) / (norm(f prime prime)_(oo ) ) = (y + (f prime (x)) / (norm(f prime prime)_oo))^2 + (2 f (x)) / (norm(f prime prime)) - ((f prime (x))^2) / (norm(f prime prime)^2) $
]

= Real Analytic Functions
#definition("Real Analytic")[
  Let $Omega subset RR$ be a open set. We say $f in C^(oo) (RR)$ is *real analytic* if for all compact $K subset Omega$ such that $C_K$ such that $ sup_(x in K) abs(f^((j)) (x)) <= C^(j + 1) , "for all" j = 0, 1, ... $
]
#proof[
  Let $x_(0) in Omega$. There exists $r > 0$ such that $[x - r, x + r] subset Omega$. Taylor's Formula gives us that $ f(x) = sum_(k = 0)^(n - 1) (f^((k))(x_0)) / (k!) (x - x_0)^(k) + R_n (x) $ for $abs(x - x_0) <= r$. $ abs(R_n (x)) & <= abs(integral_(x_0)^x (f^((n))(t) ) / ((n - 1) !) (x - t)^(n - 1) dif t) \
               & = C^(n + 1) abs(x - x_0)^(n). $

  Thus $forall x_0 in Omega$ there exists $V subset.eq Omega$ a neighborhood of $x_0$, $ f(x) = sum_(k = 0)^(oo ) (f^((k)) (x_0) ) / (k !) (x - x_0)^k $ for all $x in V$ with absolute convergence.
]

