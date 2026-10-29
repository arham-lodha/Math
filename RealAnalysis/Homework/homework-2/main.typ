#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Homework 2",
  name: "Arham Lodha",
  due: "November 2, 2026",
)

#let Pow = $#math.op("Pow")$

// Only exercises marked (*) will be collected; two or three will be graded
// from each set. All exercises are suggested practice.

#problem(num: "2.1")[
  Let $B subset.eq RR^d$.
  #part[Show that if $mu$ is a Borel measure on $RR^d$ then $mu_(|B)$ is also a Borel measure on $RR^d$.]
  #part[Show that if $mu$ is a Borel regular measure on $RR^d$, if $B$ is $mu$-measurable and of finite measure then $nu := mu_(|B)$ is a Radon measure on $RR^d$.]
]
#solution[]

#problem(num: "2.2*")[
  Suppose $mu$ is an outer measure on $X$, $E_1, dots.c, E_n$ are disjoint subsets of $X$ and $c_1, dots.c, c_n$ are distinct nonzero real numbers. Prove that $f = c_1 chi_(E_1) + dots.c + c_n chi_(E_n)$ is a $mu$-measurable function if and only if $E_1, dots.c, E_n$ are $mu$-measurable sets.
]
#solution[
  $=>$: Suppose $f$ is measurable. Thus for any open set $U$, we know that $f^(-1)(U)$ is $mu$-measurable. Let $ delta = min({abs(c_i) : 1 <= i <= n} union {abs(c_i - c_j) : 1 <= i, j <= n, i != j}). $ This is a minimum of a finite nonempty set of positive numbers (the $c_i$ are nonzero and distinct), so $delta > 0$. Thus $c_j in.not B(c_i, delta)$ for $j != i$ and $0 in.not B(c_i, delta)$. Note that $f^(-1)(B(c_i, delta)) = f^(-1)({c_i}) = E_i$, and thus $E_i$ is $mu$-measurable. Thus each $E_i$ is $mu-$measurable.

  $<==:$ Suppose that $E_1, ..., E_n$ are $mu-$measurable.  We want to show $f$ is $mu-$measurable, thus we want to show for any open set $U subset.eq RR$, $f^(-1)(U)$ is measurable. Let $U subset.eq R$ be a subset, let $A (U) := U inter {0} union {c_(k) : 1 <= k <= n, c_k in U}$. Note that for any subset $K subset.eq RR$, if $A(K) = emptyset$, then $f^(-1)(K) = emptyset$. Thus for a open set $U$ where $A(U) = emptyset => f^(-1)(U) = emptyset$ which is $mu -$measurable. Note the following $ f^(-1)(U) = f^(-1)(A(U) union (U - A(U))) & = f^(-1)(A(U)) union f^(-1)(U - A(U)) \
  & = f^(-1)(A(U)) \
  & = cases(union.big_(k in A(U)) E_k "if" 0 in.not A(U), (union.big_(k = 1)^n E_k)^c union (union.big_(k in A(U) - {0}) E_k ) "if" 0 in A(U)) $

  If $0 in A(U)$, $union.big_(k = 1)^n E_k$ $mu -$measurable (finite union) and its complement is $mu$ measurable. Furthermore, $union_(k in A(U) - {0}) E_k$ is a finite union and is $mu-$measurable. Finally the union of both sets is $mu-$measurable. If $0 in.not A(U)$, then $f^(-1)(U)$ is a finite union of measurable sets and is thus measurable.
]

#problem(num: "2.3*")[
  Suppose $X subset.eq RR$ is a Borel set and $f: X -> RR$ is a function such that ${x in X : f "is not continuous at" x}$ is a countable set. Prove that $f$ is a Borel measurable function.
]
#solution[
  We will first show that any countable subset of $X subset.eq RR$ is Borel in $X$. Let $S = {s_n : n in NN} subset.eq X$ be a countable subset of $X$. $ S = union.big_(n in NN) {s_n} $ and since singletons are closed in $RR$, hence measurable, and $S$ is a countable union of singletons, $S$ is a Borel set in $RR$. Since $S = S inter X subset.eq X$, it is also a Borel set of $X$. Let $D = {x in X: f "is not continuous at" x}$. By the prior argument, for any subset $S subset.eq D$, $S$ is Borel measurable in $X$ (implying that $D$ itself is a Borel set). Note the following $ f^(-1)(U) & = (f|_(D^c))^(-1)(U) union (f |_D)^(-1)(U) quad U subset.eq RR . $ Note by assumption, $ f|_(D^c): D^c -> RR $ is continuous. It suffices to check that for any open set $U$, $f^(-1)(U)$ is a Borel set. Note that since $f|_(D^c)$ is continuous, $(f|_(D^c))^(-1)(U)$ is a relatively open subset of $D^c$, thus there exists $V subset.eq X$ open (in subspace topology) such that $ (f|_(D^c) )^(-1)(U) = V inter D^c. $ $V$ is a Borel set of $X$. Since $D$ is a Borel set, $D^c$ is also a Borel set (closed under complements). Thus $(f|_(D^c))^(-1)(U)$ is a Borel set. Furthermore, $ (f|_D)^(-1) (U) subset.eq D => (f|_D)^(-1)(U) "is a Borel Set". $ Thus $f^(-1)(U)$ is a Borel Set since the union of two Borel sets is a Borel set.
]

