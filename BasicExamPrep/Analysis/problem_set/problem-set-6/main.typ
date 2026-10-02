#import "template.typ": *

#show: homework.with(
  course: "bootcamp",
  assignment: "Problem-Set-6",
  name: "Arham Lodha",
  due: "August 11, 2026",
)

// ── Usage ────────────────────────────────────────────────────────────────────
//
//  Basic problem:
//    #problem[
//      State the problem here.
//    ]
//
//  Problem with a title:
//    #problem("Lagrange's Theorem")[
//      State the problem here.
//    ]
//
//  Sub-parts (lettered a, b, c, ...):
//    #problem[
//      Prove the following:
//      #part[First sub-part.]
//      #part[Second sub-part.]
//    ]
//
//  Solution block (shaded, left-bar):
//    #solution[
//      Write your solution here.
//      Use $inline math$ or $ display math $ as needed.
//    ]
//
//  Full example:
//    #problem("Cauchy's Theorem")[
//      If $p mid(|) abs(G)$, show $G$ has an element of order $p$.
//      #part[Reduce to the case $G$ abelian.]
//      #part[Handle the abelian case by induction.]
//    ]
//    #solution[
//      *(a)* ...
//      *(b)* ...
//    ]
// ─────────────────────────────────────────────────────────────────────────────

// Problem 1 (Basic Exam, Fall 2015, Carry-over from yesterday)
#problem("Subadditive Sequences")[
  Let $(a_n)_(n=1)^infinity$ be a sequence of positive real numbers such that
  $ a_(n+m) <= a_n + a_m, quad m, n >= 1. $
  Show that $lim_(n -> infinity) a_n / n$ exists by showing
  $ lim_(n -> infinity) a_n / n = inf_(n >= 1) a_n / n. $

  _Hint._ Treat separately $liminf$ and $limsup$.
]
#solution[

]

// Problem 2 (Basic Exam, Fall 2015, Carry-over from yesterday)
#problem("Alternating Series of Continuous Functions")[
  Let $f_n : [-1, 1] -> [0, 1]$ be continuous functions. Assume that for each $x in [-1, 1]$, the sequence $(f_n (x))_(n >= 1)$ is decreasing and
  $ lim_(n -> infinity) f_n (x) = 0. $
  For $n >= 1$ and $x in [-1, 1]$, let
  $ g_n (x) = sum_(m=1)^n (-1)^m f_m (x). $
  Show that $g_n (x)$ converges to some $g(x) in RR$ for all $x in [-1, 1]$, and that the function $g : [-1, 1] -> RR$ thus defined is continuous on $[-1, 1]$.
]
#solution[

  By Dini's Theorem: $f_n -> 0$ uniformly.

  By the alternating series test. $g_n (x) -> g(x)$ pointwise for all $[-1, 1]$. $forall epsilon > 0$, there exists a $N in NN$ such that $forall n >= N$: $norm(f_n)_(oo) < epsilon/3$ for all $x in [-1, 1]$. By the alternating series estimation theorem:

  $ abs(g_n (x) - g (x)) <= abs(g_(n + 1)(x) - g_n (x)) = f_(n + 1)(x) < epsilon. $

  Since $f_N$ is continuous, $exists delta > 0$ such that $abs(f_N (x) - f_N (y)) < epsilon/3$ if $abs(x - y) < delta$.
  $forall x, y in [-1, 1]$ if $d(x, y) < delta$:

  $ abs(g(x) - g(y)) & <= abs(g(x) - f_N (x)) + abs(f_N (x) - f_N (y)) + abs(f_N (y) - g(y)) < epsilon. $ Thus $g$ is continous.



]

