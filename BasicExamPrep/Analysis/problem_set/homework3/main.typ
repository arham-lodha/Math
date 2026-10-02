#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Homework 3",
  name: "Arham Lodha",
  due: "August 31, 2026",
)

#problem()[
  Let $a_n >= 0$, $n = 1, 2, 3, dots$, be a sequence such that we have, for some
  $0 < gamma < 1$,
  $ limsup_(n -> oo) (a_(n+1) - gamma a_n) <= 0. $
  Show that $a_n -> 0$ as $n -> oo$.
]

#solution[
  $ S = limsup_(n -> 0) (a_(n + 1) - gamma a_n ) = lim_(n -> 0) sup_(k >= n) (a_(k + 1) - gamma a_k) <= 0. $

  Thus $forall epsilon > 0$, there exists a $N in NN$ such that $forall n >= N$ we have that $ abs(sup(a_(k + 1) - gamma a_k: k >= n) - S) < epsilon/2(1 - gamma) \ S - epsilon(1-gamma) < sup(a_(k + 1) - gamma a_k : k >= n) < S + epsilon/2(1- gamma ) <= epsilon/2(1 - gamma) $

  Thus $forall k >= N$ we have that $ a_(k + 1) - gamma a_k & <= S + epsilon/2(1 - gamma) \
              a_(k + 1) & <= S + gamma a_(k) + epsilon(1 - gamma) <= gamma a_(k) + epsilon/2(1 - gamma) $

  $
    a_(N + k) & <= gamma a_(N + k - 1) + epsilon/2(1 - gamma) \
              & <= gamma (gamma a_(N + k - 2) + epsilon/2(1 - gamma) ) + epsilon/2(1 - gamma) \
              & <= gamma^k a_(N) + epsilon/2(1 - gamma) (sum_(m = 0)^(k - 1) gamma^m) \
              & <= gamma^k a_N + epsilon/2
  $

  Let $K in NN$ such that $gamma^k a_N < epsilon/2$. Thus $forall m >= K + N$,

  $ 0 <= a_m <= epsilon/2 + epsilon/2 = epsilon $.

  Thus $a_n -> 0$.


]

#problem()[
  Let $I subset.eq RR$ be an open interval. We say that a function $f : I -> RR$
  is _convex_ if
  $
    f(lambda x + (1 - lambda) y) <= lambda f(x) + (1 - lambda) f(y),
    quad "for all" x, y in I "and all" lambda in [0, 1].
  $

  #part()[
    Show that for each $x in I$, the one-sided derivatives of $f$,
    $
      f'_r (x) = lim_(y -> x^+) frac(f(y) - f(x), y - x), quad
      f'_ell (x) = lim_(y -> x^-) frac(f(y) - f(x), y - x)
    $
    exist and are finite.
  ]

  #part()[
    Show that if $x_1 < x_2$ are points in $I$, we have
    $
      f'_ell (x_1) <= f'_r (x_1)
      <= frac(f(x_2) - f(x_1), x_2 - x_1)
      <= f'_ell (x_2) <= f'_r (x_2).
    $
  ]

  #part()[
    (Cf.\ with Basic Exam, Fall 2014) Let $f_n : I -> [0, 1]$ be a sequence of
    convex functions. Show that for each compact interval $J subset.eq I$ there
    exists a subsequence converging uniformly on $J$.

    _Hint._ Show first that for all $x < y < z$, $x, y, z in I$,
    $ frac(f(y) - f(x), y - x) <= frac(f(z) - f(x), z - x) <= frac(f(z) - f(y), z - y). $
    Conclude that for every $x in I$, the difference quotient
    $(f(x + h) - f(x)) \/ h$ is an increasing function of $h$ when
    $x + h in I$ and $h != 0$.
  ]
]