#problem(num: "2.4*")[
  Suppose that $f: RR -> RR$ is differentiable at every element of $RR$. Prove that $f'$ is a Borel measurable function from $RR$ to $RR$.
]
#solution[

]

#problem(num: "2.5*")[
  Let $h$ be a continuous and strictly increasing real valued function on $RR$. Prove that if $B subset.eq RR$, then $h(B)$ is a Borel set if and only if $B$ is a Borel set.
]
#solution[
  Note the strict increasing property, enforces that $f$ is injective. We will show that $f$ is a open mapping. Let $U$ be a open set in $RR$. Let $y in f(U)$. By injectivity, there exists a unique $x in U$ such that $f(x) = y$. By openness of $U$, there exists a $delta > 0$ such that $(x - delta, x + delta) subset.eq U$. By strict monotonicity, $f(x - delta) < y < f(x + delta)$, thus $y in (f(x - delta, f(x - delta)) = f((x -delta, x + delta)) subset.eq f(U)$. Thus $f(U)$ is open. Thus $f$ is a open map.

  Suppose $B subset.eq RR$, suppose $h(B)$ is a Borel set. It its a countable intersection or union of open sets. Since inverse image, respects unions and intersections, by continuity of $h$, $B$ is also borel. Suppose $B$ is Borel, it is also a countable union or intersection of open sets. Since taking the image also respects unions and intersections, and since $h$ is a open map, $h(B)$ is also the countable intersection or union of open sets, and thus $h(B)$ is Borel.
]

#problem(num: "2.6*")[
  Suppose $f: B -> RR$ is a Borel measurable function. Define $g: RR -> RR$ to be the function which coincides with $f$ on $B$ and is identically equal to $0$ on $RR without B$. Prove that $g$ is a Borel measurable function.
]
#solution[
  To prove that $g$ is Borel, it suffices to show that $g^(-1)((r, oo))$ is Borel $r in QQ$ since ${(r, oo) : r in QQ}$ generate $cB(RR)$. We can split it into two cases $r >= 0$ and $r < 0$.
  1. $r >= 0$: Since $g(B^c) = {0}$, $B^c inter g^(-1)((r, oo)) => g^(-1)((r, oo)) = f^(-1)((r, oo))$, which is Borel measurable set inside $B$. Thus there exists a $U in B(RR)$ such that $f^(-1)((r, oo)) = U inter B$, and thus $g^(-1)((r, oo)) = f^(-1)((r, oo))$ is Borel measurable with respect to $RR$.
  2. $r < 0$: $g^(-1)((r, oo)) = B^c union f^(-1)((r, oo))$. $B^c$ is borel measurable because $B$ is borel measurable and $cB(RR)$ is closed under complements. $f^(-1)((r, oo))$ is Borel measurable because of a argument identical to the argument in case 1.

  Thus $g^(-1) ((r, oo ))$ is always measurable for any choice of $r in QQ$. Hence $g$ is measurable.
]

