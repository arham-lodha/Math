#import "template.typ": *

#show: homework.with(
  course: "MATH 246A",
  assignment: "Homework 3",
  name: "Arham Lodha",
  due: "TBD",
)

// ── Section 5: Infinite Series and Products ──────────────────────────────────

#problem(num: "5.1")[
  Show that the infinite series $ 1/z + sum_(n in NN) (2z)/(z^2 - n^2) $ converges absolutely for each $z in CC without ZZ$.
]
#solution[
  Let $z in CC - ZZ$ be arbitrary. Note that: $ lim_(n -> oo) abs((z^2 - n^2) / (n^2)) & = 1. $
  Thus there exists a $N in NN$ such that for all $n >= N$: $ -1/2 < abs((z^2 - n^2) / (n^2)) - 1 < 1/2 => abs((z^2 - n^2) / (n^2)) > 1/2 => abs(z^2 - n^2) > 1/2 n^2 => 1/abs(z^2 - n^2) <= (2) / (n^2). $

  Thus we have the following $ abs(z)^(-1) + sum_(k = 1)^(oo) (2 abs(z)) / (abs(z^2 - n^2)) &= abs(z)^(-1) + sum_(k = 1)^(N - 1) (2 abs(z)) / (abs(z^2 - n^2)) + sum_(k = N)^(oo) (2 abs(z)) / (abs(z^2 - n^2)) $

  Thus $ sum_(k = 1)^(oo) (2 z) / (z^2 - n^2) "converges absolutely" <== sum_(k = N)^(oo) (2 abs(z)) / (abs(z^2 - n^2)) "converges" $

  The latter sum converges because $ sum_(k = N)^(oo) (2 abs(z)) / (abs(z^2 - n^2)) <= 4 abs(z) sum_(k = N)^(oo) 1/n^2 $ The second sum converges by the P test.
]

#problem(num: "5.2")[
  Let $Gamma$ be a rank-2 lattice in $CC$, that is, a set of the form $ Gamma = {n omega_1 + k omega_2 : k, n in ZZ}, $ where $omega_1, omega_2 in CC without {0}$ are linearly independent over $RR$. Show that $ sum_(gamma in Gamma without {0}) 1/gamma^n $ converges absolutely for $n in NN$, $n >= 3$.
]
#solution[
  $ S = sum_(gamma in Gamma - {0})abs((1) / (gamma)^k) = sum_((n, m) in ZZ^2 - {0}) (1) / (abs(n omega_1 + m omega_2)^(k) ). $ Let $ norm(dot)_s := RR^2 -> (0, oo) \ (x, y) -> abs(x omega_1 + y omega_2). $ One can check that $norm(dot)_s$ is a norm and since all norms are equivalent on $RR^n$, thus $exists C in RR$ where $norm(dot)_s >= C norm(dot)_(oo).$ Thus $ S & <= 1/C^(k) sum_((n, m) in ZZ^2 - {0}) (1) / (norm((n, m))_(oo)^(k) ) \
    & = 1/C^k sum_((m, n) in ZZ^2 - {0}) (1) / (max(abs(n), abs(m))^k) = 1/C^k T. $

  We want to examine sum of $T$.

  $
    sum_(n, m in ZZ - {0}) 1/max(abs(n), abs(m))^k & = 4 sum_(m = 1)^(oo) sum_(n = 1)^(oo) 1/max(abs(n), abs(m))^k \
                                                   & = 4 sum_(m = 1)^(oo) ((m - 1) / (m^k) + sum_(n = m)^(oo) 1/abs(n)^k ) \
                                                   & = 4 sum_(m = 1)^(oo) (1/m^(k - 1) + sum_(n = m + 1)^(oo) 1/n^k )
  $

  Note that $ sum_(m = 1)^(oo)(1) / (m^(k - 1) ) = zeta(k - 1) $ which is absolutely convergent if and only $k - 1 >= 2 => k >= 3$. $ sum_(m = 1)^(oo) sum_(n = m + 1)^(oo) 1/n^k & = sum_(n >= 2) (\#{m : 1 <= m <= n - 1}) / (n^k) \
                                              & = sum_(n >= 2)^() (n - 1) / (n^k) = zeta (k - 1) - zeta (k) $

  Thus $ T = 8zeta(k - 1) - 4 zeta(k) + 4 zeta (k) = 8 zeta (k - 1) $ which is only convergent for $k - 1 >= 2 => k >= 3$


]

