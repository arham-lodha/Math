#import "template.typ": *

#show: homework.with(
  course: "Algebra",
  assignment: "Homework 1",
  name: "Arham Lodha",
  due: "September 23, 2026",
)

#problem(todo: true)[
  Let $a_1, a_2, dots, a_n$ be elements of a group $G$. Define the product of the $a_i$'s by induction:
  $ a_1 a_2 dots.c a_n = (a_1 a_2 dots.c a_(n-1)) a_n. $
  #part(todo: true)[
    Prove that
    $ a_1 a_2 dots.c a_n b_1 b_2 dots.c b_m = (a_1 a_2 dots.c a_n)(b_1 b_2 dots.c b_m). $
  ]
  #part(todo: true)[
    Prove that $a_1 a_2 dots.c a_n$ is equal to the product of the $a_i$'s with the parentheses inserted arbitrarily.
  ]
]
#solution()[
  *(a)*: $a_1 dots.c a_n b_1 = (a_1 dots.c a_n) b_1$ by the definition of the product above. Suppose for the sake of induction, $ a_1 dots.c a_n b_1 dots b_k = (a_1 dots.c a_n)(b_1 dots.c b_k). $ Thus by the definition of product and the inductive hypothesis, we have that $ a_1 dots.c a_n b_1 dots.c b_(k + 1) & = (a_1 dots.c a_n b_1 dots.c b_k) b_(k + 1) \
                                      & = (a_1 dots.c a_n)(b_1 dots.c b_k)b_(k + 1) \
                                      & = (a_1 dots.c a_n)(b_1 dots.c b_(k + 1)). $ Thus by induction the claim is true.

  *(b)*: The statement is trivially true for $n = 1$. Suppose for the sake of induction, the statement is true for all $n <= k$.
]

#problem(todo: true)[
  #part(todo: true)[
    Prove that for every integer $n > 0$, the set of all complex $n$th roots of unity is a group with respect to complex multiplication. Show that this group is cyclic.
  ]
  #part(todo: true)[
    Prove that if $G$ is a cyclic group of order $n$ and $k$ divides $n$, then $G$ contains exactly one subgroup of order $k$.
  ]
]
#solution[
  *(a)*: Let $omega = e^(2 pi i \/ n).$ Let $mu_n := {1, omega, omega^2, ..., omega^(n - 1)}$, is the set of complex $n$-th roots of unity. $forall a, b in mu_n$, $a = omega^alpha$ and $b = omega^(beta)$ for some $alpha, beta in {0, ..., n-1}$. Then $ a b &= omega^(alpha + beta) \ & = e^(2 pi i (alpha + beta) \/ n) \ &= cases(e^(2 pi i (alpha + beta) \/ n) "if" alpha + beta < n, e^(2 pi i (alpha + beta - n) \/ n) "if" alpha + beta >= n) in mu_n. $

  $1 * a = a$, by complex multiplication. Furthermore, $a = omega^(2 pi i alpha \/ n )$, then let $b = omega^(2 pi i (n - alpha) \/ n).$ Then $a b = e^(2 pi i) = 1$, and same with $b a$. Thus $mu_n$ is a group. Furthermore, by construction $forall a in mu_n$, $a = e^(2 pi i alpha \/ n) = omega^(alpha).$ Thus $omega$ generates $mu_n$.

  *(b)*: Let $G$ be a cyclic group of order $n$, thus $exists x in G$ such that $x^(n) = 1$ (but $x^(alpha) != 1$ for all $0 < alpha < n$) and $forall a in G$, $a = x^(alpha)$ for some $alpha in {1, ..., n - 1}$. Suppose $k divides n$. Thus $exists m in ZZ$ where $k m = n$. Consider the subgroup $H = chevron.l x^(m) chevron.r subset.eq G$. By definition $H$ is cyclic, furthermore, $(x^m)^(k) = x^(m k) = x^n$. Suppose $alpha in {1, ..., k - 1}$, then $(x^(m))^(alpha) = x^(m alpha) != 1$ because $0 < m alpha < n$. Thus $abs(H) = k$.

]

#problem(todo: true)[
  #part(todo: true)[
    Show that if $K$ and $N$ are two finite subgroups of a group $G$ of relatively prime orders, then $K inter N = {e}$.
  ]
  #part(todo: true)[
    Show that if a group $G$ has only a finite number of subgroups, then $G$ is finite.
  ]
]
#proof[
  *(a)*: Suppose $K, N < G$ subgroups where $gcd(abs(K), abs(H)) = 1$. Note that $K inter N$ is a subgroup of $K$ and $N$. We know that $abs(K inter N)$ divides $abs(K)$ and $abs(N)$, though since the greatest common divisor is $1$, $abs(K inter N) = 1 => K inter N = {e}$.

  *(b)*
]

