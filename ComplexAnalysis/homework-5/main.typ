#import "template.typ": *

#show: homework.with(
  course: "MATH 246A",
  assignment: "Homework 5",
  name: "Arham Lodha",
  due: "TBD",
)

// ── Section 8: Cauchy's Theorem ──────────────────────────────────────────────

#problem(num: "8.1")[
  Let $f$ be a continuous function in $CC$, and ${z_n}$ and ${w_n}$ be convergent sequences in $CC$ with $z_n -> z$ and $w_n -> w$ as $n -> oo$. Show that
  $ lim_(n -> oo) integral_([z_n, w_n]) f(z) dif z = integral_([z, w]) f(z) dif z. $
]
#solution[
  Let $ g_n (t) & := f((w_n - z_n) t + z_n) (w_n - z_n) \
     g(t) & = f((w - z) t + z)(w - z). $ Note that ${z_n} union {z} union {w_n} union {w}$ is compact. Thus exists some $R > 0$ such that ${z_n} union {z} union {w_n} union {w} subset.eq cl(B)(0, R) = B,$ which is convex. Furthermore, we can upgrade to uniform continuity of $f$ on $B$. Moreover exists $R$ a uniform upper bound for $abs(f)$.

  $
    abs(f((w_n - z_n) t + z_n) (w_n - z_n) - f((w_n - z_n) t + z_n)(w - z)) &= abs(f((w_n - z_n) t + z_n)) abs(w_n - z_n - w + z) \ &<= M(abs(w_n - w) + abs(z_n - z))
  $

  $
    abs(f((w_n - z_n) t + z_n)(w - z) - f((w - z) t + z) (w - z)) &= abs(f((w_n - z_n)t + z_n) - f((w - z) t + z))abs(w- z)
  $

  $
    abs((w_n - z_n) t + z_n - (w - z) t - z) & <= abs(w_n - z_n - w + z)t + abs(z - z_n) \
                                             & <= abs(w_n - w) + 2 abs(z - z_n)
  $

  For all $epsilon > 0$, there exists a $delta > 0$ such that if $abs(z - z prime) < delta => abs(f(z) - f(z prime)) < epsilon/(2 abs(w - z))$.

  You can now create a whole lot of uniform bounds for $w_n -> w$ and $z_n -> z$ to get a uniform bound for $norm(g_n - g)_(oo)$ for $t in [0, 1]$, ie $g_n -> g$ uniformly. Using this to show the integrals converge is trivial.
]

#problem(num: "8.2")[
  Show that $abs(e^z - e^w) <= abs(z - w)$ whenever $z$ and $w$ are complex numbers with non-positive real part.
]
#solution[
]

#problem(num: "8.3")[
  Let $Omega subset.eq CC$ be a convex region and $f$ be a zero-free holomorphic function on $Omega$.
  #part[Show that $f$ has a holomorphic logarithm, that is, there exists a function $L in H(Omega)$ such that
    $ f(z) = exp(L(z)) quad "for all" z in Omega. $
    _Hint:_ Do not use the function $w |-> log(w)$ for $w in CC without {0}$ which we have not yet defined (and cannot be defined as a holomorphic function on $CC without {0}$).]
  #part[Show that $f$ has a holomorphic square root, that is, there exists a function $S in H(Omega)$ such that
    $ f(z) = S(z)^2 quad "for all" z in Omega. $]
]
#solution[
  1. Let $G(z) = (f prime (z)) / (f (z))$. Note that for $z in Omega$, $f(z) != 0$. Thus $G$ is holomorphic. This implies that $G$ has a primitive since $Omega$ is convex, which we will call $L$.

  $
    partial_z (f e^(- L)) & = f prime e^(-L) - f e^(-L) G \
                          & = f prime e^(-L) - f prime e^(-L) = 0 => f e^(-L) = c != 0
  $

  Note that $exp$ is a convering map onto $CC^*$. Thus exists some $w in CC$ such that $e^w = c$. Thus $ f = e^(w L). $

  2. $ f = (S(z))^2 = exp(L(z)) => S(z) = exp(1/2 L(z)) $
]

// ── Section 9: Power Series Representations of Holomorphic Functions ─────────

