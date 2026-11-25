#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Homework 3",
  name: "Arham Lodha",
  due: "November 25, 2026",
)

// Only exercises marked (*) will be collected; two or three will be graded
// from each set. All exercises are suggested practice.

#problem(num: "3.1*")[
  Let $(Omega, mu)$ be an outer measure space, suppose $u_n, u in L^1(mu)$ and $u_n -> u$ a.e. Show the following assertions are equivalent:
  #part[$lim_(n -> oo) integral_Omega abs(u_n (x) - u(x)) mu(dif x) = 0$.]
  #part[$lim_(n -> oo) integral_Omega abs(u_n (x)) mu(dif x) = integral_Omega abs(u(x)) mu(dif x)$.]
]
#solution[
  1. *$a=>b$*: Suppose $ lim_(n -> oo) integral_(Omega) abs(u_n (x) - u(x)) dif mu = 0. $ Let $epsilon > 0$ be arbitrary. There exists a $N in NN$ such that $forall n >= N$ we have that $ integral_(Omega) abs(u_n (x) - u(x)) dif mu < epsilon. $ Thus, $ abs(integral_(Omega) abs(u_n (x)) dif mu - integral_(Omega) abs(u (x)) dif mu) &= abs(integral_(Omega) (abs(u_n (x)) - abs(u(x))) dif mu) \ &<= integral_(Omega) abs(abs(u_n (x)) - abs(u (x))) dif mu \ &<= integral_(Omega) abs(u_n (x) - u(x)) dif mu quad ("Reverse Triangle Inequality") \
    &< epsilon. $ Thus $ lim_(n -> oo) integral_(Omega) abs(u_n (x)) dif mu = integral_(Omega) abs(u(x)) dif mu $

  2. *$b => a$*: Suppose that $ lim_(n -> oo) integral_(Omega) abs(u_n (x)) dif mu = integral_(Omega) abs(u(x)) dif mu. $ Thus $ integral_(Omega) 2 abs(u(x)) dif x &= integral_(Omega) lim_(n -> oo) (abs(u_n (x)) + abs(u(x))) dif mu \ &= integral_(Omega ) liminf_(n -> oo ) (abs(u_n (x)) + abs(u(x)) - abs(u_n (x) - u(x))) dif mu \ &<= liminf_(n -> oo)(integral_(Omega)(abs(u_n (x)) + abs(u(x)) - abs(u_n (x) - u(x)) ) dif mu) quad ("Fatou's Lemma") \
    &<= integral_(Omega) 2 abs(u(x)) dif x - limsup_(n -> oo) integral_(Omega) abs(u_n (x) - u(x)) dif mu $

  Thus $ limsup_(n -> oo) integral_(Omega) abs(u_n (x) - u(x)) dif mu = 0 => lim_(n -> oo ) integral_(Omega ) abs(u_n (x) - u(x)) dif mu = 0 $

]

#problem(num: "3.2*")[
  Let $f: [0,1] -> [0, +oo)$ be a $cL^1$-measurable function such that $integral_0^1 f(x) dif x < +oo$. Suppose that for all $n = 1, 2, dots.c$, $integral_0^1 f^n dif cL^1 = integral_0^1 f(x) dif cL^1$. Show that $f$ must be equal almost everywhere to the characteristic function of a set $E subset.eq [0,1]$.
]
#solution[
  $forall epsilon > 0$, since $f(x) >= 0$ we have that $ integral_0^1 f(x) dif x = integral_0^1 (f(x))^n dif x & >= integral_{f(x) >= 1 + epsilon} (f(x))^n dif x >= (1 + epsilon)^n mu({f(x) >= 1 + epsilon}). $ Thus for all $n in NN$ we have that $ (1 + epsilon)^n mu ({f(x) >= 1 + epsilon }) < integral_0^1 f(x) dif x. $ Assume the contrary that $mu({f(x) >= 1 + epsilon}) > 0$, let $ N > 1/ln(1 + epsilon) [ln((integral_0^1 f(x) dif x) / mu({f(x) >= 1 + epsilon}))]. $


  Thus $ (1 + epsilon)^N mu({f(x) >= 1 + epsilon}) & > integral_0^1 f(x) dif x $ and a contradiction occurs. Thus $mu({f(x) >= 1 + epsilon}) = 0$ for all $epsilon > 0$, meaning $mu({f(x) > 1}) = 0$. Thus we have the following: $ integral_0^1 (f(x))^n dif x &= integral_{0 < f(x) < 1} (f(x))^n dif x + integral_{f(x) = 1} (f(x))^n dif x + integral_{f(x) > 1} (f(x))^n dif x \ &= integral_0^1 bb(1)_({0 < f(x) < 1}) (f(x))^n dif x + integral_0^1 bb(1)_({f(x) = 1}) dif x. $

  Note the fact that $bb(1)_({0 < f(x) < 1}) (f(x))^n -> 0$ pointwise, furthermore note that $bb(1)_({0 < f(x) < 1}) (f(x))^n <= bb(1)_([0, 1])$. By Dominated Convergence theorem, $ integral_0^1 bb(1)_({0 < f(x) < 1}) (f(x))^n dif x ->_(n -> oo) 0 $

  Note that, $ integral_0^1 bb(1)_({0 < f(x) < 1}) f(x) dif x + integral_0^1 bb(1)_({f(x) = 1}) dif x &= integral_0^1 f(x) dif x \ & = integral_0^1 (f(x))^n dif x \ & = integral_0^1 bb(1)_({0 < f(x) < 1}) (f(x))^n dif x + integral_0^1 bb(1)_({f(x) = 1}) dif x. $ This implies that $ integral_0^1 bb(1)_({0 < f(x) < 1}) f(x) dif x &=integral_0^1 bb(1)_({0 < f(x) < 1}) (f(x))^n dif x => integral_0^1 bb(1)_({0 < f(x) < 1}) f(x) dif x = 0. $ This implies that $bb(1)_{0 < f(x) < 1} f(x) = 0$ a.e which means that $mu({0 < f(x) < 1}) = 0$. Thus $ 1 & = mu({f(x) = 0}) + mu({f(x) = 1}). $ and $f = bb(1)_({f(x) = 1})$ a.e
]

