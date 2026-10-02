#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Homework 1",
  name: "Arham Lodha",
  due: "October 12, 2026",
)

// Only exercises marked (*) will be collected; two or three will be graded
// from each set. All exercises are suggested practice.

#problem(num: "1.1")[
  Let $mu$ be an outer measure on a set $X$ and let ${A_k}_(k=1)^oo$ be a sequence of subsets of $X$.
  #part[Prove that if $mu[A_1] = 0$, then $A_1$ is $mu$-measurable.]
  #part[Prove that $A_1$ is $mu$-measurable if and only if its complement $A_1^c$ is $mu$-measurable.]
  #part[Assume in the sequel that ${A_k}_(k=1)^oo$ is a sequence of $mu$-measurable sets. Prove that if $A_1 subset.eq A_2 subset.eq dots.c subset.eq A_k subset.eq dots.c$, then $mu[A_1] + mu[A_2 without A_1] + dots.c + mu[A_k without A_(k-1)] = mu[A_k]$.]
  #part[Prove that if $A_1 supset.eq A_2 supset.eq dots.c supset.eq A_k supset.eq dots.c$ and $mu[A_1] < +oo$ then $lim_(k -> +oo) mu[A_k] = mu[inter_(k=1)^oo A_k]$. Give a counterexample to this statement when $mu[A_1] = +oo$.]
  #part[Assume that $B subset.eq X$. Show that if $A_1$ is $mu$-measurable then $A_1$ is $mu_(|B)$-measurable.]
]
#solution[
  *(a)*: Suppose $mu[A_1] = 0$. To show that $A_1$ is $mu-$measurable, it suffices to show that $mu[B] >= mu[B - A_1] + mu[A_1 inter B]$ for all $B subset X$. Fix $B subset.eq X$. Note that $B - A_1 subset.eq B$ and $A_1 inter B subset.eq A$ hence $mu[B - A_1] <= mu[B]$ and $mu [A inter B] = 0$. Hence $mu[B] >= mu[B - A_1] = mu[B - A_1] + mu [A inter B]$.

  *(b)*: Suppose $A$ is $mu -$measurable, thus $mu[B] &= mu[B - A] + mu[A inter B]$. We want to show that $mu[B] >= mu[B - A^c] + mu[A^c inter B]$ for all $B subset.eq X$. $                           B - A^c & = (B inter (A^c)^c) = B inter A \
                        B inter A^c & = B - A \
  <=> mu[B - A^c] + mu[A^c inter B] & = mu [B inter A] + mu [B - A] \
                                    & = mu [B] $

  All implications are bidirectional.

  *(c)*: Suppose ${A_k}_(k = 1)^(oo)$ is a sequence of $mu$-measurable and $A_i subset.eq A_(i + 1)$. Base case for $mu[A_1]$ is trivial. Assume for the sake of induction that: $ sum_(k = 1)^(n - 1) mu[A_(k + 1) - A_k ] + mu[A_1] = mu[A_n]. $
  Now by $mu-$measurablity of $A_(n)$, we know $ mu[A_(n + 1)] & = mu[A_(n + 1) - A_(n)] + mu[A_(n + 1) inter A_(n)] \
                & = mu[A_(n + 1) - A_(n) ] + mu[A_n] quad (A_n subset.eq A_(n + 1)) \
                & = sum_(k = 1)^(n) mu [A_(k + 1) - A_(k)] + mu [A_1] quad ("inductive hyp.") $

  *(d)*: Suppose $ A_i supset.eq A_(i + 1) , $ $mu [A_1] < oo$, and all $A_i$ are $mu$-measurable. $A_i^c$ is measurable.

]