#problem(num: "5.3")[
  Show that the infinite product $ product_(n=1)^infinity (1 + 1/n) e^(-1/n) $ converges.
]
#solution[
  Note that all factors of the product are positive. Let $ p_k := product_(n = 1)^(k) (1 + 1/n)e^(-1/n). $ To show convergence of the limit we will show $p_k$ is monotonic. To do this we will examine: $ f(x) = (1 + 1/x)e^(-1/x). $

  $
    f prime (x) & = -1/x^2 e^(-1/x) + (1 + 1/x) e^(-1/x) * (1/x^2) \
                & = 1/x^2 e^(-1/x)(1 + 1/x - 1) \
                & = 1/x^2 e^(-1/x) (1/x) \
                & = 1/x^3 e^(-1/x).
  $

  Note that $f prime (x) > 0$ for all $x > 0$. Thus on $(0, oo)$, $f$ is monotone increasing and hence $(1 + 1/n)e^(-1/n)$ is monotone increasing. Furthermore, $ lim_(n -> oo) (1 + 1/n)e^(-1/n) = 1 => (1 + 1/n)e^(-1/n) <= 1 => p_k >= p_(k + 1). $ Hence $p_k$ is monotone decreasing and bounded below by 0 and hence convergent. However for the infinite product to exists $ lim_(n -> oo) p_n != 0. $

  $
    p_k & = product_(n = 1)^(k)((n + 1) / (n)) e^(-1/n) \
        & = (k + 1) e^(- sum_(n = 1)^(k) 1/n)
  $

  We want to bound $p_k$ away from 0.

  $
    log(p_k) & = sum_(n = 1)^(k) (log(n + 1) - log(n) - 1/n) \
             & = sum_(n = 1)^(k)(integral_(n)^(n + 1) 1/t dif t - 1/n ) \
             & = - sum_(n = 1)^(k) integral_(0)^(1) (t)/(n (n + t)) dif t \
             & >= - sum_(n = 1)^(k) 1/n^2 integral_0^1 t dif t \
             & =-1/2 sum_(n = 1)^(k) 1/n^2 >= -1/2 sum_(n = 1)^(oo) 1/n^2 = -pi^2/12
  $

  Note $p_k < 1$ and $log(p_k) >= -pi^2/12$. Thus $e^(-pi^2/12) <= p_k <= 1.$ Thus the limit $k -> oo$ of $p_k$, is nonzero and the product converges.


]


#problem(num: "5.4")[
  Let $b_n >= 0$ for $n in NN$. Show that the infinite product $product_(n=1)^infinity (1 - b_n)$ converges if and only if $sum_(n=1)^infinity b_n$ converges.
]
#solution[
  We will use Prop 5.13, to make some reductions. $ product_(n = 1)^(oo)(1 - b_n) = product_(n = 1)^(oo) (1 + (- b_n)). $
  $
    sum_(i = 1)^(oo) b_i "coverges" <=>^("Prop" 5.13) product_(n = 1)^(oo) (1 + b_n) "converges" =>^("Prop" 5.13) product_(n = 1)^(oo) (1 + (-b_n)) "converges"
  $

  Thus we only need to show that $ product_(n = 1)^(oo)(1 + (-b_n)) "converges" => sum_(k = 1)^(oo) b_k "converges." $

  Note that $ log(1/(1 - x)) "continous at" x = 0. $. For all $epsilon > 0$, there exists a $epsilon_0 > 0$ such that $forall x in (-epsilon_0, epsilon_0)$: $ abs(log(1/(1 - x))) < epsilon. $

  By the convergence of the product: $exists N in NN$ such that $forall m >= n >= N$ we have that $ 1 - epsilon_0/2 < product_(k = n)^(m)(1- b_n) <= 1 + epsilon_0/2 $

  Note that $ 1 - x <= e^(-x) "for all" x in RR. $
  Thus $ product_(k = n)^(m) (1 - b_n) & <= product_(k = n)^(m) e^(-b_n) \
                                & = e^(-sum_(k = n)^(m) b_n) => \
            sum_(k = n)^(m) b_n & <= - log(product_(k = n)^(m) (1 - b_n)). $
  Thus:
  $ 0 <= sum_(k = n)^(m) b_n <= -log(1 - epsilon_0/2) $
  Since $-log(1 - epsilon_0/2) = abs(log(1/(1 - epsilon_0/2))) < epsilon$ by the choice of $epsilon_0$, we get $0 <= S_(n, m) < epsilon$ for all $m >= n >= N$. Hence the partial sums of $sum b_k$ are Cauchy, so $sum_(k = 1)^(oo) b_k$ converges. $qed$

]