#problem(num: "3.3*")[
  Suppose $mu$ is an outer finite measure on $X$ and $f_1, f_2, dots.c$ is a sequence of $mu$-measurable functions from $X$ to $[0, +oo)$ such that $lim_(k -> +oo) f_k (x) = +oo$ for each $x in X$. Prove that for every $epsilon > 0$ there exists a $mu$-measurable set $E$ such that $mu(X without E) < epsilon$ and $f_1, f_2, dots.c$ converges uniformly to $+oo$ on $E$ (meaning for every $t > 0$ there exists $n in NN$ such that $f_k (x) > t$ for all $k >= n$ and all $x in E$).
]
#solution[
  For $k in NN$ and $N in NN$, define the following $mu-$measurable set.
  $ E(k, N) := union.big_(j = k)^(oo) (f_j)^(-1)([0, N)) $

  Note the following relations, $ E(k, N) & supset.eq E(k + 1, N) \
  E(k, N) & subset.eq E(k, N + 1) $

  $ lim_(k -> oo) mu(E(k, N)) = mu(inter.big_(k = 1)^(oo)E(k, N)). $

  Assume the contrary there exists a $x in inter.big_(k = 1)^(oo)E(k, N))$, then for each $k in NN$ there exists a $j >= k$ such that $f_k (x) < N$. This contradicts the fact that $lim_(k -> oo) f_k (x) = +oo$. Thus $inter.big_(k = 1)^(oo)E(k, n) = oo => lim_(k -> oo) mu(E(k, N)) = 0$ for every $N$.

  For a fixed $epsilon > 0$. $forall N in NN$, there exists a $k(N) in NN$ where $mu [E(k(N), N)] < 2^(-N) epsilon$. Let $ E = union.big_(N in NN) E(k(N), N) => mu [E] < epsilon . $

  Then $ E^c & = (union.big_(N in NN) E(k(N), N) )^c \
      & = inter.big_(N in NN) E(k(N), N)^c \
      & = inter.big_(N = 0)^(oo) inter.big_(j = k(N))^(oo) (f_j)^(-1)([N, oo )) \
      & = {x in X : forall N in NN, forall j >= k(N), f_j (x) >= N} \ $

  $E$ is $mu$ measurable. Furthermore, for all $R > 0$ let $N > R$ then for all $j >= k(N)$, $f_j (x) > N > R$ for $x in E^c$. Hence the sequence of functions converges uniformly on $E^c$.
]