#problem(num: "2.7*")[
  Say whether or not every open subset of $RR^d$ is a countable union of closed subsets of $RR^d$. Justify your answer (your argument should be short, say, half a page).
]
#solution[
  We will note the following fact. All open sets $U subset.eq RR^d$ can be expressed as a countable union of balls of rational radius with centers in $QQ^d$. (PROVE THIS). Thus if we prove that $B(x, r)$ for $x in QQ^d$ and $r in QQ inter (0, oo)$ can be expressed as a countable union of closed subsets of $RR^d$ (we will just use closed balls). Let $r_n = r (1 - 1/(n + 1))$ for $n >= 1$. Notice that $r_n -> r$ but $0 < r_n < r$. We will show that $ B(x, r) = union.big_(n in NN) B(x, r_n). $ For the obvious direction, note that $cl(B)(x, r_n) subset.eq B(x, r)$ for all $n >= 1$. Thus their union must also be contained in $B(x, r)$. Thus $ union.big_(n in NN) cl(B)(x, r_n) subset.eq B(x, r). $ $forall y in B(x, r)$, by convergence and monotonicity of $r_n -> r$, we have that there exists a $n in NN$ such that $ r - r_n <= r - abs(y - x) => abs(y - x) <= r_n. $ Thus $y in cl(B)(x, r_n)$. Thus we have $ B(x, r) subset.eq union.big_(n in NN) cl(B)(x, r_n) => B(x, r) = union.big_(n in NN) cl(B)(x, r_n) $
]

#problem(num: "2.8")[
  Let $mu$ be an outer measure on a nonempty set $X$. Let $f, g: X -> [-oo, +oo]$ be two $mu$-summable functions. Assume that $A, B subset.eq X$ are two $mu$-measurable sets. Recall
  $ integral_A f dif mu = integral_X chi_A f dif mu. $
  #part[Prove that $f$ is $mu_(|A)$-summable and $integral_X f dif (mu_(|A)) = integral_X f dot chi_A dif mu$.]
  #part[Prove that $integral_X (f + g) dif mu = integral_X f dif mu + integral_X g dif mu$, and $integral_X c f dif mu = c integral_X f dif mu$, for all $c in RR$.]
  #part[Prove that if $f <= g$ then $integral_X f dif mu <= integral_X g dif mu$.]
]
#solution[
  1. Let $g: X -> [0, oo]$ be a $mu$-measurable simple function, i.e. with countable image $Y subset.eq [0, oo]$. By definition,
  $ integral_X g dif (mu_(|A)) & = sum_(y in Y) y thin mu_(|A)(g^(-1){y}) \
                              & = sum_(y in Y) y thin mu(A inter g^(-1){y}). $
  The function $g chi_A$ is also simple, with image contained in $Y union {0}$, and $(g chi_A)^(-1){y} = A inter g^(-1){y}$ for every $y != 0$. The $y = 0$ term contributes $0$ (with the convention $0 dot oo = 0$), so
  $ integral_X g chi_A dif mu = sum_(y in Y without {0}) y thin mu(A inter g^(-1){y}) = sum_(y in Y) y thin mu(A inter g^(-1){y}). $
  Hence $integral_X g dif (mu_(|A)) = integral_X g chi_A dif mu$.

  Let $f: X -> [0, oo]$ be a $mu$-measurable function. There exists $(f_k)_(k = 1)^(oo)$ a sequence of simple functions $f_k$ monotonically increasing to $f$. $ integral_X f dif (mu_(|A)) & = integral_X lim_(k -> oo) f_k dif (mu_(|A)) \
                                   & = lim_(k -> oo) integral_X f_k dif (mu_(|A)) quad ("Monotone Convergence Theorem") \
                                   & = lim_(k -> oo) integral_X chi_A f_k dif mu \
                                   & = integral_X chi_A f dif mu quad ("Monotone Convergence Theorem"). $

  Let $f: X -> [-oo, oo]$ a $mu$-measurable function. Let $f^+ = max(0, f)$ and $f^- = max(0, -f)$. Note that $f^+, f^- >= 0$ and $f = f^+ - f^-$.

  $ integral_X f dif (mu_(|A)) & = integral_X (f^(+) - f^(-)) dif (mu_(|A)) $
]

#problem(num: "2.9")[
  Let $mu$ be an outer measure on a nonempty set $X$, let ${A_k}_(k=1)^oo$ be a collection of pairwise disjoint $mu$-measurable subsets of $X$, and let $f: X -> RR$ be a summable function. Prove that
  $ integral_A f dif mu = sum_(k=1)^oo integral_(A_k) f dif mu, $
  where $A = union_(k=1)^oo A_k$.
]
#solution[]

#problem(num: "2.10*")[
  Let $(Omega, mu)$ be an outer measure space and suppose $f_n, g_n, f, g in L^1(mu)$. Suppose
  $
    abs(f_n) <= g_n, quad f_n -> f "a.e.", quad g_n -> g "a.e.", quad lim_(n -> oo) integral_Omega g_n (x) mu(dif x) = integral_Omega g(x) mu(dif x).
  $
  Show that $lim_(n -> oo) integral_Omega f_n (x) mu(dif x) = integral_Omega f(x) mu(dif x)$.
]
#solution[]
