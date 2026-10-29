#import "prelude.typ": *
#show: standalone.with(chapter: 2)

#let inj = $arrow.r.hook$
#let ox = $otimes$;
#let opl = $oplus$

= Modules

#exercise[
  Show that $(ZZ \/ m ZZ) times.circle_ZZ (ZZ \/ n ZZ) = 0$ if $m, n$ are coprime.
]
#proof[We will use the idea of 2.2, makes proof much easier. Consider the exact sequence $ ZZ ->^(times m) ZZ -> lcoset(ZZ, m ZZ) -> 0. $ Apply the $dot ox_A lcoset(ZZ, n ZZ)$ functor. $ lcoset(ZZ, n ZZ) ->^(times m) lcoset(ZZ, n ZZ) -> lcoset(ZZ, m ZZ) ox_ZZ lcoset(ZZ, n ZZ) -> 0. $ Note that $times m$ is a isomorphism since $m, n$ are co prime. Hence $ lcoset(ZZ, m ZZ) ox_ZZ lcoset(ZZ, n ZZ) = 0 $

]

#exercise[
  Let $A$ be a ring, $a$ an ideal, $M$ an $A$-module. Show that $(A \/ a) ox_A M$ is isomorphic to $M \/ a M$. [Tensor the exact sequence $0 -> a -> A -> A \/ a -> 0$ with $M$.]
]
#proof[
  Note the following, $a inj^(i) A -> lcoset(A, a) -> 0$. Tensoring by $M$ preserves exactness, $ a ox_(A) M ->^(i ox 1) A ox_A M -> lcoset(A, a) ox_A M -> 0. $ Thus $ lcoset(A, a) ox_A M iso lcoset((A ox_A M), ((i ox 1)(a ox_A M))) iso lcoset(M, a M). $ The last isomorphism comes from the canonical isomorphism $phi: A ox_A M -> M$ where $(alpha, m) -> alpha m$. $ (phi compose (i ox 1))(a ox_A M) & = phi({sum_(k = 1)^(n) a_k ox m_k: n in NN, a_k in a, m_k in M }) \
                                   & = {sum_(k = 1)^(n) a_k m_k : n in NN, a_k in a, m_k in M } = a M $
]

#exercise[
  Let $A$ be a local ring, $M$ and $N$ finitely generated $A$-modules. Prove that if $M times.circle N = 0$, then $M = 0$ or $N = 0$. [Let $m$ be the maximal ideal, $k = A \/ m$ the residue field. Let $M_k = k times.circle_A M iso M \/ m M$ by Exercise 2. By Nakayama's lemma, $M_k = 0 => M = 0$. But $M times.circle_A N = 0 => (M times.circle_A N)_k = 0 => M_k times.circle_k N_k = 0 => M_k = 0$ or $N_k = 0$, since $M_k, N_k$ are vector spaces over a field.]
]

#exercise[
  Let $M_i$ $(i in I)$ be any family of $A$-modules, and let $M$ be their direct sum. Prove that $M$ is flat $<=>$ each $M_i$ is flat.
]

#exercise[
  Let $A[x]$ be the ring of polynomials in one indeterminate over a ring $A$. Prove that $A[x]$ is a flat $A$-algebra. [Use Exercise 4.]
]

