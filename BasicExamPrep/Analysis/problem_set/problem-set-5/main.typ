#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Problem Set 5",
  name: "Arham Lodha",
  due: "August 10, 2026",
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

// Problem 1 (Basic Exam, Fall 2015, Carry-over from last Thursday)
#problem("Subadditive Sequences")[
  Let $(a_n)_(n=1)^infinity$ be a sequence of positive real numbers such that
  $ a_(n+m) <= a_n + a_m, quad m, n >= 1. $
  Show that $lim_(n -> infinity) a_n / n$ exists by showing
  $ lim_(n -> infinity) a_n / n = inf_(n >= 1) a_n / n. $

  _Hint._ Treat separately $liminf$ and $limsup$.
]
#solution[
  $
    liminf_(n -> oo) a_n / (n) & = lim_(n -> oo) inf_(k >= n) (a_k) / (k) \
                               & =
  $

]

// Problem 2 (Basic Exam, Fall 2016)
#problem("Equicontinuity and Uniform Convergence")[
  Let $f_n : [0, 1] -> CC$ be a sequence of continuous functions. Suppose $f_n$ converge pointwise. Show that the sequence converges uniformly if and only if the collection of functions ${f_n}$ is equicontinuous.
]
#solution[
  $=>$: Suppose $f_n -> f$ uniformly. Then there exists $N in NN$ such that $forall n >= N$ we have that for all $x in [0, 1]$: $ abs(f_n (x) - f(x)) < epsilon/3. $

  There exists a $delta_f$ such that $abs(f(x) - f(y)) < epsilon/3$ for $abs(y - x) < delta_f$

  Since $f_n$ are continuous functions on compact sets they are uniformly continous. There exists $delta_i$ such that for all $x, y in [0, 1]$ where $abs(x - y) < delta_i$: $abs(f_i (y) - f_i (x)) < epsilon$. Let $ delta = min(min_(i in {1, ..., N - 1}) delta_i, delta_f). $

  Then for all $n >= N$ and $x, y in [0, 1]$ where $d(x, y) < delta$: $ abs(f_n (x) - f_n (y)) <= abs(f_n (x) - f(x)) + abs(f(x) - f(y)) + abs(f(y) - f_n (y)) < epsilon $

  Thus for $delta$, ${f_n}$ is equicontinuous.

  $<==:$ Suppose $f_n -> f$ pointwise and ${f_n}$ is equicontinuous. Thus $forall epsilon > 0$ there exists a $delta > 0$ such that for all $n in NN$ and $abs(x - y) < delta$: $abs(f(y) - f(x)) < epsilon$ .

  // TODO finish

]

// Problem 3 (Basic Exam, Spring 2024)
#problem([Integral Operator on $C([0,1])$])[
  Fix $g in C([0, 1] times [0, 1])$. For a Riemann integrable function $f : [0, 1] -> RR$, define the operator $T$ via
  $ (T f)(x) = integral_0^1 g(x, y) f(y) dif y. $
  #part[
    Prove that the function $T f$ is continuous on $[0, 1]$.
  ]
  #part[
    Show that the set
    $ S = {T f ; f "is Riemann integrable and" sup_(x in [0,1]) |f(x)| <= 1} $
    is precompact (i.e. its closure is compact) in the space $C([0, 1])$ equipped with the uniform metric
    $ d_infinity (f_1, f_2) = sup_(x in [0,1]) |f_1(x) - f_2(x)|. $
  ]
]
#solution[
  *(a)*: Since $g in C([0, 1]^2)$. $forall epsilon > 0$, there exists a $delta > 0$ such that $forall x, y in [0, 1]$ where $d(x, y) < delta$: $ abs(g(x, z) - g(y, z)) < epsilon (integral_0^1 abs(f(z)) dif z)^(-1) $

  $
    abs((T f)(x) - (T f)(y)) & = abs(integral_(0)^(1) g(x, z) f(z) dif z - integral_(0)^(1) g(y, z) f(z) dif z) \
                             & = abs(integral_(0)^(1) [g(x, z) - g(y, z)] f(z) dif z) \
                             & <= integral_(0)^(1) abs(g(x, z) - g(y, z)) abs(f(z)) dif z \
                             & < epsilon
  $

  *(b)*: Let $(T f_n)$ be a sequence in $S$. Note $g$ is a continuous function on a compact set hence is bounded thus $T f$ also bounded in $S$ because $f$ is bounded. Thus $(T f_n)$ is bounded. Then we want to show that $(T f_n)$ is equicontinuous. Then by Ascoli, $(T f_n)$ has a uniformly convergent subsequence hence $A$ is compact by sequential compactness.

  So we need to show that ${T f_n}$ is equicontinuous. We know that $T f_n$ is uniformly continuous for all $n$. By problem 2, the collection is equicontinuous
]

// Problem 4 (Basic Exam, Fall 2015)
#problem("Alternating Series of Continuous Functions")[
  Let $f_n : [-1, 1] -> [0, 1]$ be continuous functions. Assume that for each $x in [-1, 1]$, the sequence $(f_n (x))_(n >= 1)$ is decreasing and
  $ lim_(n -> infinity) f_n (x) = 0. $
  For $n >= 1$ and $x in [-1, 1]$, let
  $ g_n (x) = sum_(m=1)^n (-1)^m f_m (x). $
  Show that $g_n (x)$ converges to some $g(x) in RR$ for all $x in [-1, 1]$, and that the function $g : [-1, 1] -> RR$ thus defined is continuous on $[-1, 1]$.
]
#solution[


]
