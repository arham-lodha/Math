#import "template.typ": *

#show: homework.with(
  course: "MATH 246A",
  assignment: "Homework 1",
  name: "Arham Lodha",
  due: "September 24, 2026",
)

// ── Section 1 ────────────────────────────────────────────────────────────────

#problem(num: "1.1")[
  Find all solutions $z$ of the following equations:
  #part[$z^2 = -15 - 8i$.]
  #part[$(3 + 5i)z^2 + (3 + 5i)z + (8 + 2i) = 0$.]
]
#solution[
  *(a)*:
]

#problem(num: "1.2")[
  Sketch the following sets:
  #part[$ {z in CC : abs(z - 3i) / abs(z + 3i) <= 2}, $]
  #part[$ {z in CC : op("Im")((z - 1) / (1 + i)) >= 0}, $]
  #part[$ {z in CC : abs(z - 1) / abs(z + 2i) < sqrt(2)}. $]
]
#solution[]

#problem(num: "1.3")[
  Find $f(M)$ for the following maps $f: CC -> CC$ and the following sets $M subset.eq CC$:
  #part[$f(z) = e^z$ and $M = {z in CC : 2 <= op("Re")(z) <= 3 "and" abs(op("Im")(z)) <= pi / 2}$.]
  #part[$f(z) = z^2$ and $M = {z in CC : op("Im")(z) > 0 "and" 1 <= abs(z) <= 2}$.]
]
#solution[
  *(a)*: Let $z = a + b i$ for $a, b in RR$. Then $ f(z) & = e^z \
       & = e^(a + b i) \
       & = e^a e^(b i) . $

  Thus $ f(M) := {r e^(i theta) : 2 <= r <= 3 , abs(theta) <= pi/2 } $

  *(b)*: $ M = HH inter {r e^(i theta) : 1 <= r <= 2 , theta in [0, 2 pi) } = {r e^(i theta) : 1 <= r <= 2, theta in (0, pi) } $
  Thus $ f(M) & = {r^2 e^(i 2 theta) : 1 <= r <= 2, theta in (0, pi) } \
       & = {r e^(i theta) : 1 <= r <= 4, theta in (0, 2 pi) } $
]

#problem(num: "1.4")[
  #part[Show that $(cos x + i sin x)^n = cos(n x) + i sin(n x)$ for all $n in NN$, $x in RR$.]
  #part[Express $cos(5x)$ in terms of $cos x$, and $sin(5x)$ in terms of $sin x$.]
  #part[Express $cos(2pi \/ 5)$ and $sin(2pi \/ 5)$ in terms of roots of real numbers.]
]
#solution[
  *(a)*: Follows immediately from Euler's Identity.

  *(b)*: $ e^(i 5 x) &= sum_(k = 0)^(5) vec(5, k) i^k cos^(5 - k) (x) sin^(k) (x) \ &= cos^5 (x) + 5 i sin(x) cos^(4) (x) - 10 sin^(2)(x) cos^(3)(x) - 10 i sin^3 (x) cos^2 (x) + 5 sin^4 (x) cos(x) + i sin^5 (x). $

  Hence:

  $
    cos(5x) & = Re(e^(i 5 x)) \
            & = cos^5 (x) - 10 sin^2 (x) cos^3 (x) + 5 sin^4 (x) cos(x) \
            & = 16 cos^5 (x) - 20 cos^3 (x) + 5 cos(x)
  $

  $ sin(5x) & = 16 sin^5 (x) - 20 sin^3 (x) + 5 sin (x) $

  *(c)*: Let $x = cos(2pi / 5)$ and $y = sin(2 pi / 5)$. $ 1 & = 16x^5 - 20x^3 + 5 x \
  0 & = 16y^5 - 20y^3 + 5y = y(16y^4 - 20y^2 + 5) $

  Thus $               y^4 - 5/4 y^2 & = -(5) / (16) \
  y^4 - 5/4 y^2 + (25) / (64) & = 5/64 \
                (y^2 - 5/8)^2 & = (5) / (64) \
                    y^2 - 5/8 & = (sqrt(5)) / (8) \
                          y^2 & = (5 + sqrt(5)) / (8) \
                            y & = (sqrt(5 + sqrt(5))) / (2 sqrt(2)) $

  Using the Pythagorean identity, we can get $x$. $ x & = sqrt(1 - y^2) \
  x & = sqrt(3 + sqrt(5)) / (2 sqrt(2)) $

]