#solution[*(a)*
  Let $I = (a, b)$. $forall x, y, z in I$ where $x < y < z$. $y = lambda_0 x + (1 - lambda_0)z = lambda_1 z + (1 - lambda_1)x$.

  $ (f(z) - f(x)) / (z - x) & = (lambda_0 f(z) - lambda_0 f(x)) / (lambda_0 (z - x)) $

  Note the fact that by convexity $ f(y) <= lambda_0 f(x) - lambda_0 f(z) + f(z) & => lambda_0 f(z) - lambda_0 f(x) <= f(z) - f(y) \
              y = lambda_0 x + (1- lambda_0 z) & => lambda_0 z - lambda_0 x = z - y. $

  Thus $ (f(z) - f(x)) / (z - x) <= (f(z) - f(y)) / (z - y). $

  Note by convexity: $ f(y) <= lambda_1 f(z) - lambda_1 f(x) + f(x) & => f(y) - f(x) <= lambda_1 f(z) - lambda_1 f(x) \
               y = lambda_1 z - lambda_1 x + x & => y - x = lambda_1 z - lambda_1 x $

  Thus $ (f(z) - f(x)) / (z - x) = (lambda_1 (f(z) - f(x))) / (lambda_1 (z - x)) >= (f(y) - f(x)) / (y - x). $

  Thus note that $ g_x (h) = (f(x + h) - f(x)) / (h) $ is a increasing function for $h in (a - x, b - x) inter (RR\/{0})$. Thus for $0 < h_1 <= h_2$ we have that $g_x (h_1) <= g_x (h_2)$, similarly for $h_2 <= h_1 < 0$ we have that $g_x (h_2) <= g_x (h_1)$. Thus by Monotone Convergence Theorem: $ f_r prime (x) & = lim_(h -> 0^+) g_x (h) \
  f_l prime (x) & = lim_(h -> 0^-) g_x (h) $ exists.

  *(b)*: Note that we know that $g_x (h)$ is a montonic increasing function when $h != 0$, thus for $h > 0$
  $ g_x (-h) < g_x (h) => f_l prime (x) = lim_(h -> 0^+) g_x (-h) <= lim_(h -> 0^+) g_x (h) = f_r prime (x) $

  Let $y in I$ such that $y > x$ and $h_0 = y - x$. We know that since $g_x$ increasing in $h$, $ f_r prime (x) <= g_x (h_0). $ Furthermore since $g_y$ increasing in $h$, we know that $ f_l (y) <= g_y (-h_0). $

  Thus we have the set of inequalities in the statement.

  *(c)*: $J$ is a compact interval so $J = [a, b]$ where $c < a <= b < d$ where $I = (c, d)$. $exists c prime in (c, a)$ and $d prime in (b, d)$. Then we know that $forall x, y in J$ where $y > x$: $ (f_n (x) - f_n (c prime)) / (x - c prime) <= (f_n (y) - f_n (x)) / (y - x) <= (f_n (y) - f_n (c prime)) / (y - c prime) $ Furthermore note that $ (f_n (y) - f_n (c prime)) / ( y - c prime) <= (f_n (d prime) - f_n (y )) / (d prime - y ). $

  Thus $ (-1) / (a - c prime) = (-1) / (x - c prime) <= (f_n (y) - f_n (x)) / (y - x) <= (1) / (d prime - y) = 1/(d - b). $

  Let $ L = max(abs((-1) / (a - c prime)), abs(1/(d - b))). $

  Thus $ abs(f_n (y) - f(x)) <= L abs(y - x). $

  Thus $f_n$ is continous and all have the same lipshitz constant. Furthermore Because they are lipshitz, they are equicontinous. $forall epsilon > 0$, let $delta = (epsilon)/(2 L)$ thus $ abs(f(y) - f(x)) <= L abs(y - x) < epsilon/2 < epsilon $ for $abs(y - x) < delta$. By Arzela Ascoli, there exists a subsequence of $f_n$ which converge uniformly on $J$.
]

#problem()[
  (Basic Exam, Spring 2018). Consider a sequence $(x_n)_(n=1)^oo$ defined
  recursively by
  $ x_(n+1) = sin(x_n), quad n = 1, 2, dots, quad x_1 = 1. $
  Show that $lim_(n -> oo) sqrt(n) x_n$ exists and compute its value.

  _Hint._ Show that $display(1/x_(n+1)^2 - 1/x_n^2)$ converges to a constant.
]

#lemma(name: "Average of sequence")[
  Let $a_n >= 0$ sequence where $a_n -> L$ then $ (sum_(k = 1)^(n) a_k) / (n) ->_(n -> oo) L $
]
#proof[
  $forall epsilon > 0$, there exists a $N_0 in NN$ such that $forall n >= N_0$ we have that $ abs(a_n - L) < epsilon/2. $ Furthemore note that $exists N_1 in NN$ such that $forall n >= N_1$ there $1/n < epsilon/(2 sum_(k = 1)^(N_0 - 1) abs(a_k - L)).$ For all $n >= max(N_0, N_1)$ we have the following:

  $
    abs(1/n sum_(k = 1)^(n) a_k - L) & = 1/n abs(sum_(k = 1)^(n) (a_k - L)) \
                                     & <= 1/n sum_(k = 1)^(N_0 - 1) abs(a_k - L) + 1/n sum_(k = N_0)^(n - N_0) abs(a_k - L) \
                                     & < epsilon/2 + (n - N_0) / (n) epsilon/2 < epsilon.
  $


  Thus $ lim_(n -> oo) (sum_(k - 1)^(n) a_k) / (k) = L $




]