#problem(todo: true)[
  Prove that a group $G$ is cyclic if and only if there is an element $a in G$ with $"ord"(a) = |G|$.
]
#proof[
  $=>:$ Suppose $G$ is cyclic. By definition, $exists x in G$ such that every element of $G$ can be realized as a integer power of $x$. Let $k = ord(x)$.
  1. $k < oo$: $forall a in ZZ$, let $r, p in ZZ$ where $r in {0, ..., k - 1}$ and $p k + r = a$. Then $ x^a = x^(p k + r) = (x^(k))^p x^r = 1^p x^r = x^r. $

  Thus ${1, x, ..., x^(k - 1)} = G$ and $abs(G) = k$.

  2. $k = oo$: Then note that $forall a, b in ZZ$ where $a != b => x^a != x^b$ otherwise $x^(a - b) = 1$ and $x$ has finite order. Then ${x^(z) : z in ZZ} subset.eq G$ and $G subset.eq {x^z : z in ZZ}$ thus $G = {x^z : z in ZZ} = chevron.l x chevron.r$

  $<==:$ Suppose $exists x in G$ where $k = ord(a) = abs(G)$.
  1. $k < oo$: $S = {1, x, ..., x^(k - 1)}$ has $k$ distinct elements of $G$ and $S subset.eq G$. But since $abs(G) = k$. $S = G$. Thus $x$ generates $G$ and $G$ is cyclic.
  2. $k = oo$: Statement is false in this case. Consider $G = ZZ^2$. Both $ZZ$ and $G$ are countably infinite, but $G$ has two generators (hence not cyclic).
]

#problem(todo: true)[
  #part(todo: true)[
    Show that if $a^2 = e$ for all elements $a$ of a group $G$, then $G$ is abelian.
  ]
  #part(todo: true)[
    Prove that if $G$ is a finite group of even order, then $G$ contains an element $a$ such that $a^2 = e$ and $a eq.not e$.
  ]
  #part(todo: true)[
    Show that every subgroup of index 2 is normal.
  ]
]

#solution[
  *(a)*: Suppose $forall a in G$ we have that $a^2 = e$. Then $forall a, b in G$ we have $ (a b)^2 = a b a b & = 1 \
                a b & = b^(-1) a^(-1) = b a $

  Thus $G$ is abelian.

  *(b)*: Suppose $G$ is a finite group with even order. Suppose $g in G$ where $ord(g) > 2 => g^(-1) != g$. Let $O_n = {g in G : ord(g) = n}$ and $P_(n) = {g in G : ord(g) > 2}$. Thus $G = O_1 union.sq O_2 union.sq P_2.$ Note $abs(O_1) =1$ and $abs(P_2)$ is even because if $a in P_2$ then $a^(-1) in P_2$. Thus if $abs(G)$ is even, then $abs(O_2)$ must be odd, equivalently $abs(O_2) >= 1$. Thus $exists g in O_2 subset G$ where $g != e$ and $g^2 = e$.

  *(c)*: Let $H <= G$ where $[G : H] = 2$. Let $g in G - H$, $lcoset(G, H) = {H, g H}$ and $rcoset(G, H) = {H, H g}$ since $[G: H] = 2$. $forall h in H$, $g h in.not H$, thus $g h in H g => exists h prime in H$ where $g h = h prime g => g h g^(-1) = h prime$. Thus $g H = H g$ $forall k in G$:
  1. $k in H$: $k H k^(-1) = H$ since $H$ is a subgroup.
  2. $k in.not H$: Thus $k in g H$ and $k = g a$ for $a in H$. $forall h in H$, $ k h k^(-1) = g a h (g a)^(-1) = g a h a g^(-1) = g h prime g^(-1) in H $ for $h prime = a h a^(-1)$.

  Thus $H$ is normal.
]

#problem(todo: true)[
  Find all groups (up to isomorphism) of order $<= 5$. What is the smallest order of a non-cyclic group?
]
#solution[I will use as fact that any group with prime order is cyclic. Thus the only groups with order 2, 3, and 5 are $ZZ_2, ZZ_3, ZZ_5$ respectively. The interesting question is studying groups of order $4$. Let $G$ be a group of order $4$.

  1. $G$ cyclic: $G = ZZ_4$
  2. $G$ is not cyclic: There exists a element $a in G$ where $ord(a) = 2$. Then $H = chevron.l a chevron.r$ is a index 2 subgroup of $G$ and hence normal. Suppose $b in.not H$, then $abs(b H) = 2$ ie $b H = {b, b a}$. Note that $ord(b) divides 4$ but $ord(b) != 4$ or $1$ (because then $b = e in H$ or $G$ cyclic). Thus $b$ has order 2. Let $phi: ZZ_2 times ZZ_2 -> G$ where $(1, 0) -> a$ and $(0, 1) -> b$. Suppose $phi(k_1, k_2) = e => a^(k_1) b^(k_2) = e => a^(k_1) = b^(-k_2).$ Note that $b in.not H$, thus $k_2 = 0$. Thus $a^(k_1) = e => k_2 = 0$. Thus $phi$ injective. Thus $ZZ_2 times ZZ_2 <= G$. But the orders are the same thus $G iso ZZ_2 times ZZ_2$.
]

