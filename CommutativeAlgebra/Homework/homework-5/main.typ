// Thin wrapper: the template lives in Math/_shared/math-homework (see _shared/README.md).
#import "@local/math-homework:1.0.0": *
#import "template.typ": *

#show: homework.with(
  course: "Math 215A",
  assignment: "Homework 5",
  name: "Arham Lodha",
  due: "October 28, 2026",
)

#let ox = $otimes$

Rings are understood to be commutative, unless stated otherwise.

#problem()[
  Give an example of a ring $A$ and a multiplicatively closed subset $S subset A$ such that the relation "$(a, s) tilde (b, t)$ if $a t - b s = 0 in A$" on $A times S$ is not an equivalence relation. [This explains the more complicated definition of $A[S^(-1)]$, in general. Make sure you know that definition.]
]
#solution[
  Consider $A = ZZ_6$ and $S = {1, 3}$. Consider $(0, 3), (0, 1), (2, 3)$. $             (0)*1 - 3*0 = 0 & => (0, 3) ~ (0, 1) \
          0*3 - 3 * 2 = 6 = 0 & => (0, 3) ~ (2, 3) \
  0 * 3 - 1 * 2 = -2 = 4 != 0 & => (0, 1) "is not equivalent to" (2, 3). $

  Thus $~$ is not transitive. Hence it cannot be a equivalence relation.
]

#problem()[
  Let $A$ be a ring, $f in A$, and $M$ an $A$-module. Show that the localization $M[1\/f]$ is isomorphic to the direct limit $ L = limits(lim_->)(M ->^f M ->^f M ->^f dots.c). $
]
#proof[ Let ${M_i}_(i = 1)^(oo)$ be a collection of copies of $M$ and for $x_i in M_i$, $x_i$ is a copy of $x in M$ that is in $M_i$. $ L = lcoset(union.sq.big_(i = 1)^(oo) M_i, (x_i ~ y_j <=> exists k >= i, j in.rev f^(k - i) x_i = f^(k - j) y_j )) \ $
  Let $ T: L & -> M[1/f] \
   x_i & -> x_i/f^i $
  *Well defined:* Suppose $x_i ~ y_j$, thus exists $k >= i, j$ such that $ f^(k - i) x_i & = f^(k - j) y_j. $ Furthermore, note that $x_i ~ f^(k - i) x_i = f^(k - j) y_j ~ y_j$ and that $f^(k - i) x_i = f^(k - j)y_j in M_k$.
  $
    T(f^(k - i) x_i) & = (f^(k - i) x_i) / (f^(k)) = (x_i) / (f^(i) ) = T(x_i)
  $

  Thus $T(f^(k - i)x_i) = T(x_i)$. By a symmetric argument, $T(f^(k - j) y_j) = T(y_j)$. Thus $ T(x_i) = T(f^(k - i) x_i) = T(f^(k - j) y_j) = T(y_j). $ Thus $T$ is well defined.

  *A linear*: Let $k >= i, j$ thus $ T(x_i + y_j) = (f^(k - i) x_i + f^(k - j) y_j ) / (f^k) & = (x) / (f^i) + (y) / (f^j) = T(x_i) + T(y_j) $ and $ T(a x_i) & = (a x) / (f^i) = a T(x_i) $

  *Injective*: Suppose $T(x_i) = 0$. Then $ 0 = x/f^i => 0/f = x/f^i. $ Thus there exists a $n in NN$ such that $f^n (f x - f^i*0) = 0 => f^(n + 1) x = 0 => x_i = 0 in L$.

  *Surjective*: $forall r in M[1/f]$, $ r = m/f^k $ for $m in M$ and $k in NN_0$. $T(m_k) = m/f^k$.

  Thus the map is a isomorphism as a $A[1/f]$ module.
]

#problem()[
  Let $R$ be a ring, $f in R$. Show that the localization $R[1\/f]$ is isomorphic to $R[x] \/ (f x - 1)$ (as an $R$-algebra).
]
#proof[
  Let $T: R[x] -> R[1/f]$ where for $r in R$, $r -> r$, and $x -> 1/f$. $T$ is a $R$-algebra homomorphism. Note that $ 0 = T(sum_(k = 0)^(n) a_k x^k) & = sum_(k = 0)^(n) (a_k) / (f^k) \
                                 & = (sum_(k = 0)^(n) f^(n - k) a_k)/f^k \
       f^m (sum_(k = 0)^(n) a_k) & = sum_(k = 0)^(n) f^(n + m - k) a_k \
                                 & = 0 $
]

#problem()[
  Let $R$ be a ring, $S subset R$ a multiplicatively closed subset, $M$ an $R$-module. Suppose that for every $s in S$, multiplication by $s$ is a bijection from $M$ to itself. Show that the natural map $M -> M[S^(-1)]$ is an isomorphism. As a sample application, show that the localization of the $ZZ$-module $ZZ \/ 8$ at the prime ideal $(2) subset ZZ$ is simply $ZZ \/ 8$.
]

#problem()[
  A _finite algebra_ over a ring $A$ means an $A$-algebra which is finitely generated as an $A$-module. Show that a finite flat $ZZ$-algebra is free as a $ZZ$-module, and give an example of a flat $ZZ$-algebra which is not free as a $ZZ$-module. Is a flat $ZZ$-algebra of finite type always free as a $ZZ$-module?
]