#problem(num: "3.4*")[
  Suppose $X subset.eq RR^d$ is a compact set and $(f_n)_n subset.eq C(X)$ is a sequence of functions such that $f_n <= f_(n+1)$ for all natural numbers $n$. Assume
  $ f(x) := lim_(n -> +oo) f_n (x) < +oo quad forall x in X. $
  Show that $f$ is continuous if and only if $(f_n)_n$ converges uniformly to $f$.
]
#solution[
  $=>$ Suppose $f$ is continuous. Let $g_n (x) = f(x) - f_n (x)$. Let $epsilon > 0$ be fixed. $ U_n = inter.big_(m = n)^(oo) {g_m (x) < epsilon} $ By pointwise convergence of $f_n -> f$, $ X = union.big_(n in NN) U_n . $ By continuity of $f$ and $f_n$, $g_n$ is continuous. Note that $U_1 supset.eq U_2 supset.eq ...$. There exists a finite subcover, $n_1, ..., n_m$ where $ X = union.big_(k = 1)^(m) U_(n_k) . $ Let $N = max(n_1, ..., n_m)$, hence $X = U_N$. Hence for all $n >= N$, $ abs(f(x) - f_n (x)) = abs(g_n (x)) < epsilon $ for all $x in X$. Hence $forall n >= N$ $norm(f_n - f)_(oo) < epsilon$. Hence $f_n -> f$ uniformly.

  $<==$: Suppose $f_n -> f$ uniformly. Fix $epsilon > 0$ arbitrary. Then there exists a $N in NN$ such that $n >= N => norm(f - f_n)_(oo) < epsilon/3$. By continuity of $f_N$, there exists a $delta > 0$ where $abs(x - y) < delta => abs(f_N (x) - f_N (y)) < epsilon/3$. Hence,  $ abs(f(x) - f(y)) & <= abs(f(x) - f_N (x)) + abs(f_N (x) - f_N (y)) + abs(f_N (y) - f(y)) \
                   & < epsilon $
]

#problem(num: "3.5*")[
  Let $mu$ and $nu$ be two outer measures on $Omega$. We say that $nu$ is absolutely continuous with respect to $mu$ and we write $nu << mu$ if $nu(E) = 0$ whenever $E subset.eq Omega$ is $nu$-measurable and $mu(E) = 0$. Assume $nu[Omega] < oo$. Show that the following are equivalent:
  #part[$nu << mu$]
  #part[For every $epsilon > 0$ there exists $delta > 0$ such that $nu(E) < epsilon$ whenever $E$ is $nu$-measurable and $mu(E) < delta$.]
]
#solution[
  1. *(a) $=>$ (b)* Assume the contrary, that there exists a $epsilon > 0$ such that for all $delta > 0$ there is $nu$-measurable set $E_delta subset.eq Omega$ such that $mu(E_delta) < delta$ but $nu(E_delta) >= epsilon$. Let $F_n = E_(2^(-n)).$ Consider $ G_k = union.big_(n = k)^oo F_n => mu[G_k] <= sum_(n = k)^(oo) mu (F_n) <= sum_(n = k)^(oo) 2^(-n) = 2^(1 - k). $ By monotonicity, $mu[G_k] >= mu[F_k] >= epsilon$. Let $ G = inter.big_(n = 1)^oo G_n => mu [G] = lim_(n -> oo) mu [G_k] <= lim_(k -> oo) 2^(1 - k) = 0. $ But $G$ is $nu$ measurable but $nu(G) != 0$. Thus a contradiction occurred.

  2. *(b) => (a)*: Assume the implication is false, there exists a $E$ nu measurable where $mu (E) = 0$ but $nu(E) > 0$. Take $epsilon = nu(E) / 2$. There exists a $delta > 0$ where $mu (F) < delta$ for $F$ $nu$ measurable implies $mu (F) < nu(E)/2$. But $mu (E) = 0 < delta$ but $nu (E) > nu (E) / 2$. Thus a contradiction occurs.
]