#solution[$x_1 = 1$. Assume that $x_(n) in [0, 1]$. Then $x_(n + 1) in [0, 1]$ because $sin([0, 1]) subset [0, 1]$. Furthermore $sin(x)$ is concave down so $x >= sin(x)$ hence $x_n >= x_(n + 1)$. Thus $x_(n)$ is a montonic sequence bounded below by 0, thus the limit exists. Let $L = lim_(n -> oo) x_n.$ Then since $sin$ is continuous, $sin(L) = lim_(n -> oo) sin(x_n) = lim_(n -> oo) x_(n + 1) = L => L = 0$ since $L in [0, 1]$.
  $
    lim_(n -> oo) ((1) / (x_(n + 1)^2) - (1) / (x_(n)^2)) &= lim_(n -> oo) (x_n^2 - x_(n + 1)^2 ) / (x_n^2 x_(n + 1)^2) \ & = lim_(n -> oo) (x_(n)^2 - sin^2(x_(n))) / (x_n^2 sin^2(x_n)) \
    & = lim_(n -> oo) (x_n^2 - (x_(n) - 1/6 x_n^3 + O(x_n^5))^2) / (x_n^2 (x_n^2 - O(x_n^(3) ))^2) \
    & = lim_(n -> oo) (1/3 x^4 + O(x^6)) / (x_n^4 + O(x^6)) = 1/3
  $

  Then by the lemma above we know that $ 1/3 &= lim_(n -> oo) (1/n sum_(k = 1)^(n ) ((1) / (x_(k + 1)^2) - 1/(x_(k)^2 )) ) \ &= lim_(n -> oo) ((1) / (n x_(n + 1)^2) - 1/n) => 1/3 = lim_(n -> oo) (1/(n x_(n + 1)^2)) = lim_(n -> oo) (1/(n x_(n + 1)^2 ) + 1/n) - lim_(n -> oo)(1/n). $

  Furtermore note that $ lim_(n -> oo) (n) / (n + 1) = 1 => lim_(n -> oo) (1) / ((n + 1) x_(n + 1)^2) = 1/3 = lim_(n -> oo) (1) / (n x_n^2 ) $


  $ 3 = 1/(lim_(n -> oo) (n x_n^2)^(-1) ) => 3 = lim_(n -> oo) (((n x_n)^(-1))^(-1)) = lim_(n -> oo) (n x_n^2) $

  Note that $sqrt(dot)$ is continous on $[0, oo)$. Thus $ sqrt(3) = sqrt(lim_(n -> oo) n x_n^2) & = lim_(n -> oo) sqrt(n) x_n^2 $
]

#problem()[
  (Basic Exam, Spring 2014). Assume that
  $ [0, 1] = union.big_(n=1)^oo I_n, $
  where $I_n = [a_n, b_n] != emptyset$ and $I_n inter I_m = emptyset$ whenever
  $n != m$.

  #part()[
    Let $E = {a_n ; n >= 1} union {b_n ; n >= 1}$ be the set of endpoints of
    the intervals above. Prove $E$ is closed.
  ]

  #part()[
    Prove no such family of intervals $(I_n)$ can exist.
  ]
]