#problem(num: "1.5")[
  Suppose that $z, w in CC$ and $abs(z), abs(w) < 1$. Show that then
  $ abs((z - w) / (1 - overline(z) w)) < 1. $
]
#solution[

  $
    1 - ((z - w) / (1 - conj(z) w))((conj(z) - conj(w)) / (1 - z conj(w))) &= 1 - (abs(z)^2 - w conj(z) - conj(z) w + abs(w)^2) / (1 - z conj(w) - conj(z) w + abs(z w)^2) \ &= (1 + abs(z w)^2 - abs(z)^2 - abs(w)^2) / (abs(1 - conj(z)w)^2) \ &= ((1 - abs(z)^2) (1 - abs(w)^2)) / (abs(1 - conj(z) w)^2) > 0
  $

]

#problem(num: "1.6")[
  Let $P(z) = a_0 + a_1 z + dots.c + a_(n-1) z^(n-1) + z^n$ be a polynomial of degree $n in NN$ with real coefficients $a_0, dots, a_(n-1) in [0, 1]$.

  Show that if $P(z_0) = 0$ for some $z_0 in CC$, then $op("Re")(z_0) < 0$ or $abs(z_0) < (1 + sqrt(5)) / 2$.
]
#solution[Note that if $z_0$ is a solution. $conj(z_0)$ is a solution to $P$ as well. Thus WLOG $arg(z_0) in [0, pi]$ Assume the contrary that $abs(z_0) = r >= (1 + sqrt(5)) / (2)$ and $arg(z) in [0, pi/2]$.  We know that $               0 = P(z_0) & = sum_(k = 0)^(n - 1) a_k z_0^k + z_0^n \
                    -z_0^n & = sum_(k = 0)^(n - 1) a_k z_0^k \
  r^n e^(i n theta + i pi) & = sum_(k = 0)^(n - 1) a_k r^k e^(i k theta) \
                       r^n & = sum_(k = 0)^(n - 1) a_k r^k e^(i( theta (k - n) - pi )) \
                           & = Re(sum_(k = 0)^(n - 1) a_k r^k e^(i( theta (k - n) - pi ))) \
                           & <= sum_(k = 0)^(n - 1) r^k max(0, Re(e^(theta(k - n) - pi))) \
                           & = sum_(k = 0)^(n - 1) r^k max(0, cos(theta(k - n) - pi)). $

  Thus we have the following inequalities:
  $ ((1 + sqrt(5)) / (2))^n <= r^n <= sum_(k = 0)^(n - 1) r^(k) max(0, -cos(theta (n - k))). $ Note we are using the trigonometric identity, $cos(alpha - pi) = -cos(alpha).$ Let $k = n - 1$, $ cos(theta(n - k)) & = cos(theta) > 0 => max(0, -cos(theta (n - k))) = 0. $ Thus $ r^n & <= sum_(k = 0)^(n - 2) r^k max(0, -cos(theta (n - k))) \
      & <= sum_(k = 0)^(n - 2) r^k \
      & = (1 - r^(n - 1) ) / (1 - r ) = (r^(n - 1) - 1 ) / (r - 1) $

  $ r >= (1 + sqrt(5)) / (2) => r^2 - r - 1 >= 0 => r^2 - r >= 1 => r - 1 >= 1/r $ Thus $ r^n <= (r^(n - 1) - 1 ) / (1 / r) => r^(n - 1) <= r^(n - 1) - 1 $ which is a contradiction.

]

