#import "template.typ": *
#import "@preview/commute:0.3.0": arr, commutative-diagram, node

#show: homework.with(
  course: "Math 215A",
  assignment: "Homework 3",
  name: "Arham Lodha",
  due: "October 14, 2026",
)

Rings are understood to be commutative, unless stated otherwise.

#problem()[
  Show that the kernel of the $CC$-algebra homomorphism $CC[x, y] -> CC[t]$ given by $x |-> t^2$ and $y |-> t^3$ is the ideal $(x^3 - y^2)$. (One possible approach is to show first that every element of the quotient ring $CC[x, y] \/ (x^3 - y^2)$ can be written as $f(x) + g(x) y$ for some polynomials $f$ and $g$.) Deduce that the ideal $(x^3 - y^2)$ in $CC[x, y]$ is prime.
]
#proof[
  Let $phi: CC[x, y] -> CC[t]$ be $CC$-algebra homomorphism described above. Note that $(x^3 - y^2) subset.eq ker phi$.
  We want to show that $ker phi subset.eq (x^3 - y^2)$. Note that, $CC[x, y] iso (CC[x])[y]$. Consider elements $ f in (CC[x, y]) / ((x^3 - y^2)) iso ((CC[x])[y]) / ((x^3 - y^2)) = Q. $ Note $ f = sum_(k = 0)^(n) P_k y^k $ for $P_k in CC[x]$. However, note that $y^2 = x^3$ in $Q$. This means $ y^k = y^(floor(k / 2) * 2 + k mod 2) = x^(3 * floor(k/2)) y^(k mod 2) in Q $ Thus $ f & = P_0 + P_1 y + sum_(k = 2)^(n) P_k x^(3 * floor(k/2)) y^((1 - (-1)^k) / 2) \
  & = (P_0 + sum_(k = 1)^(floor(n/2)) P_(2 k) x^(3k) ) + (P_1 + sum_(k = 1)^(floor((n - 1) / 2)) P_(2k + 1) x^(3 k) )y in Q $
  Let $ g & = (P_0 + sum_(k = 1)^(floor(n/2)) P_(2 k) x^(3k) ) in CC[x] \
  h & = (P_1 + sum_(k = 1)^(floor((n - 1) / 2)) P_(2k + 1) x^(3 k)) in CC[x]. $ Thus $f = g + h y in Q$.
  Note that since $(x^3 - y^2) subset.eq ker phi$, $phi$ factors through $Q$. Hence consider the induced map $overline(phi): Q -> CC[t]$. Suppose $f in ker(overline(phi))$. Let $f = g + h y$ for $g, h in CC[x]$. $ 0 = overline(phi)(f) & = overline(phi)(g(x) + h(x) y) \
                       & = g(t^2) + h(t^2) t^3. $ Thus $ h(t^2)t^3 = -g(t^2). $ Note the left hand side has odd degree, while the right has even degree if $h, g != 0$ which is a contradiction. Thus $h, g = 0$ and $f = 0$. Hence $overline(phi)$ has kernel $(0)$. Thus $ker(phi) = (x^3 - y^2)$.

]

#problem()[
  For any commutative ring $R$, show that $Spec(R)$ is quasi-compact. (That is, if $Spec(R)$ is the union of some collection of open subsets, then it is the union of finitely many of them. In point-set topology this would just be called "compact". The word "quasi-compact" is meant to emphasize that these topological spaces are not necessarily Hausdorff.)
]
#proof[
  A space $X$ is quasi-compact if and only if the following holds: for any collection ${C_alpha}_(alpha in Lambda)$ of closed subsets of $X$ with $ inter.big_(alpha in Lambda) C_alpha = emptyset, $ there exist ${alpha_1, ..., alpha_n} subset.eq Lambda$ such that $ inter.big_(k = 1)^n C_(alpha_k) = emptyset. $ This formulation of quasi-compactness, comes from taking the standard open cover definition and taking complements.  We will use this formulation, as closed sets have a nicer description in $Spec(R)$. Every closed subset of $Spec(R)$ is of the form $V(I) = {frak(p) in Spec(R) : I subset.eq frak(p)}$ for some ideal $I subset.eq R$. Thus any collection of closed sets corresponds to a collection of ideals ${I_alpha}_(alpha in Lambda)$ with $C_alpha = V(I_alpha)$. Note that $ inter.big_(alpha in Lambda) V(I_alpha) = V(sum_(alpha in Lambda) I_alpha), $ since a prime contains every $I_alpha$ if and only if it contains their sum. Thus we want to show that for any collection of ideals ${I_alpha}_(alpha in Lambda)$ such that for all $frak(p) in Spec(R)$: $ sum_(alpha in Lambda) I_alpha subset.eq.not frak(p), $ there exist ${alpha_1, ..., alpha_n} subset.eq Lambda$ such that for all $frak(p) in Spec(R)$: $ sum_(k = 1)^n I_(alpha_k) subset.eq.not frak(p). $ This becomes trivial, because since $ sum_(alpha in Lambda) I_(alpha) subset.eq.not frak(p), $ it cannot be in any prime ideal (and hence maximal ideal). Furthermore, it implies that it is not maximal itself and since every proper ideal is contained in a maximal ideal or is maximal itself, this implies $ sum_(alpha in Lambda) I_(alpha) = R => 1 in sum_(alpha in Lambda) I_(alpha). $ By the definition of sum, there exists ${alpha_1, ..., alpha_n} in Lambda$ such that $ 1 &in sum_(k = 1)^(n) I_(alpha_k) => sum_(k = 1)^(n) I_(alpha_k) = R => sum_(k = 1)^(n) I_(alpha_k) subset.eq.not frak(p) $ for any $frak(p) in Spec(R)$.  ]

#problem()[
  Let $R$ be a nonzero commutative ring. Let $I$ and $J$ be sets of different cardinalities. Show that the free $R$-modules $R^(oplus I)$ and $R^(oplus J)$ are not isomorphic. (Hint: this is true when $R$ is a field.)
]
#proof[Note that $R$ must have a maximal ideal of $frak(m)$.
  Note that $ (R^(oplus I))/(frak(m)^(oplus I)) iso ((R) / (frak(m)))^(oplus I). $ Suppose $R^(oplus I) iso R^(oplus J)$ as $R$ modules, thus there exists a $R$-linear map $T: R^(oplus I) -> R^(oplus J)$. Thus we have the following commutative diagram
  #align(center)[#commutative-diagram(
    node((0, 0), $R^(oplus I)$),
    node((0, 1), $R^(oplus J)$),
    node((1, 0), $(R slash frak(m))^(oplus I)$),
    node((1, 1), $(R slash frak(m))^(oplus J)$),
    arr((0, 0), (0, 1), $T$),
    arr((0, 0), (1, 0), $pi_I$, label-pos: right),
    arr((0, 1), (1, 1), $pi_J$),
    arr((1, 0), (1, 1), $tilde(T)$, label-pos: right),
  )]

  $tilde(T)$ is a $lcoset(R, frak(m))$ isomorphism. Thus we have a isomorphism of vector spaces, hence $abs(I) = abs(J)$.
]