#solution[
  *(a)*: $forall x in [0, 1] - E$, $exists ! n in NN$ such that $x in [a_n, b_n]$. Let $delta = 1/2 min(b_n - x, x - a_n)$. Then $U_x = (x - delta, x + delta) subset [a_n, b_n]$ but $a_n, b_n in.not U_x$. Note the following since $I_n inter I_m = emptyset$ when $m != n$. $U_x$ is not in any other interval. Thus $U_x in.not E$. Hence $U_x in [0, 1] - E$. Hence $[0, 1] - E$ is open hence $E$ is closed.

  *(b)*: Let $b_n < 1$. $forall epsilon in (0, 1 - b_n)$, $(b_n, b_n + epsilon) subset [0, 1]$.

  1. Case $1$: $(b_n, b_n + epsilon) subset [a_m, b_m]$ for $a_m > b_n$. This is a contradiction because that means $b_n in I_m$ which means $I_m inter I_n != emptyset$. Thus $(b_n, b_n + epsilon)$ is not contained in a single interval.
  2. Case $2$: There exists $I_(m_1), ..., I_(m_k)$ such that $I_(m_i) inter I_n = emptyset$ where $(b_n, b_(n) + epsilon) subset union_(i = 1)^k I_m_(i) = U$. A similar contradiction to 1 occurs as above as the finite union of closed intervals is a closed interval hence $b_n in U$ contradicting the pairwise disjoint assumption.
  3. Case $3$: There exists a infinite collection ${I_(m_k)}_(k = 1)^(oo )$ such that $(b_n, b_n + epsilon)$ is a subset of $union.big_(k = 1)^(oo) I_(m_k)$. Thus $ b_n = lim_(k -> oo) a_(m_k) = lim_(k -> oo) b_(m_k) $

  Hence $b_n$ is a limit point in $E$. By a similar argument $a_n > 0$ would be a limit point in $E$. Note the following $0$ must be covered so it must be the endpoint of some interval $[0, b_k]$, thus the interior is completely contained in $I_k$. Thus $0$ and similarly 1 is a isolated point in $E$. Take $E prime = E - {0, 1}$ (removal of 2 isolated points from a closed set is still closed). Thus each point in $E prime$ is a limit point. Thus $E prime$ is a closed set where each element of the set is a limit point of the set.  $E prime = {a_n : n in NN, a_n > 0} union {b_n : n in NN, b_n < 1} => E prime$ countable. Since $E prime$ closed hence it is complete. $ E prime = union.big_(n in NN \ a_n != 0) {a_n} union union.big_(n in NN \ b_n != 1) {b_n}. $ The singletons are nowhere dense.  By the Baire Category theorem, a complete metric space cannot be the countable union of nowhere dense sets, hence a contradiction occurs and $E prime$ and hence $E$ must be uncountable. But that means $[0, 1]$ cannot be the union of countable pairwise disjoint intervals, and must be the union of uncountable such intervals.
]

#problem()[
  (Basic Exam, Spring 2016). Suppose $f : [0, 1] -> RR$ is a continuously
  differentiable function. Show that the limit
  $ lim_(n -> oo) lr((sum_(k=0)^(n-1) f lr((k/n)) - n integral_0^1 f(x) dif x)) $
  exists and compute its value.
]

#solution[
  We have the following equalities. Note the fourth equality comes from Taylor's Theorem.

  $
    sum_(k = 0)^(n - 1) f(k/n) - n integral_0^1 f(x) dif x &= n[sum_(k = 0)^(n - 1) f(k/n) 1/n - integral_0^(1) f(x) dif x] \
    &= n [sum_(k = 0)^(n - 1)(f(k/n) 1/n - integral_(0)^(1/n) f(x + k/n) dif x ) ] \
    &= n [sum_(k = 0)^(n - 1) integral_0^(1/n) (f(k/n) - f(x + k/n)) dif x ] \
    &= -n [sum_(k = 0)^(n - 1) integral_0^(1/n) (f prime (k/n) x + integral_0^(x) (x - t) f prime prime (t) dif t) dif x ] \
    &= -1/2n [sum_(k = 0)^(n - 1) 1/n^2 f prime (k/n) + integral_0^(1/n) integral_0^x (x - t) f prime prime (t) dif t dif x ] \
    &= -1/2 sum_(k = 0)^(n - 1) 1/n f prime (k/n) -n/2 integral_0^(1/n) integral_0^x (x - t) f prime prime (t) dif t dif x \
  $

  Note that $ abs(n/2 integral_0^(1/n) integral_0^x (x - t)f prime prime (t) dif t dif x) & <= (1) / (12n^2) norm(f prime prime)_oo $


  Thus we have:

  $
    abs((sum_(k = 0)^(n - 1) f(k/n) - n integral_0^1 f(x) dif x ) - (f(0) - f(1)) / (2)) &<= 1/2abs(sum_(k = 0)^(n - 1) 1/n f prime (k/n) - integral_0^1 f prime (x) dif x) + 1/(12 n^2) norm(f prime prime)_(oo)
  $

  $f$ is a continous function on a compact interval and hence is Riemann Integrable on the interval. Thus $exists N_0 in NN$ such that for all $n >= N_0$ $ abs(sum_(k = 0)^(n - 1) 1/n f(k/n) - integral_0^1 f prime (x) dif x) < epsilon. $

  $exists N_1 in NN$ such that for all $n >= N_1$ $ (norm(f prime prime)_(oo) ) / (12 n^2) < epsilon/2 $

  Thus $forall n >= max(N_0, N_1)$ we have that $ abs((sum_(k = 0)^(n - 1) f(k/n) - n integral_0^1 f(x) dif x ) - (f(0) - f(1)) / (2)) < epsilon. $

  Thus $ lim_(n -> oo) (sum_(k = 0)^(n - 1) f(k/n) - n integral_0^1 f(x) dif x) = (f(0) - f(1)) / (2) $


]

