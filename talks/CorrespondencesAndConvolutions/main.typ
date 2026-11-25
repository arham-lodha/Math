#import "template.typ": *
#import "figures.typ": *

#show: paper.with(
  title: "Borel–Moore Homology, Correspondences and Convolution",
  subtitle: "UCLA Participating Seminar on Quiver Varieties, Fall 2026",
  abstract: [TODO],
  keywords: ("Borel–Moore homology", "correspondences", "convolution algebras"),
  bibliography-file: "refs.bib",
)

// ── Usage ────────────────────────────────────────────────────────────────────
//
//  Sections are level-1 (=), subsections level-2 (==). Theorem counters reset
//  at each section: Definition 2.1, Theorem 2.2, ...
//
//  Environments (from @local/my-prelude, colored boxes):
//    #definition("Name")[ ... ]   #theorem[ ... ]   #lemma[ ... ]
//    #proposition[ ... ]          #corollary[ ... ]
//    #example[ ... ]  #remark[ ... ]  #notation[ ... ]   (own counters)
//    #proof[ ... ]                #callout("Title")[ ... ]
//
//  Helpers (from template.typ):
//    $HBM(X)$, $HBMk(i, X)$       — H^BM_•(X), H^BM_i(X)
//    $Ho(X, A)$, $Hok(i, X, A)$   — H_•(X, A), H_i(X, A)   (pair optional)
//    $Hco(X)$, $Hcok(i, X, A)$    — H^•(X), H^i(X, A)
//    $Hc(X)$, $Hck(i, X)$         — H^•_c(X), H^i_c(X)
//    #question[ ... ]             — amber box for things to chase down
//    #ref-cg("2.6.3", page: 98)   — tag pointing into Chriss–Ginzburg
//    @chriss-ginzburg             — citation
// ─────────────────────────────────────────────────────────────────────────────

#let inc = $arrow.hook$

= Conventions and Setup


= Borel–Moore Homology

#definition("Borel--Moore Homology")[
  Let $X$ be a locally compact, $sigma$-compact Hausdorff space, and let $hat(X)= X union {oo }$ be the one point compactification of $X$. Assume $oo$ has arbitrarily small contractible open neighborhoods in $hat(X)$ (eg $(hat(X), oo)$ is a CW pair, which is true for complex algebraic varieties). Define $ HBM(X) & := H_*(hat(X), oo). $
]

#remark[
  We need some assumption on what $X$ looks like near $oo$, otherwise the definitions of $HBM(X)$ don't have to agree. The proof below shows where it gets used.
]

