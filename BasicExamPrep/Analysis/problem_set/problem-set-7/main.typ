#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Problem Set 7",
  name: "Arham Lodha",
  due: "August 12, 2026",
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

// Problem 1 (Carry-over from yesterday, Basic Exam, Spring 2015)
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
#solution[*(a)*: Suppose $(f_n)_(n = 1)^(oo)$ is a Cauchy Sequence of functions in $C^alpha ([0, 1])$. $forall epsilon > 0$ there exists a $N in NN$ such that $m >= n >= N$ we have $norm(f_n - f_m)_(C^(alpha)) < epsilon$. $forall x in [0, 1]$, $ abs(f_n (x) - f_m (x)) < norm(f_n - f_m)_(C^alpha) < epsilon $

  Thus the sequence $(f_n (x))_(n = 1)^(oo)$ is Cauchy in $RR$. By completeness of $RR$, the limit exists. Let $f: [0, 1] -> RR$ where $ f(x) = lim_(n -> oo) f_n (x). $






  1. $f_n -> f$ with respect to $norm(dot)_(C^(alpha))$: $forall epsilon > 0$, there exists $N in NN$ such that for $m >= n >= N$ we have that $norm(f_n - f_m)_(C^(alpha)) < epsilon/4 => norm(f_n - f_m)_(oo) < epsilon/4$. Thus $forall x in [0, 1]$,

  $ abs(f_n (x) - f(x)) = lim_(m -> oo) abs(f_n (x) - f_m (x)) <= epsilon/4 $

  Thus $norm(f_n - f)_(oo) < epsilon/4.$  $norm(f_n - f_m)_(C^(alpha)) < epsilon/4$ also gives us that for $x, y in [0, 1]$ where $x != y$ $ (abs(f_(n)(x) - f_(m) (x) - f_(n)(y) + f_(m)(y)) ) / (abs(x - y)^(alpha)) <= epsilon/4. $

  Thus do the same thing as above and we can bound the secants of $f_n - f$. Thus $forall n >= N$ we have that $ norm(f_n - f)_(C^(alpha)) <= epsilon/4 + epsilon/4 = epsilon/2 < epsilon. $

  2. $f in C^(alpha)([0, 1]):$ Since $f_n -> f$ with respect to the $norm(dot)_(C^(alpha))$, there exists a $N$ such that $norm(f_N - f)_(C^(alpha) ) < 1.$ $ norm(f)_(C^(alpha)) <= norm(f_N)_(C^alpha) + norm(f_N - f)_(C^(alpha) ) < norm(f_N)_(C^(alpha)) + 1 < oo. $


  *(b)*: We want to first show that $f_n in C^(alpha)([0, 1])$ for all $n in NN$ for $alpha <= 1/2$. To do this we need to show that $x, y in [0, 1]$ where $x != y$

  $ abs(f(x) - f(y)) / (abs(x - y)^(1/2) ) < 1 => (abs(f(x) - f(y))) / (abs(x - y)^(alpha)) < 1 $

  Note the following for $x, y in [0, 1]$, $0 <= abs(x - y) <= 1$. Thus $abs(x - y)^(p_1) > abs(x - y)^(p_2)$ if $p_1 < p_2$. Thus $ (abs(f(x) - f(y))) / (abs(x - y)^(alpha)) < (abs(f(x) - f(y))) / (abs(x - y)^(1/2) ) <= 1. $

  Thus $f_n in C^(alpha)([0, 1]).$

  Note the following about the sequence. $forall n in NN$, $forall x, y in [0, 1]$ where $x != y$ we have that $ abs(f_n (x) - f_n (y)) / (abs(x - y)^(1/2)) <= 1 => abs(f_n (x) - f_n (y)) <= abs(x - y)^(1/2). $ Thus for $epsilon > 0$ and for all $n in NN$, we have that if $delta =epsilon^2$ then for $abs(x - y) < delta$ we have that $ abs(f_(n) (x) - f_(n) (y)) <= abs(x - y)^(1/2) < ( epsilon^2 )^(1/2) = epsilon. $ Thus ${f_n}_(n = 1)^(oo)$ is a equicontinous sequence. $f_n$ also bounded above by 1. Thus by Arzela Ascoli, there exists a subsequence which converges uniformly in $C([0, 1])$. $f_n -> f$ in $C([0, 1])$ means its uniformly cauchy. Thus $forall epsilon$ there exists a $N in NN$ such that for all $m >= n >= N$ we have that $ 2norm(f_n - f_m)^(1 - 2 alpha) < epsilon/4 $

  $
    abs((f_(m) - f_(n))(x) - (f_m (y) - f_(n)) (y)) / (abs(x - y)^(alpha) ) &= abs((f_m - f_n)(x) - (f_m - f_n)(y))^(1 - 2 alpha) ((abs((f_m - f_n)(x) - (f_m - f_n)(y))) / (abs(y - x)^(1/2) ))^(2 alpha)
  $

  We have that $ abs((f_m - f_n)(x) - (f_m - f_n)(y))^(1 - 2 alpha) & <= (abs(f_m (x) - f_n (x)) + abs((f_m - f_n)(y)))^(1 - 2 alpha) \
                                                     & = (2 norm(f_m - f_n)_(oo) )^(1 - 2 alpha) $

  We also have $ (abs((f_m - f_n)(x) - (f_m - f_n)(y))) / (abs(x - y)^(1/2) ) &<= (abs(f_m (x) - f_m (y)) + abs(f_n (x) - f_n (y))) / (abs(x - y)^(1/2) ) <= 2 $

  Thus $ abs((f_m - f_n)(x) - (f_m - f_n)(y)) / (abs(x -y)^(alpha)) &<= (2 norm(f_m - f_n)_(oo) )^(1 - 2 alpha) times 2^(2 alpha) = 2 norm(f_m - f_n)_oo^(1 - 2 alpha) < epsilon/4. $

  Thus $norm(f_m - f_n)_(C^(alpha)) <= epsilon/2 < epsilon.$ Thus by completeness of $C^(alpha)([0, 1])$ and uniqueness of limit $f_n -> f$ in $C^(alpha)([0, 1]).$

]

