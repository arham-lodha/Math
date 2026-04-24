#import "@preview/lemmify:0.1.8": *
#import "@preview/ilm:1.4.1": *

#set text(lang: "en")

#show: ilm.with(
  title: [Modular Forms],
  author: "Arham Lodha",
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)

#let (
  theorem,
  lemma,
  corollary,
  remark,
  proposition,
  example,
  proof,
  definition,
  rules: thm-rules,
) = default-theorems("thm-group", lang: "en")
#show: thm-rules


= Large Deviations for Sparse Graphs
== A Approximation for Partition Functions

Take any $N >= 1$. Let $abs(abs(f))$ be the supremum norm of any function $f: [0, 1]^(N) -> RR$. Suppose $f in C^(2)((0, 1)^(N))$ and $f, f prime, f prime prime$ extend continously to the boundary. For each $i$ and $j$, let $ f_(i) = (diff f)/(diff x_(i)) " and " f_(i j) = (diff^(2) f)/(diff x_(i) diff x_(j)) $

Define,

$ a := abs(abs(f)) ", " b_(i) := abs(abs(f_(i))) ", " c_(i j) := abs(abs(f_(i j))) $

Given $epsilon > 0$, let $cal(D)(epsilon) subset RR^(N)$ finite such that for all $x in {0, 1}^(N)$, there exists $d = (d_(1), #sym.dots.h, d_(N)) in cal(D)(e)$ such that

$ sum_(i = 1)^(N) (f_(i)(x) - d_(i))^(2) <= N epsilon^(2) $

Define $ F := ln(sum_(x in {0, 1}^(N))^() e^(f(x))) $

#definition[
  In terms of statistical mechanics, $F$ is the *logarithm of the partition function* of the probability measure on ${0, 1}^(N)$ with the Hamiltonian $f$.
]

Let $I: [0, 1] -> RR$ where $ I(x) = x ln x + (1 - x) ln(1- x) $, you can naturally extend $I: [0, 1]^(N) -> RR$ where $ I(x_1, #sym.dots.h, x_(N)) = sum_(i = 1)^(N) I(x_(i)) $

The following theorem gives a sufficient condition on $f$ under which the approximation $ F = sup_(x in [0, 1]^(N)) (f(x) - I(x)) + "lower order terms" $ is valid. This is referred to as "naive mean field approximation." Roughly speaking in addition to the smoothness assumptions, the gradient vector $gradient f$ can be encoded by $o(N)$ bits of information. A bit more precisely, $abs(cal(D)(epsilon)) = e^(o(N))$ for some $epsilon = o(1)$, where the implicit assumption is that $N -> oo$ and $f$ varies with $N$. This is the "low complexity gradient" condition.


#theorem[Let $f, a, b_(i), c_(i, j), cal(D)(epsilon), F, "and" I$ be defined as above. Then for any $epsilon > 0$, $ F <= sup_(x in [0, 1]^(N)) (f(x) - I(x)) + "complexity" + "smoothness" $ where $ "complexity" = (1)/(4)(N sum_(i = 1)^(N) b_(i)^( 2))^((1)/(2)) epsilon + 2 N epsilon + ln(abs(cal(D)(epsilon))) $ and $ "smoothness" &= 4(sum_(i = 1)^(N)(a c_(i i) + b_(i)^(2)) + (1)/(4) sum_(i, j = 1)^(N) (a c_(i i)^(2) + b_(i)b_(j)c_(i j) 4 b_(i) c_(i j)))^((1)/(2)) \
  &+ (1)/(4)(sum_(i = 1)^(N) b_(i)^(2))^((1)/(2)) (sum_(i = 1)^(N) c_(i i)^(2))^((1)/(2)) + 3 sum_(i = 1)^(N) c_(i i) + ln(2). $ Additionally, $ F >= sup_(x in [0, 1]^(N))(f(x) - I(x)) - (1)/(2) sum_(i = 1)^(N) c_(i i) $      ]