#problem(num: "9.1")[
  Show that a complex power series $sum_(n=0)^oo a_n (z - z_0)^n$ has a positive radius of convergence if and only if there exist constants $C > 0$ and $M > 0$ such that $abs(a_n) <= C M^n$ for all $n in NN_0$.
]
#solution[
  1. $<==$: Suppose there exists constants $C > 0 "and" M > 0$ where $ abs(a_n) <= C M^n $ for all $n in NN$.

  $
    abs(a_n) <= C M^n => (abs(a_n))^(1/n) <= C^(1/n) M => limsup_(n -> oo) abs(a_n)^(1/n) <= limsup_(n -> oo) C^(1/n) M = M => R >= 1/M > 0
  $

  2. $=>$: Suppose the complex power series shown has a positive radius of convergence $R > 0$. This means that $ 1/R = H & = limsup_(n -> oo) abs(a_n)^(1/n) \
            & = lim_(n -> oo) sup_(k >= n) abs(a_k)^(1/k) $


    There exists a $K in NN$ such that $forall n >= K$ we have that $ abs(sup_(k >= n) abs(a_k)^(1/k) - H) < 1 => sup_(k >= n) abs(a_k)^(1/k) <= H + 1. $ Let $M = max({H + 1, 1} union {abs(a_k)^(1/k) : 1 <= k < K})$ and $C = max{1, abs(a_0)}$. Thus $forall k >= 1$, $abs(a_k)^(1/k) <= M => abs(a_k) <= M^k <= C M^k$, and $abs(a_0) <= C = C M^0$ (by construction).
]

#problem(num: "9.2")[
  Let $Omega subset.eq CC$ be a region, and $b, c$ be holomorphic functions on $Omega$. Suppose that $f in H(Omega)$ satisfies the differential equation
  $ f'' + b f' + c f = 0. #h(2em) (9.6) $
  Show that if there exists a point $z_0 in Omega$ such that
  $ f(z_0) = f'(z_0) = 0, $
  then $f$ vanishes identically on $Omega$.
]
#solution[
  Since $f in H(Omega)$, $f$ has a local power series representation.  Thus $ f(z) &= sum_(k = 0)^(oo) a_k (z - z_0)^k \ f prime (z) &= sum_(k = 1)^(oo) a_k k (z - z_0)^(k - 1) = sum_(k = 0)^(oo) a_(k + 1) (k + 1) (z - z_0)^(k) \ f prime prime (z) &= sum_(k = 1)^(oo) a_(k + 1)( k + 1)k(z - z_0)^(k - 1) = sum_(k = 0)^(oo) a_(k + 2)(k + 2) (k + 1) (z - z_0)^k $

  We know that $a_0 = a_1 = 0$ because $f(z_0) = f prime (z_0) = 0$. Let $ b(z) & := sum_(k = 0)^(oo) b_k (z - z_0)^k \
  c(z) & = sum_(k = 0)^(oo) c_k (z - z_0)^k. $ Thus $        f(z) c(z) & = sum_(k = 2)^(oo)[ (sum_(l = 2)^(k) a_l c_(k - l) ) (z - z_0)^k] \
  f prime (z) b(z) & = sum_(k = 1)^(oo) [(sum_(l = 1)^(k) (l + 1) a_(l + 1)b_(k - l) ) (z - z_0)^k]. $

  Plugging everything into the differential equation,

  $
    2a_2 + (6a_(3) + 2a_2 b_0)(z - z_0) + sum_(k = 2)^(oo)(a_(k + 2)(k + 2)(k + 1) + sum_(l = 1)^(k)(l + 1)a_(l + 1)b_(k - l) + sum_(l = 2)^(k) a_l c_(k -l) ) (z - z_0)^k = 0
  $

  By inspection, we can see that $a_2 = 0$, and $a_3 = 0$. Furthermore,

  $ a_(k + 2)(k + 2)(k + 1) + sum_(l = 1)^(k)(l + 1)a_(l + 1)b_(k - l) + sum_(l = 2)^(k) a_l c_(k -l) = 0 $ which means $ a_(k + 2) & = -1/((k + 2)(k + 1)) [sum_(l = 1)^(k) (l + 1)a_(l + 1) b_(k - l) + sum_(l = 2)^(k) a_l c_(k - l) ] \
            & =-1/((k + 2)(k + 1)) [2a_2 b_(k - 1) + sum_(l = 2)^(k) ((l + 1)a_(l + 1) b_(k - l) + a_l c_(k - l)) ] \
            & = -1/((k + 2)(k + 1)) [ 3a_(3) b_(k - 2) + sum_(l = 3)^(k) ((l + 1)a_(l + 1) b_(k - l) + a_l c_(k - l)) ] \
            & = -1/((k + 2)(k + 1)) [ 4 a_(4) b_(k - 3) + sum_(l = 4)^(k) ((l + 1)a_(l + 1) b_(k - l) + a_l c_(k - l)) ] $

  By strong induction, it is immediate that if $a_(k) = 0$ for all $k <= n$ then $a_(n + 1) = 0$.

  Since we proved that every point in $Omega$ where $f(z) = 0$, there is a open set where this true as well. By connectedness we can conclude that it is true everywhere.
]