#theorem[
  Let $cal(C)_*(X)$ be a chain complex of _infinite_ singular chains $ sum_(k) a_k sigma_k, $ where the $sigma_k$ are distinct singular simplices, $a_k in CC$, and the sum is locally finite. By locally finite, it means that for all compact sets $K subset.eq X$ we have that $\# {k : sigma_k (Delta) inter K != emptyset "and" a_k != 0} < oo$. Since $partial$ is a local operation, it is well defined on $cal(C)_(*) (X)$. Thus $ HBM(X) iso H_(*) (cal(C)_(*) (X), partial) $
]
#proof[
  First, $partial$ really is well defined: a simplex in $partial c$ that meets $K$ is a face of some $sigma_k$ that meets $K$, and there are only finitely many of those, so $partial c$ is locally finite.

  Fix a compact subset $K subset.eq X$. We know that $ C(X, rcoset(X, K)) iso lcoset(C(X), C(rcoset(X, K))) $ this is a free module on the finite singular simplices $sigma$ not contained in $rcoset(X, K)$, ie those with $sigma(Delta) inter K != emptyset$. If $K subset.eq K prime$, then the natural inclusion map of pairs $i: (X, rcoset(X, K prime)) arrow.r.hook (X, rcoset(X, K))$ gives us a map $i_* = p_(K prime, K) : C_* (X, rcoset(X, K prime)) -> C_*(X, rcoset(X, K))$ which kills simplices which meet $K prime$ but not $K$. Note that $p_(K prime, K)$ is surjective. This gives a natural inverse system indexed by compact subsets of $X$ ordered by inclusion. Examine $c = sum_(k) a_k sigma_k in cal(C)_* (X)$. Local finiteness tells us that for all $K subset.eq X$ compact, $K$ intersects only finitely many $sigma_k$, which means that $ c_K := sum_(k : sigma_k (Delta) inter K != emptyset) a_k sigma_k $ is a finite sum and thus a legitimate member of $C_(*) (X, rcoset(X, K))$. Furthermore, the family $(c_K)_(K "compact")$ is compatible with the inverse system, ie $p_(K prime, K)(c_(K prime)) = c_K$. Conversely, given a compatible family $(c_K)_K$, define the coefficient of $sigma$ to be its coefficient in $c_K$ for any compact $K supset.eq sigma(Delta)$ (this is compact since it is the image of a simplex). Compatibility tells us this doesn't depend on the choice of $K$, and the chain we get is locally finite since every $c_K$ is a finite sum. Both constructions commute with $partial$ nicely. Thus $ cal(C)_(*)(X) iso lim_(<--) C_*(X, rcoset(X, K)). $

  Now when we pass to homology we have to be careful, since homology does not commute with inverse limits. Call a compact $K$ _good_ if $U_K := rcoset(hat(X), K)$ is contractible. Good compacts are cofinal: if $L subset.eq X$ is compact, then $rcoset(hat(X), L)$ is an open neighborhood of $oo$, so by our assumption it contains a contractible open neighborhood $U$ of $oo$, and $K := rcoset(hat(X), U)$ is closed in $hat(X)$, thus compact, doesn't contain $oo$, contains $L$, and is good. For $K$ good, excising $oo$ (closed, sitting inside the open set $U_K$) gives us $ H_*(X, rcoset(X, K)) iso^("excision") H_*(hat(X), U_K), $ and since $H_*(U_K, oo) = 0$ the long exact sequence of the triple $(hat(X), U_K, oo)$ gives us $H_*(hat(X), oo) iso H_*(hat(X), U_K)$. If $K subset.eq K prime$ are both good, all of these maps come from the inclusions $oo arrow.r.hook U_(K prime) arrow.r.hook U_K$, so they commute with $p_(K prime, K)$. This means that on good compacts the system $H_*(X, rcoset(X, K))$ is constant, and equal to $H_*(hat(X), oo)$.

  #figure(
    fig-good-compact,
    caption: [A good compact $K$: its complement $U_K$ is a contractible cap around $oo$, so collapsing $U_K$ instead of $oo$ changes nothing.],
  )

  Since $X$ is $sigma$-compact we can pick a cofinal sequence of good compacts $K_1 subset.eq K_2 subset.eq dots.c$, and the limit over all compacts is the same as the limit over this sequence. The $p_(K_(n+1), K_n)$ are surjective, so we get the Milnor sequence $ 0 -> attach(lim, b: <--, tr: 1) H_(i+1)(X, rcoset(X, K_n)) -> H_i (cal(C)_*(X)) -> lim_(<--) H_i (X, rcoset(X, K_n)) -> 0. $ The transition maps of $H_*(X, rcoset(X, K_n))$ are isomorphisms, so the system is Mittag-Leffler and $lim^1 = 0$. Thus $ H_*(cal(C)_*(X)) iso lim_(<--) H_*(X, rcoset(X, K_n)) iso H_(*)(hat(X), oo) = HBM(X). $
]

#example[
  $X = RR$. The chain $sum_(n in ZZ) [n, n + 1]$ is locally finite and a cycle (boundary terms cancel in pairs), and it generates $HBMk(1, RR) iso CC$. This matches $H_1(S^1, "pt") iso CC$. It is a fundamental class with no counterpart in ordinary homology.

  #figure(
    fig-line-to-circle,
    caption: [The locally finite cycle $sum_n [n, n + 1]$ on $RR$ becomes a cycle in $H_1 (S^1, oo)$: the segments only accumulate at $oo$.],
  )
]

