#import "template.typ": *

#show: homework.with(
  course: "Bootcamp",
  assignment: "Problem Set 10",
  name: "Arham Lodha",
  due: "August 18, 2026",
)

#problem("Basic Exam, Spring 2017")[
  Show that there is a constant $C$ so that
  $ abs(frac(f(0) + f(1), 2) - integral_0^1 f(x) dif x) <= C integral_0^1 abs(f''(x)) dif x, $
  for every $C^2$ function $f : RR -> RR$.
]

#solution[

  $
    integral_0^1 f(x) g prime prime (x) dif x &= lr(g prime (x) f(x) |)_0^1 - integral g prime (x) f prime(x) dif x \
    &= (g prime (1) f(1) - g prime (0) f(0)) - [[g(x) f prime (x)]^1_0 - integral_0^1 g(x) f prime prime (x) dif x] \
    &= g prime (1) f(1) - g prime (0) f(0) - g(1) f prime (1) + g (0) f prime (0) + integral_0^1 g(x) f prime prime (x) dif x
  $

  $
    integral_0^1 g(x) f prime prime (x) dif x &= - g prime (x) f(1) + g prime (0) f(0) + g(1) f prime (1) - g(0) f prime (0) - integral_0^1 f(x) g prime prime (x) dif x
  $

  We want $     g prime (1) = -1/2 & quad g prime (0) = 1/2 \
               g (1) = 0 & quad g (0) = 0 \
  g prime prime (x) = -1 $

  Thus $ g prime (x) & = -x + A = -x + 1/2 \
        g (x) & = -1/2 x^2 + 1/2 x = -1/2 x (x - 1). $

  Note $abs(g(x)) <= 1$. Thus $ abs((f(0) + f(1)) / (2) - integral_0^1) & = abs(integral_0^1 (-1/2 x (x - 1)) f prime prime (x) dif x) \
                                          & <= integral_0^1 abs(f prime prime (x)) dif x $

]

#problem("Basic Exam, Fall 2020")[
  Let $f$ be real and continuous on $[0, 1]$. Show that
  $ lim_(n -> oo) (n + 1) integral_0^1 x^n f(x) dif x = f(1). $
]

#solution[
  $f$ continous on $[0, 1]$. Thus $exists M, m$ such that $ M & = sup_(x in [0, 1]) f(x) \
  m & = inf_(x in [0, 1]) f(x) $

  By continuity of $f$ at $1$, $forall epsilon > 0$ there exists a $0 < delta$ where $M (1 - delta)^(n + 1) < epsilon$ and $forall y in (1 -delta, 1]$ we have that $abs(f(1) - f(y)) < epsilon$. Thus



  $
    abs(integral_0^1 (n + 1) x^n f(x) dif x - integral_0^1 (n + 1) x^n f(1) dif x) &= abs(integral_0^1 (n + 1) x^n (f(x) - f(1)) dif x) \
    &= abs(integral_(0)^(1 - delta) (n + 1) x^n (f(x) - f(1)) dif x + integral_(1 - delta)^(1) (n + 1)x^n f(x) dif x) \
    &<= abs(integral_0^(1 - delta) (n + 1) x^n (f(x) - f(1)) dif x) + epsilon [x^(n + 1)]_(1 - delta)^(delta) \
    &<= M [x^(n + 1)]_0^(1 - delta) + epsilon [x^(n + 1)]^(1)_(1 - delta) \
    &< epsilon + M (1- delta)^(n + 1) < 2 epsilon
  $


]

#problem("Basic Exam, Spring 2015")[
  Let $f : RR -> RR$ be a Lipschitz continuous function, that is
  $ L(f) := sup { frac(abs(f(x) - f(y)), abs(x - y)) ; x, y in RR, x eq.not y } < oo. $
  Assume that we have for every $x in RR$,
  $ lim_(n -> oo) n (f(x + 1/n) - f(x)) = lim_(n -> oo) n (f(x - 1/n) - f(x)) = 0. $
  Show that $f$ is differentiable on $RR$.
]

#solution[
  It suffices to prove the statement for sequences of real numbers which converge at $0$ and are positive and negative. Suppose $a_n -> 0$ is a sequence of positive numbers. Let $m_n = ceil(1/a_n)$ is a subsequence of integers. Thus $1 <= a_n m_n <= 1 + a_n -> 1$. Thus there exists a $N_0 in NN$ such that $abs(1 - a_n m_n) < epsilon/(2L(f))$. By assumption, there exists a $N_1 in NN$ such that for all $n >= N$ we have that $ abs(n (f(x + (1) / (n)) - f(x))) < epsilon/2. $

  There exists a $M_0 in NN$ such that $a_n < (1/(M + 1))$ for all $n >= M_0$.
  Thus for all $n >= max(N_0, M_1)$:

  $
    abs((f(x + a_n) - f(x)) / (a_n)) & <= abs((f(x + 1/m_n) - f(x)) / (a_n)) + abs((f(x + 1/m_n) - f(x - a_n)) / (a_n)) \
                                     & <= epsilon/2 abs(1/(m_n a_n)) + L(f) abs((1/m_n - a_n) / (a_n)) \
                                     & <= epsilon/2 + L(f) abs(1 - m_n a_n) \
                                     & < epsilon
  $

]
