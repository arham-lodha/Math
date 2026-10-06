#import "template.typ": *

#show: homework.with(
  course: "Math 215A",
  assignment: "Homework 2",
  name: "Arham Lodha",
  due: "October 7, 2026",
)

Rings are understood to be commutative, unless stated otherwise.

For the sake of notation, let $ [a_0, ..., a_n] = sum_(k = 0)^(n) a_k x^k in A[x] $ and $a_n != 0$.

#let Spec = $#math.op("Spec")$


#problem()[
  Let $k$ be a field. Show that $k[x]$ and $k[x, x^(-1)]$ are not isomorphic as $k$-algebras. (Here $k[x, x^(-1)]$ can be defined as the ring of Laurent polynomials $a_(-n) x^(-n) + dots + a_n x^n$, where $n >= 0$ and $a_i in k$.)
]
#solution[
  Assume the contrary, that $k[y]$ and $k[x, x^(-1)]$ are isomorphic as $k$-algebras. Thus there exists a $L: k[x,x^(-1)] -> k[y]$ a $K$ algebra isomorphism. Then $L(x) = f = [a_0, ..., a_n]$ is a unit because $x$ is a unit in $k[x, x^(-1)]$. Thus exists $g = f^(-1) in k[x]$. $ g := [b_0, ..., b_m]. $ $ 1 = f g = a_0 b_0 + .... + a_n b_m y^(m n) => a_n b_m = 0. $ But $a_n != 0 != b_m$. A field has no nonzero zero divisors. Thus a contradiction occurs.
]

#problem(todo: true)[
  Let $k$ be a field. Show how to view the ring $k[x, y] \/ (x - 1, x^2 + y^2 - 1)$ as the quotient ring of $k[y]$ by a certain ideal. Deduce that the ideal $(x - 1, x^2 + y^2 - 1)$ is not prime, and compute its radical.
]
#solution[Note that
  $ (k[x, y]) / ((x - 1, x^2 + y^2 - 1)) iso lcoset(((k[x, y]) / ((x - 1))), (x^2 + y^2 - 1)) $

  and the following isomorphism:
  $
    (k[x, y]) / ((x - 1)) & iso k[y] \
                        1 & -> 1 \
                        x & -> 1 \
                        y & -> y
  $

  Under this isomorphism, we have $(x^2 + y^2 - 1) -> (y^2)$. Thus $ (k[x, y]) / ((x - 1, x^2 + y^2 - 1)) iso (k[y]) / ((y^2)). $ $y * y = 0 in lcoset(k[y], (y^2))$, thus the ring isn't a domain. Hence the ideal isn't prime.

  TODO CALCULATE RADICAL.


]