= Functoriality
Unlike normal singular homology, Borel--Moore Homology is covariant with respect to proper maps and not all continuous maps.

== Proper Pushforward
If $f: X -> Y$ is a proper map, we can extend it to a continuous map on one point compactifications $hat(f): hat(X) -> hat(Y)$ inducing the corresponding maps on Borel--Moore homology.


== Open Restriction
Let $j: U inc X$ be an open subset. The inclusion $j$ is usually not proper (e.g. $(0, 1) inc RR$), so there is no pushforward along it. Instead there is a map going the other way. Define the collapse map $ c: hat(X) -> hat(U), quad c(x) = cases(x "when" x in U, oo "when" x in.not U), $ which crushes $F := X - U$ together with $oo$ to the point at infinity of $U$. This is continuous: if $V subset.eq U$ is open, then $c^(-1)(V) = V$ is open in $hat(X)$ since $U$ is open in $X$; and a neighborhood of $oo$ in $hat(U)$ looks like $hat(U) - K$ with $K subset.eq U$ compact, whose preimage $hat(X) - K$ is open. Since $c(oo) = oo$ we get the *restriction* $ j^* := c_* : HBM(X) = H_*(hat(X), oo) -> H_*(hat(U), oo) = HBM(U). $

Equivalently, $j^*$ is the map of pairs $H_*(hat(X), oo) -> H_*(hat(X), hat(X) - U)$ induced by the identity (which makes sense since $oo in hat(X) - U$), followed by the identification $H_*(hat(X), hat(X) - U) iso H_*(hat(U), oo)$. The latter holds because $hat(X) - U = F union {oo}$ is closed in $hat(X)$, collapsing it gives $hat(X) slash (F union {oo}) iso hat(U)$, and $(hat(X), F union {oo})$ is a good pair (true for CW pairs, so for complex varieties).

On locally finite chains, $j^*$ keeps only the part of a chain lying in $U$: a simplex meeting $F$ gets subdivided infinitely often as it approaches $F$, and the pieces form a chain that is still locally finite in $U$, since from $U$'s point of view $F$ is at infinity.

#figure(
  fig-subdivision,
  caption: [Restricting $[-1, 1]$ to $U = [-1, 1] - {0}$. The subdivision points $plus.minus 1 slash 2^k$ accumulate only at $F$, so every compact subset of $U$ meets finitely many pieces.],
)

In particular, if $X$ is an oriented manifold then $j^* [X] = [U]$. Restriction is functorial: if $V subset.eq U subset.eq X$ are open then $(V inc X)^* = (V inc U)^* compose (U inc X)^*$, since the collapse maps compose.

== The Long Exact Sequence
Let $F subset.eq X$ be closed with inclusion $i: F inc X$, and let $j: U = X - F inc X$ be the open complement. A closed inclusion is proper, so $i_*$ is defined, and $hat(i): hat(F) inc hat(X)$ is just the inclusion of $hat(F) = F union {oo}$ (closed in $hat(X)$). The long exact sequence of the triple $(hat(X), hat(F), oo)$ is $ dots.c -> H_p (hat(F), oo) -> H_p (hat(X), oo) -> H_p (hat(X), hat(F)) -> H_(p - 1)(hat(F), oo) -> dots.c $ and by the previous subsection $H_p (hat(X), hat(F)) = H_p (hat(X), hat(X) - U) iso H_p (hat(U), oo)$, with the middle map becoming $j^*$. Thus we get $ dots.c -> HBMk(p, F) ->^(i_*) HBMk(p, X) ->^(j^*) HBMk(p, U) ->^(partial) HBMk(p - 1, F) -> dots.c $ On chains, $partial$ takes a locally finite cycle on $U$, extends it by closure to a chain on $X$, and takes its boundary, which lives on $F$.