// Problem 2
#problem("Polynomial Approximation on Unbounded Sets")[
  Let $E subset.eq RR$ be unbounded and let $f in C(E)$ be such that for every $epsilon > 0$ there exists a polynomial $p$ such that
  $ abs(f(x) - p(x)) <= epsilon, quad x in E. $
  Show that $f$ is a polynomial.
]
#solution[Let $p_n in C(E)$ be a sequence of polynomials such that $norm(f - p_n)_(oo) < 1/n$. Uniform convergence implies uniform cauchy. $forall epsilon > 0$, there exists a $N in NN$ such that $m >= n >= N$ where $norm(p_n - p_m)_(oo) < epsilon.$. Let $Z := {x in E : p_N (x) = 0}$. $ abs(p_m (z) - p_N (z)) = abs(p_m (z)) < epsilon $
]

// Problem 3
#problem("Interpolating Polynomial Approximation")[
  Let $x_1, dots, x_n$ be a finite collection of distinct points in $[0, 1]$ and let $f : [0, 1] -> RR$ be continuous. Show that there exists a sequence of polynomials agreeing with $f$ at each point $x_k$, $1 <= k <= n$, which converges to $f$ uniformly on $[0, 1]$.

  _Hint._ Introduce the Lagrange interpolating polynomials
  $ L_k (x) = product_(j != k) frac(x - x_j, x_k - x_j), quad 1 <= k <= n. $
]
#solution[

]

// Problem 4 (Basic Exam, Spring 2023)
#problem("Approximation on the Quarter Disc")[
  Let $H = {(x, y) in RR^2 ; x, y >= 0, x^2 + y^2 <= 1}$.
  #part[
    Prove that for each $epsilon > 0$ and each continuous function $f : H -> RR$ there exists a function $g$ of the form
    $ g(x, y) = sum_(m, n = 0)^N a_(m n) x^(2m) y^(2n), quad N in NN,\ a_(m n) in RR, $
    such that $abs(f(x, y) - g(x, y)) <= epsilon$ for all $(x, y) in H$.
  ]
  #part[
    Does the result in part (a) hold if $H$ is replaced by the disc $D = {(x, y) in RR^2 ; x^2 + y^2 <= 1}$?
  ]
]
#solution[

]

// Problem 5 (Basic Exam, Spring 2015)
#problem("Uniform Boundedness via Quadratic Inequality")[
  Let $f : [0, infinity) -> [0, infinity)$ be continuous with $f(0) = 0$. Show that if
  $ f(t) <= 1 + frac(1, 10) f(t)^2, quad t >= 0, $
  then $f$ is uniformly bounded throughout $[0, infinity)$.
]
#solution[

  Let $E = {x in [0, oo ) : f(x) <= M}$, $0 in E$. We want to show that $E$ is both open and closed. $f^(-1)([0,2]) = E$ is closed. We want to show that $E$ is open. Fix $x in E$.

  By continuity of $f$ there exists a $delta > 0$ such that $y in (x - delta, x + delta)$: $ abs(f(y) - f(x)) < epsilon => f(y) <= epsilon + f(x) <= epsilon + M $

  $ f(y) <= 1 + 1/10 (epsilon + M)^2 = 1 + 1/10(M^2 + 2M epsilon + M) $



]