#problem(num: "1.7")[
  #part[
    Let $P(z) = a_0 + a_1 z + dots.c + a_(n-1) z^(n-1) + z^n$ be a polynomial of degree $n in NN$ with complex coefficients $a_0, dots, a_(n-1)$. Suppose that $P(z) = product_(j=1)^n (z - z_j)$. Find an expression for $sum_(j=1)^n z_j^2$ in terms of the coefficients of $P$.
  ]
  #part[
    Let $n in NN$ and $zeta_k = exp((2 pi i k) / n)$ for $k = 1, dots, n - 1$. Find a simple expression for
    $ sum_(k=1)^(n-1) 1 / (zeta_k - 1)^2 $
    in terms of $n$.
  ]
]
#solution[
  *(a)*: $ sum_(j = 1)^(n) z_j^2 & = (sum_(j = 1)^(n) z_j)^2 - sum_(i = 1)^(n) sum_(j = 1)^(n) z_i z_j \
                        & = a_(n - 1)^2 - 2a_(n - 2) $

  *(b)*: Examine the following polynomials: $              P(x) & = product_(k = 1)^(n - 1) (zeta_k - x) = 1 + x^2 + ... + x^(n - 1) \
        P prime (x) & = sum_(k = 1)^(n - 1) product_(j != k) (zeta_j - x) = 1 + 2x + 3x^2 + ... + (n - 1)x^(n - 2) \
  P prime prime (x) & = 2 + 6x + ... (n - 1)(n - 2) x^(n - 3 )= sum_(k = 1)^(n - 2)k(k + 1)x^(k - 1) . $

  Note that $ (P prime (x)) / (P(x)) & = sum_(k = 1)^(n - 1) (1) / ((zeta_k - x)) => (dif) / (dif x)((P prime (x)) / (P(x))) &= sum_(k = 1)^(n - 1) (1) / ((zeta_k - x)^2). $

  Thus $ S = sum_(k = 1)^(n - 1) (1) / ((zeta_k - 1)^2) & = (P prime prime (1) P(1) - (P prime (1))^2 ) / ((P(1))^2) $

  Now $              P(1) & = n \
        P prime (1) & = (n (n -1)) / (2) \
  P prime prime (1) & = sum_(k = 1)^(n - 2) (k^2 + k) \
                    & = sum_(k = 1)^(n - 2) k^2 + ((n - 2)(n - 1)) / (2) \
                    & = ((n - 2)(n - 1)(2n - 1)) / (6) + ((n - 2)(n-1)) / (2) $


  Hence $ S & = 1/n^2 ((n(n - 2)(n - 1)(2n -1) + 3n(n - 2)(n - 1)) / (6) - (n^2 (n - 1)^2) / (4)) $
]

