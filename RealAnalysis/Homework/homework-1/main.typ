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
#solution[Let $ I_n := {A in cA : mu[A] >= 1/n}. $ Note that $ cA = union.big_(n in NN) I_n. $ Assume the contrary that $I_n$ is not finite. Let $J subset.eq I_n$ be a countably infinite subset, $ mu [X] >= mu [union.big_(A in I_n) A] >= mu [union.big_(A in J) A] = sum_(A in J) mu [A] >= sum_(A in J) 1/n = oo. $ Thus a contradiction occurs. Hence $abs(I_n)$ is finite. Hence $cA$ is a countable union of finite sets hence must be countable.

]

#problem(num: "1.4*")[
  Let $mu$ be an outer measure on a set $X$ and let $S$ be the collection of $mu$-measurable subsets on $X$. Show that we cannot have
  $ {mu(E) : E in S} = [0, 1). $
]
#solution[Note that $X in S$. Thus $exists alpha in [0, 1)$ where $mu[X] = alpha$. But since we have a bijection between ${mu(E) : E in S} = [0, 1)$ there exists a $E in S$ such that $mu(S) = (alpha + 1) / (2)$. But $E subset.eq X$ and by monotonicity of outer measure, $(alpha + 1) / (2) = mu(E) <= mu(X) = alpha$ this is a contradiction.
]

#problem(num: "1.5*")[
  Let $mu$ be a measure on a set $X$ such that $mu[X] = 1$ and let $cM$ be the set of $mu$-measurable sets. Suppose that $mu[M] > 0$ for each $emptyset eq.not M in cM$ and let
  $ alpha(x) = inf_(M in cM) {mu[M] : x in M} quad (x in X). $
  #part[Show that there exists a set $A_x in cM$ such that $x in A_x$ and $mu[A_x] = alpha(x)$.]
  #part[Show that the sets ${A_x}$ are either disjoint or identical.]
]
#solution[*(a)*: We know that following that: $forall n in NN$ there exists a $E_n in cM$ such that $ mu(E_n) <= alpha(x) + 1/n $ and $x in E_n$. $ inter.big_(n in NN) E_n in.rev {x}. $ Consider $ F_k := inter.big_(n = 1)^k E_k. $ Note that $F_1 supset.eq F_2 supset.eq ...$, and ${x} in F_k => alpha(x) <= mu(F_n) <= mu(E_n) = alpha(x) + 1/n$. By problem 1, we know that $ lim_(n -> oo) mu [F_n] = mu[inter.big_(n in NN) F_n ]. $ By the squeeze theorem we know, that $ alpha(x) <= mu [inter.big_(n in NN) F_n ] <= lim_(n -> oo) (alpha(x) + 1/n) = alpha (x) => mu[inter.big_(n in NN) F_n ] = alpha(x). $ Furthermore, we know that $ inter.big_(n in NN) F_n = inter.big_(n in NN) E_n "is measurable.". $ Thus $ A_x = inter.big_(n in NN) F_n $

  *(b)*: Suppose $x, y in X$ where $A_x != A_y$. Assume the contrary, that $A_x inter A_y != emptyset$.

  First note that if $M in cM$ with $x in M$, then $A_x subset.eq M$. Indeed, $A_x inter M in cM$ and $x in A_x inter M$, so $ alpha(x) <= mu[A_x inter M] <= mu[A_x] = alpha(x). $ Since $mu[X] = 1 < oo$, $mu[A_x - M] = mu[A_x] - mu[A_x inter M] = 0$. But $A_x - M in cM$, so $A_x - M = emptyset$ by assumption. Thus $A_x subset.eq M$.

  Take $z in A_x inter A_y$. Since $A_x in cM$ and $z in A_x$, we have $A_z subset.eq A_x$, and similarly $A_z subset.eq A_y$.

  Case 1: $x in A_z$. Then $A_x subset.eq A_z$ by the above, so $A_x = A_z$.

  Case 2: $x in.not A_z$. Then $x in A_x - A_z in cM$, so $A_x subset.eq A_x - A_z$. But $z in A_x$ and $z in A_z$, so $z in.not A_x - A_z$, a contradiction. Hence Case 2 cannot occur.

  So $A_x = A_z$, and by the same argument applied to $y$, $A_y = A_z$. Thus $A_x = A_y$, a contradiction. Hence $A_x inter A_y = emptyset$.
]