#exercise[
  For any $A$-module $M$, let $M[x]$ denote the set of all polynomials in $x$ with coefficients in $M$, that is to say expressions of the form
  $ m_0 + m_1 x + ... + m_r x^r quad (m_i in M). $
  Defining the product of an element of $A[x]$ and an element of $M[x]$ in the obvious way, show that $M[x]$ is an $A[x]$-module.

  Show that $M[x] iso A[x] times.circle_A M$.
]
#proof[
  We will prove this by showing that $M[x]$ satisfies the universal property of $A[x] ox_(A) M$. Let $ Theta: A[x] times M -> M[x] \ (sum_(k = 0)^(n) a_k x^k, m) |-> sum_(k = 0)^(n) a_k m x^k. $ It is easy to check that $Theta$ is an $A$-bilinear map. Let $(N, phi)$ be an arbitrary pair of an $A$-module and an $A$-bilinear map $(A[x], M) ->^(phi) N$. We will show that there is a unique $A$-linear map from $psi: M[x] -> N$ such that $psi compose Theta = phi$. Note the following, $S = {m x^(k) : m in M, k in NN_0}$ forms a generating set of $M[x]$ as an $A$-module. Thus by fixing how a map behaves on $S$ and knowing that it is $A$-linear, it determines its behavior on $M[x]$.

  1. Existence: Let $psi(m x^k) = phi(x^k, m)$. Thus: $ psi(sum_(k = 0)^(n) m_k x^k) & = sum_(k = 0)^(n) phi(x^k, m_k). $ We will check well definedness, suppose $ sum_(k = 0)^(n) m_k x^k &= sum_(k = 0)^(n) m_k prime x^k => sum_(k = 0)^(n) (m_k - m prime_k) x^k = 0 => m_k = m prime_k. $
    $A$-linearity is immediate.

    $
      psi(Theta(sum_(k = 0)^(n) a_k x^k, m)) & = psi(sum_(k = 0)^(n) a_k m x^k) \
                                             & = sum_(k = 0)^(n) phi(x^k, a_k m) \
                                             & = sum_(k = 0)^(n) phi(a_k x^k, m) \
                                             & = phi(sum_(k = 0)^(n) a_k x^k, m)
    $
  2. Uniqueness: Suppose $psi$ and $psi prime$ satisfy the necessary conditions. We know that $ psi(m x^k) = psi(Theta(x^k, m)) = phi(x^k, m) = psi prime(Theta (x^k, m)) = psi prime (m x^k). $ Since $psi$ and $psi prime$ agree on a generating set of $M[x]$, and are both $A$-linear, they are equal.

  Thus $(M[x], Theta)$ satisfies the universal property of the tensor product of $A$-modules, and thus $M[x] iso A[x] ox_A M$ as $A$-modules.

  This isomorphism is $A[x]$-linear. The induced map $A[x] ox_A M -> M[x]$ sends $x^k ox m |-> m x^k$, so multiplication by $x$ on either side gives $x^(k + 1) ox m |-> m x^(k + 1)$. Since $A$ and $x$ generate $A[x]$ as a ring, the map commutes with the action of all of $A[x]$.

  *Alternate Proof*: Let $N$ be an arbitrary $A[x]$-module. We will show that there are bijections, natural in $N$, $ Hom_(A[x])(A[x] ox_A M, N) <-> Hom_A (M, N) <-> Hom_(A[x])(M[x], N). $ (Here $M[x]$ is an $A[x]$-module by part 1.) Naturality is clear: for $h: N -> N prime$ an $A[x]$-linear map, $(h compose phi) compose i = h compose (phi compose i)$, and similarly for $i_0$ below. Hence the functors $Hom_(A[x])(A[x] ox_A M, -)$ and $Hom_(A[x])(M[x], -)$ are naturally isomorphic, and by Yoneda $M[x] iso A[x] ox_A M$ as $A[x]$-modules.

  1. Let $i: M -> A[x] ox_A M$ where $m |-> 1 ox m$. Define $ T: Hom_(A[x])(A[x] ox_A M, N) -> Hom_(A)(M, N) \ phi |-> phi compose i. $ An $A[x]$-linear $phi$ is automatically $A$-linear, and it corresponds to an $A$-bilinear map $hat(phi): A[x] times M -> N$ where $ hat(phi)(f, m) & = phi(f ox m) \
                   & = f phi(1 ox m) \
                   & = f (phi compose i)(m). $

    Thus $phi$ is determined by $phi compose i$, so $T$ is injective. For surjectivity, let $psi in Hom_A (M, N)$. The map $hat(psi): A[x] times M -> N$, $(f, m) |-> f psi(m)$, is $A$-bilinear, so it induces an $A$-linear $phi: A[x] ox_A M -> N$ with $phi(f ox m) = f psi(m)$. It is $A[x]$-linear: $phi(g (f ox m)) = g f psi(m) = g phi(f ox m)$ for all $g in A[x]$. Also $T(phi) = phi compose i = psi$. Thus $T$ is a bijection.

  2. Let $i_0 : M -> M[x]$ where $m |-> m$ (that is, $m x^0$). Define $ S: Hom_(A[x])(M[x], N) -> Hom_(A)(M, N) \ gamma |-> gamma compose i_0. $ Injectivity: Let $gamma in Hom_(A[x])(M[x], N)$ and $u = gamma compose i_0$. Then $gamma(m x^k) = x^k gamma(m x^0) = x^k u(m)$. Any two maps with the same $u$ agree on the generators $m x^k$, hence by $A[x]$-linearity agree everywhere. Surjectivity: Let $u in Hom_(A)(M, N)$ and define $ gamma (sum_(k = 0)^(n) m_k x^k ) = sum_(k = 0)^(n) x^k u(m_k). $ This is additive and $A$-linear because $u$ is, and it commutes with multiplication by $x$. Since $A$ and $x$ generate $A[x]$ as a ring, $gamma$ is $A[x]$-linear. Also $gamma compose i_0 = u$. Thus $S$ is a bijection.

  Thus $T$ and $S$ are bijections, natural in $N$, and the claim follows by Yoneda as above.
]

