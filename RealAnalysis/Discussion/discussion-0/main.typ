#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Discussion 0",
  name: "Arham Lodha",
  due: "",
)

#let mst = $m^*$

Throughout, $mst(A) := inf { sum_(i=1)^infinity |b_i - a_i| : A subset.eq union.big_(i=1)^infinity (a_i, b_i) }$ for $A subset.eq RR$, and for measurable $A$ we write $m(A) := mst(A)$ (Lebesgue measure).

#problem(num: "1.1")[
  If $U subset.eq RR$ is open, prove $U$ is a countable (finite or infinite) union of disjoint open intervals $U = union.big_i (a_i, b_i)$, where $a_i = -infinity$, $b_i = +infinity$ are allowed.
]
#solution[
  $U$ can be split into connected components (each of which are open intervals). These are countable because $RR$ is seperable and $QQ$ is countable dense.
]

#problem(num: "1.2")[
  Prove that $mst$ is an outer measure.
]
#solution[
  Nonnegativity is obvious. Suppose $A subset.eq B$. Suppose $ B subset.eq union.big_(i = 1)^(oo)(a_i, b_i) => A subset.eq B subset.eq union.big_(i = 1)^(oo)(a_i , b_i) => m^*(A) <= sum_(k = 1)^(oo) abs(b_i - a_i). $ This is true for all such covers, thus $m^* (A) <= m^* (B)$. Thus outer measure is monotonic with respect to containment. Furthermore we need to show subadditivity:

  $ m^* (A union B) <= m^* (A) + m^*(B) $
  Basically you take any pair of covers of $A$ and $B$ and $m^*(A union B)$ is a lower bound for the sums. This is true for all arbitrary pairs and thus must also be true for the infimums.
]

#problem(num: "P1")[
  Does there exist a measurable $A subset.eq RR$ with $m(A) > 0$ and $epsilon > 0$ such that for every interval $(a, b)$,
  $ m(A inter (a, b)) <= (1 - epsilon) |b - a| ? $
]
#solution[
  Assume the contrary that such a $A$ and $epsilon > 0$ exists. We will reduce to finite measure by intersecting $A$ with a compact set.

  Since $A$ is measurable and $m(A) > 0$. Let ${(a_i, b_i)}_(i = 1)^(oo)$ be any collection of open intervals such that $ A subset.eq union.big_(k = 1)^(oo)(a_k, b_k) => A subset.eq union.big_(k = 1)^(oo ) (A inter (a_k, b_k)). $ By subadditivity of measure, $ mu(A) <= sum_(k=1)^(oo) mu(A inter (a_k, b_k)) <= (1 - epsilon) sum_(k = 1)^(oo) abs(b_k - a_k) => (mu (A)) / (1 - epsilon) <= sum_(k = 1)^(oo) abs(b_k - a_k). $ By the greatest lower bound definition of infimum, $ mu(A) >= (mu (A)) / (1 - epsilon ) => (1 - epsilon )mu (A) > mu (A) $ This is a contradiction.
]

#problem(num: "P2")[
  Let $A subset.eq RR$ be measurable with $m(A) > 0$, and let $A - A := {a - a' : a, a' in A}$. Prove that $A - A$ contains a nonempty interval around the origin.
  _Hint (from the sheet):_ show there is $delta > 0$ such that $A inter (A + r) != emptyset$ for all $|r| < delta$.
]
#solution[
  We will make a preliminary reduction. Suppose we know that there exists a $delta > 0$ such that for all $r in (-delta, delta)$ we have that $A inter (A + r) != emptyset$. Then $(-delta, delta) subset.eq A - A$, because $forall r in (-delta, delta)$ there exists $a in A inter (A - r) => a in A$ and $a + r in A => (a + r) - a = r$. Thus it suffices to prove that there is such a $delta > 0$.
]
