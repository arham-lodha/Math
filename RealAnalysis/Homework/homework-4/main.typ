#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Homework 4",
  name: "Arham Lodha",
  due: "Not due — practice only",
)

// Not due — practice only. Only exercises marked (*) would normally be
// collected; two or three graded from each set.

#problem(num: "4.1*")[
  Let $J: RR -> RR$ be a convex function. Show that if $x_0 < x_1 < x_2$ then
  $ (J(x_1) - J(x_0)) / (x_1 - x_0) <= (J(x_2) - J(x_0)) / (x_2 - x_0) <= (J(x_2) - J(x_1)) / (x_2 - x_1). $
]
#solution[]

#problem(num: "4.2*")[
  Let $J in C^1 (RR)$.
  #part[Show that $J$ is convex if and only if its derivative $J'$ is monotone non-decreasing.]
  #part[Show that if $r in (1, oo)$ then $x -> J(x) := abs(x)^r$ is convex and $J(x) >= J(x_0) + J'(x_0)(x - x_0)$ for all $x, x_0 in (0, oo)$.]
]
#solution[]

#problem(num: "4.3*")[
  Let $(Omega, Sigma, mu)$ be an outer measure space with $mu(Omega) = 1$. Let $r > 1$ and set $phi.alt(t) = t^r$ for $t >= 0$. Show that if $g: Omega -> [0, oo)$ is measurable then
  $ integral_Omega g^r (x) mu(dif x) >= (integral_Omega g(x) mu(dif x))^r. $
]
#solution[]

#problem(num: "4.4*")[
  Let $(Omega, Sigma, mu)$ be an outer measure space with $mu(Omega) < oo$. Let $f, f_1, f_2, dots.c : Omega -> RR$ be measurable functions on $Omega$ and assume $f_j (x) -> f(x)$ as $j -> oo$ for almost every $x$. Assume
  $ integral_Omega f^2 (x) mu(dif x) < oo quad "and" quad integral_Omega f_j^2 (x) mu(dif x) < 1 quad forall j in NN. $
  Show that $integral_Omega abs(f_j (x) - f(x))^p mu(dif x) -> 0$ for every $p in (0,2)$. Construct a counterexample to show this can fail when $p = 2$.
]
#solution[]

#problem(num: "4.5*")[
  Let $mu$ be an outer measure on $X$, let $f: X -> [0, +oo)$ be $mu$-measurable. For $t >= 0$ we define
  $ S_f (t) = {x in X : f(x) > t}, quad F_f (t) = mu[S_f (t)]. $
  #part[Show that $F_f$ is $cL^1$-measurable.]
  #part[Show that $integral_X f dif mu = integral_0^oo F_f dif cL^1$ (you could first check the case when $f$ assumes finitely many values).]
]
#solution[]

#problem(num: "4.6")[
  Let $mu$ be the Lebesgue measure on $(0,1)$. Show that the parallelogram law fails on $L^1 (mu)$.
]
#solution[]

#problem(num: "4.7*")[
  Let $1 <= q < +oo$. Assume that $f in L^q (Omega, dif mu) inter L^oo (Omega, dif mu)$. Prove that $f in L^p (Omega, dif mu)$ for all $q <= p < +oo$ and
  $ lim_(p -> +oo) norm(f)_p = norm(f)_oo. $
]
#solution[]

#problem(num: "4.8")[
  Let $(Omega, mu)$ and $(Gamma, nu)$ be two finite measure spaces and let $f in L^1 (mu times nu)$. Show that if $f >= 0$ and $1 <= p < oo$ then
  $ (integral_Omega (integral_Gamma f(x,y) nu(dif y))^p mu(dif x))^(1/p) <= integral_Gamma (integral_Omega f(x,y)^p mu(dif x))^(1/p) nu(dif y). $
  Hint: Set $H(x) := integral_Gamma f(x,y) nu(dif y)$ and check that
  $ norm(H)_(L^p (mu))^p = integral_Gamma (integral_Omega f(x,y) H^(p-1)(x) mu(dif x)) nu(dif y). $
]
#solution[]

#problem(num: "4.9")[
  Assume that $mu$ is the $d$-dimensional Lebesgue measure on $RR^d$, $1 <= p < +oo$ and let $f in L^oo (RR^d, dif mu)$ be such that $f >= 0$ and $f$ vanishes outside a ball $B_R$ of radius $R > 0$. Let $j in L^1 (RR^d, dif mu)$ be such that $integral_(RR^d) j dif x = 1$. Define,
  $ j_epsilon (x) := 1/epsilon^d j(x/epsilon) quad "and" quad f_epsilon = j_epsilon * f. $
  #part[Prove that if $p >= 2$
    $ abs(f_epsilon (x) - f(x))^p <= [norm(f)_oo (1 + norm(j)_1)]^(p-2) abs(f_epsilon (x) - f(x))^2. $
  ]
  #part[Use Hölder's inequality to prove that if $1 < p <= 2$
    $ norm(f_epsilon - f)_p <= abs(B_R)^(1/p - 1/2) norm(f_epsilon - f)_2. $
  ]
  #part[Deduce that if the approximation by $C^oo$-functions theorem holds in $L^2 (RR^d, dif mu)$ then it holds in $L^p (RR^d, dif mu)$.]
]
#solution[]
