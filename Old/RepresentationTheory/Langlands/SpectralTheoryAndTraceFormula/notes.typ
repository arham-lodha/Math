#import "@preview/lemmify:0.1.8": *

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


#let Stab(group, element) = $op("Stab")_(#group)(#element)$
#let GL(ring, n) = $op("GL")_(#n)(#ring)$

#let SL(ring, n) = $op("SL")_(#n)(#ring)$
#let span = $op("span")$

#let SO(n) = $op("SO")_(#n)(RR)$

#let PSL(ring, n) = $op("PSL")_(#n)(#ring)$
#let adj = $op("Adj")$

#let lcoset(G, H) = $#H slash #G$
#let rcoset(G, H) = $#G backslash #H$
#let doublecoset(left, center, right) = $#left backslash #center slash #right$
#let Zmod(n) = $rcoset(ZZ, #n ZZ)$
#let Zmodx(n) = $(Zmod(#n))^(times)$
#let rproduct(space) = $product_(#space)^*$
#let inc = $↪$
#let bigtensor = $times.o.big$



#set text(lang: "en")
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")

#let SLR = link(<definitionofG>, [$G$]);
#let SLZ = link(<definitionOfK>, [$Gamma$]);
#let SO = link(<definitionOfK>, [$K$]);
#let slr = link(<definitionofLieG>, [$frak(g)$])
#let Hecke = link(<defofhecke>, [$cal(H)^(o)$])
#let calH = link(<compactlysupportedG>, [$cal(H)$])
#let Id = "Id"
#let RS = link(<riemannsurfaceofinterest>, [$X$])

= Spectral Theory and the Trace Formula

Notation:
- $G = SL(RR, 2)$<definitionofG>
- $K = SO(2)$<definitionOfK>
- $Gamma$ is a discrete cocompact subgroup of $SLR$ <definitionOfGamma> (This is not $SL(ZZ, 2)$)
- $frak(g) = "Lie"(G) = RR[e, f, h]$<definitionofLieG>
- $cal(H) = CC[G]$<compactlysupportedG>
- $cal(H)^(o) = (CC[doublecoset(K, G, K)], ast)$<defofhecke>
- $X = doublecoset(SLZ, SLR, SO) = rcoset(SLZ, SO)$<riemannsurfaceofinterest>
- $Delta$ is the Casamir element (Laplace Beltrami) where $- 4 Delta = 2 e f + 2f e + h h$

== Introduction
#theorem(name: [Gelfand's trick for Hecke Algebra for $SL(RR, 2)$ and $SO(2)$])[
  $Hecke$ is commutative
]<GelfandtrickHeckeAlgebra>
#proof[
  Let $T: G -> G$ where $g -> g^(t)$. $T$ preserves $K$. Let $T: Hecke -> Hecke$ where $phi -> phi compose T$.

  $
    (T(phi) ast T(psi))(g) & = integral_(G) T(phi)(x) T(psi)(x^(-1) g) dif x \
                           & = integral_(G) phi(x^(t)) psi(g^(t) (x^(-1))^(t)) dif x \
                           & = integral_(G) phi(x^(t)) psi(g^(t) (x^(t))^(-1)) dif x \
  $

  Let $u = g^(t) (x^(t))^(-1) => u^(-1) = x^(t) (g^(t))^(-1)$. Thus

  $
    (T(phi) ast T(psi))(g) & = integral_(G) phi(u^(-1) g^(t)) psi(u) dif u \
                           & = T(psi ast phi)
  $

  Thus $T$ is a anti-homomorphism. Note $T^(2) = Id_(Hecke)$. Furthermore since $forall [a] in doublecoset(SO, SLR, SO)$, $exists alpha in SLR$ diagonal where $[a] = [alpha]$ (Cartan Decomposition). Then $T(phi)([a]) = T(phi)([alpha]) = phi([alpha^(t)]) = phi([alpha]) = (Id_(Hecke) phi)([a]) => T = Id_(Hecke)$. Thus $Hecke$ is commutative.
]

This theorem for Gelfand has representation theoretic meaning. Let $V$ be a representation of $G$ on a Banach space. Let $cal(H)$ acts on $V$ by integration, ie $xi in cal(H)$ and $v in V$

$ xi v = integral_(G) xi(g) g v dif g. $ If $xi in Hecke$, then $xi v in V^(SO)$ thus $V^(SLR)$ is a module for $Hecke$.