#problem(num: "1.8")[
  Let $n in NN$. Find all (complex) roots of the polynomial
  $ P(z) = (z + 1)^n - z^n $
  and express them explicitly using trigonometric functions (applied to real arguments).
]
#solution[
  Suppose $z$ is a solution to the polynomial described above. Then we have that $ (z + 1)^(n) = z^n => abs(z + 1)^n = abs(z)^n => abs(z + 1) = abs(z). $ Thus we have $ abs(z)^(2) & = (z + 1)(conj(z) + 1) \
             & = abs(z)^2 + 2 Re(z) + 1. $ This implies $Re(z) = -1/2$. Thus $y = Im(z) = 1/i (z + 1/2)$. Thus we have that $ 0 = P(-1/2 + y i) & = (i y + 1/2)^n - (i y - 1/2)^n \ $
  Meaning we want $y$ such that $ (1/2 + i y)^n = (-1/2 + i y)^(n). $
  Let $theta = arctan(2y)$ and $r = sqrt(1/4 + y^2)$. Thus $ (r e^(i theta))^n & = (- r e^(- i theta) )^n => e^(i n theta) = (-1)^n e^(-i n (theta)) $

  Thus we have 2 cases $n$ even and $n$ odd.

  1. Case 1 $n$ even: We have that $sin(n theta) = 0$, so $n theta = k pi$ for some $k in ZZ$, i.e. $theta = (k pi) / n$.
  2. Case 2 $n$ odd: We have $cos(n theta) = 0$, so $n theta = pi/2 + k pi$ for some $k in ZZ$, i.e. $theta = ((2k+1) pi) / (2n)$.

  Since $theta = arctan(2y)$ ranges over $(-pi/2, pi/2)$, only the integers $k$ for which the corresponding $theta$ lies in this interval give valid solutions; in each case this selects exactly $n - 1$ values of $k$, consistent with $P$ having degree $n - 1$ (the $z^n$ terms cancel).

  Recovering $y$ from $tan(theta) = 2y$ and then $z = -1/2 + i y$ gives $ z = -1/2 (1 - i tan(theta)). $

  Explicitly, the roots are
  $ z_k = -1/2 (1 - i tan((k pi)/n)), quad -n/2 < k < n/2 quad (n "even"), $
  $ z_k = -1/2 (1 - i tan(((2k+1) pi)/(2n))), quad -(n+1)/2 < k < (n-1)/2 quad (n "odd"). $
]

#problem(num: "1.9")[
  #part[
    Show that a map $L: RR^2 -> RR^2$ is linear (as a map on the vector space $RR^2$ over $RR$) if and only if there are constants $alpha, beta in CC$ such that $L$ can be written in the form
    $ L(z) = alpha z + beta overline(z), quad z in CC, $
    under the identification of points $w in CC$ with $(op("Re")(w), op("Im")(w)) in RR^2$.

    _Hint:_ The map $L$ can be represented by a matrix $mat(a, b; c, d)$ with respect to the standard basis in $RR^2$. Express $alpha$ and $beta$ in terms of the matrix coefficients $a, b, c, d$ and vice versa.
  ]
  #part[
    When is $L$ a $CC$-_linear_ map, that is, linear as a map on the vector space $CC$ over $CC$? Find necessary and sufficient conditions in terms of $alpha$, $beta$ and in terms of $a$, $b$, $c$, $d$.
  ]
  #part[
    Express $det(L)$ and the operator norm
    $ norm(L) := sup{abs(L(z)) : z in CC, abs(z) <= 1} $
    in terms of $alpha$ and $beta$.
  ]
]
#solution[
  $=>$: Let $alpha = 1/2 (a - d) + i/2 (c + b)$ and $beta = 1/2 (a + d) + i/2 (c - b)$ given the matrix $mat(a, b; c, d)$.
  Suppose $alpha = alpha_1 + i alpha_2$ and $beta = beta_1 + i beta_2$. Now you just bash to get $a, b, c, d$ in terms of $alpha_i, beta_j$.

  $<==$: $ L(m z + n w) & = alpha (m z + n w) + beta (overline(m z + n w)) = $
]

// ── Section 2 ────────────────────────────────────────────────────────────────

#problem(num: "2.1")[
  Let $(X, d)$ be a metric space. Show that if $A, B subset.eq X$, then $overline(A union B) = overline(A) union overline(B)$.
]
#solution[
  Suppose $x in cl(A)$, then $x in A$ or $x in partial A$, in either case $x in cl(A union B)$. By a symmetric argument, the same is true for $x in cl(B)$. Thus $cl(A) union cl(B) subset.eq cl(A union B)$. Suppose $x in cl(A union B)$, $x in A union B$ or $x in partial(A union B)$. The second case, is the one which is remotely interesting. $x$ is the limit point of a sequence ${x_n}_(n = 0)^(oo )$
  without loss of generality $x_n in A$ (otherwise in $B$ or pass to a subsequence). Thus $x in cl(A) subset cl(A) union cl(B)$. Thus $cl(A union B) = cl(A) union cl(B)$.
]

