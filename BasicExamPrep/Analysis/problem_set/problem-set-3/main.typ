#import "template.typ": *

#show: homework.with(
  assignment: "Problem Set 3",
  name: "Arham Lodha",
  due: "August 05, 2026",
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

// Problem 1 (Carry-over from yesterday)
#problem("Oscillation Function")[
  Given a bounded function $f : RR -> RR$, define the oscillation function of $f$ by
  $ omega_f (x) = lim_(delta -> 0^+) sup{lr(|f(y) - f(z)|) : y, z in (x - delta, x + delta)}, quad x in RR. $
  #part[
    Show that the limit in the definition above exists and that $f$ is continuous at the point $x$ precisely when $omega_f (x) = 0$.
  ]
  #part[
    Show that the function $x mapsto omega_f (x)$ is upper semi-continuous in the sense that the set
    $ {x in RR : omega_f (x) < A} $
    is open, for each $A in RR$.
  ]
  #part[
    *(Basic Exam, Spring 2025)* Prove that the function $f$ cannot be continuous on the set $QQ$ of rational numbers only.
  ]
  #part[
    Does there exist a function $f : RR -> RR$ that is continuous on the set of irrational numbers only? Prove your assertion.
  ]
]
#solution[
  *(a)*: Let $g_x (delta) := sup{lr(| f(y) - f(z) |) : y, z in (x - delta, x + delta)}$. Note that for $delta_1 < delta_2$, $(x - delta_1, x + delta_(1)) subset (x - delta_(1), x + delta_(2)) => {lr(| f(y) - f(z) |) : y, z in (x - delta_(1) , x + delta_(1) )} subset {lr(| f(y) - f(z) |) : y, z in (x - delta_(2) , x + delta_(2) )}$ thus $g(delta_1) <= g(delta_(2))$. So $g$ is nonincreasing as $delta -> 0$. Furthermore $g_x >= 0$. Thus the limit exists.

  Let $C(f) := lr({ x in RR : f "continous at" x }).$. If $x in C(f)$, $forall epsilon > 0$ there exists $delta > 0$ such that for all $z, y in (x - delta, x + delta )$ $lr(| f(x) - f(y) |) < epsilon /2$. Thus $ lr(| f(y) - f(z) |) & <= lr(| f(y) - f(x)|) + lr(| f(x) - f(z) |) \
                      & < epsilon/2 + epsilon /2 = epsilon. $ Thus $g_x (delta) < epsilon$. Thus $omega_f (x) = 0$. Suppose $omega_f (x) = 0$. Then $forall epsilon > 0$, $exists delta > 0$ such that $delta_0 in [0, delta]$ $g_(x)(delta_0) < epsilon$. Thus for all $y, z in (x - delta, x + delta)$, $lr(| f(y) - f(z) |) < epsilon$ it immediately follows that $lr(| f(x) - f(y) |) < epsilon$. Thus $x in C(f)$.

  *(b)*: $forall A in RR$, let $U_A := {x in RR : omega_(f) (x) < A}.$ $forall x in U_A$, we know $forall epsilon > 0$ there exists a $delta > 0$ where for $y, z in (x - delta, x + delta)$ we have $lr(| f(y) - f(z) |) < A$. For $y in (x - delta , x + delta)$, take $delta_0 < delta - lr(| y - x |)$ for $z in (y - delta_0, z + delta_0)$

  $ lr(| z - x |) <= lr(| z - y |) + lr(| y - x |) < delta_0 + lr(| y - x |) < delta. $ Thus $ lr(| f(z_1) - f(z_2) |) < A $ for $z_1, z_2 in (y -delta_0, y - delta_0) subset (x - delta, x + delta)$. Thus $(x - delta, x + delta) subset U_A$. Thus $U_A$ is open and $omega_f$ is upper semicontinuous.

  *(c)*: $ C(f) = {x in RR : omega_(f) (x) = 0 } = inter.big_(n in NN) U_(1/n). $ Assume the contrary that $QQ = U_0$, thus $QQ in U_(1 / (n))$ thus the sets are dense. By above they are also open. Note for all $x in U_(1/n)$, $U_(1 / (n)) - {x}$ is still dense and open. Enumerate $QQ$ and let $q_i$ be the corresponding sequence. By Baire Category Theorem, $emptyset = inter.big_(n in NN) (U_(1/n) - {q_n} )$ is a dense set which is a contradiction. Thus $C(f) != QQ$

]