#problem(num: "1.6")[
  Let $mu$ be a measure on $X$ such that $mu[X] < oo$. Show that if ${x}$ is $mu$-measurable for every $x in X$ then there are at most countably many $x in X$ such that $mu[{x}] > 0$.
]
#solution[
  Let $Y := {x in X : mu ({x}) > 0}$. For all $n in NN$, let $Y_n := {y in Y: mu({y}) >= 1/n}$. We will show that $abs(Y_n) < oo$. Assume the contrary, that $Y_n$ is not finite. Let ${y_k}_(k = 1)^oo subset.eq Y$ be a enumeration of countably infinite elements of $Y$. By monotonicity: $ mu (X) >= mu (Y) >= mu ({y_k : k in NN}) = sum_(k = 1)^(oo) mu ({y_k}) >= sum_(k = 1)^(oo) 1/n = oo. $ Thus $mu (X)$ is not finite and a contradiction occurs. Hence $abs(Y_n)$ must be finite. $Y$ is the countable union of finite sets (with possible intersections), hence must be countable.
]

#problem(num: "1.7*")[
  Show that $S = {union_(n in K) (n, n+1] : K subset.eq ZZ} union {emptyset}$ is a $sigma$-algebra on $RR$.
]
#solution[
  For $S subset ZZ$, let $ U_K := union.big_(n in S) (n, n + 1]. $   We have $emptyset in S$ and $ RR = union.big_(n in ZZ) (n, n + 1] in S. $ Now suppose $K subset ZZ$ where $K != emptyset$. Consider $ZZ inter K^c$ and the set associated with it in $S$, $ U_K inter U_(ZZ inter K^c) & = union.big_((n, m) in K times (ZZ inter K^c)) (m, m + 1] inter (n, n + 1]. $ Note that $(n, n + 1] inter (m, m + 1] != emptyset <=> n = m$, but $K inter (ZZ times K^c) = emptyset$ which means that $ U_(K) inter U_(ZZ inter K^c) = emptyset. $ For all $r in RR$, let $k = floor(r)$. If $k in ZZ$, $r in K union (ZZ inter K^c)$. Cases:
  1. $k in K$ and $k - 1 in K$: Thus $r in (k, k + 1] union (k - 1, k] subset U_K$.
  2. $k in K$ and $k - 1 in ZZ inter K^c$: Thus $r in (k, k + 1] subset U_K$ or $r in (k - 1, k] subset.eq U_(ZZ inter K^c)$. Thus $r in U_K inter U_(ZZ inter K^c)$

  The other two cases are symmetric to the first two. Hence $r in U_k union U_(ZZ inter K^c).$ Hence $U_K^c = U_(ZZ inter K^c) in S$. Thus $S$ is closed under complements. Note for any $U in S$, $exists K subset.eq Z$ such that $U = U_K$, by definition. Let ${K_i}_(i =1)^(oo)$ where $K_i subset.eq ZZ$. Let $ K = union.big_(i = 1)^(oo) K_i subset.eq Z $ Note the following, $ union.big_(i = 1)^(oo ) U_(K_i) & = union.big_(i = 1)^(oo ) union.big_(n in K_i) (n, n + 1] \
                                  & = union.big_(n in ZZ \ exists i in NN, n in K_i) (n, n + 1] \
                                  & = union.big_(n in K) (n, n + 1] = U_(K) in S. $ Thus $S$ is closed under countable union, hence S is a $sigma$-algebra.


]

For the sake of brevity, let $cT(X)$ denote the topology of a topological space $X$.