#exercise[
  Let $p$ be a prime ideal in $A$. Show that $p[x]$ is a prime ideal in $A[x]$. If $m$ is a maximal ideal in $A$, is $m[x]$ a maximal ideal in $A[x]$?
]
#proof[
  *Direct Argument*: Consider $mod p: A[x] -> (lcoset(A, p))[x]$ where $ sum_(k = 1)^(n) a_k x^k -> sum_(k = 1)^(n) (a_k mod p ) x^k. $ $mod p$ is obvously surjective. If $k in ker(mod p) =>$ all coefficients of $k$ are in $p$, hence $k in p[x]$ . Use First Isomorphism theorem. Finally polynomials over a domain is a domain.
  No, this doesn't work for maximal ideals: consider $ZZ[x]$ and $(2 ZZ)[x]$, $FF_2 [x]$ is not a domain. .
]

#exercise[
  + If $M$ and $N$ are flat $A$-modules, then so is $M times.circle_A N$.
  + If $B$ is a flat $A$-algebra and $N$ is a flat $B$-module, then $N$ is flat as an $A$-module.
]

#exercise[
  Let $0 -> M' -> M -> M'' -> 0$ be an exact sequence of $A$-modules. If $M'$ and $M''$ are finitely generated, then so is $M$.
]

#exercise[
  Let $A$ be a ring, $a$ an ideal contained in the Jacobson radical of $A$; let $M$ be an $A$-module and $N$ a finitely generated $A$-module, and let $u: M -> N$ be a homomorphism. If the induced homomorphism $M \/ a M -> N \/ a N$ is surjective, then $u$ is surjective.
]

#exercise[
  Let $A$ be a ring $!= 0$. Show that $A^m iso A^n => m = n$. [Let $m$ be a maximal ideal of $A$ and let $phi: A^m -> A^n$ be an isomorphism. Then $1 times.circle phi: (A \/ m) times.circle_A A^m -> (A \/ m) times.circle_A A^n$ is an isomorphism between vector spaces of dimensions $m$ and $n$ over the field $k = A \/ m$. Hence $m = n$.] (Cf. Chapter 3, Exercise 15.)

  If $phi: A^m -> A^n$ is surjective, then $m >= n$.

  If $phi: A^m -> A^n$ is injective, is it always the case that $m <= n$?
]

