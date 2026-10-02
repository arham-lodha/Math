#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Homework 2",
  name: "Arham Lodha",
  due: "November 2, 2026",
)

// Only exercises marked (*) will be collected; two or three will be graded
// from each set. All exercises are suggested practice.

#problem(num: "2.1")[
  Let $B subset.eq RR^d$.
  #part[Show that if $mu$ is a Borel measure on $RR^d$ then $mu_(|B)$ is also a Borel measure on $RR^d$.]
  #part[Show that if $mu$ is a Borel regular measure on $RR^d$, if $B$ is $mu$-measurable and of finite measure then $nu := mu_(|B)$ is a Radon measure on $RR^d$.]
]
#solution[]

#problem(num: "2.2*")[
  Suppose $mu$ is an outer measure on $X$, $E_1, dots.c, E_n$ are disjoint subsets of $X$ and $c_1, dots.c, c_n$ are distinct nonzero real numbers. Prove that $c_1 chi_(E_1) + dots.c + c_n chi_(E_n)$ is a $mu$-measurable function if and only if $E_1, dots.c, E_n$ are $mu$-measurable sets.
]
#solution[]

#problem(num: "2.3*")[
  Suppose $X subset.eq RR$ is a Borel set and $f: X -> RR$ is a function such that ${x in X : f "is not continuous at" x}$ is a countable set. Prove that $f$ is a Borel measurable function.
]
#solution[]

#problem(num: "2.4*")[
  Suppose that $f: RR -> RR$ is differentiable at every element of $RR$. Prove that $f'$ is a Borel measurable function from $RR$ to $RR$.
]
#solution[]

#problem(num: "2.5*")[
  Let $h$ be a continuous and strictly increasing real valued function on $RR$. Prove that if $B subset.eq RR$, then $h(B)$ is a Borel set if and only if $B$ is a Borel set.
]
#solution[]

#problem(num: "2.6*")[
  Suppose $f: B -> RR$ is a Borel measurable function. Define $g: RR -> RR$ to be the function which coincides with $f$ on $B$ and is identically equal to $0$ on $RR without B$. Prove that $g$ is a Borel measurable function.
]
#solution[]

#problem(num: "2.7*")[
  Say whether or not every open subset of $RR^d$ is a countable union of closed subsets of $RR^d$. Justify your answer (your argument should be short, say, half a page).
]
#solution[]

#problem(num: "2.8")[
  Let $mu$ be an outer measure on a nonempty set $X$. Let $f, g: X -> [-oo, +oo]$ be two $mu$-summable functions. Assume that $A, B subset.eq X$ are two $mu$-measurable sets. Recall
  $ integral_A f dif mu = integral_X chi_A f dif mu. $
  #part[Prove that $f$ is $mu_(|A)$-summable and $integral_X f dif (mu_(|A)) = integral_X f dot chi_A dif mu$.]
  #part[Prove that $integral_X (f + g) dif mu = integral_X f dif mu + integral_X g dif mu$, and $integral_X c f dif mu = c integral_X f dif mu$, for all $c in RR$.]
  #part[Prove that if $f <= g$ then $integral_X f dif mu <= integral_X g dif mu$.]
]
#solution[]

#problem(num: "2.9")[
  Let $mu$ be an outer measure on a nonempty set $X$, let ${A_k}_(k=1)^oo$ be a collection of pairwise disjoint $mu$-measurable subsets of $X$, and let $f: X -> RR$ be a summable function. Prove that
  $ integral_A f dif mu = sum_(k=1)^oo integral_(A_k) f dif mu, $
  where $A = union_(k=1)^oo A_k$.
]
#solution[]

#problem(num: "2.10*")[
  Let $(Omega, mu)$ be an outer measure space and suppose $f_n, g_n, f, g in L^1(mu)$. Suppose
  $ abs(f_n) <= g_n, quad f_n -> f "a.e.", quad g_n -> g "a.e.", quad lim_(n -> oo) integral_Omega g_n (x) mu(dif x) = integral_Omega g(x) mu(dif x). $
  Show that $lim_(n -> oo) integral_Omega f_n (x) mu(dif x) = integral_Omega f(x) mu(dif x)$.
]
#solution[]
