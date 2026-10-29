#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Discussion 2",
  name: "Arham Lodha",
  due: "",
)

#let mst = $m^*$

== 1. Review

#problem(num: "1.1")[
  Let $(X, cA, m)$ be a finite measure space.
  #part[If $A_1 subset.eq A_2 subset.eq dots.c$ are measurable, then $m(union.big_(i=1)^infinity A_i) = lim_(i -> infinity) m(A_i)$.]
  #part[If $A_1 supset.eq A_2 supset.eq dots.c$ are measurable, then $m(inter.big_(i=1)^infinity A_i) = lim_(i -> infinity) m(A_i)$.]
]
#solution[
  1. Suppose $A_1 subset.eq A_2 subset.eq ...$ are measurable. Note that $ mu[A_2] = mu[A_1 inter A_2] + mu[A_2 - A_1]. $ Assume the inductive hypothesis, $ mu[A_n] = mu[A_1] + sum_(k = 1)^(n) mu[A_(k + 1) - A_(k)]. $ By the use definition of measurable, and we see $ mu[A_(n + 1)] = mu[A_1] + sum_(k = 1)^(n + 1) mu [A_(k + 1) - A_(k) ] . $ Thus $ mu (union.big_(k = 1)^(oo) A_k) & = mu(A_1 union (union.big_(k = 1)^(oo) (A_(k + 1) - A_k ))) \
                                    & = mu[A_1] + sum_(k = 1)^(oo) mu[A_(k + 1) - A_(k)] quad "disjointness" \
                                    & = lim_(n -> oo) (mu[A_1] + sum_(k = 1)^(n) mu [A_(k + 1) - A_(k) ] ) \
                                    & = lim_(n -> oo) mu [A_n] $
  2. $A_1 supset.eq A_2 supset ...$ measurable: Take complements and use a.
]

== 2. The rules of measurable sets

#problem(num: "2.1")[
  _Scholium._ If $P(n)$ is a statement about the $n$th natural number, how do you (hope to) prove $P(n)$ is true?
]
#solution[

]

#problem(num: "2.2")[
  Let $cB$ be the Borel $sigma$-algebra on $RR$. Suppose $m, n$ are two measures on $(RR, cB)$ with $m((a, b)) = n((a, b)) < infinity$ for every $-infinity < a < b < infinity$. Prove $m(A) = n(A)$ for all $A in cB$.
]
#solution[This is an appliction of $pi-lambda$ theorem. Let $P = {(a, b) : -oo < a < b < oo}$. $P$ is a $pi$ system. Let $L = {B : B "Borel", mu (B) = eta (B)}$. $P subset.eq L$. We will show that $L$ is a $lambda$-system.
  1. $RR in L$: Let $A_k = (-k, k)$. $A_1 subset.eq A_2 subset.eq ... subset.eq A_k subset.eq ...$. $ RR = union.big_(n = 1)^(oo) A_n & => mu(RR) = lim_(n -> oo) mu (A_n) = lim_(n -> oo) eta (A_n) = eta(RR) $
  2. $A, B in L$ where $B subset.eq A$ then $A - B in L$: $ eta(B) + eta(A - B) = eta(A)= mu(A) = mu(B) + mu(A - B) => eta(A - B) = mu (A - B) $
  3. Growing unions are the same logic as 1.

  Thus $L$ is a $lambda$-system. Furthermore, by $pi -lambda$ theorem, $cB = sigma(P) subset.eq L$. Hence we are done.
]

#problem(num: "2.3")[
  let $(x, cA)$ be a measurable space, $cc subset.eq cA$, and $m, n$ two $sigma$-finite measures on $(x, cA)$ with $m(a) = n(a)$ for all $a in cc$.
  #part[is it true that $m(a) = n(a)$ for all $a in sigma(cc)$, the smallest $sigma$-algebra containing $cc$?]
  #part[what if $m, n$ are finite measures?]
]
#solution[]