#theorem[If $V$ is a irreducible admissable representation of $SLR$ then $V^(SO)$ is  at most one dimensional  ]<VKonedimensionaltheorem>

#definition[
  For $phi in calH$, $T_(phi): L^(2)[SLR] -> L^(2)[SLR]$ where $ (T_(phi) f)(x) = integral_(G) phi(g) f(x g) dif g $
]<integraloperatoronSLRmodSLZ>


#proposition[
  $L^(2)(rcoset(SLZ, SLR))$ is invariant under $T_(phi)$
]
#proof[
  For all $gamma in SLZ$ and $x in SLR$ and $f in L^(2)(rcoset(SLZ, SLR))$.

  $
    (T_(phi) f)(gamma x) & = integral_(G) phi(g) f(gamma x g) dif g \
                         & = integral_(G) phi(g) f(x g) dif g \
                         & = (T_(phi) f)(x)
  $

  Thus $T_(phi) f in L^(2)(rcoset(SLZ, SLR))$
]

#proposition[
  If $phi in Hecke$, $L^(2)(doublecoset(SLZ, SLR, SO)) = L^(2)(X)$
]
#proof[
  For all $phi in Hecke$, $f in L^(2)(doublecoset(SLZ, SLR, SO))$, $k in SO$ and $x in SLR$ .

  $
    (T_(phi) f)(x k) & = integral_(G) phi(g) f(x k g) dif g \
  $

  Let $h = k g -> g = h k^(-1)$. Thus

  $
    (T_(phi) f)(x k) & = integral_(G) phi(h k^(-1)) f(x h) dif g \
                     & = integral_(G) phi(h) f(x h) dif g \
                     & = (T_(phi) f)(x)
  $

  Thus $T_(phi) f in L^(2)(doublecoset(SLZ, SLR, SO))$
]

#definition[
  Let $phi in calH$ and let $K_(phi): SLR times SLR -> CC$ where $ K_(phi)(x, y) = sum_(gamma in SLZ)^() phi(x^(-1) gamma y) $
]

#proposition[
  $K_(phi)$ passes to $rcoset(SLZ, SLR) times rcoset(SLZ, SLR)$. If $phi in Hecke$, $K_(phi)$ is a function on $RS times RS$.
]
#proof[
  $forall g in SLZ$,

  $
    K_(phi)(g x, y) & = sum_(gamma in SLZ)^() phi((g x)^(-1) gamma y) \
                    & = sum_(gamma in SLZ)^() phi(x^(-1) g^(-1) gamma y) ("Take" gamma prime = g^(-1) gamma) \
                    & = sum_(gamma prime in SLZ)^() phi(x^(-1) gamma prime y) \
                    & = K_(phi)(x, y)
  $

  The proof is identical for $K_(phi)(x, g y) = K_(phi)(x, y)$

  If $phi in Hecke$,

  $
    K_(phi)(x k, y) & = sum_(gamma in SLZ)^() phi((x k)^(-1) gamma y) \
                    & = sum_(gamma in SLZ)^() phi(k^(-1)x^(-1) gamma y) \
                    & = sum_(gamma in SLZ)^() phi(x^(-1) gamma y) = K_(phi)(x, y)
  $

  The proof is identical for $K_(phi)(x, y k) = K_(phi)(x, y)$
]

#proposition[
  For $f in L^(2)(rcoset(SLZ, SLR))$
  $ (T_(phi) f)(x) & = integral_(rcoset(SLZ, SLR)) K_(phi)(x, y) f(y) dif y $
]
#proof[
  $
    (T_(phi) f)(x) & = integral_(G) phi(g) f(x g) dif g \
                   & = integral_(G) phi(x^(-1)g) f(g) dif g "by" g = x g \
                   & = sum_(gamma in SLZ)^() integral_(gamma rcoset(SLZ, SLR)) phi(x^(-1)g) f(g) dif g \
                   & = sum_(gamma in SLZ)^() integral_(rcoset(SLZ, SLR)) phi(x^(-1) gamma g) f(gamma g)
                     dif g \
                   & = sum_(gamma in SLZ)^() integral_(rcoset(SLZ, SLR)) phi(x^(-1) gamma g) f(g)
                     dif g "Because f is invariant under left action of" SLZ \
                   & = integral_(rcoset(SLZ, SLR)) sum_(gamma in SLZ)^() phi(x^(-1) gamma g) f(g)
                     dif g
  $

  Where the last equality comes from the fact that $phi$ is compactly supported and thus fubini's theorem applies. Additionally the last expression is by definition of $K_(phi)$, $integral_(rcoset(SLZ, SLR)) K_(phi)(x, y) f(y) dif y$.
]

