#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Problem Set 8",
  name: "Arham Lodha",
  due: "August 13, 2026",
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
#solution[

]

// Problem 2 (Basic Exam, Fall 2014)
#problem([Connected Subsets Covering a Connected Space])[
  Let $X$ be a connected metric space and let $A, B subset.eq X$ be closed subsets such that $X = A union B$. Assume also that $A inter B$ is connected. Show that $A$ and $B$ are connected.
]
#solution[
  Assume the contrary that $A$ or $B$ are disconnected. WLOG let $A$ be disconnected. Thus $exists U, V in cT(X)$ such that $A inter (U union V) = A$ and $U inter V = emptyset$.
]

// Problem 3 (Basic Exam, Spring 2019)
#problem([Connectedness and Completeness of a Lipschitz Function Space])[
  Let $C([0, 1])$ denote the space of continuous real-valued functions on $[0, 1]$ equipped with the uniform metric. Let $X$ be a subset of $C([0, 1])$ defined via
  $
    X = {f in C([0, 1]) ; f(0) = 0, abs(f(x) - f(y)) <= abs(x - y)}.
  $
  Show that $X$ is connected and complete.
]
#solution[

]

// Problem 4 (Basic Exam, Spring 2017)
#problem([Epsilon-Chain Connectedness Implies Connectedness])[
  Let $K subset RR^n$ be compact. Suppose that for every $epsilon > 0$ and for every pair $a, b in K$ there is an integer $n >= 1$ and a sequence of points $x_0, dots, x_n in K$ such that
  $
    x_0 = a, quad x_n = b, quad abs(x_k - x_(k-1)) <= epsilon, quad 1 <= k <= n.
  $
  Show that $K$ is connected.

  _Hint._ You may wish to prove the following general fact first: let $(X, d)$ be a metric space and assume that $F subset.eq X$ is closed and $K subset.eq X$ is compact. Show that if $F$ and $K$ are disjoint, then
  $
    inf_(x in F, y in K) d(x, y) > 0.
  $
]
#solution[

]
