#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Discussion 3",
  name: "Arham Lodha",
  due: "",
)

== 1. Measurable functions

#problem(num: "1.1")[
  _(Level sets; Bass 5.1.)_ Let $(X, cA)$ be a measurable space and let $f : X -> RR$. Suppose that
  $ {x : f(x) > q} in cA quad (q in QQ). $
  Prove that $f$ is measurable. Deduce that if $f_n : X -> RR$ are measurable, then $sup_n f_n$, $inf_n f_n$, $limsup_n f_n$, and $liminf_n f_n$ are measurable (when allowed to take extended-real values).
]
#solution[]

#problem(num: "1.2")[
  _(Where does a sequence converge?; Bass 5.4.)_ Let $f_n : X -> RR$ be measurable. Prove that
  $ C = {x : lim_(n -> infinity) f_n (x) "exists in" RR} $
  is measurable.
]
#solution[]

#problem(num: "1.3")[
  Give an uncountable family of nonnegative measurable functions ${f_alpha}_(alpha in I)$ such that
  $ f(x) = sup_(alpha in I) f_alpha (x) $
  is finite everywhere but is not measurable.
]
#solution[]

== 2. Borel--Cantelli and convergence

Let $(X, cA, mu)$ be a finite measure space, i.e. $mu(X) < infinity$.

#problem(num: "2.1")[
  _(The first Borel--Cantelli lemma.)_ Let $E_n subset.eq X$, $n = 1, 2, dots.c$ be a sequence of measurable sets. Prove that
  $ sum_(n=1)^infinity mu(E_n) < infinity quad ==> quad mu(limsup_(n -> infinity) E_n) = 0. $
  Show by example that the converse is false.

  Also show that if $mu(E_n) >= delta > 0$ for every $n$ and $mu(X) < infinity$, then $mu(limsup E_n) >= delta$.
]
#solution[]

#problem(num: "2.2")[
  _(An almost-everywhere convergent subsequence.)_ Suppose that $f_n, f : X -> RR$, $n = 1, 2, dots.c$ are measurable functions. Assume that for every $epsilon > 0$,
  $ mu{x : |f_n (x) - f(x)| >= epsilon} <= a_n (epsilon) $
  for some sequence $a_n (epsilon) -> 0$ as $n -> infinity$.

  Show that there is a subsequence $f_(n_k)$ so that $f_(n_k)(x) -> f(x)$ for all $x$ outside a set of $mu$-measure $0$.
]
#solution[]

== 3. Toward Lusin's theorem

#problem(num: "3.1")[
  _(The finite-valued case of Lusin.)_ Let $s : [0, 1] -> RR$ be a measurable function taking only finitely many values. Prove that for every $epsilon > 0$ there is a compact set $K subset.eq [0, 1]$ such that
  $ m([0, 1] without K) < epsilon quad "and" quad s|_K "is continuous." $
]
#solution[]

== 4. Optional qual problems

#problem(num: "P1")[
  _(Measurable solutions of Cauchy's equation; Bass 5.11.)_ Suppose $f : RR -> RR$ is Lebesgue measurable and
  $ f(x + y) = f(x) + f(y) quad (x, y in RR). $
  Prove that $f(x) = c x$ for some $c in RR$.
]
#solution[]

#problem(num: "P2")[
  _(UCLA Analysis Qual, Fall 2020, Problem 1.)_ Suppose $f : [0, 1] times [0, infinity) -> [0, 1]$ is continuous. Prove that
  $ F(x) = limsup_(y -> infinity) f(x, y) $
  is Borel measurable.
]
#solution[]

#problem(num: "P3")[
  _(UCLA Analysis Qual, Fall 2011, Problem 1.)_ Let $f_n : [0, 1] -> RR$ be measurable and suppose $f_n -> f$ almost everywhere. Prove that for every $epsilon > 0$ there is a measurable set $E subset.eq [0, 1]$ with $m(E) < epsilon$ such that $f_n -> f$ uniformly on $[0, 1] without E$.
]
#solution[]