#problem(todo: true)[
  #part(todo: true)[
    Let $R$ be a domain. Show that the polynomial ring $R[x]$ is a domain and that the group of units $R[x]^*$ is equal to $R^*$ (viewed as constant polynomials). Give an example showing that this description of $R[x]^*$ fails for $R$ not a domain, and say where your proof fails. By induction on $n$, it follows that the polynomial ring $A = k[x_1, dots, x_n]$ over a field $k$ is a domain, and that $A^* = k^*$.
  ]
  #part(todo: true)[
    Show that the power series ring $B = k[[x_1, dots, x_n]]$ over a field is also a domain, and find the group of units $B^*$.
  ]
]
#proof[
  *(a)*: Note that trivially, $R^(times ) subset.eq (R[x])^times$. We have to show the opposite containment. Assume the contrary, that $f in (R[x])^times$ and $deg(f) = n >= 1$, thus $f = [a_0, ..., a_n]$ where $a_n != 0$. There exists $g = [b_0, ..., b_m]$ a multiplicative inverse of $f$. $ 1 & = f g = a_0 b_0 + ... + a_m b_n x^(m + n) => a_m b_n = 0 . $ However since both $a_m$ and $b_n$ are nonzero and $R$ is a domain, they cannot multiply to 0. Hence a contradiction occurs. Thus the only units in $(R[x])^times$ are 0 degree polynomial (constant polynomials) and to be a unit they must be in $R^times$. Note that $R[x]$ is a domain as well (look at highest degree in any multiplication of polynomials). Now use the isomorphism $R[x_1, ..., x_n] iso R[x_1, ..., x_(n - 1)][x_n]$ together with the inductive hypothesis, $(R[x_1, ..., x_(n - 1) ])^(times ) iso R^(times )$ and the above argument to get the more general statement.

  The issue that occurs when $R$ is not a domain, is that our argument relies on the fact that there are no nonzero zero divisors ($a_m b_n = 0$) which is not true if $R$ is not a domain. Let $R = ZZ_4$, 2 is a zero divisor. $ (1 + 2x)^2 = 1 + 4 x + 4 x^2 = 1 in ZZ_4 [x]. $ Thus $(1 + 2x) in (ZZ_4[x])^times$

  *(b):* Let $B_n := k[x_1, ..., x_n]$ and $B_0 = k$. Note the canonical isomorphism, $B_n iso B_(n - 1)[[y]]$. Let $M_n: B_n -> ZZ_(>=0)$ where $f in B_n$ goes to the minimal $a + 1$ where $P_a != 0$ where $ f = sum_(k >= 0)^() P_k y^k $ where $f$ is viewed as a element of $B_(n - 1)[y]$. If no such $a$ exists (ie $f = 0$), then $M_n (0) = 0$.

  For $f in B_n$ to be a unit a necessary condition is that the constant term must be a unit (we will prove that its a sufficient condition). $B_0$ is a domain, $B_0^(times) = K^times$. Suppose $B_k$ is a domain that $ (B_k)^(times) = {f in B_k : "constant term of " f "is" 0} $
  Suppose $f, g in B_(k + 1) iso B_k [[y]]$ nonzero thus $M_k (f), M_g (f) >= 1$. Let $a := M_k (f) - 1$ and $b := M_k (g) - 1$. $ f & := sum_(k >= a)^() P_k y^(k) \
  g & = sum_(k >= b)^() Q_k y^k $ where $P_k, Q_k in B_k$.  Thus $ f g := P_a Q_b y^(a + b) + O(y^(a + b + 1) ). $ Since $B_(k)$ is a domain, $P_a Q_b != 0$ this means that $f g != 0$. Hence $B_(k + 1) = k[[x_1, ..., x_(k + 1)]]$ is a domain. Suppose $f in B_k [[y]] iso B_(k + 1)$, $ f := sum_(k >= 0) P_k y^k $ where $P_0 in (B_k)^times$. We will define a inverse for $f$ whose coefficients are recursively defined. Let $       Q_0 & := (1) / (P_0) \
  Q_(k + 1) & = -(1) / (P_0) sum_(j = 1)^(k + 1) P_j Q_(k + 1 -j) $

  Let $ g := sum_(k >= 0) Q_k y^k. $

  Now $ f g & = sum_(k = 0)^(oo) (sum_(l = 0)^(k) P_k Q_(k - l) ) x^k. $ Looking coefficient by coefficient for $k >= 1$ we see:

  $ sum_(l = 0)^(k - 1) P_k Q_(k - l) + P_0 (-1/P_0 sum_(l = 0)^(k) P_k Q_(k + l) ) & = 0 $

  For $k = 0$, we see $P_0 Q_0 = 1$. Thus $f g = 1$. Thus $ B_(k + 1)^(times) & := {[P_n]_(n in ZZ_(>=0) ) in B_(k)[y] : P_0 in B_k^(times) } \
                    & = {[P_n]_(n = 0)^(oo) in B_k [y] : "constant term of" P_0 in k^times } \
                    & = {f in B_(k + 1) : "constant term of" f in k^(times) } $

]

#problem(todo: true)[
  Let $A$ and $B$ be commutative rings. The product ring $A times B$ (not to be confused with a tensor product) is the product set, with ring structure $(a_1, b_1) + (a_2, b_2) = (a_1 + a_2, b_1 + b_2)$ and $(a_1, b_1)(a_2, b_2) = (a_1 a_2, b_1 b_2)$. State and prove a universal property that characterizes $A times B$ in the category of commutative rings. (If this is not familiar, see the section on category theory in chapter 1 of Serge Lang's book _Algebra_.)
]
#proof[
  In the category of commutative rings, the product ring has the universal property of the product.
]
#proposition()[
  $A times B$ exhibits the universal property of the product. In other words, if there exists a commutative ring $C$ with ring homomorphisms $q_1: C -> A$ and $q_2: C -> B$ there exists a unique ring homomorphisms $q: C -> A times B$ such that the resulting diagram commutes.

  #align(center)[
    #canvas(length: 0.8cm, {
      import cetz.draw: *
      let arr = (mark: (end: "stealth", fill: black, scale: 0.6), stroke: 0.6pt)
      content((0, 0), $A$)
      content((6, 0), $B$)
      content((3, 0), $A times B$)
      content((3, 2), $C$)
      line((2.0, 0), (0.4, 0), ..arr)
      line((4.0, 0), (5.6, 0), ..arr)
      line((2.7, 1.7), (0.3, 0.4), ..arr)
      line((3.3, 1.7), (5.7, 0.4), ..arr)
      line((3, 1.6), (3, 0.5), ..arr, stroke: (paint: black, thickness: 0.6pt, dash: "dashed"))
      content((1.2, -0.15), $pi_1$, anchor: "north")
      content((4.8, -0.15), $pi_2$, anchor: "north")
      content((1.3, 1.3), $q_1$, anchor: "south-east")
      content((4.7, 1.3), $q_2$, anchor: "south-west")
      content((3.15, 1.05), $q$, anchor: "west")
    })
  ] where $pi_i$ is projection map.
]
#proof[
  We will first prove existence and then uniqueness of $q$. Let $q: C -> A times B$ where $q(c) = (q_1(c), q_2(c))$. This is a ring homomorphism, because $q_1$, $q_2$ are ring homomorphisms. Now for uniqueness, suppose $q: C -> A times B$ and $q prime : C -> A times B$ cause the diagram to commute. We know that $ (pi_1 compose q)(c) & = (pi_1 compose q prime)(c) & = q_1 (c) \
  (pi_2 compose q)(c) & = (pi_2 compose q prime)(c) & = q_2(c). $ Thus $q(c) = (q_1(c), q_2(c)) = q prime (c)$. Hence $q = q prime$. Hence $q$ is unique.
]

