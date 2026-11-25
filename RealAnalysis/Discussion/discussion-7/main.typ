#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Discussion 7",
  name: "Arham Lodha",
  due: "",
)

== $L^p$

#problem(num: "0.1")[
  _(Fubini and $L^p$.)_ Prove the $L^p$ layer-cake formula: for $0 < p < oo$,
  $ integral_X |f(x)|^p dif m(x) = p integral_0^oo t^(p - 1) m({x in X : |f(x)| > t}) dif t. $
]
#proof[
  $
    integral_X abs(f(x))^(p) dif mu &= integral_X integral_0^oo 1_({t <= abs(f(x))^p}) dif t dif mu \
    &= integral_0^oo integral_X 1_({t <= abs(f(x))^p}) dif mu dif t quad ("Fubini's Theorem") \ &= integral_0^oo mu ({t^(1/p) <= abs(f(x))}) dif t
  $

  Let $u = t^(1/p)$. Then  $dif u = 1/p t^(1/p - 1) dif t => dif t = p t^((p - 1)/p) dif u = p u^(p - 1) dif u$. Then $ integral_X abs(f(x))^p dif mu & = p integral_0^oo u^(p - 1) mu({u <= abs(f(x))}) dif t $


]

#problem(num: "0.2")[
  Are continuous functions dense in $L^oo$?
]
#proof[
  Let $(f_n)_(n in NN)$ is a sequence of continous functions convergent to $f$ in $L^oo$, ie $forall epsilon > 0$ there exists a $N in NN$ where $n >= N$ implies that $ norm(f_n - f) < epsilon. $ Thus $f_n$ is Uniformly convergent to $f$ then $f$ must be continuous. However we have $1_((0, oo))$ a function which is discontinous in $L^oo$.
]

#problem(num: "0.3")[
  Prove that, for $0 < p < oo$, $f in L^p$ if and only if
  $ sum_(n in ZZ) 2^(n p) m({x : |f(x)| > 2^n}) < oo. $
]
#proof[
  Note the following that $E_k = {x: 2^k <= abs(f(x)) <= 2^(k + 1)}$ we have that $ 2^k 1_E_k <= abs(f(x)) 1_(E_k) <= 2^(k + 1) 1_E_k. $ Thus $ sum_(k in ZZ) 2^k 1_(E_k) <= abs(f(x)) sum_(k in ZZ) 1_(E_k) = abs(f(x)) 1_({f(x) != 0}) <= sum_(k in ZZ) 2^(k + 1) 1_(E_k). $
]

#problem(num: "0.4")[
  Let $f in inter.big_(1 <= p < oo) L^p$. Prove that $f in L^oo$.
]

#problem(num: "0.5")[
  Prove that if $f in L^p inter L^q$, where $0 < p < q <= oo$, then $f in L^r$ for every $r in (p, q)$.
]
#proof[
  Let
  $ f(theta) = (1 - theta) / (p) + (theta) / (q) $
  Thus let $ g(theta) = 1/f(theta) = (p q) / ((1 - theta)q + theta p). $
  $g$ maps $[0, 1] -> [p, q]$.

  Let $r = g(theta)$. Then
  $
    norm(f)_(r) = norm(abs(f)^(1 -theta) abs(f)^(theta)) & <=^"Holder" norm(abs(f)^(1 - theta))_(p/(1 - theta)) norm(abs(f)^(theta))_(q/theta) \ &<= norm(f)_p^(1 - theta) norm(f)_q^(theta) < oo
  $
]

#problem(num: "0.6")[
  Suppose that
  $ integral_RR |x| |f(x)| dif x < oo. $
  Prove that if $f in L^p (RR)$, where $1 <= p <= oo$, then $f in L^q (RR)$ for every $1 <= q <= p$.
]
#proof[
  $
    integral_RR abs(f(x)) dif x &= integral_(-1)^1 abs(f(x)) dif x + integral_(-oo)^(-1) abs(f(x)) dif x + integral_(1)^(oo) abs(f(x)) dif x \ &<= integral_(-1)^1 abs(f(x)) dif x + integral_RR abs(x) abs(f(x)) dif x
  $

  Thus we only need to examine, the behavior of $f$ in $[-1, 1]$.

  $
    norm(f)_(L^1([-1, 1])) <= norm(f)_(L^p ([-1, 1])) norm(1_([-1, 1]))_(L^(p prime)([-1, 1])) <= 2^(1 - 1/p) norm(f)_p
  $
]

