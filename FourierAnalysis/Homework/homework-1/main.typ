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

  $<==:$ Suppose the log-convexity of $L^p$ is true. Let $ 1/r = 1/p + 1/q. $ Without loss of generality $f in L^p (X, d mu)$ and $g in L^q (X, d mu)$ (otherwise statement is trivially true). We will first show that it is sufficient to prove for $(X, mu)$ where $mu (X) < oo$. Suppose Holder's inequality is true for such a $X$. Note that $supp(f)$, $supp(f g)$, and $supp(g)$ are $sigma$-finite, or a union of $A_n subset.eq X$ of finite measure where $A_n subset.eq A_(n + 1)$. Let $ supp(f), supp(g), supp(f g) subset.eq union.big_(n in NN) A_n. $ Note because $mu (A_n) < oo$, we have that $ norm(f g)_(L^r (A_n, d mu|_(A_n))) <= norm(f)_(L^p (A_n, d mu |_(A_n))) norm(g)_(L^q (A_n, d mu |_(A_n))) $ for all $n in NN$. Let us examine each side: $ norm(f g)_(L^r (A_n, d mu|_(A_n))) & = (integral_(A_n) abs(f(x) g(x))^r dif mu|_(A_n))^(1/r) \
                                     & = (integral_X abs(f(x) g(x))^r 1_(A_n) dif mu)^(1/r). $ By monotone convergence theorem and the fact that $x -> x^(1/p)$ is continuous: $ lim_(n -> oo ) norm(f g)_(L^r (A_n, dif mu|_(A_n) )) &= (integral_(X) abs(f(x) g(x))^r 1_(union_n A_n) dif mu )^(1/r) \ &= (integral_X abs(f (x) g(x))^r dif mu )^(1/r) quad ("using" supp(f g) subset.eq union.big_n A_n) \ &= norm(f g)_(L^r (X, dif mu)). $ By a similar argument, we see that $ norm(f)_(L^p (A_n, d mu |_(A_n))) norm(g)_(L^q (A_n, d mu |_(A_n))) ->_(n -> oo) norm(f)_(L^p (X, d mu)) norm(g)_(L^q (X, d mu)). $ Thus we have Holder's inequality: $ norm(f g)_r <= norm(f)_p norm(g)_q. $ Thus it suffices to prove Holder's inequality for the case of $X$ where $mu(X) < oo$. Furthermore, we can make the reduction that $f, g$ are everywhere nonvanishing because $supp(f), supp(g) subset.eq X$ and thus must also be finite measure, meaning we can restrict to them and nothing would change. Without loss of generality $f = abs(f)$ and $g = abs(g)$. We will now reduce to the case of simple functions. Suppose Holder's inequality is true for simple functions. $f$, $g$ are approximated by sequence of simple functions $phi_n$ and $psi_n$ respectively each also lying in $p, q$ (respectively) and $phi_(n) <= phi_(n + 1) <= f$ and $psi_n <= psi_(n + 1) <= g$. By monotone convergence, Holder's inequality holds for $f, g$. Thus the problem reduces to proving Holder's inequality for $f, g$ simple functions. Note it is sufficient to prove that if $norm(f)_(p) = 1$ and $norm(g)_q = 1$ then $norm(f g)_r <= 1$. Furthermore, suppose we prove it for $alpha, beta in (0, oo)$ where $ 1 = 1/alpha + 1/beta, $ and $norm(psi)_(alpha) = 1$ and $norm(phi)_beta = 1$ implies that $norm(phi psi)_1 <= 1$. Let $alpha = p/r$ and $beta = q/r$. Let $ psi & = f^(r) \
  phi & = g^r. $

  $
    norm(f^r)_alpha & = (integral_X abs(f^r)^(p/r) dif mu )^(r/p) \
                    & = norm(f)_p^r = 1 \
     norm(g^r)_beta & = (integral_X abs(g^r)^(q/r) dif mu)^(r/q) \
                    & = norm(g)_q^r = 1 \
               => 1 & >= norm((f g)^r)_1 \
                    & = integral_X (abs(f g)^r) dif mu \
                    & = norm(f g)_r^r => norm(f g)_r <= 1
  $

  Thus the last reduction tells us it is sufficient to prove for r = 1. Consider $ dif nu & = abs(g)^q dif mu \
    h(x) & = 1/abs(g(x))^(q/p) f(x). $ Thus, we can match some norms $ norm(h)_(L^1 (X, dif nu)) & = integral_(X) abs(h(x)) abs(g(x))^q dif mu \
                            & = integral_X abs(f(x)) abs(g(x))^(q - q/p) dif mu \
                            & = integral_X abs(f(x)) abs(g(x)) dif mu \
                            & = norm(f g)_(L^1 (X, dif mu )) $

  $
    norm(h)_(L^(p)(X, dif nu)) & = (integral_X norm(f)^p norm(g)^(q - q) dif mu )^(1/p) \
                               & = norm(f)_p = 1.
  $


  By log convexity, $forall q prime$ where $0 < q prime < 1 < p$ and $theta in (0, 1)$ where $ 1 = (1 - theta) / (q prime) + theta/p $ we have that $ norm(f g)_(L^1 (X, dif mu)) = norm(h)_(L^1 (X, dif nu)) &<= norm(h)_(L^p (X, dif nu))^(theta) norm(h)_(L^(q prime) (X, dif nu))^(1 - theta) \ & = norm(h)_(L^(q prime) (X, dif nu))^(1 - theta) $
  Note that as $q prime -> 0^+$ we have that $theta -> 1$ because
  $ 1 - theta = q prime (1 - theta/p). $ Since $q prime -> 0$ and $h > 0$ positive simple function, $h^(q prime) -> 1$ everywhere and hence $integral_X h^(q prime) dif nu -> integral_X dif nu = nu (X).$ Thus $ norm(h)_(L^1 (X, dif nu )) <= lim_(q prime -> 0) norm(h)^(1 - theta)_(L^(q prime) (X, dif nu ) ) = nu (X) = norm(g)_(L^q (X, dif mu )) = 1. $ Thus putting all this together, we see that $ norm(f g)_(L^(1)(X, dif mu ) ) <= 1. $

]

#problem(num: "13")[
  Differentiate $log norm(f)_p$ twice with respect to $alpha := 1/p$ and show
  that this is non-negative (take $f$ to be a non-zero simple function with
  finite measure support, to avoid technicalities).
]
#solution[Let $f$ be a non-zero simple function with finite measure support (we can just assume $mu (X) < oo$). Thus $norm(f)_(p) != 0$ for all $p in (0, oo)$. Note that since $f$ simple and finite measure support, $norm(f)_p < oo$ for all $p in (0, oo)$. Furthermore, since $f$ simple, $ f = sum_(k = 1)^(n) c_k 1_(E_k) $ for $E_k subset X$ and $c_k in RR$. Let $C = max(c_1, ..., c_n)$. Let $ I(alpha) := integral_X abs(f(x))^(1/alpha) dif x $
]

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