#problem(num: "1.8*")[
  Prove that $sigma(C_1) = sigma(C_2) = sigma(C_3) = cB$, where $cB$ is the Borel $sigma$-algebra on $RR$. Here,
  $ C_1 = {(r, s] : r, s in QQ}, quad C_2 = {(r, n] : r in QQ, n in ZZ}, quad C_3 = {[r, +oo) : r in QQ}. $
]
#solution[
  To show $sigma(C_i) supset cB$, we will show for all $U in cT(RR)$, $U in sigma (C_i)$ and since $cB$ is the smallest $sigma$-algebra containing $cT(RR)$. Hence if $cT(RR) subset.eq sigma(C_i) => cB subset.eq sigma(C_i)$. Moreover it suffices to show that $(a, b) in sigma(C_i)$ for any $a, b in RR$ ($a < b$) because all open sets are countable unions of open intervals (metric space plus separability).Fix a $a, b in RR$ where $a < b$. Let $(r_n), (s_n)$ be sequences in $QQ$ such that $r_n$ is monotone nonincreasing where $r_n -> a$, and $s_n$ monotone nondecreasing such that $s_n -> b$ and $s_n != b$. Let $A_n := (r_n, s_n]$ and note that $A_(n) subset.eq A_(n + 1) subset.eq (a, b)$. Thus $ A = union.big_(n = 1)^(oo) (r_n, s_n] subset.eq (a, b). $ We need to show the opposite containment is true as well. Take $x in (a, b)$. There exists a $N in NN$ such that $forall n <= N$ we have that $ a <= r_n < x. $ Similarly, $exists M in NN$ such that for all $m in M$ we have that $ x < s_m < b. $ Take $K = max(N, M)$ and thus $r_K < x < s_K => x in (r_k, s_k)$ and $x in A$. Thus $ (a, b) = A in sigma(C_1). $ Thus $ cB subset.eq sigma(C_1). $ Showing, $C_1 subset.eq cB => sigma(C_1) subset.eq cB$. Fix a arbitrary $r, s in QQ$ where $r < s$. Let $(b_n)$ be a monotone nonincreasing sequence of real numbers such that $b_n -> s$ and $b_n != s$. Let $A_n := (r, b_n)$. We will show that $ inter.big_(n in NN)(r, b_n) = (r, s]. $ Note the following, $(r, s] subset.eq (r, b_n)$. Thus the nontrivial direction is showing that $ A = inter.big_(n in NN) (r, b_n) subset.eq (r, s]. $ It suffices to show that $(s, oo) inter A = emptyset$. Let $x in (s, oo)$. By assumption, there exists a $N in NN$ such that $forall n >= N$ we have that $ s < b_n < x. $ Thus $x in.not (r, b_n) => x in.not A.$ Thus $A inter (s, oo) = emptyset$. Thus $(r, s] = A in cB$. Hence $cB = sigma(C_1)$. Note some trivial directions, $C_2 subset.eq C_1 => sigma(C_2) subset.eq sigma(C_1)$.

  1. $sigma(C_2) = sigma(C_1)$: To prove this we need to show that $sigma (C_1) subset.eq sigma(C_2)$, which implied by the fact that $C_1 subset.eq sigma(C_2)$. For $q in QQ$, $ (q, oo) = union.big_(n in NN, n > q) (q, n] in sigma(C_2), $ a countable union of sets in $C_2$. Now fix $r, s in QQ$ with $r < s$. Then $ (r, s] = (r, oo) inter (s, oo)^c in sigma(C_2), $ since $sigma(C_2)$ is closed under complements and finite intersections.

    Thus $C_1 subset.eq sigma(C_2) => sigma(C_1) subset.eq sigma(C_2) => sigma(C_1) = sigma(C_2)$.
  2. $cB = sigma(C_3)$: To do this we will show that $C_3 subset.eq cB$ and $cT(RR) subset.eq sigma(C_3)$. Let $(a_n)_(n = 0)^(oo)$ be a sequence of real numbers such that $a_n -> r$ and $a_n$ monotone increasing where $a_n != r$. Let $A_n = (a_n, oo)$, and note $[r, oo)$. Consider $ A = inter.big_(n in NN) A_n supset.eq [r, oo). $ It suffices to show that, $ A inter (-oo, r) = emptyset. $ For all $x in (-oo, r)$, $exists N in NN$ such that $ x < a_n < r. $ Thus $x in.not A_n => x in.not A$. Hence $[r, oo) = A in cB$. Thus $C_3 subset.eq cB => sigma(C_3) subset.eq cB$.

    For the reverse, it suffices to show $C_1 subset.eq sigma(C_3)$, since then $cB = sigma(C_1) subset.eq sigma(C_3)$. For $q in QQ$, $ (q, oo) = union.big_(n in NN) [q + 1/n, oo) in sigma(C_3), $ since each $q + 1/n in QQ$ and $sigma(C_3)$ is closed under countable unions. Now fix $r, s in QQ$ with $r < s$. Then $ (r, s] = (r, oo) inter (s, oo)^c in sigma(C_3), $ as $sigma(C_3)$ is closed under complements and finite intersections. Hence $C_1 subset.eq sigma(C_3)$, so $cB subset.eq sigma(C_3)$, and therefore $sigma(C_3) = cB$.

  Combining 1 and 2, $sigma(C_1) = sigma(C_2) = sigma(C_3) = cB$. $qed$
]


