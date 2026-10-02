#import "template.typ": *
#import "figures.typ" as figs

#show: paper.with(
  title: "Abel's Theorem",
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

= Abel's Lemma
#lemma("Abel's Lemma")[
  Assume that the power series $ sum_(k = 0)^(oo) a_k x^k $ converges for some $x = x_0 != 0$. Then the series converges absolutely for $x in RR$ such that $abs(x) < abs(x_0)$
]
#proof[
  $ sum_(k = 0)^(oo) a_k x^k "converges" & => lim_(k -> oo ) a_k x^k = 0 $
  and in particularly $abs(a_k x_0^(k)) <= C$ for $k = 1, 2, ...$. Then $ abs(a_k x^k)= abs(a_k x_0^(k)) abs(x / x_0)^(k) <= C abs((x) / (x_0))^(k). $ Note $abs((x) / (x_0)) < 1$ thus it is is a geometric series and hence converges.

  $ sum_(k = 0)^(oo) a_k x^(k) "converges absolutely" $
]

= Main Theorem
#theorem()[
  Given the power series $ sum_(k = 0)^(oo) a_k x^(k), $ one of the following occurs:

  1. the series converges
  2. $exists R > 0$ such that the series converges absolutely for $abs(x) < R$ and diverges for $abs(x) < R$
  3.The series converges absolutely for $x in RR$.
]
#proof[
  $ M = {x in RR: "series converges"}. $ $0 in M$ by definition.

  1. $M = 0$: Case 1.
  2. $M$ is unbounded: $forall C > 0$ exists a $x in M$ such that $abs(x) > C$. By Abel's Lemma, $M = RR$.
  3. $M != 0$ but bounded: Let $R = sup {abs(x) : x in R}.$ Abel's Lemma and definition of supremum we get case 2 of the theorem.

]

#definition("Radius of Convergence")[
  *$R in (0, oo]$* is called the *Radius of Convergence* of $ sum_(k =0)^(oo ) a_k x^k $ if for all $abs(x) <= R$ the series convergence.
]

#proposition()[
  Let $ sum_(k = 0)^(oo) a_k x^k $ be a power series with radius of convergence $R > 0$. Then the series converges uniformly on a compact subset of $abs(x) < R$.
]
#proof[
  Let $K subset (-R, R)$ be compact. Pick $0 < r < R$ such that $K subset.eq [-r, r]$. We know that the series converges absolutely on $[-r,r]$. Since $abs(a_k x^k) <= abs(a_k) r^k$. By the Weierstrass M test, the power series converges uniformly on $K$.
]

#corollary()[
  Let $ f(x) = sum_(k = 0)^(oo ) a_k x^k $ with radius of convergence of $R$. $f in C((-R, R))$
]

#theorem("Hadamard's Formula")[
  Let $(a_k)_(k = 0)^(oo )$ be the sequence of coefficients of a power series with radius $R$. $ R = 1/(H) $ where $ H = limsup_(k -> oo) abs(a_k)^(1/k) $
]
#proof[
  We have to show that $H$ satisfies the properties of the radius of convergence: $abs(x) < 1/H =>$ the series converges absolutely, and if $abs(x) > 1/H$ the series diverges. $abs(x) < 1/H => abs(x) H <= 1$. Thus $abs(x) limsup abs(a_k)^(1/k) < 1 <=> L = limsup abs(a_k x^k)^(1/k) < 1.$ Thus $forall epsilon > 0$ there exists a $N$ such that $forall k >= N$, $abs(a_k x^k)^(1/k) < L + epsilon.$ Take $epsilon$ such that $L + epsilon < 1$. Then $abs(x_k x^k) < (L + epsilon)^k$. Thus for large enough $k$, we have a geometric series and thus the series converges absolutely.

  Suppose $abs(x) H > 1$. Then $L > 1$. Then the terms $abs(a_k x^k)^(1/k) > 1$ for infinitely many $k$, thus $abs(a_k x^k) > 1$ for infinitely many $k$. Thus the series diverges.
]

#proposition[
  Let $I subset RR$ be an open interval. Let $f_n in C^1 (I)$ be such that $f_n -> f$ converges pointwise on $I$ and $f_n prime -> g$ locally uniformly (uniformly on compact subsets of $I$). Then $f in C^1(I)$ and $f prime = g$.
]
#proof[
  Let $a = I$. $forall x in I$: $ integral_a^x f_n prime (t) dif t = f_n (x) - f_n (a). $ Keep $x$ fixed and $n -> oo$: $ f_n (x) - f_n (a) -> f(x) - f(a). $ Since $f_n prime -> g$ converge uniformly on compact subsets of $I$, $ lim_(n -> oo )integral_a^x f_n (t) dif t & = integral_a^x g(t) dif t. $ Note $g in C(I)$, thus $f$ is a $C^1(I)$. Thus $f prime (x) = g$ by fundamental theorem of calculus.
]

#theorem()[
  Let $ sum_(k = 0)^(oo ) a_k x^k $ be a power series with radius of convergence $R > 0$. Then $ f(x) = sum_( k =0 )^(oo ) a_k x^k $ where $abs(x) < R$, satisfies:
  $f in C^(oo) ((-R, R))$ and the derivatives can be obtained by differentiating the power series term by term.
]
#proof[The radius of convergence of the differentiated series: $ sum_(k = 1)^(oo) k a_k x^(k - 1) $ is equal to the radius of convergence of $ sum_(k = 1)^(n) k a_k x^(k) $ which is $ (1) / (limsup_(n -> oo) abs(k a_k)^(1/k) ) = (1) / (limsup_(n -> oo) abs(a_k)^(1/k) ) = R. $
]