// Problem 2 (Carry-over from yesterday)
#problem("Uniform Continuity and Extension")[
  #part[
    Let $X$ and $Y$ be metric spaces, with $Y$ complete, and let $A subset.eq X$ be dense in $X$. Let $f : A -> Y$ be a uniformly continuous map. Show that $f$ can be extended uniquely to a continuous map $tilde(f) : X -> Y$. Show also that the unique extension $tilde(f)$ is uniformly continuous on $X$.
  ]
  #part[
    *(Basic Exam, Spring 2024)* Let $f : QQ -> RR$ be a uniformly continuous function. Show that the closure $overline(f(QQ))$ is connected.
  ]
]
#solution[
  *(a)*: $forall x in X - A$. Create a sequence where $a_n in A inter B_(1/n) (x)$ where the intersection is nonempty because of density of $A$ in $X$. Note $a_n -> x$ and is hence Cauchy. By the sequential definition of uniform continuity, $a_n$ being Cauchy $=>$ $f(a_n)$ is Cauchy. By completeness of Y, $lim_() f(a_n)$ exists. We want to define $f(x) = lim f(a_n)$ but we need to show that this definition doesn't rely on the choice of sequence.

  Let $a_n -> x$ and $b_n -> x$ be sequences in $A$. Define $c_n$, where $c_(2n - 1) = a_n$ and $c_(2n) = b_n$, thus $c_n -> x$ as well. By uniform convergence and Completeness, $f(a_n) -> L in Y$ and $f(b_n) -> L prime in Y$ and $f(c_n) -> lim_() f(c_n) in Y$. Definition of convergence and the fact that $f(a_n)$ and $f(b_n)$ are subsequences of $f(c_n)$, we know $L = lim_(n -> oo ) f(c_n) = L prime$. Hence the limit is well defined and is not dependent on the choice of sequence in $A$.

  Thus let $F: X -> Y$ where $ F(x) := lim_(n -> oo) f(a_n). $

  $forall epsilon > 0$: $exists delta > 0$ such that $forall a in B_delta (x) inter A$ where $abs(F(x) - F(a)) = abs(F(x) - f(a)) < epsilon/2$.

  $abs(F(x) - F(y)) <= abs(F(x) - F(a)) + abs(F(y) - F(a)) < epsilon/2 + epsilon/2 = epsilon$.
]

// Problem 3
#problem("Compactness via Approximation")[
  Let $A$ be a closed subset of a complete metric space $(X, d)$. Assume that for each $epsilon > 0$ there exists a compact set $K_epsilon subset.eq X$ such that for all $x in A$, we have
  $ inf_(y in K_epsilon) d(x, y) < epsilon. $
  Show that $A$ is compact.
]
#solution[
  We will show this by showing $A$ is complete and totally bounded. A is a closed subset of a complete metric space and hence complete (because it contains all it limit points). Now the hard part is showing $A$ is totally bounded.

  For all $epsilon > 0$, we have $K_(epsilon/2)$ a compact set where $inf_(y in K_(epsilon/2)) d(a, y)$ is achieved and is less than $epsilon/2$. Thus $d(y, K_(epsilon/2)) <= epsilon/2$ for all $y in A$. Thus $exists b_1, ..., b_n in K_(epsilon /2)$ such that $union_(i = 1)^(n) B_(epsilon/2)(b_i) = K_(epsilon/2)$.
  $forall a in A$, $exists k in K_(epsilon /2)$ such that $d(a, k) < epsilon/2$. Furthermore, since $K_(epsilon/2)$ is covered by $epsilon/2$ balls, there exists $b_i in {b_1, ..., b_n}$ such that $d(k, b_i) = epsilon /2$. Thus $ d(b_i, a) <= d(b_i, k) + d(k, a) <= epsilon. $ Thus $ A subset union.big_(i = 1)^(n) B_(epsilon ) (b_i). $

  We now need to show that we can preturb the balls sufficiently and move them into $A$.

  Pick a $a_i in A inter B_(epsilon ) (b_i)$, $forall a in A inter B_(epsilon)(b_i)$: $ d(a_i, a) <= d(a_i, b_i) + d(b_i, a) < 2epsilon. $

  Thus $ A subset union.big_(i = 1)^n B_(2 epsilon)(a_i) $

  Thus $A$ totally bounded. $A$ is compact.
]

// Problem 4
#problem[$l^infinity$ as a Complete Metric Space][
  Let $l^infinity = l^infinity (NN)$ denote the set of all bounded complex-valued sequences $x = (x_n)_(n=1)^infinity$.
  #part[
    Show that $l^infinity$ is a complete metric space when equipped with the metric
    $ d(x, y) = sup_n lr(|x_n - y_n|). $
  ]
  #part[
    Let $(epsilon_n)_(n=1)^infinity$ be a sequence of positive real numbers such that $epsilon_n -> 0$ as $n -> infinity$. Show that
    $ M = {x = (x_n) in l^infinity : lr(|x_n|) <= epsilon_n, quad n = 1, 2, dots} $
    is a compact subset of $l^infinity$.
  ]
]
#solution[


]