#exercise[
  Let $M$ be a finitely generated $A$-module and $phi: M -> A^n$ a surjective homomorphism. Show that $"ker"(phi)$ is finitely generated. [Let $e_1, ..., e_n$ be a basis of $A^n$ and choose $u_i in M$ such that $phi(u_i) = e_i$ $(1 <= i <= n)$. Show that $M$ is the direct sum of $"ker"(phi)$ and the submodule generated by $u_1, ..., u_n$.]
]

#exercise[
  Let $f: A -> B$ be a ring homomorphism, and let $N$ be a $B$-module. Regarding $N$ as an $A$-module by restriction of scalars, form the $B$-module $N_B = B times.circle_A N$. Show that the homomorphism $g: N -> N_B$ which maps $y$ to $1 times.circle y$ is injective and that $g(N)$ is a direct summand of $N_B$. [Define $p: N_B -> N$ by $p(b times.circle y) = b y$, and show that $N_B = "im"(g) plus.circle "ker"(p)$.]
]

== Direct limits

#exercise[
  A partially ordered set $I$ is said to be a *directed set* if for each pair $i, j$ in $I$ there exists $k in I$ such that $i <= k$ and $j <= k$.

  Let $A$ be a ring, let $I$ be a directed set and let $(M_i)_(i in I)$ be a family of $A$-modules indexed by $I$. For each pair $i, j$ in $I$ such that $i <= j$, let $mu_(i j): M_i -> M_j$ be an $A$-homomorphism, and suppose that the following axioms are satisfied: (1) $mu_(i i)$ is the identity mapping of $M_i$, for all $i in I$; (2) $mu_(i k) = mu_(j k) compose mu_(i j)$ whenever $i <= j <= k$.

  Then the modules $M_i$ and homomorphisms $mu_(i j)$ are said to form a *direct system* $bold(M) = (M_i, mu_(i j))$ over the directed set $I$.

  We shall construct an $A$-module $M$ called the *direct limit* of the direct system $bold(M)$. Let $C$ be the direct sum of the $M_i$, and identify each module $M_i$ with its canonical image in $C$. Let $D$ be the submodule of $C$ generated by all elements of the form $x_i - mu_(i j)(x_i)$ where $i <= j$ and $x_i in M_i$. Let $M = C \/ D$, let $mu: C -> M$ be the projection and let $mu_i$ be the restriction of $mu$ to $M_i$.

  The module $M$, or more correctly the pair consisting of $M$ and the family of homomorphisms $mu_i: M_i -> M$, is called the *direct limit* of the direct system $bold(M)$, and is written $lim_(->) M_i$. From the construction it is clear that $mu_i = mu_j compose mu_(i j)$ whenever $i <= j$.
]

#exercise[
  In the situation of Exercise 14, show that every element of $M$ can be written in the form $mu_i (x_i)$ for some $i in I$ and some $x_i in M_i$.

  Show also that if $mu_i (x_i) = 0$ then there exists $j >= i$ such that $mu_(i j)(x_i) = 0$ in $M_j$.
]

#exercise[
  Show that the direct limit is characterized (up to isomorphism) by the following property. Let $N$ be an $A$-module and for each $i in I$ let $alpha_i: M_i -> N$ be an $A$-module homomorphism such that $alpha_i = alpha_j compose mu_(i j)$ whenever $i <= j$. Then there exists a unique homomorphism $alpha: M -> N$ such that $alpha_i = alpha compose mu_i$ for all $i in I$.
]

#exercise[
  Let $(M_i)_(i in I)$ be a family of submodules of an $A$-module, such that for each pair of indices $i, j$ in $I$ there exists $k in I$ such that $M_i + M_j subset.eq M_k$. Define $i <= j$ to mean $M_i subset.eq M_j$ and let $mu_(i j): M_i -> M_j$ be the embedding of $M_i$ in $M_j$. Show that
  $ lim_(->) M_i = sum_i M_i = union_i M_i. $
  In particular, any $A$-module is the direct limit of its finitely generated submodules.
]