#let monup = $arrow.tr$
#problem(num: "3.6*")[
  A collection of functions ${f_alpha}_(alpha in A) subset.eq L^1(mu)$ is called uniformly integrable if for every $epsilon > 0$ there exists $delta > 0$ such that $integral_E abs(f_alpha (x)) mu(dif x) < epsilon$ for all $alpha in A$ whenever $E$ is measurable and $mu(E) < delta$. Show that
  #part[any finite subset of $L^1(mu)$ is uniformly integrable.]
  #part[if ${f_n}_(n in NN) subset.eq L^1(mu)$ is a sequence that converges to $f$ in $L^1(mu)$ then ${f_n}_(n in NN)$ is uniformly integrable.]
]
#solution[
  1. For this problem we will prove this in two steps. We will first show that if $f in L^1(mu )$, then ${f}$ is uniformly integrable. Then we will extend to the case of finite subsets of $L^1 (mu)$. Let $f_n = min(abs(f), n)$, $f_n monup abs(f)$ pointwise, note that $f_n in L^1(mu)$. Let $g_n = f_(n) - f_(n - 1)$, thus $f_n = sum_(k = 1)^(n) g_k$ and $g_n >= 0$.

  Note that $ sum_(n = 0)^(oo) integral_X g_n dif mu & = lim_(n -> oo) sum_(k = 1)^(n) integral_X g_k dif mu \
                                         & = lim_(n -> oo) integral_E sum_(k = 1)^(n) g_k dif mu \
                                         & = lim_(n -> oo) integral_X f_n dif mu \
                                         & =^("MCT") integral_X lim_(n -> oo) f_n dif mu \
                                         & = integral_X abs(f) dif mu < oo $

  By Cauchy Criterion, there exists a $N in NN$ where $ sum_(n = N)^(oo) integral_X g_n dif mu < epsilon. $ Take $delta = epsilon/(2N)$. Hence for all $E subset.eq X$ where $mu (E) < delta$, note that $ epsilon/2 > sum_(n = N)^(oo) integral_E g_n dif mu & = lim_(n -> oo) integral_E sum_(k = N)^(N + n) g_k dif mu \
  & = lim_(n -> oo) integral_E (f_(N + n) - f_N) dif mu \
  & =^("MCT") integral_E abs(f) dif mu - integral_E f_N dif mu \
  & >= integral_E abs(f) dif mu - N mu (E) >= integral_E abs(f) dif mu - epsilon/2. $ Thus, $ integral_E abs(f) dif mu <= epsilon. $

  Now for $S = {f_1, ..., f_n} subset.eq L^1(mu )$ an arbitrary finite subset. Note by the argument above, for all $epsilon > 0$, there exists $delta_i > 0$ such that $ integral_E abs(f_i) dif mu < epsilon $ for $mu(E) < delta_i$. Then let $delta = min {delta_i : i in [n]}$. The claim follows immediately.

  2. Suppose that $(f_n)_(n = 1)^(oo)$ is a sequence in $L^1(mu)$, where $f_n -> f in L^1$ in $L^1$. $forall epsilon > 0$, by the argument above, there exists a $delta_0 > 0$ where if $mu (E) < delta_0$ that implies that $ integral_E abs(f) dif mu < epsilon/2. $ By hypothesis, there exists a $N in NN$ where if $n>= N => norm(f_n - f)_(L^1) < epsilon/2$. Thus if $mu(E) < delta_0$ we have that for $n >= N$: $ integral_E abs(f_n) dif mu & <= integral_(E) abs(f_n - f) dif mu + integral_E abs(f) dif mu \
                               & < norm(f_n - f) + epsilon/2 \
                               & < epsilon/2 + epsilon/2 = epsilon. $

  Then by part a, there exists a $delta_1$ for which if $n < N$ and $mu (E) < delta_1$ we have that $ integral_E abs(f_i) dif mu < epsilon. $ Then let $delta = min(delta_0, delta_1) > 0$. If $mu (E) < delta$, then $ integral_E abs(f_n) dif mu < epsilon $ for $n in NN$. Hence ${f_n}$ is uniformly integrable.
]

#problem(num: "3.7*")[
  Let $I = [-1/2, 1/2]$. For each $x, y in I$ we write that $x tilde y$ if $x - y in QQ$. For $x in I$ set $K(x) = {y in I : y tilde x}$. Let ${r_k}_(k=0)^oo$ be an enumeration of $[-1,1] inter QQ$ such that $r_0 = 0$.
  #part[Show that $tilde$ is an equivalence relation.]
  #part[Let $A$ be a set containing exactly one member of each equivalence class (the axiom of choice ensures existence of such an $A$) and set $A_k = A + r_k$. Show that
    $ I subset.eq union_(k=0)^oo A_k subset.eq [-3/2, 3/2]. $
  ]
  #part[Conclude that $A$ is not $cL^1$-measurable if $cL^1$ is the one-dimensional Lebesgue measure. (Hint: compare $cL^1 [A_k]$ to $cL^1 [A]$.)]
]
#solution[
  1. *Symmetry*: $x ~ y => x - y in QQ => y - x = -(x - y) in QQ => y ~ x$. *Reflexive*: $x - x = 0 in QQ => x ~ x$. *Transitive*: $x ~ y$ and $y ~ z$, thus $x - y in QQ and y - z in QQ$, hence $x - y + y - z = x - z in QQ => x ~ z$
  2. We will first show that $I subset.eq union.big_(k in NN) A_k$. Fix a arbitrary $r in I$. By definition, there exists $a in I$ where $a ~ r$ meaning $a - r in QQ$. Furthermore $abs(a - r) <= abs(a) + abs(r) = 1$. Thus $a - r in [-1, 1] inter QQ$. By definition, there exists a $k in NN$ such that $a - r = r_k$. Thus $r in A + r_k = A_k$. Hence $I subset.eq union.big_(k in NN) A_k$. Fix a arbitrary $k in NN$. $forall a in A$, $a in [-1/2, 1/2]$. Furthermore $r_k in [-1, 1]$. Hence $ -1/2 - 1<= a + r_k <= 1/2 + 1 => -3/2 <= a + r_k <= 3/2. $ Thus $A_k subset.eq [-3/2, 3/2]$. Hence $ union.big_(k in NN) A_k subset.eq [-3/2, 3/2]. $
  3. Suppose $A_i inter A_j != emptyset => r in A_i inter A_j$. Thus $r - r_i, r - r_j in A$. Note that $r - r_i ~ r ~ r - r_j => r - r_i ~ r - r_j$ Furthermore, since you take a single representative of a equivalence relation, $r - r_i = r - r_j => r_i = r_j => i = j$ (since ${r_k}$ is a enumeration of $QQ$). Hence if $i != j => A_i inter A_j = emptyset$. Note that $cL^(1)[A_k] = cL^1 [A + r_k] = cL^1 [A]$. Assume the contrary, that if $A$ was measurable. Then $ 1 = cL^1 [I] <= cL^1[union.big_(n = k)^(oo) A_k] =^"disjoint" sum_(k = 1)^(oo) cL^1[A_k] = sum_(k = 1)^(oo) cL^1 [A] <= 3. $ But note that $cL^1 [A] > 0$, since the sum is bounded below from 1. However if $cL^1 [A] > 0$, then the sum is divergent and cannot be less than or equal to 3.

]

