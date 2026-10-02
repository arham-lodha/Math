#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Problem Set 12",
  name: "Arham Lodha",
  due: "August 20, 2026",
)
#problem("Basic Exam, Spring 2016")[
  For $a < b$ real numbers and $f : [a, b] -> RR$ a function, do as follows:

  #part[
    Define what it means for $f$ to be Riemann integrable on $[a, b]$.
  ]

  #part[
    Let ${x_n}_(n=1)^oo subset.eq [a, b]$ be a sequence such that
    $lim_(n -> oo) x_n$ exists and suppose that $f : [a, b] -> RR$ is defined by
    $
      f(x) = cases(1 "," & "if" x in.not {x_n}_(n=1)^oo",", 0 "," & "else.")
    $
    Using your definition, prove that $f$ is Riemann integrable on $[a, b]$.
  ]
]

#solution[
  *(a)*: $P subset [a, b]$ is a *partition of $[a, b]$* if $P = {x_1, ..., x_n}$ where $a = x_1 <= x_2 <= ... <= x_n = b$. Let $ U(f, P) & = sum_(i=1)^(n - 1) (x_(i + 1) - x_i) (sup_(x in [x_i, x_(i + 1)]) f(x) ) \
  L(f, P) & = sum_(i=1)^(n - 1) (x_(i + 1) - x_i) (inf_(x in [x_i, x_(i + 1)]) f(x) ) \
     L(f) & := sup_(P "partition") L(f, P) \
     U(f) & := inf_(P "partition") U(f, P) $

  $f$ is Riemann integrable if and only if $forall epsilon > 0$ there exists a $P$ such that $ abs(L(f, P) - U(f, P)) < epsilon $

  *(b)*: Let $z = lim_(n -> oo) x_n$.
  $forall epsilon > 0$. There exists a $N in NN$ such that $n >= N => abs(x_n - z) < epsilon/2$. Let $I = [z - epsilon/2, z + epsilon/2] = [s, t]$. Let $I_k (nu) = [x_k - nu, x_k + nu]$. Without loss of generality for $x_m != x_n$ for $m,n in {1, ..., N}$ and $x_m in I$. Let $nu in (0, epsilon/(2 (N)))$ small enough such that $I_m (nu) inter I_n (nu) = emptyset$ and $I_n (nu) inter I = emptyset$. Again without loss of generality we will order the $x_i$ and $x < x_i$. Note the following:

  $
    sup_(x in I_k (nu)) f(x) & = 1 & = sup_(x in I) f(x) \
    inf_(x in I_k (nu)) f(x) & = 0 & = inf_(x in I) f(x)
  $

  Thus only intervals whcih matter are $I$, $I_k (nu)$
  $
    abs(L(f, P) - U(f, P)) & <= abs(epsilon + 2 N nu) \
                           & = epsilon + epsilon = 2 epsilon
  $
]

#problem("Basic Exam, Spring 2025")[
  Let ${f_n}$ and ${g_n}$ be sequences of Riemann integrable functions
  $[0, 1] -> RR$ such that

  + There exists $C > 0$ such that
    $ integral_0^1 |g_n (x)| dif x <= C, quad n = 1, 2, dots $
  + $f_n$ converges uniformly to $f$ on $[0, 1]$.
  + For all $n in NN$, $lim_(m -> oo) integral_0^1 |f_n (x) g_m (x)| dif x = 0$.

  Show that
  $ lim_(m -> oo) integral_0^1 f(x) g_m (x) dif x = 0. $
]

#solution[$forall epsilon > 0$:

  By uniform convergence of $f_n -> f$, we have that $exists N$ such that for all $n >= N$ we have that $norm(f - f_n)_(oo) < epsilon/2C$

  $
    abs(integral_0^1 f(x) g_m (x) dif x - integral_(0)^1 f_n (x) g_m (x) dif x) &= abs(integral_0^1 (f(x) - f_n (x)) g_m (x) dif x) \ &<= integral_0^1 abs(f(x) - f_n (x)) abs(g_m (x)) dif x \ &<= norm(f - f_n)_(oo) integral_0^1 g_m (x) dif x \ &<= C norm(f - f_oo) < epsilon/2
  $

  By assumption 3, there $exists M in NN$ such that $forall m >= M$ we have that $ integral_0^1 abs(f_n (x) g_m (x)) dif x < epsilon/2 $
  $
    abs(integral_0^1 f(x) g_m (x) dif x) & < epsilon/2 + abs(integral_0^1 f_n (x) g_m (x) dif x) \
                                         & <= epsilon/2 + integral_0^1 abs(f_n (x) g_m (x)) dif x \
                                         & < epsilon.
  $

  Thus $ lim_(n -> oo) integral_0^1 f(x) g_(m) (x) dif x = 0 $

]

#problem("Basic Exam, Spring 2024")[
  Let $f : [0, 1] -> (0, oo)$ be a continuous function and let
  $ M = sup_(x in [0,1]) f(x). $
  Show that
  $ lim_(n -> oo) lr((integral_0^1 (f(x))^n dif x))^(1\/n) = M. $
]

#solution[
  $
    abs(1/n log(integral_0^1 (f(x))^n dif x) - log(M)) & = abs(1/n log(1/M^n integral_0^(1) f(x)^n dif x)) \
                                                       & = 1/n abs(log(1/M^n integral_0^(1) (f(x))^n dif x)) \
                                                    <=
  $

  $ integral_0^1 (f(x))^n dif x & <= M^n $
  Thus the sequence $ x_n & = (integral_0^1 (f(x))^n dif x )^(1/n) <= M => limsup_(n -> oo ) x_n <= M $

  By compactness there exists a $x in [0, 1]$ such that $f(x) = M$. $forall epsilon > 0$, by continuity $exists delta > 0$ such that $forall y in (x - delta, x + delta)$ where $f(y) >= M - epsilon$.

  $
    (integral_0^(1) (f(x))^n dif x)^(1/n) &= (integral_(0)^(x - delta) (f(x))^(n) dif x + integral_(x - delta)^(x + delta) (f(x))^n dif x + integral_(x + delta)^(1) (f(x))^n dif x)^(1/n) \
    &>= (integral_(0)^(x - delta) (f(x))^(n) dif x + (2 delta) (M - epsilon)^(n) + integral_(x + delta)^(1) (f(x))^n dif x)^(1/n) \ &>= (2 delta)^(1/n) (M - epsilon)
  $

  Note that $ liminf_(n -> oo) (2 delta)^(1/n) = lim_(n -> oo) (2 delta)^(1/n) = 1. $ Thus $ liminf_(n -> oo)(integral_0^1 (f(x))^n dif x)^(1/n) & >= liminf_(n -> oo ) ((2 delta)^(1/n) (M - epsilon)) \
                                                      & = (M - epsilon) $

  Since this is true for all $epsilon > 0$, we can take the limit as $epsilon -> 0^+$ which tells us that $ liminf (integral_0^(1) (f(x))^n )^(1/n) >= M $

  Thus $ M <= liminf_(n -> oo ) x_n <= liminf_(n -> oo ) x_n <= M => lim_(n ->oo ) (integral_0^1 (f(x))^n dif x)^(1/n) $


]
