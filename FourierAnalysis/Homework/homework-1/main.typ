#import "template.typ": *

#show: homework.with(
  course: "MATH 247A",
  assignment: "Homework 1",
  name: "Arham Lodha",
  due: "Oct 09, 2026",
)

// Exercises 11, 12, 13, 18, 19 from Terry Tao's "247A, Notes 1:
// Rearrangement-invariant spaces"
// (https://terrytao.wordpress.com/2026/09/20/247a-notes-1-rearrangement-invariant-spaces/)

#problem(num: "11")[
  If $1 < p < infinity$, determine the cases for which Minkowski's inequality
  $ norm(sum_i f_i)_p <= sum_i norm(f_i)_p $
  holds with equality. What changes when $p = 1$ or $p = infinity$?
]
#solution[

  $
    norm(sum_(i in I) f_i)_p^p & = integral_X abs(sum_(i in I) f_i (x))^(p) dif mu \
                               & = integral_X abs(sum_(i in I) f_i (x))^(p - 1) abs(sum_(i in I) f_i (x)) dif mu \
                               & <= integral_(X) abs(sum_(x in I) f_i (x))^(p - 1) (sum_(i in I) abs(f_i (x))) dif mu
  $

  Note that the last inequality, arises due to the triangle inequality of complex numbers: $ abs(sum_(i in I) f_i (x)) <= sum_(i in I)^() abs(f_i (x)). $
  Equality in the triangle inequality only holds if $f_i (x) &= lambda_i (x) f (x)$ for $lambda_i (x) in [0, oo)$ and $f:X -> S^1$. Thus if $f_i = lambda_i f$ almost everywhere, where $lambda_i (x) in [0, oo)$ and $f: X -> S^1$ equality holds. So suppose this is the case. $ norm(sum_(i in I)^() f_i)_p^p & = integral_X (abs(sum_(i in I) f_i (x))^(p - 1) sum_(i in I)^() abs(f_i (x)) ) dif mu \
  & = integral_X sum_(i in I)^() abs(f_i (x)) abs(sum_(j in I)^() f_j (x))^(p - 1) dif mu \ &= sum_(i in I)^() integral_(X) abs(f_i (x)) abs(sum_(j in I) f_j (x))^(p - 1) dif mu & ("Tonell's Theorem") \ &= sum_(i in I) integral_X abs(f_i (x)) abs((sum_(j in I) f_j (x) )^(p - 1)) dif mu \ &= sum_(i in I) norm(f_i (x) (sum_(j in I)^() f_j (x) )^(p - 1))_1 \ &<= sum_(i in I) norm(f_i (x))_p norm(sum_(j in I) f_j (x))_((p) / (p - 1)) $

  The final inequality comes from Holder.
]

#problem(num: "12")[
  Show that Hölder's inequality
  $ norm(f g)_r <= norm(f)_p norm(g)_q, quad 1/p + 1/q = 1/r $
  is equivalent to the log-convexity of $L^p$ norms: for $0 < p < q <= infinity$,
  $0 < theta < 1$, and $1/r = (1 - theta)/p + theta/q$,
  $ norm(f)_r <= norm(f)_p^(1 - theta) norm(f)_q^theta. $
]
#solution[
  $=>:$ Suppose Holder's inequality is true for all choices of parameters. Suppose $ 1/r = (1 - theta) / (p) + (theta) / (q). $ Let $ alpha & = (p) / (1 - theta) \
   beta & = (q) / (theta). $ Thus by Holder's inequality we have $ norm(f)_r &= norm(f^(1 -theta) f^(theta))_r \ &<= norm(f^(1 - theta))_alpha norm(f^(theta))_(beta) \ &= (integral_(X) abs(f (x))^((1 - theta) alpha) dif mu)^(1/alpha) (integral_X abs(f(x))^(theta beta) dif mu )^(1/beta) \ &= (integral_(X) abs(f(x))^(p) dif mu)^((1 - theta) / (p)) (integral_(X) abs(f(x))^(q) dif mu )^((theta ) / (q)) = norm(f)_p^(1 - theta) norm(f)_q^(theta). $

  $<==:$ Suppose the log-convexity of $L^p$ is true. Let $ 1/r = 1/p + 1/q. $ We will first show that it is sufficient to prove that if $norm(f)_p <= 1$ and $norm(g)_q <= 1$ then $norm(f g)_r <= 1$. WLOG $norm(F)_p != 0 != norm(G)_q$ otherwise $F$ or $G$ are zero almost everywhere and hence $F G$ is zero almost everywhere and $norm(F G)_r = 0$ and the statement is trivially true. Let $ norm(F G)_r & <= norm(F)_p norm(G)_q norm((F/norm(F)_p) (G / norm(G)_q))_r <= norm(F)_p norm(G)_q. $ Thus it is sufficient to prove that $norm(f)_p <= 1$ and $norm(g)_q <= 1$ implies that $norm(f g)_r <= 1$. Consider the following function $ F(x) := cases((f(x)) / abs(g(x))^(q/p) "if" g(x) != 0, 0 "otherwise"). $ Let $d nu = abs(g(x))^q d mu$. Then we have that $ norm(F)_(L^(p)(X, dif nu))^p & = integral_X F(x)^p dif nu \
                               & = integral_{x : g(x) != 0} (abs(f(x))^p / (abs(g(x))^q)) abs(g(x))^q dif mu \
                               & = integral_({x: g(x) != 0}) abs(f(x))^p dif mu \
                               & <= norm(f)_(L^p (X, d mu))^p <= 1. $ We also have $ norm(F)_(L^r (X, d nu))^r & = integral_X F(x)^r dif nu \
                            & = integral_{x: g(x) != 0} (abs(f(x))^r) / (abs(g(x))^((r q) / (p)) ) $


]

#problem(num: "13")[
  Differentiate $log norm(f)_p$ twice with respect to $alpha := 1/p$ and show
  that this is non-negative (take $f$ to be a non-zero simple function with
  finite measure support, to avoid technicalities).
]
#solution[]

#problem(num: "18")[
  On a measure space consisting of $N$ points (with counting measure), and
  $0 < p <= q <= infinity$, one has
  $ norm(f)_(ell^q) <= norm(f)_(ell^p) <= N^(1/p - 1/q) norm(f)_(ell^q). $
  When does equality occur for either of these two inequalities? Note how the
  example that attains the lower bound is in many ways the "opposite extreme"
  to the example which attains the upper bound.
]
#solution[]

#problem(num: "19")[
  Establish the (vector-valued) bound
  $ norm((sum_n abs(f_n)^q)^(1/q))_(L^p) <= (sum_n norm(f_n)_(L^p)^q)^(1/q) $
  for any measurable functions $f_n$ and any $0 < q < p <= infinity$.
]
#solution[]
