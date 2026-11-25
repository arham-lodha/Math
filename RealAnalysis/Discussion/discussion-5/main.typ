#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Discussion 5",
  name: "Arham Lodha",
  due: "",
)

*Assumption.* Unless otherwise specified we work on a $sigma$-finite measure space $(X, Sigma, mu)$. If $mu$ is a finite measure that will be stated in the assumptions explicitly.

*Notation.* We say $f in L^1(mu)$ if
$ integral_X |f(x)| dif mu(x) < infinity. $

== 1. Practicing the three main theorems

#problem(num: "1.1")[
  _(Exercise; Bass 7.7.)_ Suppose $0 <= f_n arrow.b f$ almost everywhere and $f_1$ is integrable, i.e. $integral |f_1| dif mu < infinity$. Prove that $integral f_n -> integral f$. Give a counterexample if the integrability assumption is removed. Is $sigma$-finiteness necessary?
]
#solution[
  Note the following $0 <= f_n <= f_(n - 1) <= f_1$ a.e. $f_1$ is in $L^1$ and thus $mu-$summable. By the Dominated Convergence theorem. $ integral_(X) abs(f_k - f) dif mu ->_(k -> oo ) 0 => lim_(k ->oo ) integral_X f_k dif mu = integral_X f dif mu. $

  Take $f_n (x) = x/n$ and $X = [1, oo)$. $f_n -> 0$ pointwise. But $integral_X f_n dif mu = oo$.
]

#problem(num: "P1")[
  _(Generalized dominated convergence; Bass 7.5.)_ Suppose
  $ f_n -> f, quad g_n -> g quad "a.e.", quad |f_n| <= g_n, $
  where $g_n, g in L^1(mu)$ and $integral g_n -> integral g$. Prove that $f in L^1(mu)$ and
  $ integral |f_n - f| --> 0. $
  Deduce convergence of the integrals of $f_n$.
]
#solution[
  homework problem in Homework 2.
]

#problem(num: "1.2")[
  _(Exercise.)_ Suppose $f_n in L^1(mu)$ for all $n$ and $f_n -> f$ a.e., show that $f in L^1(mu)$.
]
#solution[
  $
    integral_X abs(f) dif x & = integral_X liminf_(n -> oo) abs(f_n) dif mu \
                            & <= liminf_(n -> oo) integral_X abs(f_n) dif mu quad ("Fatou's Lemma") \
                            & = liminf_(n -> oo) norm(f_n)_(L^1)
  $
]

#problem(num: "P2")[
  _(Fatou with a varying lower bound; additional.)_ Suppose $f_n >= -g_n$, where $g_n >= 0$, $g_n -> g$ almost everywhere, and $integral g_n -> integral g < infinity$. Assume each $g_n$ is integrable. Prove that
  $ integral liminf_n f_n <= liminf_n integral f_n. $
]
#solution[
]

#problem(num: "P3")[
  _(Convergence of absolute integrals; Bass 7.10.)_ Let $f_n, f in L^1(mu)$, with $f_n -> f$ almost everywhere. Prove that
  $ integral |f_n| --> integral |f| quad <==> quad integral |f_n - f| --> 0. $
]
#solution[]

== 2. Uniform integrability

*Assumption.* For this section assume $(X, cA, mu)$ is a *finite* measure space.

*2.1 Definition.* A family $cF subset L^1(mu)$ is _uniformly integrable_ if
$ lim_(M -> infinity) sup_(u in cF) integral_({|u| > M}) |u| = 0. $

#problem(num: "P4")[
  _(Two characterizations; Bass 7.21.)_ Prove that ${f_n}$ is uniformly integrable if and only if it is bounded in $L^1$ and its integrals are uniformly absolutely continuous:
  $ forall epsilon > 0 space exists delta > 0 : quad mu(A) < delta ==> sup_n integral_A |f_n| < epsilon. $
  Show that boundedness in $L^1$ alone is insufficient.
]
#solution[]

#problem(num: "P5")[
  _(Vitali convergence; Bass 7.22--7.23.)_ Suppose $f_n -> f$ in measure, i.e. for all $epsilon > 0$
  $ lim_(n -> infinity) mu{|f_n (x) - f(x)| > epsilon} = 0. $
  Prove that
  $ norm(f_n - f)_1 -> 0 quad <==> quad {f_n} "is uniformly integrable." $
  In the forward implication assume $f in L^1$; in the reverse implication establish this as part of the proof.
]
#solution[]

#problem(num: "P6")[
  _(Bass 7.24.)_ Suppose, for some $p > 1$, $sup_n integral |f_n|^p < infinity$. Prove that ${f_n}$ is uniformly integrable.
]
#solution[]

#problem(num: "P7")[
  _(Bounded entropy implies uniform integrability.)_ Let $f_n >= 0$ on $[0, 1]$, with $0 log 0 = 0$, and suppose
  $ sup_n integral_0^1 f_n log f_n dif x < infinity. $
  Prove that ${f_n}$ is uniformly integrable.
]
#solution[]

== 3. Explicit computations

#problem(num: "P8")[
  _(Bass 7.13--7.14.)_ Evaluate
  $ lim_(n -> infinity) integral_0^n (1 + x/n)^(-n) log(2 + cos(x/n)) dif x $
  and
  $ lim_(n -> infinity) integral_0^n (1 - x/n)^n log(2 + cos(x/n)) dif x. $
]
#solution[]

#problem(num: "P9")[
  _(Bass 7.15.)_ Evaluate
  $ lim_(n -> infinity) integral_0^1 (1 + n x^2)/(1 + x^2)^n log(2 + cos(x/n)) dif x. $
]
#solution[]

#problem(num: "P10")[
  _(Bass 7.16.)_ Evaluate
  $ lim_(n -> infinity) integral_0^infinity n e^(-n x) (x^2 + 1)/(x^2 + x + 1) dif x. $
  Explain why the pointwise limit of the original integrands does not determine the answer.
]
#solution[]

#problem(num: "P11")[
  _(Bass 7.17.)_ Suppose $g in L^1(RR)$, and $f : RR -> RR$ is bounded, measurable, and continuous at $1$. Find
  $ lim_(n -> infinity) integral_(-n)^n f(1 + x/n^2) g(x) dif x. $
]
#solution[]

#problem(num: "P12")[
  _(Bass 7.19.)_ For $p > 0$, prove
  $ integral_0^1 (-x^p log x)/(1 - x) dif x = sum_(k=1)^infinity 1/(p + k)^2. $
]
#solution[]
