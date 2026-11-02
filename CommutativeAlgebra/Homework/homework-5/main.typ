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
  Let $phi: R -> lcoset(R[x], (f x - 1))$ where $r -> r$. $phi$ is a ring homomorphism. $phi (f) = f in lcoset(R[x], (f x - 1))$. Note that $ f x = 1 => f "is unit in" lcoset(R[x], (f x - 1)). $ By the universal property, $exists tilde(phi): R[1/f] -> lcoset(R[x], (f x - 1))$ a ring homomorphism, note under this map $1/f -> x$. We also want to check that its a $R$-algebra map, this $tilde(phi)(r (q) / (f^k)) = tilde(phi)((r q) / (f^k)) = r q x^k = r tilde(phi)(q/f^k).$


  By the universal property of the polynomial ring, there exists a unique $R$-algebra homomorphism: $ tilde(psi): R[x] & -> R[1/f] \
                 r & -> r/1 \
                 x & -> 1/f. $

  $
    tilde(psi)(f x - 1) &= tilde(psi)(f) tilde(psi)(x) - 1 \ &= f * 1/f - 1 = 0 => (f x - 1) subset.eq ker tilde(psi) => tilde(psi) "factors through" tilde(psi): R[x] / ((f x - 1)) -> R[1/f]
  $


  Note that $ (phi compose psi)(q/f^k) & = phi(q x^k) \
                           & = q * 1/f^k \
                           & = q/f^k $ and $ (phi compose psi)(sum_(k = 0)^(n) a_k x^k) & = phi (sum_(k = 1)^(n) (a_k) / (x^k) ) \
                                             & = sum_(k =1)^(n) a_k x^k $
]

#problem()[
  Let $R$ be a ring, $S subset R$ a multiplicatively closed subset, $M$ an $R$-module. Suppose that for every $s in S$, multiplication by $s$ is a bijection from $M$ to itself. Show that the natural map $M -> M[S^(-1)]$ is an isomorphism. As a sample application, show that the localization of the $ZZ$-module $ZZ \/ 8$ at the prime ideal $(2) subset ZZ$ is simply $ZZ \/ 8$.
]
#proof[
  Let $phi: M -> M[S^(-1)]$ where $m -> m/1$.

  *Injective*: Suppose $ phi(m) = 0, $ thus exists a $s in S$ such that $ s m = 0. $. Since $s times dot: M -> M$ is bjective hence injective, $m = 0$. Thus $ker phi = {0}$.

  *Surjective*: $forall a/s in M[S^(-1)]$, $exists! b in M$ such that $s b = a$. Thus $ phi(b) & = b/1 = a/s. $

  Hence $phi$ is a isomorphism.

  *Localizing at $(2)$ in $lcoset(ZZ, 8)$*: $S = ZZ - (2) = {1, 3, 5, ..., 2n + 1, ...}$. All odd number are units in $lcoset(ZZ, 8)$, thus multiplication by them simply permutes the elements of $lcoset(ZZ, 8)$. Hence localizing $lcoset(ZZ, 8)$ at two doesn't do anything ie $ (ZZ/8)[ZZ - (2)] = ZZ/8 $
]

#problem()[
  A _finite algebra_ over a ring $A$ means an $A$-algebra which is finitely generated as an $A$-module. Show that a finite flat $ZZ$-algebra is free as a $ZZ$-module, and give an example of a flat $ZZ$-algebra which is not free as a $ZZ$-module. Is a flat $ZZ$-algebra of finite type always free as a $ZZ$-module?
]
#proof[Let $A$ be a flat finite $ZZ$ algebra. By the structure theorem for finitely generated $ZZ$ modules, $A = ZZ^d oplus T(A)$ where $d = rank_ZZ (A)$ and $T(A)$ is the torsion of $A$ where $T(A) = oplus.big_(i = 1)^k lcoset(ZZ, p^(r_i))$ for $k >= 0$. Assume the contrary $k > 0$. Consider the short exact sequence $ 0 -> ZZ^k ->^(D) ZZ^k -> T(A) -> 0. $ where $D = diag(p_1^(r_1), ..., p_k^(r_k)).$

  Apply the $ox_(ZZ) A$ functor, we should have $ 0 -> A^k ->^(D ox 1) A^k -> T(A)^d oplus T(A)^(ox 2) -> 0 $
  Now take $x in A$, a generator for the $lcoset(ZZ, p_i^r_i)$ summand. Thetn $x != 0$, but $p_i^(r_i) x = 0$. So $(x, 0, ...., 0) in ker (D ox 1)$, contradicting injectivity, meaning $k = 0$ and $T(A) = 0$ and $A = ZZ^d$.


  $QQ$ is a flat $ZZ$ algebra, but isn't free as a $ZZ$-module. $ ZZ[1/2] iso (ZZ[x]) / ((2x - 1)) $ and thus $ZZ[1/2]$ is a $ZZ$-algebra of finite type but isn't free. $ZZ[1/2]$ is flat and hence is a counterexample to the claim that all finite type $ZZ$-algebras are always free.
]