#problem()[
  (Basic Exam, Spring 2023). Let $epsilon > 0$ and let $f$ be a continuous
  function on $[0, pi/2]$ such that $f(pi/2) = 0$ and
  $ abs(f(x)^2 + sin x med f(x)) <= epsilon^2, quad "for all" 0 <= x <= pi/2. $
  Show that for small enough $epsilon > 0$,
  $ max_(0 <= x <= pi/2) abs(f(x)) <= 3 epsilon. $
]

#solution[For all $x in [0, pi/2]$ we have
  $ abs(f(x))abs(f(x) + sin (x)) = abs(f(x)^2 + sin(x) f(x)) <= epsilon^2 $

  Thus $ f(x) in [-epsilon, epsilon] union [-sin x - epsilon, -sin x + epsilon] = I_1 union I_2 (x). $

  Note that $I_1 (x) inter I_2 (x) = emptyset <=> sin x > 2 epsilon$. Thus for $sin x >> epsilon$, $f(x)$ must fall cleanly in one and not the other. Let $x_0 in [0, pi /2]$ be the unique point such that $sin(x_0) = 2 epsilon$. Thus $sin ([0, x_0]) subset [0, 2 epsilon]$ and then $sin((x_0, pi/2]) subset (2 epsilon, 1]$.

  1. $x in [0, x_0]$: Thus $I_1 inter I_2 (x) != emptyset$. Thus $f(x) in [-sin (x) - epsilon, epsilon] subset.eq [- 3 epsilon, 3 epsilon ].$ Thus $abs(f (x)) <= 3 epsilon$.
  2. $x in (x_0, pi/2]$. Let $E = {x in (x_0, pi/2] : f(x) in I_1}$. $pi/2 in E$.

    1. *Closed*: $f$ is continous. $E = f^(-1)([ - epsilon, epsilon]) inter (x_0, pi/2]$ hence $E$ is closed in $(x_0, pi/2]$.
    2. *Open*: Let $x in E$. $x > x_0$ thus $d(x) = sin(x) - 2 epsilon > 0$ the distance between $I_1$ and $I_2 (x)$. $f(x) > -epsilon$ by assumption. $exists delta_0 > 0$ such that $ abs(sin(x) - sin(y)) < (d(x)) / (3) => sin(y) > sin(x) - d(x) / 3. $ By continuity of $f$, $exists delta_1 > 0$ such that $abs(f(x) - f(y)) < 2/3(d(x))$.

  Let $delta = min(delta_1, delta_2, x - x_0)$. Let $y in (x - delta, x + delta)$

  Assume for contradiction $f(y) in I_2 (y)$. Thus $ f(y) <= -sin(y) + epsilon. $ Thus $ f(x) - f(y) & >= sin(y) - 2 epsilon \
              & > sin(x) - (d(x)) / (3) - 2 epsilon \
              & = sin(x) - 2 epsilon - 1/3(sin(x) - 2x) = 2/3(sin(x) - 2 epsilon ) = 2/3 d(x) > 0 $

  But we know that $ abs(f(x) - f(y)) < 2/3 d(x). $ Thus we have a contradiction, and $f(y) in I_1$. Hence $(x - delta, x + delta) subset.eq E$. Thus $E$ is open.


  Thus $E subset.eq ( x_0, pi /2]$ is a nonempty subset which is both open and closed in $(x_0, pi / (2)]$hence by connectedness $E = (x_0, pi/2]$. Thus for $x in (0, pi /2]$ we have that $abs(f(x)) < epsilon < 3 epsilon$. Thus $ max_(0 <= x <= pi /3) f(x) < 3 epsilon $
]