#exercise[
  Let $bold(M) = (M_i, mu_(i j))$, $bold(N) = (N_i, nu_(i j))$ be direct systems of $A$-modules over the same directed set. Let $M, N$ be the direct limits and $mu_i: M_i -> M$, $nu_i: N_i -> N$ the associated homomorphisms.

  A *homomorphism* $Phi: bold(M) -> bold(N)$ is by definition a family of $A$-module homomorphisms $phi_i: M_i -> N_i$ such that $phi_j compose mu_(i j) = nu_(i j) compose phi_i$ whenever $i <= j$. Show that $Phi$ defines a unique homomorphism $phi = lim_(->) phi_i: M -> N$ such that $phi compose mu_i = nu_i compose phi_i$ for all $i in I$.
]

#exercise[
  A sequence of direct systems and homomorphisms
  $ bold(M) -> bold(N) -> bold(P) $
  is *exact* if the corresponding sequence of modules and module homomorphisms is exact for each $i in I$. Show that the sequence $lim_(->) M_i -> lim_(->) N_i -> lim_(->) P_i$ of direct limits is then exact. [Use Exercise 15.]
]

== Tensor products commute with direct limits

#exercise[
  Keeping the same notation as in Exercise 14, let $N$ be any $A$-module. Then $(M_i times.circle N, mu_(i j) times.circle 1)$ is a direct system; let $P = lim_(->) (M_i times.circle N)$ be its direct limit.

  For each $i in I$ we have a homomorphism $mu_i times.circle 1: M_i times.circle N -> M times.circle N$, hence by Exercise 16 a homomorphism $psi: P -> M times.circle N$. Show that $psi$ is an isomorphism, so that
  $ lim_(->) (M_i times.circle N) iso (lim_(->) M_i) times.circle N. $
  [For each $i in I$, let $g_i: M_i times N -> M_i times.circle N$ be the canonical bilinear mapping. Passing to the limit we obtain a mapping $g: M times N -> P$. Show that $g$ is $A$-bilinear and hence define a homomorphism $phi: M times.circle N -> P$. Verify that $phi compose psi$ and $psi compose phi$ are identity mappings.]
]

#exercise[
  Let $(A_i)_(i in I)$ be a family of rings indexed by a directed set $I$, and for each pair $i <= j$ in $I$ let $alpha_(i j): A_i -> A_j$ be a ring homomorphism, satisfying conditions (1) and (2) of Exercise 14. Regarding each $A_i$ as a $ZZ$-module we can then form the direct limit $A = lim_(->) A_i$. Show that $A$ inherits a ring structure from the $A_i$ so that the mappings $A_i -> A$ are ring homomorphisms. The ring $A$ is the *direct limit* of the system $(A_i, alpha_(i j))$.

  If $A = 0$ prove that $A_i = 0$ for some $i in I$. [Remember that all rings have identity elements!]
]

#exercise[
  Let $(A_i, alpha_(i j))$ be a direct system of rings and let $fN_i$ be the nilradical of $A_i$. Show that $lim_(->) fN_i$ is the nilradical of $lim_(->) A_i$.

  If each $A_i$ is an integral domain, then $lim_(->) A_i$ is an integral domain.
]

#exercise[
  Let $(B_lambda)_(lambda in Lambda)$ be a family of $A$-algebras. For each finite subset $J$ of $Lambda$ let $B_J$ denote the tensor product (over $A$) of the $B_lambda$ for $lambda in J$. If $J'$ is another finite subset of $Lambda$, and $J subset.eq J'$, there is a canonical $A$-algebra homomorphism $B_J -> B_(J')$. Let $B$ denote the direct limit of the rings $B_J$ as $J$ runs through all finite subsets of $Lambda$. The ring $B$ has a natural $A$-algebra structure for which the homomorphisms $B_J -> B$ are $A$-algebra homomorphisms. The $A$-algebra $B$ is the *tensor product* of the family $(B_lambda)_(lambda in Lambda)$.
]