#problem(num: "2.2")[
  Let $(X, d)$ be a metric space and $M subset.eq X$. Recall that a set $A subset.eq M$ is called #emph[relatively closed (in $M$)] if there exists a closed set $A' subset.eq X$ such that $A = A' inter M$.
  #part[Show that $A subset.eq M$ is relatively closed if and only if $A = overline(A) inter M$.]
  #part[Show that $A subset.eq M$ is relatively closed if and only if the following condition is true: whenever ${x_n}$ is a convergent sequence in $A$ and $x_n -> x in M$, then $x in A$.]
]
#solution[
  *(a)*: Suppose $A subset.eq M$ is relatively closed. Then $exists B prime subset.eq X$ closed such that $A = B inter M.$ Note that, $A subset.eq cl(A) subset.eq B$. Thus we have that $A subset.eq cl(A) inter M subset.eq B inter M = A => cl(A) inter M = A$. The other direction follows immediately from the definition of relatively closed.

  *(b)*: For the forward direction apply a. Suppose for all onvergent sequences ${x_n} in X$ where $x_n -> x in M$, then $x in A$. This kind of immediately implies the $cl(A) inter M subset.eq A$ which implies equality.
]

#problem(num: "2.3")[
  #part[
    Show that if $A subset.eq CC$ is a closed set contained in an open disk $D = B(z_0, R)$, where $z_0 in CC$ and $R > 0$, then there exists a number $r < R$ such that $abs(z - z_0) <= r$ for all $z in A$.
  ]
  #part[
    For non-empty sets $A$ and $B$ in $CC$ we define their distance as
    $ op("dist")(A, B) := inf{abs(z - w) : z in A "and" w in B}. $
    Show that if $A$ is compact and $B$ is closed, then there exist points $u in A$ and $v in B$ such that $op("dist")(A, B) = abs(u - v)$.
  ]
]
#solution[
  *(a)*: Consider the set $A_D = {abs(z - z_0) : z in A}$. Note that $A subset.eq D$, thus $abs(z - z_0) < R$. Thus $A_D$ is bounded above by $R$. Thus $exists r <= R$ such that $sup A_D = r$. We now need to show that $r < R$. Assume the contrary, that $r = R$. Thus for all $epsilon$, $exists z in A$ such that $abs(z - z_0) in (R - epsilon, R).$ Now consider the sequence $(x_n)_(n = 1)^(oo)$ where $x_n in A$ and $abs(z_0 - x_n) in (R - 1/n, R)$. By Bolzano Weierstrass, $x_n$ has a convergent subsequence, without loss of generality pass to it. Let $x^*$ be the limit point. Note that the function $x -> abs(z_0 - x)$ is continous hence $abs(z_0 - x^*) = R$ but $x^* in A subset D$ and a contradiction arises. Thus $r < R$.

  *(b)*: Suppose $A$ is compact and $B$ is closed. Consider $ d(x, B) := inf {abs(z - x) : z in B}. $ $d(dot, B) := CC -> RR$ there exists a $z in B$ such that $abs(z - x) = d(x, B)$, this is by intersecting $B$ with a closed ball and then compactness applies (Heine Borel) and then minimum is achieved. Now we have to show that $f = d(dot, B)$ is a continous function. $forall epsilon > 0$, $forall x in f^(-1)([0, epsilon))$ we know that $f(x) < epsilon$. We want to show there exists a $B(x, delta) subset.eq f^(-1)([0, epsilon))$. We know that $exists b in B$ such that $abs(x - b) = f(x) < epsilon$. $forall y in B(x, epsilon - abs(x - b))$ we have:
  $
    f(y) <= abs(y - b) <= abs(x - y) + abs(x - b) < epsilon - abs(x - b) + abs(x- b) = epsilon => y in f^(-1)([0, epsilon))
  $

  We will also show that $f^(-1)((epsilon, oo))$ is open. $forall x in f^(-1)((epsilon, oo))$, $f(x) > epsilon$. Assume the contrary, $forall n in NN$ there exists $y_(n) in B(x, 1/n)$ such that $f(y) < epsilon$ which means there are $b_n in B$ such that $abs(y - b_n) < epsilon$. Thus $ abs(x - b_n) <= abs(x - y_n) + abs(y - b_n) < 1/n + epsilon => f(x) <= epsilon $ thus a contradiction occurs. Hence $exists n in NN$ such that $B(x, 1/n) subset f^(-1)((epsilon, oo)).$ Thus $f$ continous. Now $exists a in A$ such that $f(a) <= f(a prime)$ for all $a prime in A$. This effectively solves the problem.
]

