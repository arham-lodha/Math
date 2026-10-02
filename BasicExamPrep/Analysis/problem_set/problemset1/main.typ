#import "template.typ": *

#show: homework.with(
  assignment: "ProblemSet1",
  name: "Arham Lodha",
  due: "August 06, 2026",
)

#problem()[
  Let $X$ and $Y$ be metric spaces and let $f : X -> Y$ be a function.
  Assume that $A$ and $B$ are open subsets of $X$ such that the restrictions
  $f|_A$ and $f|_B$ are continuous.

  #part[Show that $f|_(A union B)$ is continuous.]
  #part[Is this result still true if $A$ and $B$ are both closed subsets of $X$?]
  #part[Is the result true for the union of an infinite number of open sets?]
  #part[Is the result true for the union of an infinite number of closed sets?]
]

#solution()[
  *(a)*: $V subset Y$ open. $(f|_(A union B))^(-1)(V) := {x in A union B: f(x) in V} = (f|_A)^(-1)(V) union (f|_B)^(-1)(V)$ which is open because both parts are open (this comes from continuity of $f|_A "and" f|_B$).
]

#problem("Basic Exam, Fall 2017")[
  Let $(a_n)_(n >= 1)$ be a decreasing sequence of nonnegative numbers such that
  $ sum_(n=1)^(oo) a_n < oo. $
  Show that $n a_n -> 0$ as $n -> oo$.
]

#solution()[ Let $S_n := sum_(i=1)^(n) a_n$ and by assumption $S_n -> L < oo$. Since convergence implies cauchy, $forall epsilon > 0$ there exists $m >= n >= N_0$  where $ S_m - S_n = sum_(i = 1)^(m - n) a_(n + i) < epsilon/2 => (m - n) a_(n + (m - n)) < epsilon/2. $


  Let $N_1$ where $a_n < epsilon/(2 N_0)$. For $M = max(N_0 + 1, N_(1))$ and $n >= M$:

  $ n a_(n) = N_0 a_(n) + (n - N_0) a_n < epsilon/2 + epsilon/2 = epsilon. $
]

#problem()[
  Let $X$ be a metric space which is separable, i.e. $X$ admits a countable dense
  subset. Show that

  #part[
    $X$ is second countable, that is, there exists a countable base for the
    topology. Recall that a collection $cal(B)$ of open sets is a base for the
    topology if each open set in $X$ can be written as a union of elements in
    $cal(B)$.
  ]
  #part[
    $X$ has the Lindelöf covering property: given a collection of open sets
    $(G_alpha)_(alpha in I)$ in $X$, there exists $I_1 subset.eq I$ countable
    such that
    $ union.big_(alpha in I) G_alpha = union.big_(alpha in I_1) G_alpha. $
    _Hint:_ Consider $cal(B)_1 = {V in cal(B) ; V subset.eq G_alpha "for some" alpha in I}$.
  ]
]

#solution()[
  *(a)*: Let $A subset X$ be the countable dense subset of $X$. We want to show that $ cal(B) := {B_(q)(a)}_((q, a) in QQ times A) $ is a basis for $X$. $forall U in cal(T)(X)$, $forall x in U$ there exists a $delta > 0$ such that $B_(delta) (x) subset.eq U$. By density $exists a_x in B_(delta/4) (x)$. $exists q_x in QQ inter (delta/4, 3delta/4)$. Note $x in B_(q_x)(a_x)$ and $forall z in B_(q_x)(a_x)$

  $ d(x, z) <= d(x, a_x) + d(a_x, z) < delta/4 + q_x < delta/4 + 3 delta/4 <= delta $

  Thus $x in B_(q_x)(a_x) subset B_(delta)(x) subset U$. $ U = union.big_(x in U) B_(q_x)(a_x) $


  *(b)*: You create $cal(B)_1$ which is a open cover of $X$ then you form $I_1$ by doing the following for all $V in cal(B)_1$ take one element out of ${alpha in I: V subset G_alpha}$. Since $cal(B)_1$ is a open cover this set is also a open cover and is countable.
]

#problem()[
  Let $X$ be a separable metric space and let $A subset.eq X$ be uncountable.
  Show that there exists $a in X$ such that for each open neighborhood $V$ of
  $a$, the set $V inter A$ is uncountable. (Such a point is called a
  _condensation point_ of $A$.)
]

#solution()[
  Assume the contrary there exists no condensation point for $A$ in $X$. Thus $forall x in X$ any open set $V in cal(T)(X)$ has at most countable intersection with $A$. Pick a open set $V_x$ for all $x$ such that $x in V_x$. Then ${V_x}_(x in X)$ forms a open cover of $x$. There exists $X_1 subset X$ where $X_1$ is countable by the Lindelöf covering and ${V_x}_(x in X_1)$ is a open cover.

  $ A = union.big_(x in X_1) V_x inter A $

  This is a countable union of countable elements hence $A$ must be countable, which contradicts our assumptions.

]