#problem(todo: true)[
  Find all subgroups of the symmetric group $S_3$. Determine which subgroups are normal.
]
#solution[
  $S_3 = chevron.l x, y : x^2 = y^3 = 1 , x y x = y^(-1) chevron.r$. The subgroups of $S_3$ are $e, chevron.l x chevron.r$, $chevron.l x y chevron.r$, $chevron.l x y^(2) chevron.r$, $chevron.l y chevron.r$, and $S_3$. $e, S_3$ are both trivially normal. Suppose $H$ is a normal subgroup of $S_3$, $abs(H) = 1, 2, 3, 6$. If $abs(H) = 1 => H = e$, if $abs(H) = 6 => H = S_3$ both of which are trivially normal. Since $H$ is normal it is a kernel of a group homomorphism, ie $phi: G -> G \/ H$ is a  group homomorphism. $G \/ H$ has order $6 \/ abs(H)$. If $abs(H) = 3$, then $[G : H] = 2$ and hence $H$ is normal, the order 3 subgroup of $S_3$ is $chevron.l y chevron.r$. If $abs(H) = 2$, then $G \/ H iso ZZ_3$. $S_3 - H$ has 2 more elements of order 2 which must map to something with order 3 which is an impossibility. Thus there is no normal subgroup with order 2 in $S_3$. Hence the normal subgroups of $S_3$ are $e, S_3,$ and $chevron.l y chevron.r iso ZZ_3$.
]

#problem(todo: true)[
  Let $n$ be a natural number. Show that the map
  $ f : QQ slash ZZ -> QQ slash ZZ, quad f(a + ZZ) = n a + ZZ $
  is a well-defined homomorphism. Find $"Ker"(f)$ and $"Im"(f)$.
]
#solution[
  *Well Defined*: $f((r + z) + ZZ) = n(r + z) + ZZ = n r + n z + ZZ = n r + ZZ = f(r + ZZ)$ hence $f$ is well defined.

  *Homomorphism*: $f((r + ZZ) + (q + ZZ)) = f((r + q) + ZZ) = n(r + q) + ZZ = (n r + n q) + ZZ = (n r + ZZ) + (n q + ZZ) = f(r + ZZ) + f(q + ZZ)$

  Suppose $f(p/q + ZZ) = ZZ => n(p/q) in ZZ => q | n$. Thus $ ker(f) := {p/q + ZZ : p, q in ZZ, q | n, gcd(p, q) = 1} $

  Suppose $p/q + ZZ in im(f)$, then $exists r + ZZ in lcoset(QQ, ZZ)$ where $ n r + ZZ = p/q + ZZ => n r + z = p/q => n r = (p + q z) / (q) => r = (p + q z) / (q n) $
]

#problem(todo: true)[
  #part(todo: true)[
    Show that $ZZ slash 6ZZ tilde.equiv ZZ slash 2ZZ times ZZ slash 3ZZ$.
  ]
  #part(todo: true)[
    Prove that $n ZZ slash m n ZZ tilde.equiv ZZ slash m ZZ$.
  ]
]

#problem(todo: true)[
  Let $f : G -> H$ be a surjective group homomorphism and let $H'$ be a subgroup of $H$.
  #part(todo: true)[
    Show that $f^(-1)(H')$ is a subgroup of $G$.
  ]
  #part(todo: true)[
    Prove that the assignment $H' |-> f^(-1)(H')$ yields a bijection between the set of all subgroups of $H$ and the set of all subgroups of $G$ that contain $"Ker"(f)$.
  ]
  #part(todo: true)[
    Prove that a subgroup $H'$ is normal in $H$ if and only if $f^(-1)(H')$ is normal in $G$. Show that $G \/ f^(-1)(H') tilde.equiv H \/ H'$. Prove that the assignment $H' |-> f^(-1)(H')$ yields a bijection between the set of all normal subgroups of $H$ and the set of all normal subgroups of $G$ that contain $"Ker"(f)$.
  ]
]