#problem(num: "2.4")[
  #part[
    Show that the function $z |-> (z^2 + 3) / (z + 1)$ is continuous on the set $CC without {-1}$ by using the $epsilon$-$delta$-definition of continuity.
  ]
  #part[
    Suppose ${z_n}$ and ${w_n}$ are convergent sequences in $CC$, say $z_n -> z$ and $w_n -> w$. Assume $w_n != 0$ for $n in NN$ and $w != 0$. Show that $z_n \/ w_n -> z \/ w$ by using the $epsilon$-definition for convergence.
  ]
]
#solution[
  *(a)*: The product of continous $f: Omega_1 -> CC$ and $g: Omega_2 -> CC$ is continous on $Omega_1 inter Omega_2$ ($Omega_1$ and $Omega_2$ are open). $forall x in Omega_1 inter Omega_2$, there exists a $delta_0 > 0$ such that $B(x, delta_0) subset.eq Omega_1 inter Omega_2$. Thus $cl(B)(x, delta_0/2) subset Omega_1 inter Omega_2$. Thus $f$ and $g$ acheive a maximum on $cl(B)(x, delta_0/2)$ denoted by $M_f$ and $M_g$. Now $forall epsilon > 0$ there exist a $delta < delta_0 / 2$ such that $abs(f(x) - f(y)) < (epsilon) / (2 M_g)$ and $abs(g(x) - g(y)) < epsilon/(2M_f)$ for $y in B(x, delta)$.

  $
    abs(f(x) g(x) - f(y) g(y)) & <= abs(f(x) g(x) - f(x) g(y)) + abs(f(x) g(y) - f(y) g(y)) \
                               & <= M_f abs(g(x) - g(y)) + M_g abs(f(x) - f(y)) < epsilon
  $
  Let $f(x) = x^2 + 3$ and $g(x) = (x + 1)^(-1)$. $f$ and $g$ are continous on $CC$ and $CC \/ {-1}$ respectively. Thus the function given is continous on $C \/ {-1}$.

  *(b)*: $ abs((z_n) / (w_n) - (z) / (w)) & = abs((z_n w - z w_n) / (w_n w)) \
                                 & = abs((z_n w - z w + z w - z w_n) / (w w_n)) \
                                 & <= abs((w(z_n - z)) / (w w_n)) + abs((z(w - w_n)) / (w w_n)) \
                                 & <= 1/(m_w) abs(z_n - z) + 1/m_w abs(z/w) abs(w - w_n) $

]

#problem(num: "2.5")[
  Suppose $f: overline(bb(D)) -> CC$ is a continuous function with $exp(f(z)) = 1$ for all $z in overline(bb(D))$. Show that then $f$ is constant.
]
#solution[
  Note that the range of $f$ must be ${2 pi i k: k in NN}$ which is discrete. The only continous function from a euclidean space to discrete space is constant.
]