#problem(num: "9.3")[
  Suppose we have the same setup as in Problem 9.2 and $z_0 in Omega$. Show for given values $f(z_0), f'(z_0) in CC$, the equation (9.6) has a unique solution $f$ that is holomorphic near $z_0$.

  _Hint:_ Assume that
  $ f(z) = sum_(n=0)^oo c_n (z - z_0)^n. $
  Show that the coefficients $c_n$ can be computed recursively. To establish convergence of the series near $z_0$, prove an estimate of the form $abs(c_n) <= C M^n$ by induction.
]
#solution[
  To avoid a clash with the coefficient function $c$, write the coefficients of $f$ as $a_n$ instead. Let $r > 0$ be such that $B(z_0, r) subset.eq Omega$, so that on $B(z_0, r)$ $ b(z) = sum_(k = 0)^(oo) b_k (z - z_0)^k, quad c(z) = sum_(k = 0)^(oo) c_k (z - z_0)^k. $ Suppose $f(z) = sum_(k = 0)^(oo) a_k (z - z_0)^k$ is a solution holomorphic near $z_0$. Exactly as in Problem 9.2, $ f prime (z) = sum_(k = 0)^(oo) (k + 1) a_(k + 1) (z - z_0)^k, quad f prime prime (z) = sum_(k = 0)^(oo) (k + 2)(k + 1) a_(k + 2) (z - z_0)^k, $ and taking Cauchy products, $ b(z) f prime (z) & = sum_(k = 0)^(oo) [(sum_(l = 0)^(k) (l + 1) a_(l + 1) b_(k - l)) (z - z_0)^k] \
         c(z) f(z) & = sum_(k = 0)^(oo) [(sum_(l = 0)^(k) a_l c_(k - l)) (z - z_0)^k]. $ This time none of the low-order terms drop out, since $a_0 = f(z_0)$ and $a_1 = f prime (z_0)$ are arbitrary. Plugging into (9.6) and comparing coefficients of $(z - z_0)^k$ gives, for every $k >= 0$, $ (k + 2)(k + 1) a_(k + 2) + sum_(l = 0)^(k) ((l + 1) a_(l + 1) b_(k - l) + a_l c_(k - l)) = 0, $ that is, $       a_0 & = f(z_0), quad a_1 = f prime (z_0), \
  a_(k + 2) & = -1/((k + 2)(k + 1)) sum_(l = 0)^(k) ((l + 1) a_(l + 1) b_(k - l) + a_l c_(k - l)). $ Note the right-hand side only involves $a_0, dots, a_(k + 1)$, so the $a_n$ are determined recursively by $f(z_0)$ and $f prime (z_0)$. In particular any solution holomorphic near $z_0$ has these Taylor coefficients, which gives uniqueness near $z_0$.

  By convergence of the power series of $b$ and $c$ near $z_0$ and Problem 9.1, we know that $abs(b_n) <= C_0 M_0^n$ and $abs(c_n) <= C_1 M_1^n$. Let $C_2 = max{C_0, C_1, 1}$ and $M_2 = max{M_0, M_1, 2}$. Thus $abs(b_n), abs(c_n) <= C_2 M_2^n$. Let $A = max{abs(a_0), abs(a_1), 1}$. Then

  $
    abs(a_(k + 2)) & <= 1/ ((k + 2)(k + 1)) sum_(l = 0)^(k) [(l + 1)abs(a_(l + 1)) C_2 M_2^(k - l) + abs(a_l) C_2 M_2^(k - l)] \
    & = (C_2) / (( k + 2) ( k + 1)) sum_(l = 0)^(k) [(l + 1) abs(a_(l + 1)) M_2^(k - l) + abs(a_l) M_2^(k - l)] \
    &= (C_2) / (( k + 2) ( k + 1)) sum_(l = 0)^(k) M_2^(k - l)((l + 1) abs(a_(l + 1)) + abs(a_l) ) \
    &<= (C_2) / (( k + 2) ( k + 1)) sum_(l = 0)^(k) M_2^(k - l)((k + 1) abs(a_(l + 1)) + (k + 1) abs(a_l) ) \
    &= (C_2) / (k + 2) sum_(l = 0)^(k) M_2^(k - l) (abs(a_(l + 1)) + abs(a_l))
  $


  Write $K = C_2 M_2 A$, and note that $C_2, A >= 1$ and $M_2 >= 2$, so $K >= 2$. Taking $k = 0$ in the bound above, $ abs(a_2) <= C_2/2 (abs(a_1) + abs(a_0)) <= C_2/2 dot 2 A = C_2 A <= C_2^2 A^2 = (C_2 A)^2 <= K^2. $

  Taking $k = 1$ and using $abs(a_0), abs(a_1) <= A$ and $abs(a_2) <= (C_2 A)^2$, $ abs(a_3) & <= C_2/3 [ M_2(abs(a_1) + abs(a_0)) + M_2^0 (abs(a_2) + abs(a_1)) ] \
           & <= C_2/3 [M_2 (2 A) + C_2^2 A^2 + A ] \
           & = 1/3 [C_2^3 A^2 + 2 C_2 M_2 A + C_2 A]. $ Each of these terms is a small fraction of $K^3 = C_2^3 M_2^3 A^3$: since $C_2, A >= 1$ and $M_2 >= 2$, we have $C_2^3 A^2 <= K^3 / M_2^3 <= K^3 / 8$, $2 C_2 M_2 A <= 2 K^3 / M_2^2 <= K^3 / 2$, and $C_2 A <= K^3 / M_2^3 <= K^3 / 8$. Thus $ abs(a_3) <= 1/3 (1/8 + 1/2 + 1/8) K^3 = K^3 / 4 <= K^3 = (C_2 M_2 A)^3. $


  We now show by strong induction that $abs(a_k) <= A K^k$ for all $k >= 0$. This holds for $k = 0, 1$ since $abs(a_0), abs(a_1) <= A$ and $K >= 1$ (and for $k = 2, 3$ by the computations above, since $A >= 1$). Suppose $abs(a_k) <= A K^k$ for all $k <= n$, where $n >= 1$. Taking $k = n - 1$ in the general bound, and using $M_2 <= K$, $ abs(a_(n + 1)) & = abs(a_((n - 1) + 2)) \
                 & <= (C_2) / (n + 1) sum_(l = 0)^(n - 1) M_2^(n - 1 - l)(abs(a_(l + 1)) + abs(a_l)) \
                 & <= (C_2) / (n + 1) sum_(l = 0)^(n - 1) M_2^(n - 1 - l)(A K^(l + 1) + A K^l) \
                 & <= (C_2 A) / (n + 1) sum_(l = 0)^(n - 1) K^(n - 1 - l)(K^(l + 1) + K^l) \
                 & = (C_2 A) / (n + 1) sum_(l = 0)^(n - 1) (K^n + K^(n - 1)) \
                 & = (C_2 A n) / (n + 1) (K^n + K^(n - 1)) \
                 & <= 2 C_2 A K^n. $ Since $M_2 >= 2$ and $A >= 1$, we have $K = C_2 M_2 A >= 2 C_2$, so $abs(a_(n + 1)) <= 2 C_2 A K^n <= A K^(n + 1)$, which completes the induction.
]

#problem(num: "9.4")[
  Let $f(z) = sum_(k=0)^oo a_k z^k$ be an entire function and define
  $ P_n (z) = sum_(k=0)^n n! / ((n - k)!) a_k z^k $
  for $n in NN_0$. Show that then $P_n (z \/ n) -> f(z)$ locally uniformly for $z in CC$.
]
#solution[
  Let $ Q_n (z) & = P_n (z/n) \
          & = sum_(k = 0)^(n) a_k (n!) / (n^k (n - k)!) z^k \
          & = sum_(k = 0)^(n) a_k c_n (k) z^k $

  Where $ c_n (k) & = (n!) / (n^k (n - k)!) \
          & = 1/n^k ((n - 0) (n + 1) ... (n - k + 1)) \
          & = product_(j = 0)^(k - 1) (1 - j/n). $

  Note some key properties of $c_n (k)$. $0 = c_(n)(n) <= c_(n)(n - 1) <= ... <= c_(n)(0) = 1$ and for fixed $k$, $c_n (k) ->_(n -> oo) 1$.

  N
]