#problem(num: "1.9*")[
  Prove that if $B subset.eq RR^d$ is a Borel set, $t in RR$ and $c in RR^d$ then $t B = {t x : x in B}$ and $c + B = {c + x : x in B}$ are Borel sets, where $cB$ is the Borel $sigma$-algebra on $RR$.
]
#solution[
  For a function $f: X -> Y$. Let $f_*: 2^2^X -> 2^2^Y$ where $ f_*(S) := {f(A) : A subset.eq S}. $
  Fix a arbitrary $(c, t) in RR times RR^d$. $f_(c, t)(x) := t x + c$ is a continuous function on $RR^d$. We have two cases, $t = 0$ and $t != 0$.
  1. $t = 0$: Then $f_(c, 0) = c$, meaning $f_(c, 0) (X) = {c}$ for any $X subset.eq RR^d$ (not necessarily Borel). $ {c} = inter.big_(n in NN) B(c, 1/n) => {c} in cB(RR^d). $
  2. $t != 0$: $f_(c, t)$ is a homemorphism, with its continuous inverse: $g_(c, t) (x) = 1/t (x - c)$. This implies $(f_(c, t) )_*(cT(RR)) subset.eq cT(RR) => (f_(c, t) )_*(cB(RR^d)) subset.eq cB(RR^d)$.

  Thus $(f_(c, t) )_*(cB(RR^d)) subset.eq cB(RR^d)$ for any choice of $t in RR$. Thus if $B subset.eq cB(RR^d)$, then $f_(c, 1)(B) = c + B in cB(RR^d)$ and $f_(0, t) (B) = t B in cB(RR^d)$.
]

#problem(num: "1.10")[
  Let $(X, mu)$ be an outer measure space and $(A_n)_n$ be a sequence of $mu$-measurable subsets of $X$. Show that if $sum_(n=1)^oo mu[A_n] < oo$ then $mu[A] = 0$ if we set
  $ A = inter.big_(m=1)^oo union.big_(n=m)^oo A_n. $
]
#solution[
  Let $ B_m = union.big_(n = m)^(oo) A_m. $ By monotonicity, $mu[A] <= mu[B_m]$ for all $m in NN$. Note that $B_(m) supset.eq B_(m + 1)$. By subadditivity, $ mu [B_1] <= sum_(k = 1)^(oo) mu [A_k] = L < oo. $ By Cauchy Criterion we know that for all $p in NN$, there $exists N_p in NN$ such that if $N_p <= n <= m$ we have that $ abs(sum_(k = 1)^(n) mu[A_k] - sum_(k = 1)^(m) mu[A_m]) < 2^(-p) => sum_(k = n + 1)^(m) mu[A_k] < 2^(-p). $ Take $lim_(m -> oo)$ on both sides, and thus we see that for all $n >= N_p$ $ sum_(k = n + 1)^(oo) mu [A_k] <= 2^(-p). $ Note that $ mu [B_(n + 1)] <= sum_(k = n + 1)^(m) mu[A_k] <= 2^(-p) $ for all $n >= N_p$. $forall epsilon > 0$, there exists a $P in NN$ such that $2^(-P) < epsilon.$ For all $n >= N_P + 1$, we have that $ mu [B_n] <= 2^(-P) < epsilon. $ Hence $lim_(n -> oo) mu [B_n] = 0$. By Problem 1c, we can conclude that $ mu [A] & = lim_(n -> oo) mu[B_n] = 0 $


]