// Problem 3
#problem[
  Let $(X, d_X)$ be a compact metric space.
  #part[
    Show that
    $ d_Y (f, g) = sum_(n in ZZ) 2^(-abs(n)) d_X (f(n), g(n)) $
    defines a metric on $Y = {f : ZZ -> X}$.
  ]
  #part[
    Show that $(Y, d_Y)$ is compact.
  ]
]
#solution[

  *(a)*: $forall f in Y$: $forall n in ZZ$, $d_Y (f(n), f(n)) = 0$ thus $ d_Y (f, f) = sum_(n in ZZ)^() 2^(-abs(n)) d_X (f(n), g(n)) = 0. $ Naturally positive and symmetric.

  $forall f, g, h in Y$:

  $
    d_Y (f, g) & = sum_(n in ZZ)^() 2^(- abs(n)) d_X (f(n), g(n)) \
               & <= sum_(n in ZZ)^() 2^(- abs(n)) [d_X (f(n), h(n)) + d_X (h(n), g(n)) ] = d_Y (f, h) + d_Y (h ,g)
  $


  *(b)*: Let $(f_n)_(n = 0)^(oo)$ be a sequence in $Y$. Let $ZZ = {z_1, z_2, ...}$ be an enumeration of $ZZ$. We will do a diagonalization argument to get a subsequence.

  Let $g_n^0 = f_n$. $(g_n^(0) (z_1))_(n = 1)^(oo)$ is a sequence in $X$, and by compactness of $X$, there exists a subsequence $(g^1_n)_(n in NN)$ such that $(g_n^1 (z_1))_(n in NN)$ is convergent. Inductively create $g^i_n$ such that $g^i_n$ is a subsequence of $g^(i - 1)_n$ and converges pointwise on ${z_1, ..., z_i}$.

  Let $h_n = g^n_n$. The tail of $h_n$ is a subsequence of $g^n$ and hence converges on ${z_1, ..., z_n}$. Hence $h_n$ has pointwise convergence on $ZZ$.

  $forall epsilon > 0$: There is a $epsilon/3$-net on $X$.

  $ d(h_n (n), h(n)) <= d(h_n (n), c_i) + d(c_i, h(n)) $

]

// Problem 4 (Basic Exam, Fall 2014)
#problem("Increasing Functions and Uniform Convergence")[
  Let $f_n : [0, 1] -> RR$ be increasing continuous functions. Assume that $f_n$ converge pointwise to a continuous function $f : [0, 1] -> RR$. Prove that $f_n$ converge uniformly to $f$.
]
#solution[
  Since $[0, 1]$ is compact, $f_n$ and $f$ are uniformly continuous.
  $forall epsilon > 0$, there exists a $delta > 0$ such that $forall x, y in [0, 1]$ where $0 < x - y < delta$ implies that $0 < f(x) - f(y) < epsilon$. By total boundedness of $[0, 1]$, There exists $0 <= a_1 < a_2 < ... < a_n <= 1$ such that $ [0,1] = union.big_(i = 1)^(n) B_(delta/2)(a_i). $ Note $a_(i - 1) - a_i < delta$. $forall i in {1, ..., n}$, $exists N_i in NN$ such that for all $m >= N$: $abs(f_m (a_i) - f(a_i)) < epsilon$. Let $N = max{N_i : 0 <= i <= n}.$ $forall x in [0, 1]$ there exists a $i in {1, ..., n}$ such that $x in [a_i, a_(i + 1)]$.
  $f$ is a increasing continous function.
  By monotonicity, we have that $forall m in NN$,

  $ f_m (a_i) <= f_m (x) <= f_m (a_(i + 1)) $

  For $m >= N$: $f_m (a_i) - f(a_i) > - epsilon => f(a_i) - epsilon < f_m (a_i)$. Similarly we see $f_m (a_(i + 1)) < f(a_(i + 1)) + epsilon$. Thus $ f(a_(i)) - epsilon <= f_m (x) <= f(a_(i + 1) ) + epsilon. $

  Thus $ forall m >= N $:

  $
    abs(f_m (x) - f(x)) & = abs(f_m (x) - f(a_i) + f(a_i) - f(a_(i + 1)) + f(a_(i + 1)) - f(x)) \
                        & <= abs(f_m (x) - f(a_(i + ) )) + abs(f(a_(i + 1)) - f(a_i)) + abs(f(a_i) - f(x)) \
                        & < epsilon + epsilon + epsilon = 3 epsilon
  $
]

// Problem 5 (Basic Exam, Spring 2015)
#problem([Hölder Continuous Functions])[
  Let $f : [0, 1] -> RR$. We say that $f$ is Hölder continuous of order $alpha in (0, 1)$ and write $f in C^alpha ([0, 1])$ if
  $
    norm(f)_(C^alpha) := sup{abs(f(x)) ; x in [0, 1]} + sup lr({frac(abs(f(x) - f(y)), abs(x - y)^alpha) ; x, y in [0, 1], x != y}) < infinity.
  $
  For $f, g in C^alpha ([0, 1])$, define $d(f, g) = norm(f - g)_(C^alpha)$.
  #part[
    Show that $(C^alpha ([0, 1]), d)$ is a complete metric space.
  ]
  #part[
    Let $(f_n)$ be a sequence in $C^(1\/2) ([0, 1])$ such that $norm(f_n)_(C^(1\/2)) <= 1$ for $n = 1, 2, dots$ Show that $(f_n)$ has a subsequence that converges in $C^(1\/3) ([0, 1])$.
  ]
]
#solution[

]