#example[
  $X = RR$, $F = {0}$, $U = RR - {0} = (-oo, 0) union.sq (0, oo)$. The sequence in degrees $1$ and $0$ reads:
  $ HBMk(1, F) ->^(i_*) HBMk(1, X) ->^(j^*) HBMk(1, U) ->^(partial) HBMk(0, F) -> HBMk(0, RR). $ Using the standard definition we see, $ 0 = Hok(1, F union {oo}, F) ->^(i_*) Hok(1, S^1, oo) ->^(j^(*)) Hok(1, S^1 or S^1, oo) ->^(partial) Hok(0, F union {oo}, F) -> Hok(0, S^1, oo) = 0 $

  Here $j^*$ is the diagonal map where $1 -> (1, 1)$, the fundamental class of $RR$ maps restricts to the sum of the fundamental classes of the two half lines. Up to sign $partial$ sends $(a, b) -> b - a$. This is consistent with the short exact sequence $0 -> ZZ ->^(Delta) ZZ^2 ->^((a, b) -> b - a) ZZ -> 0$

  #figure(
    fig-figure-eight,
    caption: [$hat(U) = S^1 or S^1$: the point $0$ and both ends $plus.minus oo$ all become $oo$. The two loops are the basis of $HBMk(1, U) iso CC^2$, and $j^* [RR]$ is their sum.],
  )
]

= Fundamental Classes, Künneth and Poincaré Duality

== Fundamental Class
Any compact oriented manifold $X$ has a well defined *fundamental class* in ordinary homology. Recall $H_m (X, X - x) iso H_m (RR^m, RR^m - 0) iso ZZ$ by excision (you take local neighborhood of $x$ homeomorphic to $RR^n$...) and the orientation is the consistent choice of generator $mu_x$ of these. For $x in X$, we have a map of pairs $(hat(X), oo ) -> (hat(X), hat(X) - x)$ since $x != oo$. Thus we have an induced map $ rho_x: H_m (hat(X), oo) -> H_m (hat(X), hat(X) - x) iso^("excision") H_m (X, X - x) iso ZZ. $ thus we get a unique element in $H_m (hat(X), oo)$ which is the fundamental class, $[X]$, which maps to $mu_x$. Thus in Borel--Moore homology, we have a well defined fundamental class $[X] in HBMk(m, X)$. Using the inverse limit definition for Borel Moore, you can show existence and uniqueness.

#remark(name: "Locally finite chain picture")[
  The way you do it is triangulate $X$ and orient the top simplex compatibly with orientation then $ [X] = [sum_(sigma "top simplex") sigma ] $ the sum is infinite but locally finite. Intrerior faces cancel in pairs, so its a cycle. It isn't allowed in ordinary homology if $X$ is not compact, which is why noncompact manifolds don't have ordinary fundamental class
]

=== Fundamental Class of Complex algebraic varieties
The essential feature of Borel--Moore homology, which will play a big role is the existence of fundamental class, $[X]$, for any (not necessarily smooth, or compact) complex algebraic varieties $X$.

1. $X$ irreducible: Let $X^("reg")$ be the Zariski open dense subset consisting of the non-singular pints of $X$. Being smooth complex manifold, $X^("reg")$, has a canonical orientation coming from the complex structure so $[X^("reg")] in HBM(m, X^("reg"))$ canonically. The inequality $dim(X - X^("reg")) <= m$, yields, $HBMk(k, X - X^("reg")) = 0$ for $k > m - 2$. By the long exact sequence of Borel--Moore homology, we know that restriction $HBMk(m, X) -> HBMk(m, X^("reg"))$ is a isomorphism and $[X]$ is the preimage under the isomorphism.
2. $X$ reducible: $X_1, ..., X_n$ its reducible components. Then $[X] = sum_(k = 1)^(n) [X_k]$.