#problem(num: "2.4")[
  Work in $X = [0, 1]$ with the usual topology and Lebesgue measure $m$.
  #part[Prove that for every Borel $A subset.eq X$ and every $epsilon > 0$ there are a compact $K$ and a relatively open $U$ with $K subset.eq A subset.eq U subset.eq X$ and $m(U without K) < epsilon$. Prove this from scratch using only basic properties of $m$.]
  #part[Deduce that every Borel $A subset.eq X$ has an $F_sigma$ subset $F$ and a $G_delta$ superset $G$ with $F subset.eq A subset.eq G$ and $m(G without F) = 0$.]
]
#solution[
  +
]

== 3. Quantifiers and measurability

#problem(num: "3.1")[
  Let $f_n : RR -> RR$ be a sequence of functions. Describe ${x : lim_(n -> infinity) f_n(x) "exists"}$.
]
#solution[]

#problem(num: "3.2")[
  Let $f : RR -> RR$ be arbitrary. Prove $C_f = {x in RR : f "is continuous at" x}$ is a $G_delta$ set, hence Borel.
  _Hint:_ for each $k >= 1$, take the union of all open intervals $I$ with $|f(y) - f(z)| < 1 slash k$ for all $y, z in I$.
]
#solution[]

#problem(num: "3.3")[
  Let $A subset.eq RR$ be Lebesgue measurable, and define
  $
    E_infinity = {x : x + 1 slash n in A "for infinitely many" n >= 1}, quad E_"ev" = {x : x + 1 slash n in A "for all sufficiently large" n}.
  $
  #part[Show both are Lebesgue measurable. If $A$ is Borel, are they Borel?]
  #part[Prove $E_"ev" subset.eq E_infinity$, and give an example where the inclusion is strict.]
]
#solution[]

#problem(num: "3.4")[
  If $E_1, E_2, dots.c subset.eq [0, 1]$ are Lebesgue measurable and $sum_(i=1)^infinity m(E_i) < infinity$, what can you say about $m({x : x in E_i "infinitely often"})$?
]
#solution[]

#problem(num: "3.5")[
  _(Ternary digits.)_ For $x in [0, 1)$ write $x = sum_(n=1)^infinity d_n (x) slash 3^n$ with $d_n(x) in {0, 1, 2}$, using the expansion ending in zeros when there are two choices.
  #part[Fix a word $(e_1, dots.c, e_N) in {0, 1, 2}^N$. Show that the set of numbers whose first $N$ digits are $e_1, dots.c, e_N$ is a half-open interval, and find its endpoints.]
  #part[Prove that $B = {x in [0, 1) : lim_(N -> infinity) #[$\#{1 <= n <= N : d_n (x) = 2} slash N$] = 1 slash 2}$ is Borel.]
  #part[Show the set of $x in [0, 1]$ admitting two different expansions has Lebesgue measure $0$.]
  #part[What is $K = {x : d_n (x) = 0 "or" 2 "for all" n in NN}$? What is its Lebesgue measure?]
]
#solution[]

#problem(num: "3.6")[
  Suppose $A$ is Lebesgue measurable and $B = union.big_(x in A) [x - 1, x + 1]$. Prove $B$ is Lebesgue measurable.
]
#solution[

]

== 4. Two interesting problems

#problem(num: "P1")[
  Construct a Borel set $A subset.eq RR$ such that for every interval $(a, b)$,
  $ 0 < m(A inter (a, b)) < |b - a|. $
]
#solution[]

#problem(num: "P2")[
  _(Qual problem.)_ Let $tau > 1$ and define
  $
    E_tau := {x in RR^2 : exists C_x > 0 "such that for all" lambda in ZZ^2, |x dot lambda| >= C_x slash |lambda|^tau}.
  $
  Prove $E_tau$ has full Lebesgue measure.
]
#solution[]