#problem(num: "0.7")[
  #part[Give an example of a measure space on which $q < p$ implies $L^q supset.eq L^p$.]
  #part[Give an example of a measure space on which $q > p$ implies $L^q supset.eq L^p$.]
]
#solution[
  1. *$q < p$.* Take any $(X, mu)$ with $mu(X) < oo$ (e.g. $[0,1]$ with Lebesgue measure).
    Let $f in L^p$ and set $r = (p q)/(p - q)$, so that $1/q = 1/p + 1/r$. By Hölder,
    $
      norm(f)_q = norm(f dot 1_X)_q <= norm(f)_p norm(1_X)_r
      = norm(f)_p mu(X)^((p - q)/(p q)) = norm(f)_p mu(X)^(1/q - 1/p) < oo.
    $
    Hence $L^p subset.eq L^q$.

  2. *$q > p$.* Take $X = NN$ with counting measure, or more generally any $(X, mu)$ for
    which there is $delta > 0$ such that $mu(A) >= delta$ whenever $mu(A) > 0$.
    Let $f in L^p$, so $norm(f)_p^p = integral_X abs(f)^p dif mu < oo$.

    _Claim: $f$ is bounded a.e._ Suppose not. Then for every $N in NN$ we have
    $mu({abs(f) >= N}) > 0$, hence $mu({abs(f) >= N}) >= delta$, and so
    $ norm(f)_p^p >= integral_{{abs(f) >= N}} abs(f)^p dif mu >= N^p mu({abs(f) >= N}) >= N^p delta. $
    Letting $N -> oo$ gives $norm(f)_p^p = oo$, a contradiction. So there is $N$ with
    $mu({abs(f) >= N}) = 0$, i.e. $abs(f) < N$ a.e.

    Now, since $q > p$,
    $
      integral_X abs(f)^q dif mu = integral_X abs(f)^(q - p) abs(f)^p dif mu
      <= N^(q - p) integral_X abs(f)^p dif mu = N^(q - p) norm(f)_p^p < oo.
    $
    Hence $f in L^q$, so $L^p subset.eq L^q$. (For counting measure this is the
    familiar $ell^p subset.eq ell^q$ for $p < q$.)
]
#problem(num: "0.8")[
  _(Uniform integrability and $L^p$.)_ Let $(X, m)$ be a finite measure space. Suppose that
  $ sup_n norm(f_n)_(L^p (X)) < oo $
  for some $p > 1$, and that $f_n -> f$ pointwise almost everywhere. Show that $f_n -> f$ in $L^1 (X)$.
]
#proof[
  By Ergoroff's, $forall epsilon > 0$ there exists a $E subset.eq X$ where $mu(X - E) < epsilon$ and $f_n|_E -> f|E$ uniformly. $f_n -> f$ in measure. Showing $abs(f_n - f) -> 0$ is the same as showing ${f_n}_(n = 1)^oo$ is uniformly integrable. Let $A subset.eq X$ note that.

  $
    integral_(A) abs(f_n) dif x = norm(1_A f_n)_1 & <= norm(1_A)_(p/(p - 1)) norm(f_n)_p \
                                                  & = mu(A)^((p - 1) / (p)) norm(f_n)_p \
                                                  & <= mu (A)^((p - 1) / (p)) sup_(n) norm(f_n)
  $

  For all $epsilon > 0$, let $delta = (epsilon/(sup norm(f_n)_p))^((p) / (p - 1))$. Thus if $ mu (A) < delta => integral_A abs(f_n) dif mu < epsilon $

  $ integral_X abs(f_n) dif x <= mu(X)^((p - 1) / (p)) sup_(n) norm(f_n)_p $
  Thus ${f_n}$ is uniformly integrable hence converge to $f$ in $L^1$.
]