#figure(
  fig-singular-curves,
  caption: [Real pictures of complex curves. Left: the nodal cubic $y^2 = x^2 (x + 1)$, whose singular locus $S$ is a point, so $[X]$ is pulled back from $[X^"reg"]$. Right: $x y = 0$ has two components and $HBMk(2, X) = CC [X_1] plus.circle CC [X_2]$.],
)

#proposition[
  Let $X$ be a complex algebraic variety of complex dimension $n$ and $X_1, ..., X_m$ be the $n$-dimensional irreducible components of $X$. Then  the fundamental classes $[X_1], ..., [X_(m)]$ form a basis for the vector space $HBMk(2n, X)$.
]

#let cap = $frown$;
== Poincaré Duality
Let $M$ be a smooth, oriented manifold with $dim_(RR) (M) = m$. Let $X subset.eq M$ be a closed subset which has a closed neighborhood $U subset.eq M$ such that $U$ deformation retracts properly to $X$. We work with $CC$ coefficients and assume $H_c^i (X)$ is finite dimensional (e.g. $X$ is of finite type or constructible), so that the first duality below is an isomorphism. Then
$
  HBMk(i, X) = H_i (hat(X), oo) & iso^("UCT") Hom(H^i (hat(X), oo), CC)
                                  = Hom(H_c^i (X), CC) \
                                & iso^("duality") Hom(H_(m - i)(M, M - X), CC)
                                  iso^("UCT") H^(m - i)(M, M - X).
$
The middle isomorphism is Alexander--Lefschetz duality $H_(m - i)(M, M - X) iso H_c^i (X)$: for $X$ compact this is @hatcher[Thm 3.44], for $X = M$ it is Poincaré duality for noncompact manifolds, and in general it is @bredon[Thm V.9.3]. The proper deformation retract hypothesis is what lets us use singular rather than Čech cohomology. Excision also gives
$ H^(m - i)(M, M - X) iso H^(m - i)(op("int") U, op("int") U - X), $
by cutting out $M - op("int") U$, whose closure lies in $M - X$ since $X subset.eq op("int") U$.

We denote the composite isomorphism by
$ P_X : HBMk(i, X) ->^~ H^(m - i)(M, M - X). $

*Motivation for $X = M$.* The fundamental class $[M] in HBMk(m, M)$ gives the maps
$
       D: H^k (M) & -> HBMk(m - k, M) quad & beta & |-> [M] cap beta \
  D_c : H_c^k (M) & -> H_(m - k)(M) quad   & beta & |-> [M] cap beta.
$
Here the cap product is $sigma cap beta = beta(sigma|_([v_0, ..., v_k])) thin sigma|_([v_k, ..., v_n])$ for $sigma in C_n (M)$, $beta in C^k (M)$, $n >= k$. These maps make sense because $[M]$ is locally finite and each simplex has only one back face of dimension $n - k$, so capping preserves local finiteness. If $beta$ is supported in a compact set $K$, only finitely many terms are nonzero, so the result is a finite chain. $D_c$ is an isomorphism by @hatcher[Thm 3.35], and $D$ is the case $X = M$ of $P_X$.

== Intersection Pairing
Let $M$ be an oriented smooth manifold of real dimension $m$ and let $Z, tilde(Z) subset.eq M$ be closed subsets such that $Z$, $tilde(Z)$ and $Z inter tilde(Z)$ each satisfy the neighborhood hypothesis above. We want a bilinear map
$ inter.big: HBMk(i, Z) times HBMk(j, tilde(Z)) -> HBMk(i + j - m, Z inter tilde(Z)) $
where we "intersect two cycles". An $i$-dimensional cycle and a $j$-dimensional cycle meet in dimension $i + j - m$ (two lines in $RR^2$ meet in a point).

*The idea.* Cohomology has a natural bilinear map (the cup product) that needs no transversality. Poincaré duality says a Borel--Moore class on $Z$ "is" a cohomology class of $(M, M - Z)$, so we translate the cycles into cohomology, multiply, and translate back.