#problem(num: "2.6")[
  Let $U subset.eq CC$ be an open set with $0 in U$. Show that then it is impossible to define a continuous square root function on $U$; more precisely, show that there exists no continuous function $S: U -> CC$ such that $S(z)^2 = z$ for each $z in U$.

  _Hint:_ Consider a suitable parametrization of a small circle centered at $0$.
]
#solution[
  There exists a $r > 0$ such that $cl(B) (0, r) subset U$. Assume for the sake of contradiction, that there exists a continous function $S: U -> CC$ such that $S(z)^(2) = z$. We will examine the behavior close to $-r in U$ specifically along the paths $theta -> e^(r i theta)$ and $theta -> e^(- r i theta)$ as
  $theta in [0, pi]$. Let $gamma: [-pi, pi] -> CC$ where $theta -> e^(i theta)$. $gamma$ is continous and hence $S compose gamma$ is continous. $S(gamma(theta)) = c(theta) sqrt(r) e^(i theta/2)$ where $c(theta) in {-1, 1}$ and continous. Thus $c(theta) = C in {-1, 1}$. As $theta -> -pi$, $S(gamma(theta)) -> C sqrt(r) e^(- i pi /2) = -C i sqrt(r)$ while $theta -> pi$, $S(gamma(theta)) -> C i sqrt(r)$. Thus $S(-r)$ has no consistent value and thus $S$ cannot be continous.

]

#problem(num: "2.7")[
  Let $(X, d)$ be a metric space. Recall that $M subset.eq X$ is called _connected_ if the following condition is true: if $U, V subset.eq X$ are open, $M subset.eq U union V$, and $U inter V = emptyset$, then $M subset.eq U$ or $M subset.eq V$.

  Show that $M subset.eq X$ is connected if and only if $emptyset$ and $M$ are the only subsets of $M$ that are both relatively open and relatively closed.

  _Note:_ This statement would be very easy to prove if we replaced the condition $U inter V = emptyset$ with $U inter V inter M = emptyset$ in the definition of connectedness.
]
#solution[
  $=>:$Suppose $M subset.eq X$ is connected. Suppose $emptyset != S subset.eq M$ is relatively open and relatively closed. There exists $A subset X$ open such that $A inter M = S$ and similarly $B subset X$ closed such that $B inter M = S$. $ M \/ S & = M inter (A inter M)^c = M inter (A^c union M^c) = M inter A^c \
  M \/ S & = M inter (B inter M)^c = M inter B^c, $ Thus $S$ and $M \/ S$ are both relatively clopen in $M$. Consider $forall x in S$, there exists a $epsilon_x > 0$ such that $B(x, epsilon_x) subset A => B(x, epsilon_x) inter M \/ S = emptyset$. Then $d(x, M \/ S) >= epsilon_x$. Similarly $forall x in M \/ S$ there exists a $delta_x > 0$ such that $d(x, M) > delta_x$. Consider $ U & = union.big_(x in S) B(x, (d(x, M \/ S)) / (4)) \
  V & = union.big_(x in M \/ S) B(x, (d(x, S)) / (4)). $

  Assume the contrary that $exists x in U inter V$, thus $exists s in S$ and $t in M \/ S$ such that $d(x, s) < d(s, M \/ S)$ and $d(x, t) < d(t, S)$. Thus $ d(s, t) & <= d(x, s) + d(x, t) \
          & < d(s, M \/ S)/4 + d(t, S)/4 < 1/2 d(s, t) $

  This is a constradiction, hence $U inter V = emptyset$. Morover $M = S union (M \/ S) subset U inter V$. Neither $S$ and $M \/ S$ are empty thus $M$ cannot be connected.

  $<==:$ Suppose $emptyset , M$ are the only relatively clopen sets in $M$. Assume the contrary, that $exists U, V subset X$ such that $M subset.eq U union V$ but their intersections are empty and $M inter U subset U$ and $M inter V subset M$. Then $U subset.eq V^c$, $ M inter V^c subset.eq (U union V) inter V^c subset.eq U inter V^c = U => M inter V^c = M inter U. $ Thus $M inter U = M inter V^c$ is relatively clopen and not all of $M$ but isn't empty either.

]