#problem(num: "5.5")[
  Let $n in NN$ and $z_k in CC$ for $k = 1, dots, n$. Show that there exists a set $J subset.eq {1, dots, n}$ such that $ abs(sum_(j in J) z_j) >= 1/pi sum_(k=1)^n abs(z_k). $
  _Hint:_ For $t in [0, 2 pi]$ define $J(t) := {j in {1, dots, n} : op("Re")(z_j e^(-i t)) >= 0}$. Find a lower bound for the average of $sum_(j in J(t)) z_j$.
]
#solution[
  $
    (1) / (2 pi) integral_(0)^(2 pi ) abs(sum_(k in J(t)) z_k) dif t &= 1 / (2 pi) integral_(0)^(2pi) abs(e^(- i t) sum_(k = 1)^(n) z_k) dif t \ &= 1/(2 pi) integral_(0)^(1) abs(sum_(k in J(t)) e^(- i t) z_k) dif t \ &>= 1/(2 pi) integral_(0)^(1) Re(sum_(k in J(t))^() e^(-i t) z_k) dif t \
  $
]

#problem(num: "5.6")[
  Let $a_n in CC$ for $n in NN$.
  #part[Show that the series $sum_(n=1)^infinity a_n$ converges absolutely if and only if the following condition is true: there exists a constant $L in CC$ such that for all $epsilon > 0$ there exists a finite set $F_0 subset.eq NN$ such that for all finite sets $F subset.eq NN$ with $F_0 subset.eq F$ we have $ abs(sum_(k in F) a_k - L) < epsilon. $]
  #part[Show that in this case $L = sum_(n=1)^infinity a_n$.]
]
#solution[
  $=>$: Suppose $ sum_(n = 0)^(oo) a_n $ converges absolutely to $L$. $forall epsilon > 0$, $exists N in NN$ such that $ abs(sum_(k = 1)^(n) a_n - L) < epsilon/2 $ for $n >= N$. Additionally $exists M in NN$ such that $ sum_(k = n)^(m) abs(a_n) < epsilon/2 $ for $m >= n > M$. Let $K = max(M, N)$. Let $F_(0) = {1, ..., K}$. $forall F subset.eq NN$ finite where $F_0 subset.eq F$. $F subset.eq {1, ..., n}$ for $n >= K$. Let $G = {K + 1, ..., n} - F$.

  $
    abs(sum_(k in F)^() a_k - L) & = abs(sum_(k = 1)^(n) a_k - sum_(k in G) a_k - L) \
                                 & <= abs(sum_(k = 1)^(n) a_k - L) + sum_(k in G) abs(a_k) \
                                 & <= epsilon/2 + sum_(k = K + 1)^(n) abs(a_k) \
                                 & < epsilon/2 + epsilon/2 = epsilon.
  $

  $<==:$ Suppose that for all $epsilon > 0$ there exists a $F_(epsilon)$ finite such that all finite sets $F supset.eq F_epsilon$ we have $ abs(sum_(k in F) a_k - L) < epsilon. $ We will show any rearrangement of the sum is convergent and then by contrapositive of riemann rearrangement we are done.
]