*The cup product with supports.* Since $M - Z$ and $M - tilde(Z)$ are open, they form an excisive couple, and the relative cup product gives
$
  H^a (M, M - Z) times H^b (M, M - tilde(Z))
  -> H^(a + b)(M, (M - Z) union (M - tilde(Z)))
  = H^(a + b)(M, M - (Z inter tilde(Z))).
$
For $a = m - i$ and $b = m - j$ we get $a + b = 2m - i - j = m - (i + j - m)$, which is exactly the degree dual to $HBMk(i + j - m, Z inter tilde(Z))$.

Thus for $c in HBMk(i, Z)$ and $tilde(c) in HBMk(j, tilde(Z))$ we set
$ c inter tilde(c) := P_(Z inter tilde(Z))^(-1) (P_Z (c) union P_tilde(Z)(tilde(c))). $

#let btimes = $times.square$;
== Kunneth Formula
Let $M_1$ and $M_2$ be arbitrary CW complexes. Then there is a natural isomorphism, $ btimes: HBM(M_1) otimes HBM(M_2) -> HBM(M_1 times M_2) $ where the definition comes from the standard kunneth isomorphism on $ Ho(overline(M_1), conj(M_1) - M_1) otimes Ho(conj(M_2), conj(M_2) - M_2) -> Ho(conj(M_1 times M_2), conj(M_1 times M_2) - (conj(M_1) times M_2 union M_1 times conj(M_2))) $ which is the standard definition of Borel More homology.

= Restriction with Supports
Let $i: N inc M$ be a closed embedding of oriented manifolds, $m = dim M$ and $n = dim N$. For a closed, possibly singular, subset $Z subset.eq M$, the restriction with support in $Z$ is the map
$ i^*: HBMk(k, Z) -> HBMk(k + n - m, Z inter i(N)), quad c |-> c inter i_*([N]), $
where $inter$ is the intersection pairing above applied with $tilde(Z) = i(N)$ and $tilde(c) = i_*([N]) in HBMk(n, i(N))$. This needs $i(N)$ to satisfy the neighborhood hypothesis, which holds because $i(N)$ is a closed submanifold. Since $i$ is a closed embedding, we identify $Z inter i(N)$ with $i^(-1)(Z)$. Equivalently, $i^* c = tau_N cap c$, where $tau_N in H^(m - n)_N (M)$ is the Thom class (the Poincaré dual of $i_*[N]$). The family of maps $i^*$ is natural in $Z$.

= Diagonal Restriction
Let $ M_Delta subset.eq M times M $ be the diagonal where $M$ continues to be a oriented manifolds .Observe that for closed subsets $Z, tilde(Z) subset.eq M$ we have the following set theoretic equality: $ (Z times tilde(Z)) inter M_(Delta) = (Z times tilde(Z))_(Delta) iso Z inter tilde(Z) $

There is a linear map called the Gysin Diagonal Map $ Delta^(!): HBMk(k, Z times tilde(Z)) -> HBMk(k - n, Z inter tilde(Z)) $ where $n = dim M$. By duality we know that $ HBMk(k, Z times tilde(Z)) iso H^(2n - k)(M times M, M times M - (Z times tilde(Z))). $ We have a inclusion of pairs $i: (M, M - Z inter tilde(Z)) iso (M_(Delta), M_(Delta) inter (Z times tilde(Z))^(c) ) inc (M times M, M times M - (Z times tilde(Z)))$, which induces a map $ i^(*): H^(2n - k)(M times M, M times M - (Z times tilde(Z))) -> H^(2n - k) (M_(Delta), M_(Delta) - (Z times tilde(Z))) = H^(2n - k)(M, M - (Z inter tilde(Z))). $