#theorem[
  $T_(phi)$ compact operator on $L^(2)(rcoset(SLZ, SLR))$
]

If $phi(g^(-1)) = overline(phi(g))$, then $K_(phi)(x, y) = overline(K_(phi)(y, x))$ so $T_(phi)$ is self adjoint. Furthermore by the spectral theorem of compact self adjoint operators, $T_(phi)$ has nonzero eigenvalues $mu_(i)$ where $mu_(i) -> 0$. Furtheremore, Hilbert Schmidt imples that $sum_(i = 1)^(NN) abs(mu_(i))^(2) < oo$ and, eventually, we will see that $sum_(i = 1)^(oo) abs(mu_(i)) < oo$. Thus $T_(phi)$ is a trace class.

#theorem[
  $L^(2)(X)$ has a basis consisting of eigenvectors of $Delta$
]<eigenspacesofl2RS>
#proof[
  Let $cal(F) = {T_(phi) : phi in Hecke "and" phi(g^(-1)) = overline(phi(g))}$ is a family of commuting (@GelfandtrickHeckeAlgebra) and self-adjoint compact operators. Thus they simultaneously diagonalize.
  By the spectral theorem the nonzero eigenspaces are f.d; there is no nonzero vector on which the operators are all zero, since $phi$ can chosen to be strictly positive, mass one, and concentrated near the identity, in which case $T_(phi) f$ approximates $f$. Therefore the simultaneous eigenspaces of $Hecke$ are f.d. Let $V$ be such a eigenspace. $Delta in Z_(slr)$, thus $Delta$ is a differential operator which commutes with the right regular representation of $G$. Since $T_(phi)$ is defined by convolution (integration of the right regular action), $Delta$ commutes with $T_(phi)$ which means it preserves $V$. Since its symmetric, it induces a self-adjoint transformation on $V$. Spectral theorem, there is a orthonormal basis on $V$ consisting of eigenvectors of $Delta$, put them together to get a eigenbasis of $L^(2)(X)$
]

#theorem[
  $L^(2)(rcoset(SLZ, SLR))$ decomposes as a direct sum of closed irreducible subspaces. Each affords an irreducible admissible representation of $SLR$.
]<decompositionofl2SLZSLR>

Each of the irreducible subspaces has at most 1 $K$ fixed vector by @VKonedimensionaltheorem.

@decompositionofl2SLZSLR extends @eigenspacesofl2RS. Let $phi$ an eigenfunction of $Delta$ from @eigenspacesofl2RS, then its right translates by $K$ span an irreducible subspace of $L^(2)(rcoset(SLZ, SLR))$. Conversely $Delta$ acts by scalar on each irreducible subspace. If the subspace has a $K$ invariant vector in it, that vector is one of the basis elements of @eigenspacesofl2RS.

There are some irreducible subspaces of $L^2(rcoset(SLZ, SLR))$ with no $K$ invariant vectors. These can be constructed from _holomorphic modular forms_ with the following procedure. Let $f: HH -> CC$ be a holomorphic modular form of weight $k$ with respect to $SLZ$. Let $F: rcoset(SLZ, SLR) -> CC$ where $ F(gamma) = j_(-k)(gamma, z) f(gamma z) $. Note $F(g k_(theta)) = e^(i k theta) F(g)$. Thus there is no fixed $K$ vector. This is a weight $k$ holomorphic discrete series representation.

Adelic picture follows nearly the same analysis. (DO THIS!)

== Spectral Trace Formula.
Integral operators $T_(phi)$ are Hilbert Schmidt, hence compact.  $T_(phi)$ is trace class if and only if $tr(abs(T_(phi))) < oo$

Let $f_(i)$ be a basis of $L^(2)(rcoset(SLZ, HH))$ consisting of eigenfunctions of $T_(phi)$ that are also eigenfunctions of $Delta$. Assuming $phi in Hecke$ satsifies $phi(g^(-1)) = overline(phi(g))$, let $mu_(i)$ be the eigenvalues of $f_(i)$ for $T_(phi)$. We can Fourier expand $K_(phi)(z, w)$ with respect to the ${f_(i)}$ basis.