== Flatness and Tor

In these exercises it will be assumed that the reader is familiar with the definition and basic properties of the Tor functor.

#exercise[
  If $M$ is an $A$-module, the following are equivalent:
  + $M$ is flat;
  + $Tor_n^A (M, N) = 0$ for all $n > 0$ and all $A$-modules $N$;
  + $Tor_1^A (M, N) = 0$ for all $A$-modules $N$.

  [To show that (i) $=>$ (ii), take a free resolution of $N$ and tensor it with $M$. Since $M$ is flat, the resulting sequence is exact and therefore its homology groups, which are the $Tor_n^A (M, N)$, are zero for $n > 0$. To show that (iii) $=>$ (i), let $0 -> N' -> N -> N'' -> 0$ be an exact sequence. Then, from the Tor exact sequence,
  $ Tor_1 (M, N'') -> M times.circle N' -> M times.circle N -> M times.circle N'' -> 0 $
  is exact. Since $Tor_1 (M, N'') = 0$ it follows that $M$ is flat.]
]

#exercise[
  Let $0 -> N' -> N -> N'' -> 0$ be an exact sequence, with $N''$ flat. Then $N'$ is flat $<=> N$ is flat. [Use Exercise 24 and the Tor exact sequence.]
]

#exercise[
  Let $N$ be an $A$-module. Then $N$ is flat $<=> Tor_1 (A \/ a, N) = 0$ for all finitely generated ideals $a$ in $A$.

  [Show first that $N$ is flat if $Tor_1 (M, N) = 0$ for all finitely generated $A$-modules $M$, by using (2.19). If $M$ is finitely generated, let $x_1, ..., x_n$ be a set of generators of $M$, and let $M_i$ be the submodule generated by $x_1, ..., x_i$. By considering the successive quotients $M_i \/ M_(i-1)$ and using Exercise 25, deduce that $N$ is flat if $Tor_1 (M, N) = 0$ for all *cyclic* $A$-modules $M$, i.e., all $M$ generated by a single element, and therefore of the form $A \/ a$ for some ideal $a$. Finally use (2.19) again to reduce to the case where $a$ is a finitely generated ideal.]
]

#exercise[
  A ring $A$ is *absolutely flat* if every $A$-module is flat. Prove that the following are equivalent:
  + $A$ is absolutely flat.
  + Every principal ideal is idempotent.
  + Every finitely generated ideal is a direct summand of $A$.

  [i) $=>$ ii). Let $x in A$. Then $A \/ (x)$ is a flat $A$-module, hence in the diagram
  $
    mat(
      delim: #none,
      (x) times.circle A, arrow.r^beta, (x) times.circle (A\/(x));
      arrow.b, , arrow.b^alpha;
      A, arrow.r, A\/(x);
    )
  $
  the mapping $alpha$ is injective. Hence $"im"(beta) = 0$, hence $(x) = (x^2)$. ii) $=>$ iii). Let $x in A$. Then $x = a x^2$ for some $a in A$, hence $e = a x$ is idempotent and we have $(e) = (x)$. Now if $e, f$ are idempotents, then $(e, f) = (e + f - e f)$. Hence every finitely generated ideal is principal, and generated by an idempotent $e$, hence is a direct summand because $A = (e) plus.circle (1 - e)$. iii) $=>$ i). Use the criterion of Exercise 26.]
]

#exercise[
  A Boolean ring is absolutely flat. The ring of Chapter 1, Exercise 7 is absolutely flat. Every homomorphic image of an absolutely flat ring is absolutely flat. If a local ring is absolutely flat, then it is a field.

  If $A$ is absolutely flat, every non-unit in $A$ is a zero-divisor.
]