= Abel's Theorem
#theorem("Abel's Continuity Theorem")[
  Let $ f(x) = sum_(k = 0)^(oo) a_k x^(k) $ with positive radius of convergence $0 < R < oo$ and assume that $ sum_(k = 0)^(oo ) a_k R^k $ converges (not necessarily nicely). Then the convergence is uniform on $[0, R]$, then $f(x) in C([0, R])$
]<AbelsContinuityTheorem>
#proof[
  For $x in [0, R]$, let $t = x/R => x = R t$. Thus the power series becomes a power series in $t$ with radius of convergence of $1$: $ sum_(k = 0)^(oo) a_k R^k t^k. $
  We also have convergence when $t = 1$. Suffices to treat the case where $R = 1$. We have $ -oo < sigma & = sum_(k = 0)^(oo) a_k < oo \
      sigma_n & = sum_(k = 1)^(n) a_k. $

  Consider for $x in [0, 1)$, $ f(x) - sum_(k = 0)^(n) a_k x^k &= sum_(k = n + 1)^(oo) a_k x^k \
  &= sum_(k = n + 1)^(oo) (sigma_k - sigma_(k - 1) ) x^k \
  &= sum_(k = n + 1)^(oo) ((sigma_k - sigma ) - (sigma_(k - 1) - sigma )) x^k \
  &= sum_(k = n + 1)^(oo) (sigma_k - sigma) x^k - x sum_(k = n + 1)^(oo) (sigma_(k - 1) - sigma) x^(k - 1) \
  &= sum_(k = n + 2)^(oo) (sigma_(k - 1) - sigma) x^(k - 1) + (sigma_n - sigma)x^n -(sigma_n - sigma) x^n - x sum_(k = n + 1)^(oo) (sigma_(k - 1) - sigma) x^(k - 1) \
  &= sum_(k = n + 1)^(oo) (sigma_(k - 1) - sigma) x^(k - 1) - x sum_(k = n + 1)^(oo) (sigma_(k - 1) - sigma) x^(k - 1) - (sigma_n - sigma) x^n \
  &= (1 - x)sum_(k = n + 1)^(oo) (sigma_(k - 1) - sigma) x^(k - 1) - (sigma_n - sigma) x^n $


  Let $epsilon > 0$. $exists N$ such that $ abs(sigma_n - sigma) <= epsilon $ for all $n >= N$. We get for $n >= N$ and $x in [0, 1)$, $ abs(f(x) - sum_(k = 0)^(oo) a_k x^k) &<= epsilon x^n + (1 - x) sum_(k = n + 1)^(oo) epsilon x^(k - 1) \ <= epsilon + epsilon (1 - x) sum_(k = n)^(oo) x^k <= epsilon + epsilon x^n <= 2 epsilon $ where $x in [0, 1]$. Thus $forall x in [0, 1]$ this holds. Take $ sup_(x in [0, 1]) abs(f(x) - sum_(k = 0)^(n) a_k x^k) <= 2 epsilon . $ Thus the power series converges uniformly on $x in [0, 1]$.
]
#remark[
  The trick used here is called Abel's Partial summation.
]

#example[
  Consider $log(1 + x)$, it is given by the following Taylor series with radius of convergence of $1$, $ sum_(k = 1)^(oo) (-1)^(k - 1) / (k) x^k. $ But when $x = 1$, the series converges (alternating). By @AbelsContinuityTheorem, the RHS is continous on $[0, 1]$. Letting $x -> 1^(-):$ we get $ log(2) = sum_(k = 1)^(oo) ((-1)^(k - 1) ) / (x^k) $
]

#example("Basic Exam, Spring 2022")[
  Let $(a_n)_(n = 0)^(oo)$ where $a_n >= 0$ such that $n a_n -> a in (0, oo)$. Look at $ f(x) = sum_(k = 0)^(oo) a_n x^k $ with radius of convergence of $1$. $ lim_(x -> 1^-) f prime (x) (1 - x) = a $
]
#proof[
  We have $ f prime (x) = sum_(k = 1)^(oo) k a_k x^(k - 1), abs(x) < 1 $
  $f prime (x) (1 - x)$
]

= Abel's Partial Summation
Consider: $sum_(k = 1)^(n) a_k b_k$ and let $B_k = sum_(n = 1)^(oo) b_n$ and let $B_0 = 0$. Thus $b_k = B_(k) - B_(k - 1).$

Thus $ sum_(k = 1)^(n) a_k b_k & = sum_(k = 1)^(n) a_k (B_k - B_(k - 1)) \
                        & = sum_(k = 1)^(n) a_k B_k - sum_(k = 0)^(n - 1) a_(k + 1) B_(k) \
                        & = sum_(k = 1)^(n) a_k B_k - sum_(k = 1)^(n - 1) a_(k + 1) B_(k) $

We get: $ sum_(k = 1)^(n) a_k b_k & = a_n B_n + sum_(k = 1)^(n - 1) (a_k - a_(k + 1) )B_k $