#problem(num: "1.2*")[
  Suppose $mu$ is a measure on $ZZ^+ := ZZ inter [0, +oo)$ such that every subset of $ZZ^+$ is $mu$-measurable. Show that there exists a sequence $(omega_k)_(k=0)^oo subset.eq [0, +oo]$ such that for every $E subset.eq ZZ^+$ we have
  $ mu(E) = sum_(k in E) omega_k. $
]
#solution[
  Let $ omega_k := mu[{k}]. $ For finite sets $E subset ZZ^+$, showing the claim follows from a inductive argument. The case for singletons is trivial. Suppose for the sake of induction that it is true for all $E subset ZZ^+$ such that $abs(E) = k$. Then let $F = {x_1, ..., x_(k + 1) } subset ZZ^+$. $ mu[F] & = mu[F - {x_(k+1) }] + mu[{x_(k + 1)}] quad (F " is measurable") \
        & = sum_(i = 1)^(k) omega_(x_i) + omega_(x_(k + 1) ). $

  Now for $E subset.eq ZZ^+$ infinite we will do the following argument. $E$ countable, thus let $E = {x_(i)}_(i = 1)^(oo)$ be an enumeration. Let $A_n := {x_1, ..., x_n}$. Note that $A_(n) subset.eq A_(n + 1)$. $ mu[E] & = lim_(n -> oo) mu[A_n] \
        & = lim_(n -> oo) (mu[A_1] + sum_(k = 1)^(n - 1) mu[A_(k + 1) - A_(k)] ) \
        & = lim_(n -> oo) (omega_x_1 + sum_(k = 1)^(n - 1) omega_x_k ) \
        & = sum_(k = 1)^(oo) omega_x_k = sum_(e in E) omega_e $
]

#problem(num: "1.3*")[
  Suppose $mu$ is an outer measure on $X$ such that $mu(X) < oo$ and suppose $S$ is the set of $mu$-measurable subsets. Suppose $cA subset.eq S$ is such that for every $A in cA$, $mu(A) > 0$ and for every $A, B in cA$ such that $A eq.not B$ then $A inter B = emptyset$. Show that $cA$ is countable.
]
#solution[]

#problem(num: "1.4*")[
  Let $mu$ be an outer measure on a set $X$ and let $S$ be the collection of $mu$-measurable subsets on $X$. Show that we cannot have
  $ {mu(E) : E in S} = [0, 1). $
]
#solution[]

#problem(num: "1.5*")[
  Let $mu$ be a measure on a set $X$ such that $mu[X] = 1$ and let cM be the set of $mu$-measurable sets. Suppose that $mu[M] > 0$ for each $emptyset eq.not M in cM$ and let
  $ alpha(x) = inf_(M in cM) {mu[M] : x in M} quad (x in X). $
  #part[Show that there exists a set $A_x in cM$ such that $x in A_x$ and $mu[A_x] = alpha(x)$.]
  #part[Show that the sets ${A_x}$ are either disjoint or identical.]
]
#solution[]

#problem(num: "1.6")[
  Let $mu$ be a measure on $X$ such that $mu[X] < oo$. Show that if ${x}$ is $mu$-measurable for every $x in X$ then there are at most countably many $x in X$ such that $mu[{x}] > 0$.
]
#solution[]

#problem(num: "1.7*")[
  Show that $S = {union_(n in K) (n, n+1] : K subset.eq ZZ} union {emptyset}$ is a $sigma$-algebra on $RR$.
]
#solution[]

#problem(num: "1.8*")[
  Prove that $sigma(C_1) = sigma(C_2) = sigma(C_3) = cB$, where $cB$ is the Borel $sigma$-algebra on $RR$. Here,
  $ C_1 = {(r, s] : r, s in QQ}, quad C_2 = {(r, n] : r in QQ, n in ZZ}, quad C_3 = {[r, +oo) : r in QQ}. $
]
#solution[]

#problem(num: "1.9*")[
  Prove that if $B subset.eq RR^d$ is a Borel set, $t in RR$ and $c in RR^d$ then $t B = {t x : x in B}$ and $c + B = {c + x : x in B}$ are Borel sets, where $cB$ is the Borel $sigma$-algebra on $RR$.
]
#solution[]

#problem(num: "1.10")[
  Let $(X, mu)$ be an outer measure space and $(A_n)_n$ be a sequence of $mu$-measurable subsets of $X$. Show that if $sum_(n=1)^oo mu[A_n] < oo$ then $mu[A] = 0$ if we set
  $ A = inter_(m=1)^oo union_(n=m)^oo A_n. $
]
#solution[]