Finally applying duality again we see that $ HBMk(k, Z times tilde(Z)) ->^("duality") H^(2n - k)(M times M, M times M - (Z times tilde(Z))) ->^i^* H^(2n - k)(M, M - (Z inter tilde(Z))) ->^("duality") HBMk(k - n, Z inter tilde(Z)), $ which is our target map.

#example([Transverse Intersection in $RR^n$])[
  Let $A, B subset.eq RR^n$ subspaces of dimension $a "and" b$ respectively where $ dim(A inter B) = a + b - n $. Thus $A + B = RR^n$. $ HBMk(a + b, A times B) = ZZ [A times B]. $
  Applying duality, $ V = A times B subset.eq RR^(2 n) $ which has codimension $2n - a - b$. Thus $ HBMk(a + b, A times B) iso H^(2n - a - b)(RR^(2n), RR^(2n) - (A times B)) iso ZZ tau $ where $tau$ is the *Thom Class*(What is Thom class) of the normal space $(RR^n - A) oplus (RR^n - B)$. Restrict to the diagonal, the diagonal $Delta iso RR^n$ maps to $N_V$ where $x -> (x mod A, x mod B)$. The kernel is $A inter B$ and image has dimension $n - (a + b - n) = 2n - (a + b)$ thus the map is onto. This means that $Delta$ is transverse to $V$. And the restriction sends $tau ->$ the thom class of $A inter B subset Delta$. Thus $ H^(2n - a - b)(RR^(2n, RR^(2n) - (A times B))) iso^(i^*) H^(2n - a - b)(RR^n, RR^n - (A inter B) ). $

  Applying duality again we see that $ Delta^! ([A times B]) = plus.minus [A inter B] $
]

#example([Nontransverse intersection])[
  Let $A = B = L = RR chevron.l arrow(v) chevron.r subset.eq RR^2$. Then $k = a + b = 2$ and $k - n = 0$. But note that $ HBMk(0, A inter B) = HBMk(0, RR^n) = 0. $ Thus $ Delta^! [A times B] = 0 $

]

#example([Self intersection of the Diagonal of $S^n$])[

]

#let ox = $times.o$

= Convolution
#example("Toy Example")[
  Given finite sets $A, B, C$ define the convolution product $ ast: CC^(A times B) times CC^(B times C) -> CC^(A times C) $ where $ (f ast g)(a, c) & = sum_(b in B) f(x, y) g(y, z). $ Which looks a lot like matrix multiplication. Okay, but now can we extend this consistently to a broader case of smooth compact manifolds rather than finite sets. We discuss compact manifolds as a substitute for the finitness condition. However only measures can convolved in such way, and differential top tells that differential forms play that role here.


]

#let Zij(i, j) = $Z_(#i #j)$
#let proj(i, j) = $p_(#i #j)$
== General Case
Let $M_1, M_2, M_3$ be connected oriented smooth manifolds and let $Zij(i, j) subset M_i times M_j$ be closed subsets, and let $proj(i, j): M_1 times M_2 times M_3 -> M_i times M_j$. $ Zij(1, 2) compose Zij(2, 3) &= {(m_1, m_3) in M_1 times M_3 : exists m_2 in M_2, (m_1, m_2) in Zij(1, 2) and (m_2, m_3) in Zij(2, 3)} \ &= proj(1, 3)(proj(1, 2)^(-1)(Zij(1, 2)) inter proj(2, 3)^(-1) (Zij(2, 3)) ) \ &= proj(1, 3)(Zij(1, 2) times M_3 inter M_1 times Zij(2, 3)) $

We can view $Zij(i, j)$ as a multivalued map $M_i -> cal(P)(M_j)$, where
$ Zij(i, j)(m_i) = {m_j in M_j : (m_i, m_j) in Zij(i, j)} subset.eq M_j. $
Then $(Zij(1, 2) compose Zij(2, 3))(m_1) = (Zij(2, 3))_*(Zij(1, 3)(m_1))$.

#example[
  Let $f: M_1 -> M_2$ and $g: M_2 -> M_3$ be smooth. Then $"Graph"(f) compose "Graph"(g) = "Graph"(f compose g)$
]