#problem(num: "2.8")[
  Let $(X, d)$ be a metric space, and $A subset.eq X$ be a connected set. Show that every set $B subset.eq X$ with $A subset.eq B subset.eq overline(A)$ is also connected.
]
#solution[
  Connectedness definition is equivalent to the same definition replacing $U$ and $V$ with closed sets just take $U^c$ and $V^c$. Assume for the sake of taking the contrapositive that B is "between $A$ and $cl(A)$" and is not connected thus $B subset U union V$ where $U$ and $V$ are closed and $U inter V != emptyset$ but $B subset.not U$ and $B subset.not V$. Note that $U$ and $V$ form a disconnection for $cl(A)$ as well. Furthermore, if $A subset U$ or $A subset V$ then so is $cl(A)$ thus $U$ and $V$ form a disconnection of $A$ as well and thus $A$ cannot be connected. By the contrapositive the statement is true.
]

#problem(num: "2.9")[
  Let $(X, d)$ be a metric space, $I$ be an index set, and $M_i subset.eq X$ be connected for $i in I$. Show that if $M = inter.big_(i in I) M_i != emptyset$, then $union.big_(i in I) M_i$ is connected.
]
#solution[
  We will prove this using the contrapositive. Suppose that the $M$ is not connected. Thus there exists disjoint open sets $U$ and $V$ such that $M$ is in $U union V$ but $M subset.not U$ and $M subset.not V$. $ J & = {i in I : M_i inter U != emptyset} \
  K & = {i in I : M_i inter V != emptyset} $

  Assume the contrary, that there exists $i in J inter K$, thus $M_i subset U union V$ and $M_i inter U != emptyset$ and $M_i inter V != emptyset$. Since $U$ and $V$ are disjoint, they are a disconnection of $M_i$ and hence $M_i$ is not connected which is a contradiction. Thus $ union.big_(i in J) M_i &= U \ union.big_(k in K) M_k &= V \ union.big_(i in J) M_i inter V &= emptyset \ inter.big_(i in I) M_i subset.eq (union.big_(i in J) M_i) inter (union.big_(k in K) M_k) &subset.eq (union.big_(i in J) M_i) inter V &= emptyset. $

  Thus by the contrapositive, the statement is true.
]

#problem(num: "2.10")[
  Let $M$ be a non-empty subset of $CC$. A #emph[(connected) component] $C$ of $M$ is a maximal (with respect to inclusion) connected subset of $M$. Show that:
  #part[Each component $C$ of $M$ is relatively closed in $M$.]
  #part[If $C$ and $C'$ are distinct components of $M$, then $C inter C' = emptyset$.]
  #part[Every connected subset $A$ of $M$ lies in a unique component $C$ of $M$.]
  #part[$M$ is the (disjoint) union of its components.]
  #part[There exists an equivalence relation $tilde.op$ on $M$ whose equivalence classes are the components of $M$. Give a concise description of $tilde.op$ that does not use the concept of a component!]
]
#solution[
  *(a)*: Since $C$ is connected in $M$, $cl(C) inter M$ is also connected in $M$. But since $C$ is maximal, $cl(C) inter M = C => C$ relatively closed.

  *(b)*: Suppose $C$ and $D$ are distinct components of $M$. Use 2.9 to contradict.

  *(c)*: Combine maximality and claim b.

  *(d)*: Each singleton of $M$ is a connected subset, each of which is in one unique component.

  *(e)*: The components define a  partition of $M$. $x ~ y <=> exists {U_i}_(i = 1)^n subset.eq cal(T)(M)$ such that $x in U_1$ and $y in U_n$ and $U_i inter U_(i + 1) != emptyset$
]