#problem(num: "3.8")[
  Suppose $mu$ is an outer measure on $X$. Prove that the following are equivalent:
  #part[The measure $mu$ is $sigma$-finite.]
  #part[There exists an increasing sequence $X_1 subset.eq X_2 subset.eq dots.c$ of $mu$-measurable sets such that $X = union_(k=1)^oo X_k$ and $mu(X_k) < oo$ for each $k in NN$.]
  #part[There exists a disjoint sequence $Z_1, Z_2, dots.c$ of $mu$-measurable sets such that $X = union_(k=1)^oo Z_k$ and $mu(Z_k) < oo$ for each $k in NN$.]
]
#solution[]

#problem(num: "3.9")[
  Let $mu$ be an outer measure on a set $X$ and let $nu$ be an outer measure on a set $Y$. Define
  $ cP_o := {A times B : A "is" mu"-measurable", B "is" nu"-measurable"}. $
  #part[Prove that if $A_1, A_2 subset.eq X$ and $B_1, B_2 subset.eq Y$ then
    $ (A_1 times B_1) inter (A_2 times B_2) = (A_1 inter A_2) times (B_1 inter B_2) $
    and
    $
      (A_1 times B_1) without (A_2 times B_2) = [(A_1 without A_2) times B_1] union [A_1 inter A_2 times (B_1 without B_2)].
    $
  ]
  #part[Deduce that any finite union of elements of $cP_o$ can be written as a finite union of disjoint elements of $cP_o$.]
  #part[Deduce that any countable union of elements of $cP_o$ can be written as a countable union of disjoint elements of $cP_o$.]
]
#solution[]

#problem(num: "3.10")[
  Let $mu$ be an outer measure on a set $X$ and let $nu$ be an outer measure on a set $Y$. Define $cP_o$ as in Exercise 3.9,
  $ cP_1 := {union_(i=1)^(+oo) S_i : S_i in cP_o}, quad "and" quad cP_2 := {inter_(i=1)^(+oo) S_i : S_i in cP_1}. $
  Let $cF$ be the collection of all sets $S subset.eq X times Y$ such that the function $x -> chi_S (x,y)$ is $mu$-measurable for $nu$-almost every $y in Y$, and the function $y -> integral_X chi(x, y) dif mu(x)$ is $nu$-measurable. Define
  $ rho[S] := integral_Y (integral_X chi(x, y) dif mu(x)) dif nu(y), quad (S in cF). $
  Note in fact that if $S subset.eq X times Y$ then there exists $R in cP_2$ such that $S subset.eq R$ and $mu times nu [S] = rho[R]$.
  #part[Use that $cP_o subset.eq cF$ to deduce that $cP_1 subset.eq cF$.]
  #part[Prove that if $T subset.eq X times Y$ and $mu times nu [T] = 0$ then $T in cF$ and $rho[T] = 0$.]
  #part[Prove that if $S subset.eq X times Y$ is $mu times nu$-measurable and $mu times nu [S] < +oo$ then there exists $R in cP_2$ such that $rho[R without S] = 0$ and $R without S in cF$.]
]
#solution[]