#problem(num: "0.9")[
  Show that
  $ cS = {f in L^1 (RR) inter L^2 (RR) : integral_RR f(x) dif x = 0} $
  is dense in $L^2 (RR)$. Show that the set of functions with zero mean is not dense in $L^2 ([0, 1])$.
]
#proof[
  For this problem, we will a reduction. $C_c (RR) subset.eq L^2 (RR)$ is dense for $p >= 1$. Thus if we show any continuous function with compact support can be sufficiently approximated with functions in the set $cS$, then we can approximate all functions in $L^2 (RR)$ without worries. Let us do a initial calculation, consider $ norm(H 1_(A))_p = H mu (A)^(1/p). $ Let $f in C_c (RR)$ be a arbitrary function, there exists a $R > 0$ where $abs(x) >= R => f(x) = 0$. Fix $epsilon > 0$. Let $x_0 = R + 1$. Let $W > sqrt(abs(integral_RR f dif x)/ epsilon)$. Let $A = [x_0, x_0 + A]$. Let $H = - W^(-1) integral_RR f dif x$. Then consider $g = f + H 1_(A)$. Note $supp(f) inter A = emptyset$. $ norm(g)_1 = integral abs(f) dif x + abs(H)^2 W < oo quad norm(g)_2 = (integral abs(f)^2 dif x + abs(H)^2 W)^(1/2) < oo. $

  Finally $ integral_RR abs(f - g)^2 dif x & = integral_(A) abs(g)^2 dif x \
                                 & = abs(W^(-2) integral_(-R)^R f dif x) \
                                 & < epsilon. $ Thus $norm(f - g)_2 -> 0$.
]

#problem(num: "0.10")[
  Let $f in L^2_"loc" (RR^n)$ and $g in L^3_"loc" (RR^n)$. Assume that, for every real $r >= 1$,
  $ integral_({x : r <= |x| <= 2r}) |f(x)|^2 dif x <= r^a, quad integral_({x : r <= |x| <= 2r}) |g(x)|^3 dif x <= r^b, $
  where $a, b in RR$ satisfy
  $ 3a + 2b + n < 0. $
  Show that $f g in L^1 (RR^n)$.
]
#proof[
  Let $X_k := {x in RR^n : 2^k <= abs(x) <= 2^(k + 1)}$
  $
    integral_RR abs(f g) dif mu & = integral_(B) abs(f g) dif mu + sum_(k >= 1) integral_(X_k) abs(f(x) g(x)) dif mu \
                                & = integral_(B) abs(f g) dif mu + sum_(k >=1) norm(f g)_(L^1(X_k)) \
                                & = integral_(B) abs(f g) dif mu + sum_(k >=1 ) norm(f)_2 norm(g)_2
  $


  $
    norm(g)_2 <= norm(1 g)_2 =
  $
]

#problem(num: "0.11")[
  Suppose that $f in L^1 ([0, 1])$ satisfies
  $ integral_E |f(x)| dif x <= sqrt(m(E)) quad (*) $
  for every Borel set $E subset.eq [0, 1]$.
  #part[Show that $f in L^p ([0, 1])$ for every $1 < p < 2$.]
  #part[Give an example of a function satisfying $(*)$ that does not belong to $L^2 ([0, 1])$.]
]

#problem(num: "0.12")[
  _(The tensor power trick.)_ Let $1 < p < oo$ and $q = p slash (p - 1)$. Suppose that there is a constant $C > 0$ such that, on every probability space $(X, mu)$,
  $ integral_X |f g| dif mu <= C norm(f)_(L^p (X)) norm(g)_(L^q (X)) $
  for all $f in L^p (X)$ and $g in L^q (X)$.

  Prove that the same inequality holds with $C = 1$.

  _Hint: use Fubini's Theorem._
]