#problem(todo: true)[
  For rings $A$ and $B$, give an example to show that an (additive) subgroup of the ring $A times B$ need not be of the form $S times T$, for subgroups $S subset A$ and $T subset B$. (The question is about equality of subgroups, not isomorphism of subgroups.) But show that every ideal in $A times B$ is of the form $I times J$ for ideals $I subset A$ and $J subset B$. Building on that, show that $"Spec"(A times B)$ is the disjoint union of $"Spec"(A)$ and $"Spec"(B)$, as a set. (In fact, it is the disjoint union as a topological space, but you need not prove that.)
]
#proof[
  Consider $ZZ^2$ and the additive subgroup $G = chevron.l vec(1, 1) chevron.r = {vec(k, k) : k in ZZ}$. $G$ doesn't arise as a product of two subgroups $S, T subset.eq ZZ$, because $1 in S, T => S, T = ZZ$.

  Suppose $K subset.eq A times B$ is a ideal. Let $pi_1: A times B ->> A$ and $pi_2: A times B ->> B$ be the standard projection maps. We will first show that $pi_1 (K)$ and $pi_2 (K)$ is a ideal (this is not true for general ring homomorphisms). It suffices to prove this for $pi_1 (K)$. $a_1, a_2 in pi_1 (K)$, there exists $b_1, b_2 in B$ such that $(a_1, b_1), (a_2, b_2) in K$, thus $(a_1 + a_2, b_1 + b_2) in K => a_1 + a_2 in pi_1 (K)$. $forall r in A$, $(r, 0) (a_1, b_1) = (r a_1, 0) in K => r a_1 in pi_1(K)$. Hence $pi_i (K)$ is a ideal. Now we will show $K = pi_1 (K) times pi_2 (K)$. $K subset.eq pi_1 (K) times pi_2 (K)$ is trivial. $forall a in pi_1 (K)$ and $forall b in pi_2 (K)$. Note that $(a, 0) in K$ and $(0, b) in K$ (multiply by $(1, 0)$ and $(0, 1)$ to any element that starts with $a$ and any element which ends with $b$). Hence $(a, 0) + (0, b) = (a, b) in K$. Thus $K = pi_1 (K) times pi_2(K)$.

  Suppose $frak(p) in Spec(A times B)$, $frak(p) = pi_1(frak(p)) times pi_2 (frak(p))$. Note that $ lcoset((A times B), frak(p)) ->^~ (A) / (pi_1(frak(p))) times (B) / (pi_2(frak(p))). $ note that $lcoset((A times B), frak(p))$ must be a domain. Assume the contrary that $pi_1(frak(p)) != A$ and $pi_2(frak(p)) != B$. Thus $ (1, 0) * (0, 1) = (0, 0) in (A) / (pi_1(A)) times (B) / (pi_2 (B)) $ this contradicts the domain nature of $lcoset((A times B), frak(p))$. Thus at least one must be $A$ or $B$. Thus $frak(p)$ is of the form $pi_1(frak(p)) times B$ or $A times pi_2 (frak(p))$ where $pi_i (frak(p))$ is prime. Thus $ Spec (A times B) := Spec(A) union.sq Spec(B) $
]

#problem(todo: true)[
  Let $k$ be a field. Since $R = k[x_1, dots, x_n]$ is a UFD, the ideal $(f)$ is prime for every irreducible polynomial $f$ in $R$. The following exercise gives some practice in finding irreducible polynomials. (I recommend proving this by hand rather than trying to use big theorems: just analyze what a factorization of the given polynomial would have to look like.)

  Show that a polynomial in $k[x_1, dots, x_n]$ of the form $x_n - f(x_1, dots, x_(n-1))$ is irreducible over $k$. Show that a polynomial of the form $x_n^2 - f(x_1, dots, x_(n-1))$ is irreducible over $k$ if and only if $f$ is not a square in $k[x_1, dots, x_(n-1)]$.
]