$ K_(phi)(z, w) = sum_(i = 0)^(oo) mu_(i) f_(i)(z) overline(f_(i)(w)) $

#theorem[If $phi in Hecke$ then $T_(phi)$ is trace class  ]
#proof[
  This is a proof summary. A linear combination of trace class operators is trace class. Let $psi in Hecke$, $ phi_(1)(g) & = (1)/(2)(psi(g) + overline(phi(g^(-1)))) \
  phi_(2)(g) & = (1)/(2i)(psi(g) + overline(phi(g^(-1)))) $

  $phi_(1) + i phi_(2) = psi$. Furthermore, $ phi_1(g^(-1)) = (1)/(2)(psi(g^(-1)) + overline(phi(g))) = overline(phi_1(g)). $ The same is true for $phi_2$. Thus if we prove that $phi_1$ and $phi_2$ is a trace class then $psi$ is as well. Thus it suffices to prove the statement for $phi$ that satsify $overline(phi(g^(-1))) = phi(g)$, thus $T_(phi)$ is self adjoint. Let $mu_(i)$ be the nonzero eigenvalues. Let $lambda_(i)$ be the corresponding eigenvalues of $Delta$. Thus $sum_()^() lambda_(i)^(-2) < oo$.

  Let $Delta_(z)$ be the application of $Delta$ to $K_(phi)$ in the first variable, which gives a new kernel $Delta_(z)K_(phi)$. $ (Delta_(z) K_(phi))(z, w) = sum_(i = 0)^(oo) mu_(i) lambda_(i) f_(i)(z) overline(f_(i)(w)) $

  Formally this is true because of termwise differentiation. But there is a bit more needed for this. To allow termwise differentatiation we need some integral. Since $Delta_(z) K_(phi)(z, w)$ is continous, it is Hilbert-Schmidt so we know that $ sum_(i = 0)^(oo) abs(mu_(i) lambda_(i))^(2) < oo. $ By Cauchy Schwarz, $sum_(i = 0)^(oo) abs(mu_(i)) < oo$.
]

#theorem[
  If $phi in Hecke$ satisfies $overline(phi(g^(-1))) = phi(g)$, and if $mu_(i)$ are the eigenvalues of $T_(phi)$, the trace $ tr(T_(phi)) = integral_(rcoset(SLZ, HH)) K_(phi)(z, z) (d x d y)/(y^(2)) $
]<trace1>
#proof[ Let $z = x + i y$.
  $
    integral_(rcoset(SLZ, HH)) K_(phi)(z, z) (d x d y)/(y^(2)) &= integral_(rcoset(SLZ, HH)) sum_(i = 1)^(oo) mu_(i) f_(i)(z) overline(f_(i)(z)) (dif x dif y)/(y^(2)) \
    & = sum_(i = 1)^(oo) integral_(rcoset(SLZ, HH)) mu_(i) f_(i)(z) overline(f_(i)(z)) (dif x dif y)/(y^(2)) \
    & = sum_(i = 1)^(oo) mu_(i) = tr(T_(phi))
  $
]

The Selberg trace formula is a more explicit formula for its trace. Let ${gamma}$ be the set of representative for the conjugacy classes of $SLZ$. Let $Z_(SLZ)(gamma)$ be the centralizer of $SLZ$ of $gamma$.

#theorem[
  $
    tr(T_(phi)) = sum_({gamma})^() sum_(delta in rcoset(Z_(SLZ)(gamma), SLZ))^() integral_(G) phi(g^(-1) delta^(-1) gamma delta g)
  $
]<primitivetraceformula>
#proof[
  $
    tr(T_(phi)) & = integral_(rcoset(SLZ, HH)) K_(phi)(z, z) (d x d y)/(y^(2)) \
                & = integral_(rcoset(SLZ, SLR)) K_(phi)(g, g) dif g \
                & = integral_(rcoset(SLZ, SLR)) sum_(gamma in SLZ)^() phi(g^(-1) gamma g) dif g \
  $

  We partition the group $SLZ$ into disjoint conjugacy classes. Any element conjugate to $gamma in SLZ$ takes the form $delta^(-1) gamma delta$ for some $delta in SLZ$. We have $delta^(-1) gamma delta = nu gamma nu <=> nu delta^(-1)$ commutes with $gamma$, which implies that $nu delta^(-1) in Z_(SLZ)(gamma).$
]