In practice we use a alternative definition for composition. Assume that that the restriction $proj(1, 3): proj(1, 2)^(-1)(Zij(1, 2)) inter proj(2, 3)^(-1) (Zij(2, 3)) -> M_1 times M_3$ is *proper*

Note that $ proj(1, 2)^(-1)(Zij(1, 2)) inter proj(2, 3)^(-1) (Zij(2, 3)) = (Zij(1, 2) times M_3) inter (M_1 times Zij(2, 3)) = Zij(1, 2) times_(M_2) Zij(2, 3) "fiber product " $ Then $ Zij(1, 2) compose Zij(2, 3) = proj(1, 3)(Zij(1, 2)times_M_2 Zij(2, 3)) $


Let $d = dim_RR M_2$. We define convolution in Borel Moore Homology as follows:

#definition()[
  $ast: HBMk(i, Zij(1, 2)) times HBMk(j, Zij(2, 3))-> HBMk(i + j - d, Zij(1, 2) compose Zij(2, 3))$ where $(c_(1, 2), c_(2, 3)) -> c_(1 2) ast c_(2 3) = (proj(1, 3))_*((c_(1, 2) btimes [M_3]) inter ([M_1] btimes c_(2, 3))) = (proj(1, 3))_* (proj(1, 2)^*(c_(1,2 )) inter p_(2, 3)^* c_(2, 3))$
]

#let inv(func) = $#func^(-1)$

#example("Graphs")[
  Let $f: M_1 -> M_2$ and $g: M_2 -> M_3$ be smooth where $n_i = dim M_i$ and $d = n_2$. Let $Gamma_f := "Graph"(f) = {(x, f(x)) in M_1 times M_2}$ and $Gamma_g := "Graph"(g).$The expected degree of the convolution is $n_1 + n_2 - n_2 = n_1$. Pull back to $P = M_1 times M_2 times M_3$. $    p_(12 )^*([Gamma_f]) & = [proj(1, 2)^(-1)[Gamma_f]] = [Gamma_f times M_3] \
  proj(2, 3)^*([Gamma_g]) & = [inv(proj(1, 2))[Gamma_g]] = [M_1 times Gamma_g]. $ These are the fundamental classes of $ Gamma_f times M_3 & = {(m_1, f(m_1), m_3) : (m_1, m_3) in M_1 times M_3} \
  M_1 times Gamma_g & = {(m_1, m_2, g(m_3) ): (m_1, m_2) in M_1 times M_2}. $

  $ W = (Gamma_f times M_3) inter (M_1 times Gamma_g) & = {m_1, f(m_1), g(f(m_1)) : m_1 in M_1} iso M_1 $

  Hence $ [Gamma_f] ast [Gamma_g] = proj(1, 3)([W]) = [Gamma_(g compose f)] $

]

= Convolution Algebra
Let $M$ be a smooth complex manifold and let $N$ be a (possibly singular variety) and let $pi: M -> N$ be a proper map. Let $M_1 = M_2 = M_3 = M$ and $Z = Zij(1, 2) = Zij(2, 3) = M times_N M = {(m_1, m_2) : pi (m_1) = pi (m_2)}$.

$
  Z compose Z & = {(m_1, m_3) in M times M : exists m_2 in M, (m_1, m_2), (m_2, m_3) in Z} \
              & = {(m_1, m_3) in M times M : exists m_2 in M, pi (m_1) = pi (m_2) = pi (m_3)} \
              & = {(m_1, m_3) in M times M : pi (m_1) = pi (m_3)} = Z
$

Thus the convolution map gives us a associative binary R bilinear operation: $ ast: HBM(Z) times HBM(Z) -> HBM(Z) $. The associativity is just a matter of tracing out the binary tree that is formed when considering $ (c_12 ast c_23) ast c_34. $

= Correspondences

= Examples

= Open Questions
