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

#let Stab(group, element) = $op("Stab")_(#group)(#element)$
#let GL(ring) = $op("GL")_(2)(#ring)$

#let SL(ring) = $op("SL")_(2)(#ring)$
#let PSL(ring) = $op("PSL")_(2)(#ring)$
#let rcoset(G, H) = $H backslash G$
#let lcoset(G, H) = $G slash H$



#set text(lang: "en")
#set heading(numbering: "1.")

= Elementary Modular Forms
== Basic Definitions and Notation
#definition(name: "Modular Forms")[
  A function $ f: HH -> CC $ is called *modular* (of level 1) of weight $k in ZZ$ if for $ mat(a, b; c, d) in S L_2(ZZ) $ we have $ f((a z + b) / (c z + d)) = (c z + d)^k f(z) $

  Other terminology: Automorphic Forms.
]<defmodularform>


#remark()[
  1. If $z in HH$ and $mat(a, b; c, d) in S L_2(RR)$ then $(a z + b) / (c z + d) in HH$. $ Im((a z + b) / (c z + d)) = (Im(z)) / (abs(c z + d)^2 ) > 0 $ by definition.
  2. The set of weight k modular forms is a $CC$-vector space, and if $f_1$ has weight $k_1$ and if $f_2$ has weight $k_2$ then $f_1 f_2$ has weight $k_1k_2$. $=>$ Construction of weight 0 functions as ratios of $f_i$ of same weight, linearly independent.
]

#definition(name: [Action of $S L_2(RR)$ on $HH$ and modular forms])[
  $forall g = mat(a, b; c, d) in S L_2(RR)$, $forall z in HH$

  $ g dot z = (a z + b) / (c z + d) $

  $forall f: HH -> CC$

  $
    (f |_k g)(z) = f(
      (a z + b) / (c z + d)
    ) (1) / (c z + d)^(k)
  $

  Note the action on the $z$ is a left action and the action on the functions is a right action. So $f$ is *modular* of weight $k <=>$ if $f$ is invariant under the weight $k$ right action of $S L_2(ZZ)$.
]

#lemma(name: [Transitivity of action of $S L_2(RR)$])[
  $S L_2(RR)$ acts transitively on $HH$. In fact $B = {mat(a, b; 0, a^(-1)) | a in RR^(*), b in RR}$ acts transitively. Moreover $S L_2(RR)^(i) = S O_2(RR)$
]
#proof[
  1. We will show that $forall z = x + i y in HH$, $exists M in B in.rev M dot z = i$. We want to find $(a, b) in RR^times times RR in.rev i = (a(x + i y) + b) / ((1) / (a)) = a(a x + b) + a^2 i y$. Thus $a = sqrt((1) / (y))$ and $b = -x sqrt((1) / (y))$. Thus

  $
    M = mat(
      sqrt((1) / (y)), -x sqrt((1) / (y));
      0, sqrt(y)
    )
  $

  and $M dot z = i$. Since it is a group action, the action is transitive.

  2. We need to show that $M dot i = i => M in S O_2(RR)$. Let $M = mat(a, b; c, d)$

  $ (a i +b) / (c i + d) = i => a i + b = d i - c $

  Thus $a = d "and" c = -b$. Thus $M = mat(a, b; -b, a).$

  $
    M M^T & = mat(a, b; -b, a) mat(a, -b; b, a) \
          & = mat(a^2 + b^2, 0; 0, a^2 + b^2)
  $

  Furthermore note $M^T in S L_2(RR) => M M^T in S L_2(RR) => (a^2 + b^2)^2 = 1 => a^2 + b^2 = 1 => M M^T = I$. Thus $M in S O_2(RR)$. Thus $S L_2(RR)^i subset S O(RR)$. Let $mat(a, b; -b, a) in S O(RR)$.

  $
    (b + a i) / (a - b i) & = ((b + a i)(a + b i)) / (a^2 + b^2) \
                          & = a b - a b + i(a^2 + b^2) \
                          & = i
  $

  Thus $S O(RR) subset S L_2(RR)^i$. Thus $S L_2(RR)^i = S O(RR)$.
]

#lemma(name: [NAK Decomposition of $S L_2(RR)$])[

  Let $N = {mat(1, x; 0, 1)}$, $A = {mat(a; , a^-1)}$, and $K = S O_2(RR)$.

  $ S L_2(RR) = N A K $
]
#proof[
  Let $g = mat(a, b; c, d) in S L_2(RR)$. Let $z = x + i y = g dot i$. We want to show $exists (N, A) in N times A in.rev N A dot i = z$. Let $N = mat(1, x; , 1)$ and $A = mat(sqrt(y); , (1) / (sqrt(y) ))$. Thus $N A dot i = z$. Let $K = (N A)^(-1) g$. Thus $g = N A K$. Thus $S L_2(RR) = N A K$.
]

So that is how $S L_2(RR)$ acts on $HH$, but what we need to understand is how $S L_2(RR)$ acts on $HH$.

*Analogy*: $RR$ transitively acts on $RR$ by translation. $ZZ subset RR$ acts on $RR$ by translation but the action is no longer transitive, each orbit is characterized by the fractional part of the number thus for any function invariant under translation by $ZZ$ we only need to understand the behavior on $[0, 1)$. Thus $[0, 1)$ is the fundamental domain of $ZZ$. Similarly $S L_2(RR)$ acts transitively on $HH$, but $S L_2(ZZ)$ acts in the same way but isn't transitive. However its orbits can also be completely characterized, so what is the fundamental domain of $S L_2(ZZ)$?

#pagebreak()

#theorem(name: [Fundamental Domain of $S L_2(ZZ)$])[
  Let $ D_F := {
    z in HH mid(|) abs(Re(z)) < (1) / (2) "and" abs(z) >= 1
  } $<FundamentalDomain>

  #figure(image("pictures/fundamental_domain.jpg", width: 75%), caption: [
    The fundamental domain of $S L_2(ZZ)$
  ])

  + Every $S L_2(ZZ)$-orbit intersects $D$($<=> forall z in HH,exists g in S L_2(ZZ) in.rev g dot z in D_F$)
  + If $z_1, z_2 in D_F^o = {z in HH mid(|) abs(Re(z)) < (1) / (2) "and" abs(z) > 1 }$ the orbits of $z_1$ or $z_2$ are equal or disjoint
  + If $z_1, z_2 in D$ and $g z_1 = z_2$ for $g in S L_2(ZZ)$ then:
    - $Re(z_1) = -(1) / (2)$ and $g = mat(1, 1; 0, 1)$
    - $Re(z_1) = (1) / (2)$ and $g = mat(1, -1; 0, 1)$
    - $abs(a) = 1$ and $g = plus.minus mat(0, -1; 1, 0)$

  + For $z in D$, $ Stab(SL(RR), z) = cases(
      {plus.minus 1} "if" z in.not {i, e^((pi i) / (3)), e^((2 pi i) / (3))},
      plus.minus mat(0, -1; 1, 0) "if" z = i,
      plus.minus lr(angle.l mat(0, -1; 1, 1) angle.r) "if" z = e^(2 pi i / 3),
      plus.minus lr(angle.l mat(1, -1; 0, 1) angle.r) "if" z = e^(pi i / 3),
    ) $
]
#proof[
  Proof of (1), and (2). Key point: $SL(ZZ)$ is discrete in $SL(RR)$.

  1.
    We will prove something seemingly stronger, that any $Gamma$-orbit intersects $D_F$ where $Gamma = lr(angle.l mat(1, 1; , 1), mat(0, -1; 1, 0) angle.r)$. Let $z in HH$. *WTS: $exists g in Gamma in.rev Im(g z)$ is maximal.* $ Im(g dot z) = (Im(z)) / (abs(c z + d)^2) $

    If we want $Im(g z)$ to be maximal, we want $abs(c z + d)^2 = (c (x + i y) + d)(c(x - i y)+ d) = (c x + d)^2 + c^2 y^2$ to be minimal. Thus look at the set, ${(c, d) in Z^2 mid(|) (c, d) != (0, 0), abs(c z + d)<= 1 }$ is a finite set. Then take an element with $|c z + d|$ minimal in the finite set. The set and its intersection with $Gamma$ will not be empty as identity will be in both.

    Let $g in Gamma$, be the element with this property such that $g dot z$ is maximal. WLOG, $abs(z) >= 1$, for $abs(z) < 1$, take $z = mat(0, -1; 1, 0) z = -(1) / (z)$ since $mat(0, -1; 1, 0) in Gamma$. Then $exists k in ZZ in.rev abs(Re(z) - k) <= (1) / (2)$ and then replacing g with $g prime = mat(1, k; 0, 1) g$ gives an element in $Gamma in.rev g prime z in D_F$.

  + Let $z in D_F$ and $g in SL(ZZ) in.rev g dot z in D_F$.

    + *$Im(g z) >= Im(z)$*: Then $abs(c z + d)^2 = (c x + d)^2 + c^2 y^2 <= 1$. But $y >= (sqrt(3) ) / (2)$ with equality iff $z = e^(plus.minus (2 pi i) / (3))$. Thus $1 >= c^2 y^2 >= (3) / (4) c^2 => c^2 <= (4) / (3) => c^2 <= 1$ since $c in ZZ$. If $c = 0 => g dot z$ is a integer translate of $z$ thus $Re(z) = (1) / (2) "or" (1) / (2)$ and $g = plus.minus mat(1, 1; 0, 1) "or" plus.minus mat(1, -1; 0, 1)$. Or $c = 1$, then $abs(z + d) <= 1$, you get the further cases in $(3)$.

    + $Im(g z) < Im(z)$: replace $(g, z)$ by $(g^(-1), g z)$ and use $1$.
]

#corollary[
  $Gamma = SL(ZZ)$, ie $forall g in SL(ZZ)$ g is a product of $plus.minus 1, mat(1, 1; 0, 1), mat(0, -1; 1, 0)$
]
#proof[
  Let $g in SL(ZZ)$. Let $z = g(2 i)$. By Theorem 1.1.6.1, $exists h in Gamma in.rev z prime = h dot z in D_F$. Then $z prime, 2 i$ are in $D$ are $SL(ZZ)$-equivalent. By part 2,3, $z prime = 2i$ and $g = plus.minus h in Gamma$.
]

#remark[
  1. ${g in SL(RR) mid(|) forall z, g z = z} = {plus.minus 1}$ one can always replace $SL(RR)$ and $SL(ZZ)$ with $PSL(RR)$ and $PSL(ZZ)$.
  2. $D_F$ is not compact. This creates a lot of analytic complications; on the other hand this gives a distiguished infinity direction, namely "up".
]

== First Examples of Modular Forms
We will construct a modular form of a given weight $k$ (if possible), which are meromorphic or holomorphic.

#proposition[For a group $G$ acting on $X$, if you have $f: X -> CC$ that is invariant under the action of $H < G$. Then the function $F: X -> CC$ defined by

  $ F(x) = sum_(g in H backslash G) f(g x) $

  if absolutely convergent is (well defined) and $G$ invariant function.]
#proof[
  First note $forall g in H backslash G$, $f(g x)$ is well defined because replacing $g$ with $h g$ gives

  $ f(h g x) = f(h (g x)) = f(g x) $ by the assumption that $f$ is $H$-invariant.

  Then for $gamma in G$,

  $
    F(gamma x) & = sum_(g in H backslash G) f(g gamma x) \
               & = sum_(g prime in H backslash G)^() f(g prime x) = F(x)
  $
]

#example[
  $G = ZZ$, $X = RR$, $H = {0}$. $f: RR -> CC$. Then $F(x) = sum_(n in ZZ)^() f(n + x)$ is 1-periodic.
]

We will apply this to $     G & = SL(ZZ) \
H = N & = {plus.minus mat(1, n; 0, 1) mid(|) n in ZZ} $

(Note $mat(1, n; 0, 1) z = n + z$ ). Let $ e(z) = e^(2 pi i z) $, $e$ is invariant under integer translation and is holomorphic on $HH$.

#definition(name: "Translation Subgroup")[
  Let *$T = {mat(1, n; 0, 1) mid(|) n in ZZ} < SL(Z)$* be the translation subgroup. Let *$overline(T) = {plus.minus mat(1, n; 0, 1) mid(|) n in ZZ}$*.
]<Translation-Subgroup>
#definition(name: "Poincaré Series")[
  $ P_(m, k)(z) = sum_(g in #link(<Translation-Subgroup>)[$overline(T)$] backslash G)^() (c z + d)^(-k) e(m(g dot z)) $
  is a *Poincaré Series*
]<PoincareSeries>
#definition(name: "J Helper Function")[
  For $k in ZZ$, let $j_k: GL(RR) times CC -> CC$ where

  $ j_k (mat(*, *; c, d), z) := (c z + d)^(-k) $.

  Thus $ (f|_k g)(z) = j_k (g, z) f(g dot z) $
]<JHelperFunction>



#proposition[If $P_(m, k)$ converges absolutely then $P_(m, k)$ is a weight k modular form ]
#proof[
  $ (c z + d)^(-k) e(m(g dot z)) = (e_m |_k g)(z) $
  where $e_m (z) = e(m z)$.

  $forall gamma in SL(ZZ)$,
  $
    (P_(m, k)|_(k) gamma)(z) & = j_k(gamma, z) P_(m, k)(gamma z) \
                             & = j_k(gamma, z) sum_(g in H backslash G)^() (e_m |_k g)(gamma z) \
                             & = sum_(g in H backslash G)^() j_k(gamma, z) (e_m |_k g)(gamma z) \
                             & = sum_(g in H backslash G)^() (e_m |_k g |_k gamma)(z) \
                             & = sum_(g in H backslash G)^() (e_m |_k g gamma)(z) \
                             & = sum_(g prime in H backslash G)^() (e_m |_k g prime)(z) = P_(m, k)(z)
  $
]

#lemma[
  Let $alpha: SL(ZZ) -> ZZ^2$ where $mat(a, b; c, d) -> (c, d)$. $alpha$ factors through $#link(<Translation-Subgroup>)[$T$] backslash SL(ZZ)$
]<injection-cosetsTranslation>
#proof[
  $forall mat(a, b; c, d) in SL(ZZ)$ and $forall n in ZZ$

  $
    alpha(mat(1, n; 0, 1) mat(a, b; c, d)) & = alpha(mat(*, *; c, d)) \
                                           & = (c, d)
  $


  Thus $alpha$ is invariant under right multiplication by elements of $T$.

  Suppose

  $ alpha(mat(a, b; c, d)) = alpha(mat(a prime, b prime; c, d)) $

  Then $1= a d - b c = a prime d - b prime c => d(a - a prime) = c(b - b prime)$. Since $(c, d) = 1$, we get $d | (b - b prime)$ and $c | (a - a prime)$. Thus $b = b prime + k d$ and $a = a prime + l c$. Thus

  $ d(a - a prime) = d l c = c k d = c(b - b prime) $

  Thus $l = k$. Thus

  $ mat(a, b; c, d) & = mat(1, k; 0, 1) mat(a prime, b prime; c, d) \ $

  Thus $alpha$ factors through $T backslash SL(ZZ)$
]
#lemma[
  For $z in HH$ and $k > 2$, the series

  $ sum_((c, d) != (0, 0))^() abs(c z + d)^(-k) $

  converges absolutely and locally uniformly.
]<convergenceofjsum>
#proof[
  Note that $(c, d) -> max(abs(c), abs(d))$ and $(c, d) -> abs(c z + d)$ are both norms on $RR^2$. The second because since $z in HH, c z + d = 0 <=> (c, d) = (0,0)$. By the equivalence of norms on $RR^2$. Thus

  $
        abs(c z + d) & <= alpha(z) max(abs(c), abs(d)) \
    max(abs(c), |d|) & <= beta(z) abs(c z + d)
  $

  For two norms in $RR^n$, $|dot|_1$ and the second norm be $|dot |_2$, we have $|v|_1 <= c|v|_2$ for $c = sup_(|v|_1 = 1)(|v|_2) = max_(|v|_1 = 1)(|v|_2)$. So

  $
    alpha(z) & = max_(max(|c|, |d|) = 1)(|c z + d|) \
     beta(z) & = max_(|c z + d| = 1)(max(|c|, |d|))
  $

  If $z$ varies in a compact subset of $HH$, by property continuous functions $alpha$ and $beta$ are bounded.

  Let $r(n) := abs({(c, d) in ZZ^2 mid(|) n <= |c z + d| < n + 1})$. Define two functions

  $
    A(z) & = (r(0)) / (min_((c, d) in ZZ^2 - (0, 0))(|c z + d|^k)) \
    B(z) & = sum_(n >= 1)^() (r(n)) / (n^k)
  $

  Thus,

  $
    sum_((c, d) != (0, 0))^() abs(c z + d)^(-k) & <= A(z) + B(z)
  $

  1. For $r(0)$: Since $abs(c z + d) < 1 => max(|c|, |d|) <= beta(z)$. For any choice of $z$, there is a fixed finite number of $(c, d) in ZZ^2$ such that $max(abs(c), abs(d)) <= beta(z)$. Thus $r(0) = O(1)$.
  2. For $n >= 1$ $r(n)$: $max(|c|, |d|) <= beta(z)(n + 1)$ thus we have upper bound for $|c|$ and $|d|$. We also have, $(n) / (alpha(z)) <= max(|c|, |d|)$. Thus we have roughly speacking $r(n)$ counts the number of $(c,d)$ in the annulus $n <= |c z + d| <= n + 1$ which grows proportionally to n. Thus $r(n) = O(n)$.

  $min_((c, d) in ZZ^2 - (0, 0)) (|c z + d|^k)$ bounded below uniformly locally, because $ZZ + ZZ z$ is discrete in $RR^2$. Thus the series is dominated by

  $ c sum_(n >= 1)^() (n) / (n^k) = c sum_(n >= 1)^() n^(1 - k) $

  Since $k > 2$, the series is locally absolutely convergent.
]

#theorem[For $m >= 0$ and $k >= 3$, the series $P_(m, k)$ converges absolutely and locally uniformly on $HH$ ]
#proof[
  Note that $forall z = x + i y in HH$, $abs(e(m z)) = e^(-2 pi m y) <= 1$, so the statement will hold for all $m > 0$ if it holds for $m = 0$. Thus it suffices to prove that $P_(0, k)$ converges absolutely and locally uniformly on $HH$.

  $
    sum_(g in overline(T) backslash SL(ZZ))^() abs(j_k (g, z)) &< sum_(g in T backslash SL(ZZ))^() abs(j_k (g, z)) \
    &< sum_((c, d) in ZZ^2 - (0, 0))^() abs(c z + d)^(-k) & "(By Injection Lemma)"
  $

  The last sum is absolutely and locally uniformly convergent. Thus $sum_(g in overline(T) backslash SL(ZZ))^() abs(j_k (g, z))$ is absolutely and locally uniformly convergent. Thus $P_(0, k)$ is absolutely and locally uniformly convergent.
]

#remark[For any modular form $f$ since $-I in SL(ZZ)$, and $f(-I z) = f(z) = (-1)^k f(z)$. That means that $f$ is either zero or $k$ is even. ]

== Fourier Expansions
*Idea: Study modular forms "at $infinity$" ie for $Im(z) -> infinity$*
#theorem(name: "Existence of Fourier Expansion")[
  Let $ f: HH -> CC $ be a meromorphic modular form of weight $k$ there exists a meromorphic $tilde(f): DD^* -> CC$ such that $f(z) = tilde(f)(e(z))$
]
#proof[
  The map $e: D -> DD^*$ where $tilde(D) = {z in HH mid(|) abs(Re(z)) < (1)/(2) }$ is a conformal equivalence. Thus $e^(-1)$ is also holomorphic. Thus define $tilde(f) = f compose e^(-1)$ is a meromorphic on $DD$. Thus $f = tilde(f) compose e$. Since $f(z + 1) = f|_(k)mat(1, 1; 0, 1)(z) = f(z) =>$ this holds everywhere on $HH$ using periodicity and continuity.
]

#definition[f is a meromorphic modular form of weight $k$ is called *meromorphic or holomorphic* at $infinity$ if $tilde(f)$ extends to a meromorphic or holomorphic function $tilde(f): DD -> CC$. ]
#definition[
  $f$ is a cusp form of weight $k$ if its a modular form of weight $k$ and $tilde(f)(0) = 0$.
]
#definition[
  $M_(k)$ is the space of modular forms of weight $k$ which are holomorphic on $HH$ and at $infinity$. $S_(k) = M_(k)^o$ is the space of cusp forms.
]<space-of-forms_1>
#definition[For $f in M_(k)$, $tilde(f)$ is holomorphic and thus has a Taylor Expansion

  $ tilde(f)(z) = sum_(n >= 0)^() a_(n) z^(n) $

  thus

  $ f(z) = sum_(n >= 0)^() a_(n) e(n z) $

  $a_(n)$ is the *Fourier coefficients at $infinity$ of $f$*
  By uniqueness of Taylor expansion, the sequence $(a_(n))$ characterizes the modular forms.
]


*Suppose $(a_(n))$ is some arbitrary series which doesn^t grow too fast, how can you determine if its the fourier coefficients of some modular form?*

It just has to satisfy the extra symmetry of $SL(ZZ)$.
Suppose $(a_(n))$ is a series with polynomial growth. Then $f(z) = sum_(n >= 0)^() a_(n) e(n z)$ defines a function $f: HH -> CC$ holomorphic such that $f(z + 1) = f(z)$ (this comes from exponentials).

Since $mat(1, 1; 0, 1)$ and $mat(0, -1; 1, 0)$ generate $SL(ZZ)$ we just need to check that

$ f(-(1)/(z)) = z^k f(z) $

for some $k$ to know if $f$ is modular of a given weight $k$!
#pagebreak()
== Dimension of $M_(k)$ and $S_(k)$
$forall z in HH union {0}$, let $v_z: hom(HH, CC) -> NN union {0}$ where $f -> "order of f at z"$ (if $z$ is a zero > order and $<0$ if pole  ) and for $v_(infinity)(f) = v_(0)(tilde(f))$ for f weight k meromorphic. Thus if $f in S_(k) => v_(infinity)(f) >= 1$.

Note that $forall f in M_(k)$ and $forall z in HH$,  $forall g in Gamma$ $f(g z) = j_(-k)(g, z)f(z)$ (@JHelperFunction - J Helper Function). $j_(-k)(g, z)$ does not vanish on $HH$. Thus $v_(g z)(f) = v_(z)(f)$. So $v_(z)(f)$ can be defined on $Gamma backslash HH$.

#theorem[
  For $f in M_(k), f != 0$ then the "number of zeroes of $f$ in $Gamma backslash HH$" with multiplicity is $(k)/(12)$. More precisely,

  $
    v_(infinity)(f) + sum_(z in Gamma backslash HH - {i, omega, omega})^() v_(z)(f) + (1)/(2)v_(i)(f) + (1)/(2)v_(omega)(f) = (k)/(12)
  $

  where $omega = e^(2 pi i slash 3)$. $(1)/(2) "and" (1)/(3)$ come from the order of the stablizer of $i$ and $omega$ in $PSL(ZZ)$
]<NumberOfZerosModularForms>
#proof[
  Note $Gamma backslash H$ is not $D_(F)$, but rather you have identified the two verticals and each half of the arc of the unit circle together. So $z ~ w$ if

  1. $abs(Re(z)) = abs(Re(w)) = (1)/(2)$
  2. $abs(z) = abs(w) = 1$ and $Re(z) = -Re(w)$

  + *There exists $y_(0) > 0 in.rev f(z) != 0, forall z in HH in.rev Im(z) > y_(0)$:* $f$ is holomorphic at $infinity$, so $tilde(f): D^* -> CC$ is holomorphic at $0$ and $tilde(f) != 0$. There are two cases:
    + $tilde(f)(0) != 0$: Since $tilde(f)$ is holomorphic, $exists r in (0, 1) in.rev 0 in.not f({z in DD mid(|) 0 < |z| <= r})$.
    + $tilde(f)(0) = 0$: #link("https://mathweb.ucsd.edu/~jmckerna/Teaching/19-20/Winter/120A/l_18.pdf")[Since the zeros of holomorphic functions are isolated], $exists r in (0, 1) in.rev 0 in.not f({z in DD mid(|) 0 < |z| <= r})$.

    Now that means that $f(z) != 0$ for $Im(z) >= (1)/(2pi) log((1)/(r))$. Take $y_(0) = max(2pi log((1)/(r)), 2)$.

    $forall epsilon > 0$, consider the contour $Gamma_(epsilon)$ below, if $f$ doesn't have 0s on the boundary. Otherwise, add $epsilon$ dimples in the contour. For $epsilon > 0$ small enough, we have

    $
      (1)/(2pi) integral_(Gamma_(epsilon))^() (f prime)/(f) dif z = sum_(z in SL(ZZ) backslash HH - {i, omega})^() v_(z)(f) "(Logarithmic Derivative)"
    $

    To calculate the integral, we will tranform the integral using $z -> e(z)$. Thus the top part of the integral

    $
      integral_((1)/(2) + i y_(0))^(-(1)/(2) + y_(0)) (f prime)/(f) dif z = - integral_(pi)^(-pi) (f prime (e (z)))/(f(e(z))) d z = - integral_(pi)^(-pi) (tilde(f) prime)/(tilde(f)) d z = - 2pi v_(infinity)(f)
    $

    The vertical chunks of the integral cancel each other out.

  // TODO mark C1 and C2 on the curved parts

  $
    integral_(C_1) (f prime(z))/(f(z)) dif z + integral_(C_2) (f prime (z))/(f (z)) dif z &= integral_(C_1) (f prime (z))/(f (z)) dif z + integral_(-C_1) (f prime (- (1)/(z)))/(f (-(1)/(z))) dif (-(1)/(z)) \
    &=integral_(C_1) (f prime (z))/(f (z)) dif z + integral_(-C_1) (f prime (- (1)/(z)))/(z^2 f (-(1)/(z))) dif (z)
  $
  Looking at the second term,
  $
                    (dif)/(dif z)(f(-(1)/(z))) & = (dif)/(dif z)(z^k f(z)) \
                   f prime(-(1)/(z)) (1)/(z^2) & = k z^(k - 1) f(z) + z^k f prime(z) \
                             f prime(-(1)/(z)) & = k z^(k + 1) f(z) + z^(k + 2) f prime(z) \
    => (f prime (- (1)/(z)))/(z^2f (-(1)/(z))) & = (k z^(k + 1) f(z) + z^(k + 2) f prime(z) )/(z^(k + 2) f(z)) \
                                               & = (k)/(z) + (f prime (z))/(f(z))
  $

  $
    integral_(C_1) (f prime (z))/(f (z)) dif z + integral_(-C_1) (f prime (- (1)/(z)))/(z^2 f (-(1)/(z))) dif (z) & = integral_(C_1) ((f prime(z))/(f(z))-[(k)/(z) + (f prime(z))/(f(z))]) dif z \
    &= integral_(C_(1))-(k)/(z) dif z ->_(epsilon -> 0) (k)/(12)
  $

  Thus the arcs of unit circle give us $(k)/(12)$. Lets do the arcs around $i$ and $omega$,

  $
    integral_(C_(i)) (f prime(z))/(f(z)) dif z ->_(epsilon -> 0) (1)/(2) integral_(epsilon "counter clockwise circle around i ") (f prime(z))/(f(z)) dif z = (-1)/(2) v_(i)(f)
  $

  $
    integral_(C_(omega)) (f prime(z))/(f(z)) dif z ->_(epsilon -> 0) -(1)/(6) v_(omega)(f)
  $

  $
    integral_(C_(-omega^(-1))) (f prime(z))/(f(z)) dif z ->_(epsilon -> 0) -(1)/(6) v_(omega)(f)
  $

  Thus putting every thing together we see,

  $
    lim_(epsilon -> 0) integral_(Gamma_(epsilon)) (f prime (z))/(f(z)) dif z & = -(1)/(3) v_(omega)(f) - (1)/(2) v_(i)(f) - v_(infinity)(f) + (k)/(12)
  $

  thus,

  $ (k)/(12) = (1)/(3)v_(omega)(f) + (1)/(2)v_(i)(f) + v_(infinity)(f) + sum_(z in Gamma backslash D_(F))^() v_(z)(f) $

]

#definition[$E_(k) : HH -> DD$ where $E_(k) = P_(0, k)$ is a *Eisenstein Series*]

#lemma[
  For $k >= 0$ even, $E_(k) in M_(k) - {0}$ and

  $ lim_(y -> infinity) E_(k)(x + i y) = 1 $
]<valueatinfinityofEisenstein>
#proof[
  Recall,
  $
    E_(k)(z) = sum_(g in overline(T) backslash Gamma)^() j_(k)(g, z) = sum_(g in overline(T) backslash Gamma)^() (c z + d)^(-k)
  $

  for $z in HH$. Since $E_(k)$ is holomorphic on $HH$, $tilde(E_(k)): DD^times -> CC$ is holomorphic. To prove the lemma, it suffices to prove that $lim_(y -> infinity) E_(k)(x + i y) = 1$ by the removable singularity theorem.

  Note that $forall g in overline(T)$, $j_(k)(g, z) = 1$. $forall g in Gamma - overline(T)$, $forall z = x + i y in D_(F) => abs(x) <= (1)/(2)$

  $
    abs(c (x + i y) + d)^2 & = abs((c x + d) + i c y) \
                           & = (c x + d)^2 + c^2 y^2 \
                           & = c^2 x^2 + 2c d x + d^2 + c^2 y^2 \
                           & >= c^2 x^2 - c d + d^2 + c^2 y^2 \
                           & = c^2 (x^2 + y^2) - c d + d^2 \
                           & >= c^2 - c d + d^2
  $

  $x^2 + y^2 = 1$ corresponds to the case where $z = e^(i theta)$, but since $x = -(1)/(2) => z = e((1)/(3))$.

  Thus

  $ abs(c (x + i y ) + d)^2 & >= abs(c e((1)/(3)) + d)^2 $.

  And we know that, $sum_((c, d) in ZZ^2 - (0,0))^() abs(c e((1)/(3)) + d)^(-k)$ converges for $k >= 4$, by @convergenceofjsum. Thus the convergence of $E_(0)$ is dominated, thus by dominated convergence theorem you can interchange limits

  $
    lim_(y -> infinity) sum_(g in overline(T) backslash Gamma)^() j_(k)(g,x+ i y) &=sum_(g in overline(T) backslash Gamma)^() lim_(y -> infinity) j_(k)(g, x + i y) \
    &= 1 & "for" g = I
  $

  From this we know that $tilde(E_(k))$ is bounded around a region of 0, Since its meromorphic, it follows that $E_(k)$ is holomorphic at $0$, so $E_(k) in M_(k)$. Since $E_(k)(infinity) = 1 => E_(k) in.not S_(k)$.
]

#theorem[
  $M_(k) = {0}$ for $k < 0$, $k$ odd, and $k = 2$.
]<sizeofsmallweightmodularforms>
#proof[
  As previously proven, $M_(k) = {0}$ for $k$ odd, since $forall f$ weight $k$ modular forms, $f(-I z) = f(z) = (-1)^k f(z) => f$ is zero or $k$ is even.

  If $f in M_(2k) - {0}$, by @NumberOfZerosModularForms
  , $exists a, b, c >= 0$ such that

  $ (k)/(6) = (2k)/(12) & = (a)/(3) + (b)/(2) + c $


  1. $k < 0$: There are no positive integers that sum to negative numbers. Thus by contradiction $M_(2k) - {0} = diameter$.
  2. $k = 1$: $(a)/(3) + (b)/(2) + c > (1)/(3)$ for all $a, b, c >= 0$. Thus by contradiction $M_(2k) = {0}$
]

#proposition[
  $exists Delta in S_(12) - {0}$ such that $v_(z)(Delta) = 0$ for $z in HH$.
]
#proof[
  Let $Delta = E_(4)^3 - E_(6)^2$. $forall g in SL(ZZ)$, $(Delta|_(12)g) = (E_(4)^3)|_(12) - (E_(6)^2)|_(12) = E_(3)^(4) - E_(6)^(2) = Delta$. Thus $Delta in M_(12)$. By @valueatinfinityofEisenstein,

  $ lim_(y -> infinity) Delta(x + i y) = lim_(y -> infinity) (E_(4)^3 - E_(6)^2)(x + i y) = 1 - 1 = 0 $

  Thus $Delta in S_(12)$. We need to show tho that $Delta != 0$. For this look at @NumberOfZerosModularForms, for $E_(4)$ and $E_(6)$

  $
    (1)/(3) & = (v_(i)(E_(4)))/(2) + (v_(omega)(E_(4)))/(3) + sum_(z in Gamma backslash HH)^() v_(z)(E_(4)) + v_(infinity)(E_(4)) \
  $

  which implies

  $
    v_(z)(E_(4)) = cases(1 "if" z = omega, 0 "otherwise")
  $

  For $E_(6)$ we see,
  $
    (1)/(2) & = (v_(i)(E_(6)))/(2) + (v_(omega)(E_(6)))/(3) + sum_(z in Gamma backslash HH)^() v_(z)(E_(6)) + v_(infinity)(E_(6)) \
  $

  thus,

  $
    v_(z)(E_(6)) = cases(1 "if" z = i, 0 "otherwise")
  $

  Thus $Delta(i) != 0 => Delta != 0$.
]

#theorem[
  $dim S_(k) = dim M_(k) "or" dim M_(k) - 1$
]<dimensionofcuspforms>
#proof[
  Let $A: M_(k) -> CC$, where $f -> tilde(f)(0)$. $S_(k) = ker A$. $A$ is $CC$-linear. Thus by rank nullity, $dim S_(k) = M_(k) - dim A(M_(k))$, where $dim A(M_(k)) <= 1$. Thus $dim S_(k) = M_(k) "or" M_(k) - 1$.
]

#theorem[
  For all $k in NN$, let $u: M_(2k) -> S_(2k + 12)$ where $f -> Delta f$. $u$ is a isomorphism of vector spaces.
]
#proof[
  1. *Linearity*: $forall (f, g, a, b) in M_(2k)^2 times CC^2$, $u(a f + b g) = Delta times (a f + b g) = a Delta f + b Delta g$.
  2. *Injectivity*: $forall f, g in M_(2k) in.rev Delta f = Delta g$
  3. *$im(u) subset S_(2 k + 12)$*: $(f Delta)(infinity) = 0$

  Let $f in S_(2 k + 12)$, $g := (f)/(Delta)$. Thus $g$ is modular of weight $2k$. $g$ is holomorphic everywhere, because $v_(infinity)(g) = v_(infinity)(f) - 1 >= 0$ and $forall z in HH$, $v_(z)(g) = v_(z)(f) >= 0$ (since $Delta$ has no zeros in $HH$). Thus $g in M_(2k)$. Thus $u$ is a surjective map and thus a linear isomorphism from $M_(2k) -> S_(2k +12)$.

  By @sizeofsmallweightmodularforms, $M_(2k) = {0}$ for $k < 0$ and $k = 1$. Thus $S_(2k + 12) = 0$. Thus $S_(0), S_(4), S_(6), S_(8), S_(10) = {0}$. Since $1, E_(4), E_(6), E_(8), E_(10) in M_(k) - {0}$ (@valueatinfinityofEisenstein), and $dim M_(k) = dim S_(k) "or" dim S_(k) + 1 => 1, E_(4), E_(6), E_(8), E_(10)$ generate $M_(0), M_(4), M_(6), M_(8), M_(10)$. Thus since *$S_(12) tilde.equiv M_(0) => S_(12)$ generated by $Delta$.*
]

#theorem(name: "Dimension of Modular Forms")[
  For $k >= 1$

  $
    dim M_(2k) = cases(floor((k)/(6)) & "if" k equiv 1 mod 6, floor((k)/(6)) + 1 & "otherwise")
  $
]<dimensionofweightkmodularforms>
#proof[
  Observe that for $2k < 12$, that the theorem holds.

  + For $2k = 12$, note that $E_(12) in.not S_(12) => M_(12)$ generated by $E_(12)$ and $Delta$. Thus $dim M_(12) = 2$.
  + For $2k = 14$, note that $E_(14) in M_(14) - S_(14)$ (@valueatinfinityofEisenstein) and $S_(14) = 0$. By @sizeofsmallweightmodularforms, $dim M_(14) = 1$.

  Suppose the formula holds for $k$. Then $dim S_(2(k + 6)) = dim M_(2k) => dim M_(2(k + 6)) = dim S_(2(k + 6)) + 1 = dim M_(2k) + 1$.

  $
    dim M_(2(k + 6)) & = cases(floor((k)/(6)) + 1 & "if" k equiv 1 mod 6, floor((k)/(6)) + 2 & "otherwise") \
                     & = cases(floor((k + 6)/(6)) & "if" k equiv 1 mod 6, floor((k + 6)/(6)) + 1 & "otherwise") \
                     & = cases(floor((k + 6)/(6)) & "if" (k + 6) equiv 1 mod 6, floor((k + 6)/(6)) + 1 & "otherwise") \
  $

  Thus by induction the formula holds for all $k$.
]

#corollary[
  The $CC$-algebra $ plus.circle.big_(k >= 0) M_(k) $ with product of modular forms as multiplication is $tilde.equiv$ to $CC[x, y]$ by $u: CC[x, y] -> plus.circle.big_(k >= 0) M_(k)$ where

  $
    x & -> E_(4) \
    y & -> E_(6)
  $
]<modularformscalgebra>
#proof[
  $forall f in ker(u)$, $f = sum_(i, j)^() a_(i, j) x^i y^j$. Thus $u(f) = sum_(i, j)^() a_(i, j) E_(4)^i E_(6)^j = 0$ is a relation. Then for all $k$, each peice of weight $k$ vanishes. Thus $sum_(4 i + 6j) a_(i, j) E_(4)^i E_(6)^j = 0$.

  Pick $(a, b) in NN$ with $4a + 6b = k$ and $a$ minimal, we observe that for all $i, j$ with $4i + 6j = k$ we have $i >= a => j <= b$.

  $ (E_(4)^(a)E_(6)^(b))/(E_(4)^(i)E_(6)^(j)) & = (E_(6)^(b - j))/(E_(4)^(i-a)) $

  Since $4(i - a) = 6(b - j) => b - j = (2)/(3)(i - a)$,

  $
    (E_(4)^(a)E_(6)^(b))/(E_(4)^(i)E_(6)^(j)) & = (E_(6)^(b - j))/(E_(4)^(i-a)) \
                                              & = (E_(6)^((2)/(3)(i - a)))/(E_(4)^(i-a)) \
                                              & = ((E_(6)^2)/(E_(4)^(3)))^((i - a)/(3))
  $

  Thus

  $ E_(4)^(a)E_(6)^(b) & = E_(4)^(i)E_(6)^(j) ((E_(6)^2)/(E_(4)^(3)))^((i - a)/(3)) $

  Thus,

  $
    0 = sum_(4 i + 6 j)a_(i, j) E_(4)^(i) E_(6)^(j) & = sum_(4 i + 6 j)a_(i, j) E_(4)^(a)E_(6)^(b) ((E_(4)^(3))/(E_(6)^(2)))^((i-a)/(3)) \
    &= E_(4)^(a)E_(6)^(b) sum_(4 i + 6 j)^() a_(i, j)((E_(4)^(3))/(E_(6)^(2)))^((i-a)/(3)) \
    => sum_(4 i + 6 j)^() a_(i, j)((E_(4)^(3))/(E_(6)^(2)))^((i-a)/(3)) &= 0
  $

  This is only possible in two cases:
  1. $a_(i, j) = 0$: Thus $f = 0$.
  2. $((E_(4)^(3))/(E_(6)^(2)))^((i-a)/(3)) = c$: Not true since $E_(4)$ and $E_(6)$ don't agree on i and $e((1)/(3))$.

  Thus $f = 0 => u$ is injective.

  *$u$ is surjective:*
  Induction on $k$ that $M_(k) subset im(u)$. This holds for $k <= 6$ since $M_(0) = CC$, $M_(2) = 0$, $M_(4) = CC dot E_(4)$, and $M_(6) = CC dot E_(6)$.

  Suppose it hold for all $n < k$ that $M_(n) subset im(u)$. Then pick $a, b in.rev 4a + 6b = k$. $forall f in M_(6)$, there $exists lambda in.rev f - lambda E_(4)^a E_(6)^b in S_(k)$, because $E_(4), E_(6)$ are not cusp forms $E_(4)^(a)E_(6)^(b)$ is not one either so its value at infinity is nonzero. Thus $f = E_(4)^(a) E_(6)^(b) + Delta g$ for $g in M_(k - 12)$. Since $Delta in im(u)$, by inductive hypothesis, $f in im(u)$.
]


#pagebreak()

== The $J$ function
#corollary(name: "The J function")[
  There exists a meromorphic modular form $J: HH -> CC$ of weight $0$ such that $J$ defines a bijection between $SL(ZZ) slash HH$ and $CC$ and $J$ has a pole at $infinity$ and residue 1.
]
#proof[
  Since $Delta$ has a simple zero at $infinity$ and no other zero, we can find a $lambda in CC^(times)$ such that $J = lambda (E_(4)^(3))/(Delta)$ has a simple pole with residue 1 at $infinity$. It is weight 0, and holomorphic on $HH$. $J$ defines a map $SL(ZZ) slash HH -> CC$. To prove it is a bijection, pick $z in CC$. The function $f_(z):lambda E_(4)^(3) - z Delta$ is in $M_(12)$ and is nonzero ($E_(4)$ is not a cusp form). The formula of zeros from @NumberOfZerosModularForms gives,

  $
    v_(infinity)(f_(z)) + (1)/(2)v_(i)(f_(z)) + (1)/(3)v_(e((1)/(3)))(f_(z)) + sum_(w in SL(ZZ) slash HH - {i, e((1)/(3))})^() v_(w)(f_(z)) = 1
  $

  Note $v_(infinity)(f_(z)) = 0$. Thus there are 3 cases:
  1. $v_(i)(f_(z)) = 2$ and all others are 0
  2. $v_(e((1)/(3)))(f_(z)) = 3$ and all others are 0
  3. $v_(w)(f_(z)) = 1$ for $w != i, e((1)/(3))$ and all others are 0.

  In any of the 3 cases, $f_(z)$ has unique zero $w in SL(ZZ) slash HH$. Since $(lambda E_(4)^(3) - z Delta)(w) = f_(z)(w) = 0 => j(w) = z$ where $w$ is the unique solution. Thus $J$ is injective and surjective. Thus $J$ is a meromorphic bijection.
]

#corollary[
  Any modular function $f$ which is meromorphic everywhere, including at $infinity$, is of the form $ f = Q(j) $ for $Q in CC(x)$, (field of rational functions over $QQ$).
]
#proof[
  + WLOG we can assume that $f$ is holomorphic on $HH$: Examine $f$ on $SL(ZZ) slash HH$.
    + $tilde(f)$ has a pole at 0: Since poles are isolated then $exists 0 < r_(0) < 1$ such that $tilde(f)$ only has 1 pole on ${w in DD mid(|) |w| < r}$ which is 0. Thus $exists y_(0) > 0$ such that $forall z in SL(ZZ) slash HH, Im(z) > y_(0)$, $f$ has no pole. Let $K = SL(ZZ) slash HH inter {z in HH mid(|) Im(z) <= y_(0)}$ which is a compact subspace. Let $S$ be the set of poles of $f$, which is a discrete subspace of $SL(ZZ) slash HH$. $S inter K$ must be finite set (since $S inter K$ would have a accumulation point in $K$ contradicting the discretness of $S$), thus $f$ has a finite number of poles in $SL(ZZ) slash HH$.
    + $f$ doesn't have a pole at $0$: Basically same argument, but now you have a $r_(0)$ such that ${w in DD mid(|) |w| < r_(0)}$ has no poles.

    Let $alpha_1, #sym.dots.h, alpha_(m)$ be the poles of $f$. Then

    $ g = f product_(i = 0)^(m) (j - j(alpha_(i)))^(-v_(alpha_(i))(f)) $

    is a modular form which is holomorphic on $HH$.

  + Since $Delta$ has a simple zero at $infinity$, $exists n >= 0 in.rev g = Delta^n f$ is holomorphic modular form of weight 12, that is holomorphic at $infinity$. Thus $g in M_(12)$. Thus by @modularformscalgebra,

  $ g = sum_(4 i + 6 j = 12 n)^() a_(i, j) E_(4)^(i) E_(6)^(j) $

  For all $i, j in.rev 4 i + 6 j = 12 n => 4 i = 3(4 n - 2 j)$ since $3 divides.not 4 => 3 | i$. $6 j = 4 (3n - i) => 3 j = 2 (3 n - i) => 2 divides j$. Then

  $
    f = (g)/(Delta^(n)) &= sum_(i, j)^() a_(i, j) ((E_(4)^3)^(i / 3) (E_(6)^2)^((j)/(2)))/(Delta^((4)/(12) i + (6)/(12) j)) \
    &= sum_(i, j)^() a_(i, j) ((E_(4)^3)^(i / 3) (E_(6)^2)^((j)/(2)))/(Delta^((i)/(3) + (j)/(2)))
    &= sum_(i, j)^() a_(i, j) ((E_(4)^3)^(i / 3))/(Delta^((i)/(3))) ((E_(6)^2)^((j)/(2)))/(Delta^(j / 2))
  $

  Thus it suffices to check that $(E_(4)^3)/(Delta)$ and $(E_(6)^(2))/(Delta^())$ are rational functions of $j$.

  $ j := lambda (E_(4)^3)/(Delta) => (E_(4)^3)/(Delta) = (j)/(lambda) $

  and

  $ (E_(6)^( 2))/(Delta) = (E_(4)^3 - Delta)/(Delta) = (j)/(lambda) - 1 $

  Thus $f$ is a rational function of $j$
]

#remark[This property that all modular forms which are meromorphic everywhere is analogous to the fact that all meromorphic $f: CC -> CC$ are rational functions. ]

#pagebreak()
== Fourier Expansions of Eisenstein and Poincaré Series

#definition[
  For $Re(s) > 0$,

  $ Gamma(s) = integral_(0)^(infinity) t^s e^(-t) (dif t)/(t) $
]<gammafunction>


#theorem[
  $forall k >= 4, m >= 1$ integers. The fourier expansion of $P_(m, k)$ is given by:

  $ P_(m, k)(z) = sum_(n >= 1)^() p(m, n)e(n z) $

  where

  $
    p(m, n) := delta(m, n) + ((m)/(n))^((k - 1)/(2)) (2 pi)/(i^k) sum_(c >= 1)^() (1)/(c) S(m, n; c) J_(k - 1)((4 pi sqrt(m n) )/(c))
  $

  where

  $ S(m, n; c) = sum_(x in ZZ_(c)^(times))^() e((m x + n overline(x))/(c)) $

  is the Kloosterman Sum, and

  $ J_(nu)(xi) = sum_(n >= 0)^() ((-1)^(n))/(n! Gamma(n + 1 + nu)) ((xi)/(2))^(nu + 2n) $

  is the Bessel Function.
]<PoincareSeriesFourierExpansion>


#proof[
  Recall

  $
    P_(m, k)(z) = sum_(g in overline(T) slash SL(ZZ))^() j_(k)(g, z) e(m g z) = sum_(g in overline(T) slash SL(ZZ))^() (e_(m) |_(k) g)(z)
  $

  Thus, by @rewritingsumcorollary,

  $
    P_(m, k)(z) &= e_(m)(z) + sum_(c >= 1)^() sum_(d in ZZ^(times )_(c))^() sum_(n in ZZ)^() (e_(m)(mat(a, b; c, d)(z + n)))/(c(z + n) + d)^(k) \
    &= e(m z) + sum_(c >= 1)^() sum_(d in ZZ^(times )_(c))^() sum_(n in ZZ)^() (e(m mat(a, b; c, d)(z + n)))/(c(z + n) + d)^(k)
  $<rewritten_poissonsummation>

  Note:
  $
    mat(a, b; c, d)(z + n) & = (a(z + n) + b)/(c(z + n) + d) \
                           & = (c a(z + n) + b c)/(c^2(z + n) + d c) \
                           & = (c a(z + n) + a d - 1)/(c^2 (z + n) + c d) \
                           & = (a (c(z + n) + d))/(c(c(z +n) + d)) - (1)/(c(c z + c n + d)) \
                           & = (a)/(c) - (1)/(c(c z + c n + d))
  $

  Thus,

  $
    P_(m, k)(z) &= e(m z) + sum_(c >= 1)^() sum_(d in ZZ^(times )_(c))^() sum_(n in ZZ)^() (e(m ((a)/(c) - (1)/(c(c z + c n + d)))))/(c(z + n) + d)^(k) \
    &= e(m z) + sum_(c >= 1)^() sum_(d in ZZ^(times )_(c))^() e((m a)/(c)) sum_(n in ZZ)^() (e(- (m)/(c(c z + c n + d))))/(c(z + n) + d)^(k)
  $

  For fixed $c, d$, let our test function be $phi(x) = (1)/((c(z + x) + d)^(k)) e(- (m)/(c(c z + c x + d)))$. Note the following:

  + $c(z + x) + d != 0$ for all $x in RR$ because $Im(z) > 0$. Thus $phi in C^infinity (RR)$.
  + $phi in L^1(RR)$: This is because $abs(e(-m(#sym.dots.h))) <= 1$ and $k >= 4$.
  + $sum_(n in ZZ)^() phi(x + n)$ is locally absolutely convergent.
  + $phi prime(x) = -k c (c (z + x) + d)^(- k - 1) e(#sym.dots.h) + (c(z + x) + d)^(-k) (2 pi i m)/(c) (c z + c x + d)^(-2) e(#sym.dots.h)$. Thus $phi prime$ is locally absolutely convergent for a similarly reason to $phi$.

  By @PoissonSummationFormula in the Appendix,

  $ sum_(n in ZZ)^() (e(- (m)/(c(c z + c n + d))))/(c(z + n) + d)^(k) = sum_(h in ZZ)^() hat(phi)(h) $

  where,

  $
    hat(phi)(h) & = integral_(RR) (e(- (m)/(c(c z + c t + d))))/(c(z + t) + d)^(k) e(-h t) dif t \
    & = integral_(RR) (1)/(c(z + t) + d)^(k) e(- (m)/(c(c z + c t + d)) -h t) dif t \
    & = integral_(RR) (1)/(c(x + i y + t) + d)^(k) e(- (m)/(c(c x + i c y + c t + d)) -h t) dif t & (z = x + i y) \
    & = integral_(RR) (1)/(c(x + i y + t) + c(d)/(c))^(k) e(- (m)/(c(c x + i c y + c t + c(d)/(c))) -h t) dif t\
    & = integral_(RR) (1)/(c(x + i y + t + (d)/(c)))^(k) e(- (m)/(c^2( x + i y + t + (d)/(c))) -h t) dif t \
    & = integral_(RR) (1)/(c(u + i y))^(k) e(- (m)/(c^2(u + i y)) -h (u - x - (d)/(c))) dif u & (u = x + t + (d)/(c)) \
    &= e(h((d)/(c))) integral_(RR) (1)/(c(u + i y))^(k) e(- (m)/(c^2(u + i y)) -h(u - x)) dif u \
    &= e(h((d)/(c))) integral_(RR) (1)/(c(u + i y))^(k) e(- (m)/(c^2(u + i y)) -h(u - z + i y)) dif u \
    &= e(h(z + (d)/(c))) integral_(RR) (1)/(c(u + i y))^(k) e(- (m)/(c^2(u + i y)) -h(u + i y)) dif u \
    &= e(h(z + (d)/(c))) integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w
  $

  Thus,

  $
    sum_(n in ZZ)^() (e(- (m)/(c(c z + c n + d))))/(c(z + n) + d)^(k) = sum_(h in ZZ)^() e(h(z + (d)/(c))) integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w
  $

  Plugging in @rewritten_poissonsummation,

  $
    P_(m, k)(z) &= e(m z) + sum_(c >= 1)^() sum_(d in ZZ^(times )_(c))^() e((m a)/(c)) sum_(h in ZZ)^() e(h(z + (d)/(c))) integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w \
    &= e(m z) + sum_(c >= 1)^() sum_(d in ZZ^(times )_(c))^() sum_(h in ZZ)^() e((m a + h d)/(c)) (integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w) e(h z) \
    &= e(m z) + sum_(h in ZZ)^() sum_(c >= 1)^() sum_(d in ZZ^(times )_(c))^() e((m a + h d)/(c)) (integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w) e(h z) \
    &= e(m z) + sum_(h in ZZ)^() p_(k)(m, h) e(h z)
  $

  where,

  $
    p_(k)(m, h) &:= sum_(c >= 1)^() sum_(d in ZZ^(times )_(c))^() e((m a + h d)/(c)) (integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w) \
    &= sum_(c >= 1)^() (integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w) sum_(d in ZZ^(times )_(c))^() e((m a + h d)/(c)) \
  $

  Note that since $a d - b c = 1 => a d = 1 + b c => a d equiv 1 mod c => a equiv overline(d) mod c$. Thus,

  $
    sum_(d in ZZ^(times )_(c))^() e((m a + h d)/(c)) & = sum_(d in ZZ^(times )_(c))^() e((m overline(d) + h d)/(c)) = S(m,h; c)
  $

  Note $S(m, h; c) = S(h, m; c)$ substitute $d$ with $bar(d)$.

  Thus

  $ p_(k)(m, h) = sum_(c >= 1)^() (integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w) S(m, h; c) $

  Thus all that is left is to handle the complex integral. Let

  $ I_(k)(m, h; c) = integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w $

  + *$I_k (m, k; c)$ invariant under choice of $y$*:

    $
      I_k(m, k; c) = lim_(T -> infinity) integral_(-T)^(T) (1)/(c(x + i y))^(k) e(- (m)/(c^2(x + i y)) -h(x + i y)) dif x
    $

    $forall y prime > 0$, let $C_(y prime)$ be the box contour with $[-T + i y , T + i y]$ and $[T + i y prime, -T + i y prime]$ as top and bottom (flipped signs for orientation.) Since the integrand is holomorphic on the interior, by Cauchy's theorem:

    $ integral_(C_(y prime)) (1)/(c(x + i y))^(k) e(- (m)/(c^2(x + i y)) -h(x + i y)) dif x = 0 $

    Vertical segments suffices to just see 1 side:

    $
      abs(e(- (m)/(c^2(T + i u)) -h(T + i u))) & = abs(e(- (m)/(c^2(T + i u)))) abs(e(-h(T + i u))) \
                                               & = abs(e(- (m T - i u m)/(c^2abs(T + i u)^2 ))) abs(e(- i h u)) \
                                               & = abs(e((i u m )/(c^2 abs(T + i u)^2 ))) abs(e^(2 pi h u)) \
                                               & <= e^(2 pi h u)
    $

    Thus,

    $
      abs(integral_(y)^(y prime) (1)/(c(T + i u))^(k) e(- (m)/(c^2(T + i u)) -h(T + i u)) dif u) \ <= integral_(y)^(y prime) abs((1)/(c(T + i u))^(k) e(- (m)/(c^2(T + i u)) -h(T + i u))) dif u &<= integral_(y)^(y prime) (1)/(c^k abs(T + i u)^k ) e^(2 pi h u) d u ->_(T ->infinity) 0
    $

    The same with the opposite vertical. Thus

    $
      integral_(Im(w) = y) (c w)^(- k) e(- (m)/(c^2 w) -h w) dif x = integral_(Im(w) = y prime) (c w)^(- k) e(- (m)/(c^2 w) -h w) dif x
    $
  + *If $h <= 0$, then $I_(k)(m, h; c) = 0$*: Let $h >= 0$, then

    $
      abs(I_(k)(m, -h; c)) & <= integral_(RR) abs((1)/(c(t + i y))^(k) e(- (m)/(c^2(t + i y)) + h(t + i y))) dif w \
      & = integral_(RR) (c abs(t + i y) )^(-k) abs(e(- (m)/(c^2(t + i y)) + h(t + i y))) dif w \
      &=integral_(RR) (c abs(t + i y) )^(-k) abs(e((i m y - m x)/(c^2 abs(t + i y)^2 ) + h(t + i y))) dif w \
      &<= integral_(RR) (c abs(t + i y) )^(-k) abs(e((i m y)/(c^2 abs(t + i y)^2 ))) abs(e( h(t + i y))) dif w \
      &<= integral_(RR) (c abs(t + i y) )^(-k) abs(e( h i y)) dif \
      &= integral_(RR) (c abs(t + i y) )^(-k) e^(-h y) dif w
    $

    Since the integral is invariant under choice of height $y$, as $y -> infinity$ you get tighter and tighter bounds. Thus $I_(k)(m, -h; c) = 0$.

  Thus,

  $ P_(m, k)(z) & = e(m z) + sum_(h >= 1)^() p_(k)(m, h)e(h z) \ $

  *Consequences*: $P_(m, k)$ is holomorphic at $infinity$ for $m >= 0$. Furthermore, since

  $ abs(P_(m, k)(x + i y)) <= e^(- m y) + sum_(h >= 0)^() abs(p_(k)(m, h))abs(e(- h y)) $

  as $y -> infinity$ for $m >= 1$ $P_(m, k)(x + i y) -> 0$. Thus $P_(m, k) in S_(k)$.


  Continuing on,

  3. *Computing $I_(k)(m, h; c)$*:
    + $m = 0 "and" h >= 1$: Then

      $
        I(0, h; c) & = integral_(Im(w) = y) (c w)^(-k) e(-h w) dif w \
                   & = (1)/(h) integral_(Im(w) = y) ((c v)/(h))^(-k) e(-v) dif v \
                   & = c^(-k) h^(k - 1) integral_(Im(w) = y) v^(-k) e(-v) dif v \
                   & = (h^(k - 1) (2 pi)^k)/(c^k i^k Gamma(k))
      $<zeromforintegralofpoincareseries>

      The last equality comes from @gammaproperty1 in the Appendix.

    + $m >= 0 "and" h >= 1$ :

    Expand $e(-(m)/(c^2 w))$ in a power series:

    $ e(-(m)/(c^2 w)) & = sum_(l >= 0)^() (1)/(l!) ((-m)/(c^2 w))^(l) (2 i pi)^(l) $

    Thus,

    $
      I(m, h; c) & = integral_(Im(w) = y) (1)/(c w)^(k) e(- (m)/(c^2w) -h w) dif w \
      & = integral_(Im(w) = y) sum_(l >= 0)^() (1)/(l!) (1)/(c w)^(k) ((-m)/(c^2 w))^(l) (2 i pi)^(l) e(-h w) dif w \
      &= sum_(l >= 0)^() ((-2 i pi m)^(l))/(l!) integral_(Im(w) = y) (1)/(c^(k + 2 l) w^(k + l)) e(-h w) dif w \
      &= sum_(l >= 0)^() ((-2 i pi m)^(l) h^(k + l - 1))/(c^(k + 2 l) l! ) ((2 pi)^(k + l))/(i^(k + l)) (1)/(Gamma(k + l)) \
      &= sum_(l >= 0)^() ((-1)^(l))/(l!) ((2 pi)/(c))^(k + 2l) (h^(k + l - 1) m^l)/(i^k) (1)/(Gamma(k - 1 + l + 1)) \
      &= sum_(l >= 0)^() ((-1)^(l))/(l!) ((4 pi)/(2 c))^(k + 2l) (h^(k + l - 1) m^l)/(i^k) (1)/Gamma(k - 1 + l + 1) \
      &= (2pi)/(c i^k) sum_(l >= 0)^() ((-1)^(l))/(l!) ((4 pi)/(2 c))^(k + 2l - 1) h^((k + 2 l - 1)/(2) + (k - 1)/(2)) m^((k + 2 l - 1)/(2) - (k - 1)/(2)) (1)/Gamma(k - 1 + l + 1) \
      &= (2pi)/(c i^k) sum_(l >= 0)^() ((-1)^(l))/(l!) ((4 pi sqrt(h m) )/(2 c))^(k + 2l - 1) h^((k - 1)/(2)) m^(- (k - 1)/(2)) (1)/Gamma(k - 1 + l + 1) \
      &= (2pi)/(c i^k) sum_(l >= 0)^() ((-1)^(l))/(l!) ((4 pi sqrt(h m) )/(2 c))^(k + 2l - 1) ((h)/(m))^((k - 1)/(2)) (1)/Gamma(k - 1 + l + 1) \
    $

  Restructure the sum a bit.

  $
    I(m, h; c) &= (2pi)/(c i^k) ((h)/(m))^((k - 1)/(2)) sum_(l >= 0)^() ((-1)^(l))/(l!) ((4 pi sqrt(h m) )/(2c))^((k - 1) + 2l) (1)/Gamma((k - 1) + l + 1) \
    &= (2pi)/(c i^k) ((h)/(m))^((k - 1)/(2)) J_(k - 1)((4 pi sqrt(h m) )/(c))
  $

  By the definition $ J_(nu)(xi) = sum_(l >= 0)^() ((-1)^(l))/(l! Gamma(nu + 1 - l)) ((xi)/(2))^(nu + 2 l) $

  of the Bessel Function.

  *Conclusion*:

  $
    p_(k)(m, h) := cases(
      (h^(k - 1) (2 pi)^k)/(i^k Gamma(k)) sum_(c >= 1)^() (1)/(c^k) S(m, h; c) "if" m = 0,
      ((h)/(m))^((k - 1)/(2)) (2 pi)/(i^k) sum_(c >= 1)^() (1)/(c) S(m, h; c) J_(k - 1)((4 pi sqrt(h m) )/(c))
    )
  $

  1. Eisenstein Series (ie $m = 0$):

  $
    E_(k)(z) & = 1 + sum_(h >= 1)^() p_(k)(0, h) e(h z) \
             & = (2 pi)^k/(i^k Gamma(k)) sum_( h >= 0)^() (sum_(c >= 1)^() (h^(k - 1))/(c^k) S(0, h; c)) e(h z) \
             & = (2 pi)^k/(i^k (k - 1)!) sum_( h >= 0)^() (h^(k - 1) sum_(c >= 1)^() (1)/(c^k) S(0, h; c)) e(h z)
  $<partiallysimplifiedeisensteinfourier>

  2. $m >= 1$:

  $
    P_(m, k)(z) & = e(m z) + sum_(h >= 1)^() p_(k)(m, h)e(h z) \
                & = sum_(h >= 1)^() (p_(k)(m, h) + delta(m, h)) e(h z)
  $
]

#theorem[
  Let $k >= 4$ be an integer. The fourier expansion of $E_(k)$, the weight k Eisenstein Series, is

  $ E_(k)(z) = 1 + (2 i pi)^(k)/(zeta(k)(k - 1)!) sum_(n >= 1)^() sigma_(k - 1)(n) e(n z) $

  where $sigma_(k - 1)(n) = sum_(d | n)^() d^(k - 1)$
]
#proof[
  Carrying on from @PoincareSeriesFourierExpansion, we need to understand $S(0, h; c)$.

  By Mobius Inversion,
  $
    sum_(d in ZZ_(c))^() e((n d)/(c)) & = sum_(delta | c)^() sum_(d in ZZ_(c)\ (d, c) = delta)^() e((n d)/(c)) \
    & = sum_(delta divides c)^() sum_(delta d prime in ZZ_(c) \ (delta d prime, c) = delta)^() e((n delta d prime)/(c)) \
    &= sum_(delta divides c)^() sum_(d prime in ZZ_(c slash delta) \ (d prime, c slash delta) = 1)^() e((n d prime)/((c)/(delta))) \
    &= sum_(delta divides c)^() S(0, n; (c)/(delta))
  $

  but also $ sum_(d in ZZ_(c))^() e((n d)/(c)) = cases(
    c "if" c divides n,
    0 "otherwise"
  ) $

  thus

  $
    sum_(delta divides c)^() S(0, n; (c)/(delta)) & = c bb(1)_(c divides n)
  $


  By Mobius Inversion,

  $
    S(0, n; c) & = sum_(d divides c)^() ((c)/(d)) mu(d) bb(1)_((c)/(d) divides n) \
               & = sum_(delta divides c)^() delta mu((c)/(delta)) bb(1)_(delta divides n) \
               & = sum_(delta divides (c, n))^() delta mu((c)/(delta))
  $

  Thus, for $h >= 0$

  $
    h^(k - 1) sum_(c >= 1)^() (1)/(c^k) S(0, h; c) &= h^(k - 1) sum_(c >= 1)^() (1)/(c^k) sum_(d divides (c, h))^() d mu((c)/(d)) \
    &= h^(k - 1) sum_(d divides h)^() d sum_(c >= 1 \ d | c)^() mu((c)/(d)) c^(-k) \
    &= h^(k - 1) sum_(d divides h)^() d sum_(alpha >= 1)^() mu(alpha) (alpha d)^(-k) \
    &= h^(k - 1) sum_(d divides h)^() d^(-(k - 1)) sum_(alpha >= 1)^() mu(alpha) alpha^(-k)\
    &= (1)/(zeta(k)) sum_(d divides h)^() ((h)/(d))^(k - 1) \
    &= (1)/(zeta(k)) sum_(delta divides h)^() delta^(k - 1) \
    &= (sigma_(k - 1)(h))/(zeta(k))
  $

  Thus plugging this into @partiallysimplifiedeisensteinfourier, we get

  $
    E_(k)(z) & = 1 + (2 pi)^k/(i^k (k - 1)!) sum_( h >= 1)^() (sigma_(k - 1)(h))/(zeta(k)) e(h z) \
             & = 1 + (2 pi)^k/(i^k (k - 1)! zeta(k)) sum_(n >= 1)^() sigma_(k-1)(n) e(n z)
  $
]

#pagebreak()
== Petersson Formula
#lemma[
  For $f in S_(k)$, the integral

  $ abs(integral_(D_(F)) abs(f(z))^2 y^k (dif x dif y)/(y^2)) < infinity $

  where $D_(F)$, is the @FundamentalDomain[Fundamental Domain (Equation]).
]
#proof[
  Since $f in S_(k)$, there is a fourier expansion
  $ f(z) = sum_(n >= 1)^() a_(n) e(n z) $. We can get a bound on $abs(f(z))$ as $z -> infinity$:
  $
    abs(f(z)) & <= sum_(n >= 1)^() abs(a_(n)) abs(e(n z)) \
              & = sum_(n >= 1)^() abs(a_(n)) e^(- 2 pi n y) \
              & = e^(- 2pi y) (abs(a_(1)) + sum_(n>=2)^() abs(a_(n)) e^(- 2pi (n - 1) y) )
  $

  As $y -> infinity$, each term of the series gets smaller exponentially. In fact $y -> infinity$, $sum_(n>=2)^() abs(a_(n)) e^(- 2pi (n - 1) y) -> 0$ (you can get this because $f(z) -> 0$). Let $y_(0) > 0$ such that $forall y > y_(0)$, $sum_(n>=2)^() abs(a_(n)) e^(- 2pi (n - 1) y) < abs(a_(1))$. Thus $forall y > y_(0)$,

  $ abs(f(z)) & <= e^(- 2pi y)(abs((a_(1)) + abs(a_(1))) = 2 abs(a_(1)) e^(-2 pi y) $

  Thus the function $(x, y) -> abs(f(x + i y))^2 y^(k - 2)$ is Lebesgue integrable.
]

#definition[
  The Petersson Inner Product on $S_(k)$ is defined by $ lr(angle.l f, g angle.r) = integral_(D_(F)) f(z) overline(g(z)) y^k (dif x dif y)/(y^2) $
]<peterssoninnerproduct>

This makes $S_(k)$ a (finite dimensional) *Hilbert Space*, since $lr(angle.l f, f angle.r) = 0 => f = 0$ on $D_(F)$, thus $f = 0$.

#theorem[
  For $k >= 4$, $m >= 1$ and $forall f in S_(k)$ we have

  $ lr(angle.l f, P_(m, k) angle.r) = (Gamma(k - 1))/((4 pi m)^(k - 1))a_(m)(f) $

  where

  $ f(z) = sum_(n >= 1)^() a_(n)(f) e(n z) $

  is the Fourier expansion of $f$.
]<PoincareSeriesPeterrsonInnerProduct>
#proof[
  $
    lr(angle.l f, P_(m, k) angle.r) & = integral_(D_(F))f(z) overline(P_(m, k)) y^k (dif x dif y)/(y^2) \
    & = integral_(D_(F))f(z) (sum_(g in overline(T) backslash SL(ZZ))^() overline(j_(k)(g, z)) overline(e(m g z))) y^k (dif x dif y)/(y^2) \
    &= integral_(D_(F)) (sum_(g in overline(T) backslash SL(ZZ))^() j_(k)(g, z) f(g z) overline(j_(k)(g, z)) overline(e(m g z))) y^k (dif x dif y)/(y^2) & (f(g z) = j_(-k)(g, z) f(z)) \
    &= integral_(D_(F)) (sum_(g in overline(T) backslash SL(ZZ))^() abs(j_(k)(g, z))^2 f(g z) overline(e(m g z))) y^k (dif x dif y)/(y^2) \
    &= integral_(D_(F)) (sum_(g in overline(T) backslash SL(ZZ))^() f(g z) overline(e(m g z))) Im(g z)^k (dif x dif y)/(y^2) & (Im(g z) = y abs(j_(1)(g, z))^2 ) \
    &= sum_(g in overline(T)backslash SL(ZZ))^() integral_(D_(F)) f(g z) overline(e(m g z)) Im(g z)^k (dif x dif y)/(y^2)\
    &= sum_(g in overline(T)backslash SL(ZZ))^() integral_(g D_(F)) f(omega) overline(e(m omega)) Im(omega)^k (dif u dif v)/(v^2) & ("Invariance of hyperbolic measure")\
    &= integral_(union_(g in overline(T) backslash SL(ZZ)) g D_(f)) f(omega) overline(e(m omega)) v^k (dif u dif v)/(v^2)\
  $

  $union.big_(g in overline(T) backslash SL(ZZ)) g D_(F)$ is the fundamental domain of the action of $overline(N)$ on $HH$. Since $overline(T)$ is translations,

  $ union.big_(g in overline(T) backslash SL(ZZ)) g D_(F) = {z in HH mid(|) abs(Re(z)) <= (1)/(2) } $

  Thus,

  $
    lr(angle.l f, P_(m, k) angle.r) &= integral_(-(1)/(2))^((1)/(2)) integral_(0)^(infinity) f(u + i v) overline(e(m (u + i v))) v^k (dif u dif v)/(v^2)\
    &= integral_(0)^(infinity) v^(k - 2) integral_(-(1)/(2))^((1)/(2)) f(u + i v) overline(e(m (u + i v))) d u d v \
    &= integral_(0)^(infinity) v^(k - 2) e^(- 2 pi m v) integral_(-(1)/(2))^((1)/(2)) f(u + i v) e(- m u) d u d v \
    &= integral_(0)^(infinity) v^(k - 2) e^(- 2 pi m v) integral_(-(1)/(2))^((1)/(2)) sum_(n >= 1)^() a_(n) e(n (u + i v)) e(- m u) d u d v \
    &= integral_(0)^(infinity) sum_(n >= 1)^() a_(n) v^(k - 2) e^(- 2 pi (m + n) v) integral_(-(1)/(2))^((1)/(2)) e((n - m) u) d u d v \
    &= integral_(0)^(infinity) sum_(n >= 1)^() a_(n) v^(k - 2) e^(- 2 pi (m + n) v) delta(n, m) d v \
    &= a_(m) integral_(0)^(infinity) v^(k - 2) e^(- 4 m pi v) d v \
    &= a_(m) integral_(0)^(infinity) ((u)/(4 m pi))^(k - 2) e^(- u) (1)/(4 pi m) d u \
    &= (a_(m))/(4 pi m)^(k - 1) integral_(0)^(infinity) u^(k - 1) e^(- u) (dif u)/(u) \
    &= (a_(m) Gamma(k - 1))/(4 pi m)^(k - 1)
  $
]

#corollary[
  The Poincare Series $P_(m, k)$ for $m >= 1$ generate $S_(k)$ as a $CC-$ vector space.
]
#proof[
  Suppose $f in S_(k)$ is orthogonal to all $P_(m, k)$ for $m >= 1$. Then by @PoincareSeriesPeterrsonInnerProduct, we get $a_(m)(f) = 0$ for all $m >= 1$. So the space generated by ${P_(m, k) mid(|) m >= 1}$ must be $S_(k)$.
]

#corollary(name: "Petersson Formula")[
  Let $k >= 4$. Let $cal(F)$ be a orthonormal basis of $S_(k)$. Then for $m >= 1$ and $n >= 1$:

  $
    (Gamma(k - 1))/(4 pi sqrt(m n) )^(k - 1) sum_(f in cal(F))^() a_(f)(m) overline(a_(f)(n)) &= delta(m, n) + (2 pi)/(i^k) sum_(c >= 1)^() (1)/(c) S(m, n; c) J_(k - 1)((4 pi sqrt(m n) )/(c))
  $
]
#proof[Expand $P_(m, k)$ in terms of the basis $cal(F)$. Thus by orthonormality of $cal(F)$:

  $
    P_(m, k) & = sum_(f in cal(F))^() lr(angle.l P_(m, k), f angle.r) f \
             & =sum_(f in cal(F))^() overline(lr(angle.l f, P_(m, k) angle.r)) f \
             & = (Gamma(k - 1))/((4 pi m)^(k - 1)) sum_(f in cal(F))^() overline(a_(f)(m)) f
  $
  where @PoincareSeriesPeterrsonInnerProduct gives the last equality. Continuing:

  $
    P_(m, k)(z) & = (Gamma(k - 1))/((4 pi m)^(k - 1)) sum_(f in cal(F))^() overline(a_(f)(m)) sum_(n >= 1)^() a_(f)(n) e(n z) \
    &= sum_(n >= 1)^() ((Gamma(k - 1))/((4 pi m)^(k - 1)) sum_(f in cal(F))^() a_(f)(n) overline(a_(f)(m)) ) e(n z)
  $

  Thus $a_(P_(m, k))(n) = sum_(f in cal(F))^() a_(f)(n) overline(a_(f)(m)) )$. By @PoincareSeriesFourierExpansion,

  $
    (Gamma(k - 1))/((4 pi m)^(k - 1)) sum_(f in cal(F))^() a_(f)(n) overline(a_(f)(m)) &= delta(m, n) + (2 pi)/(i^k) sum_(c >= 1)^() (1)/(c) S(m, n; c) J_(k - 1)((4 pi sqrt(m n) )/(c))
  $
]

= L Functions and Hecke Operators
== L Functions and Hecke $Lambda$ Function.
#definition[
  *$ Gamma(q) = {mat(a, b; c, d) in SL(ZZ) mid(|) mat(a, b; c, d) equiv mat(1, 0; 0, 1) mod q} <= SL(ZZ) $* has index equal to $abs(SL(ZZ_(q)))$ and *$ Gamma_(0)(q) = {mat(a, b; c, d) in SL(ZZ) mid(|) q divides c } $*. Note $SL(ZZ) = Gamma_(0)(1)$.
]
#definition[
  $M_(k)(q, chi)$, where $q in NN$ and $chi: Gamma_(0)(q) -> CC$, is the space of functions $f: HH -> CC$ such that $forall g in Gamma_0(q)$

  $ f(g z) & = chi(g) j_(k)(g, z) f(z) $

  $S_(k)(q, chi)$ is the corresponding space of cusp forms. For brevity, $S_(k) = S_(k)(1, 1)$ and $S_(k)(q) = S_(k)(q, 1)$.
]

Until otherwise specified, let $tilde(chi)$ be Dirichlet character mod q. Then $chi: Gamma_(0)(q) -> CC$ is defined as follows $mat(a, b; c, d) -> tilde(chi)(d)$.

#definition[
  For $s in CC$ such that integral makes sense, define *Hecke $Lambda$-Function*

  $ Lambda(f, s) := integral_(0)^(infinity) f(i y) y^s (dif y)/(y) $
]

#proposition[
  For $f in S_(k)$, let $(a_(n))_(n >= 1)$ be its Fourier expansion at $infinity$. Then for $Re(s) > k + 1$

  $ Lambda(f, s) := (2 pi)^(-s) Gamma(s) sum_(n >= 1)^() a_(n) n^(-s) $
]
#proof[
  $
    Lambda(f, s) & := integral_(0)^(infinity) f(i y) y^s (dif y)/(y) \
                 & = integral_(0)^(infinity) sum_(n >= 1)^() a_(n) e^(- 2 pi n y) y^s (dif y)/(y) \
  $

  We have to justify the swap of integral and sum,

  $
    integral_(0)^(infinity) abs(sum_(n >= 1)^() a_(n) e^(- 2 pi n y)) y^(s - 1) dif y &= integral_(0)^(infinity) sum_(n >= 1)^() abs(a_(n)) e^(- 2 pi n y) y^(Re(s) - 1) dif y\
    &= sum_(n >= 1)^() integral_(0)^(infinity) abs(a_(n)) e^(- 2 pi n y) y^(Re(s) - 1) dif y & "(By Tonellis Theorem)" \
    &= sum_(n >= 1)^() abs(a_(n)) integral_(0)^(infinity) e^(-2 pi n y) y^(Re(s) - 1) dif y \
    &= sum_(n >= 1)^() abs(a_(n)) integral_(0)^(infinity) e^(-2 pi n y) y^(Re(s) - 1) dif y \
    & = sum_(n >= 1)^() abs(a_(n))/(2 pi n) integral_(0)^(infinity) e^(-u) ((u)/(2 pi n))^(Re(s) - 1) dif y \
    & = sum_(n >= 1)^() abs(a_(n))/((2 pi n)^(Re(s))) integral_(0)^(infinity) e^(-u) u^(Re(s) - 1) dif y \
    & = (-2 pi)^(Re(s)) Gamma(Re(s)) sum_(n >= 1)^() abs(a_(n)) n^(-Re(s)) \
  $

  By @LfunctionHolomorphic, $sum_(n >= 1)^() abs(a_(n)) n^(-Re(s))$ converges if $Re(s) > (k)/(2) + 1$. Thus by Fubini's theorem, the interchange of integral and sum is allowed if $Re(s) > (k)/(2) + 1$.

  $
    Lambda(f, s) & = sum_(n >= 1)^() a_(n) integral_(0)^(infinity) e^(-2 pi n y) y^s (d y)/(y) \
                 & = sum_(n >= 1)^() a_(n) ((1)/(2 pi n)) integral_(0)^(infinity) e^(- u) ((u)/(2 pi n))^(s - 1) d u \
                 & = (2 pi)^(-s) (integral_(0)^(infinity) e^(- u) u^(s - 1) d u ) sum_(n >= 1)^() a_(n) n^(-s) \
                 & = (2 pi)^(-s) Gamma(s) sum_(n >= 1)^() a_(n) n^(-s) \
  $
]

Thus the Hecke $Lambda$-Function is the Dirichlet generating series of the Fourier coefficents of $f in S_(k)$.

#proposition[
  $forall f in S_(k)$,

  $ Lambda(f, s) & = i^k Lambda(f, k - s) $
]
#proof[
  Recall that,

  $ f(-(1)/(z)) = z^k f(z) => f(z) = (f(-(1)/(z)))/(z^k) $

  Furthermore note, that $- (1)/(i y) = (i)/(y)$. Thus,

  $
    Lambda(f, s) & = integral_(0)^(infinity) f(i y) y^s (dif y)/(y) \
                 & = integral_(0)^(infinity) f(-(1)/(i y)) (i y)^(- k) y^s (dif y)/(y) \
                 & = i^k integral_(0)^(infinity) f((i)/(y)) y^(k - s) (dif y)/(y) \
  $

  Let $u = (1)/(y) => dif u = -(1)/(y^2) dif y => - (1)/(u) dif u = - y dif u = (1)/(y) dif y$. Thus,

  $ Lambda(f, s) & = i^k integral_(0)^(infinity) f(i u) y^(k - s) (dif u)/(u) = i^k Lambda(f, k - s) $
]

Thus there is a functional equation between $Lambda(f, s)$ and $Lambda(f, k - s)$ for $f in S_(k)$. We expect something similar for general $f$.

#definition[
  For $s$ such that $Re(s)$ large enough that the sum converges, one defines

  $ L(f, s) := sum_(n >= 1)^() a_(n) n^(-s) $

  which is called the *Hecke L-Function* of $f$
]

#lemma[
  For $f in S_(k)(q, chi)$ then the function $z -> (Im(z))^((k)/(2)) abs(f(z))$ is bounded on $HH$.
]<boundingcuspform>
#proof[
  For all cusps $c$, $abs(f(z)) -> 0$ as $z -> c$ exponentially fast. Furthermore $g(z) = (Im(z))^((k)/(2)) abs(f(z))$. Then $forall gamma in Gamma_(0)(q)$,

  $
    g(gamma z) & = (Im(g z))^((k)/(2)) abs(f(gamma z)) \
               & = (Im(z)abs(j_(1)(g, z))^2)^((k)/(2)) abs(j_(-k)(g, z) f(z)) \
               & = Im(z) abs(f(z))
  $

  Thus $g$ is $Gamma_(0)(q, chi)$.
]

#lemma[
  Let $f in S_(k)(q, chi)$ and $(a_(n))_(n >= 0)$ is its fourier coefficents at $infinity$. We have

  $ sum_(n <= X)^() abs(a_(n))^2 << X^k $

  where the implied constant depends on $f$.
]
#proof[

  $
    f(x + i y) & = sum_(n >= 0)^() a_(n) e(n(x + i y)) \
               & = a_(0) + sum_(n >= 1)^() a_(n) e(n x) e^(-2 pi y)
  $

  Thus $ abs(f(x + i y))^2 <= abs(a_(0))^2 + sum_(n >= 1)^() abs(a_(n))^2 e^(-4 pi y) $

  Thus $forall y >= 0$,  $ integral_(0)^(1) abs(f(x + i y))^2 dif x &<= integral_(0)^1[abs(a_(0))^2 + sum_(n >= 1)^() abs(a_(n))^2 e^(-4 pi y)] dif x &= abs(a_(0))^2 + sum_(n >= 1)^() abs(a_(n))^2 e^(-4 pi y) < infinity $

  Thus $f(x + i y) in L^2(S^1)$. By Parseval's Identity,

  $ sum_(n >= 0)^() abs(a_(n))^2 e^(-4 pi n y) = integral_(0)^(1) abs(f(x + i y))^2 dif x $

  Let $y = (1)/(X)$.

  $
    sum_(0 <= n <= X)^() abs(a_(n))^2 e^(-4 pi n slash X) <= sum_(n >= 0)^() abs(a_(n))^2 e^(-4 pi n slash X) = integral_(0)^(1) abs(f(t + (i)/(X)))^2 dif t
  $

  Note $e^(-4 pi ) <= e^(-4 pi n X)$ for all $n in {0, #sym.dots.h, X}$. Thus

  $
    sum_(0 <= n <= X)^() abs(a_(n))^2 e^(- 4 pi) <= integral_(0)^(1) abs(f(t + (i)/(X)))^2 dif t
  $

  Thus,

  $ sum_(0 <= n <= X)^() abs(a_(n))^2 & <= e^(4 pi) integral_(0)^(1) abs(f(t + (i)/(X)))^2 dif t $

  By @boundingcuspform, $exists C_(f)$ such that $Im(z)^((k)/(2))abs(f(z)) <= C_(f) => abs(f(z)) <= C_(f) Im(z)^(-(k)/(2))$.

  Thus,

  $ sum_(n = 0)^(X) abs(a_(n))^2 & <= e^(4pi)integral_(0)^1 C_(f) Im(t + (i)/(X))^(-k) dif t = e^(4pi) C_(f)X^k \ $

  Thus $sum_(n = 0)^(X) abs(a_(n))^2 << X^k$
]

#theorem[
  Let $f in S_(k)(q, chi)$ and let $f(z) = sum_(n >= 1)^() a_(n) e(n z)$ be its Fourier expansion at $infinity$. Then $(a_(n))_(n >= 0)$ has polynomial growth.
]<polynomialgrowthoffouriercoefficients>
#proof[
  $forall y in (0, infinity)$,
  $
    a_(n) & = integral_(0)^1 f(x + i y) e(n(x + i y)) dif x \
          & = e^(2 pi n y) integral_(0)^(1) f(x + i y) e(n x) dif x
  $

  Thus,

  $ abs(a_(n)) <= e^(2 pi n y) integral_(0)^1 abs(f(x + i y)) d x $

  By @boundingcuspform, $exists C_(f) in.rev Im(z)^(k/2) abs(f(z)) <= C_(f)$. Thus

  $
    abs(a_n) & <= e^(2 pi n y) integral_0^1 C_f Im(x + i y)^(-k/2) dif y \
             & = C_(f) e^(2 pi n y) y^(-(k)/(2))
  $

  Take $y = (1)/(n)$. Then

  $ abs(a_(n)) <= C_(f)e^(2 pi)n^((k)/(2)) $.

  Thus $abs(a_(n)) = O(n^((k)/(2)))$.

]

#corollary[The Hecke L-Function is holomorphic for $Re(s) > (k)/(2) + 1$  ]<LfunctionHolomorphic>
#proof[
  Recall the Hecke L Function is given by:
  $ L(f, s) := sum_(n >= 1)^() a_(n) n^(-s). $ By @polynomialgrowthoffouriercoefficients, $exists C_(f)in.rev abs(a_(n)) <= C_(f)n^((k)/(2))$ thus

  $ sum_(n >= 1)^() abs(a_(n))n^(-s) <= sum_(n >= 1)^() C_(f)n^((k)/(2) - s) = C_(f) sum_(n = 1)^(infinity) n^((k)/(2) - s ) $ which converges if $(k)/(2) - Re(s) < -1 => Re(s) > (k)/(2) + 1$. Thus $L(f, s)$ converges absolutely for $Re(s) > (k)/(2) + 1$ so it converges locally uniformly (by the Weierstrass M Test). As $L(f, s)$ is a series of holomorphic functions that locally uniformly converges, it is a holomorphic function.
]

#lemma[
  $ mat(0, -1; q, 0)^(-1) Gamma_(0)(q) mat(0, -1; q, 0) = Gamma_(0)(q) $ and $chi$ is mapped to $overline(chi)$ by $ overline(chi)(g) = chi(mat(0, -1; q, 0)^(-1) g mat(0, -1; q, 0)) $
]<heckelemma1gammaq>
#proof[
  Let $mat(a, b; q c, d) in Gamma_(0)(q)$ where $ mat(0, (1)/(q); -1, 0) mat(a, b; q c, d) mat(0, -1; q, 0) & = mat(0, (1)/(q); -1, 0) mat(b q, -a; q d, -q c) \
                                                            & = mat(d, -c; -b q, a) in Gamma_(0)(q) $.

  $
    chi(mat(0, (1)/(q); -1, 0) mat(a, b; q c, d) mat(0, -1; q, 0)) & = chi(mat(d, -c; -b q, a)) \
    & = chi(a) = chi(a^(-1)) = overline(chi)(d) = overline(chi)(mat(a, b; q c, d))
  $
]

#definition[Let $f in S_(k)$, $forall g in GL(QQ)$ then $(f|_(g))(z) = (det(g))^((k)/(2)) j_(k)(g, z) f(g z)$  ]<ModularityForGL>

#theorem(name: "Hecke's Theorem")[
  Let $f in S_(k)(q, chi)$. Then $Lambda(f, s)$ and $L(f, s)$ have analytic continuation to $CC$. More precisely the function $ tilde(f)(z) = (f|_(k)mat(0, -1; q, 0))(z) $ is in $S(q, overline(chi))$ and for all $s in CC$, we have $ q^((1)/(2)) Lambda(f, s) = i^k Lambda(tilde(f), k - s) q^((k - s)/(2)) $
]
#proof[$forall g in Gamma_(0)(q)$, $ tilde(f)|_(k) g & = f|_(k) mat(0, -1; q, 0) |_(k) g \
                  & = f|_(k) mat(0, -1; q, 0) g $
  By @heckelemma1gammaq, $exists g prime in Gamma_(0)(q)$ such that $mat(0, -1; q, 0) g = g prime mat(0, -1; q, 0)$. Thus $ f|_(k) g prime mat(0, -1; q, 0) & = f |_(k) g prime |_(k) mat(0, -1; q, 0) \
                                  & = overline(chi)(d) f |_(k) mat(0, -1; q, 0) \
                                  & = overline(chi)(d) tilde(f) $ Thus $f in Gamma_(0)(q, overline(chi)).$ To show analytic continuation, we will start with the definition of $Lambda(f, s)$. $ Lambda(f, s) = integral_(0)^(infinity)f(i y) y^(s) (dif y)/(y). $

  Lets split the integral $(1)/(sqrt(q))$. Thus $ Lambda(f, s) &= integral_(0)^((1)/(sqrt(q) )) f(i y) y^(s) (dif y)/(y) + integral_((1)/(sqrt(q) ))^(infinity) f(i y) y^(s) (dif y)/(y) \. $ Lets start the first part of the integral. Let $u = (1)/(q y)$, then $dif u = -(1)/(q y^2) dif y$. Thus $(dif y)/(y) = - q y dif u= -(dif u)/(u)$. Thus $ integral_(0)^((1)/(sqrt(q) )) f(i y) y^s (dif y)/(y) & = - integral_(infinity)^((1)/(sqrt(q)) ) f((i)/(q u)) (q u)^(-s) (dif u)/(u) \
  &= integral_((1)/(sqrt(q) ))^(infinity ) f((i)/(q u)) (q u)^(-s) (dif u)/(u) \ $

  Lets use @ModularityForGL (Modularity for $GL(ZZ)$):
  $
    f((i)/(q u)) & = f(-(1)/(q u i)) \
                 & = f(mat(0, -1; q, 0) dot i u) \
                 & = q^(-(k)/(2)) (q i u)^k tilde(f)(i u) \
                 & = q^((k)/(2)) (i u)^k tilde(f)(i u)
  $

  Thus,
  $ integral_(0)^((1)/(sqrt(q) )) f(i y) y^s (dif y)/(y) &= integral_((1)/(sqrt(q) ))^(infinity) q^((k)/(2)) (i u)^k tilde(f)(i u) (q u)^(-s) (dif u)/(u) \
  &= i^k q^((k)/(2) - s)integral_((1)/(sqrt(q) ))^(infinity) tilde(f)(i u) u^(k - s) (dif u)/(u). \ $ Thus, $ Lambda(f, s) & = integral_((1)/(sqrt(q) ))^(infinity) [ i^k q^((k)/(2) - s) tilde(f)(i y) y^(k - s) + f(i y) y^s ] (dif y)/(y). $ Let's do the same thing with $Lambda(tilde(f), s)$ (we can do this because $tilde(f)$ is also a cusp form, and the integral exists for all $s in CC$ and defines a entire function). Thus $ Lambda(tilde(f), s) = integral_((1)/(sqrt(q) ))^(infinity) [ i^k q^((k)/(2) - s) tilde(tilde(f))(i y) y^(k - s) + tilde(f)(i y) y^s ] (dif y)/(y). $ We want to get some equality between $Lambda(f, s)$ and $Lambda(tilde(f), s)$. Lets use the relation between, $f$ and $tilde(f)$. $ tilde(tilde(f))(z) = (f|_(k) mat(0, -1; q, 0)^2)(z) = (f|_(q) mat(-q, 0; 0, -q)) = q^k (-q)^(-k) f(z) = (-1)^k f(z). $

  Thus $ Lambda(tilde(f), s) = integral_((1)/(sqrt(q) ))^(infinity) [ (-i)^k q^((k)/(2) - s) f(i y) y^(k - s) + tilde(f)(i y) y^s ] (dif y)/(y). $

  After some algebra we see, $q^((1)/(2)) Lambda(f, s) = i^k q^((k - s)/(2)) Lambda(tilde(f), k - s)$


]

The relationship between $s <-> k- s$ suggests that $Re(s) = (k)/(2)$ has critical behavior. We call the line the "critical line". Quite often we have $tilde(f) = f$.

#example[Although $E_(k)$ isn't a cusp form, we can define a analogous Hecke $Lambda$ function and $L$ function in the same way. Where $L(E_(k), s) := sum_(n >= 1)^() a_(n) n^(-s)$, thus you skip $a_(0)$.  Up to a constant multiple $a_(n) approx sigma_(k - 1)(n).$ Thus $ L(E_(k), s) & approx sum_(n >= 1)^() sigma_(k - 1)(n) n^(-s) \
              & = sum_(n >= 1)^() sum_(d divides n)^() d^(k - 1) n^(-s) \
              & = (sum_(n >= 1)^()(1)/(n^(-s)))(sum_(n >= 1)^()(1)/(n^(s - k - 1))) \
              & = zeta(s) zeta(s - k - 1) $ Thus the function has a Euler Product thus reflecting multiplicativity.
]
== Hecke Operator
#lemma[Let $n >= 1$ be a. Let $Delta_(n) := {mat(a, b; 0, d) mid(|) a d = n, 0 <= b < d}$. Then $Delta_(n)$ parametrizes the $SL(ZZ)$ orbits of the subset $ G_(n) = {g in M_(2)(ZZ) mid(|) det(g) = n} $ for $SL(ZZ)$ by left multiplication. There is a disjoint union $ G_(n) = union.sq.big_(g in Delta_(n)) SL(ZZ)g $       ]
#proof[
  Let $gamma_(1), gamma_2 in SL(ZZ)$ and $g_1, g_2 in Gamma_(n)$. Suppose $gamma_(1) g_(1) = gamma_(2) g_(2)$. Let $gamma = mat(q, r; s, t) = gamma_(2)^(-1) gamma_(1) in SL(ZZ)$. $gamma g_(1) = g_2$. Thus $ mat(q a_(1), q b_(1) + r d_1; s a_1, s b_1 + t d_1)= mat(q, r; s, t) mat(a_1, b_1; 0, d_1) = mat(a_(2), b_(2); 0, d_2). $ Thus $a_(2) = s a_(1) => s = 0$ (contradiction if $a_(1) = 0$). Thus $mat(q, r; 0, t) in SL(ZZ) => q, t = plus.minus 1$. Thus $plus.minus d_(1) = t d_1 = s b_1 + t d_1 = d_2$ and $plus.minus a_(1) = q a_(1) = a_(2)$. But by assumption $d_(2) >= 0$ and $a_2 >= 0$. Thus $q, t = 1$.
  Thus $ mat(a_(1), b_(1) + r d_1; 0, d_1) = mat(a_(2), b_(2); 0, d_2) $. Since $0 <= b_(1), b_(2) < d_(1) => r = 0$. Thus $gamma = I$.Thus $gamma_(1) = gamma_2$ and $g_(1) = g_2$. Thus the union is disjoint.

  $forall mat(a, b; c, d) in G_(n)$. Let $gamma = (c)/((a, c))$ and $delta = -(a)/((a, c)).$ $(gamma, delta) = 1 => exists alpha, beta in ZZ in.rev alpha delta + beta gamma = 1.$ Thus $mat(alpha, -beta; gamma, delta) in SL(ZZ).$ $ mat(alpha, -beta; gamma, delta) mat(a, b; c, d) & = mat(alpha a - beta c, alpha b - beta d; 0, (c b - a d)/((a, c))) \
  & = mat((a, c), alpha b - beta d; 0, (n)/((a, c))) = mat(a_1, b_1; 0, d_1) $ where $a_1 d_1 = n$ and up to multiplying $-1$ we have that $a_1, d_1 >= 1$. Exists $u in ZZ$ such that $b_1 + u d_1 = b_1 mod d_1$. Thus $ mat(1, u; 0, 1)mat(alpha, -beta; gamma, delta) mat(a, b; c, d) = mat(1, u; 0, 1)mat(a_1, b_1; 0, d_1) = mat(a_1, b_1 mod d_1; 0, d_1) in Delta_(n) $

  Thus $mat(a, b; c, d) in SL(ZZ) Delta_(n)$
]
#definition[
  Fix $k$, $q >= 1$, and a Dirichlet character $chi mod q$. Let $P_(k) := {f: HH -> CC mid(|) f "is 1-periodic"}$. Let $T_(n): P_(k) -> P_(k)$ (this depends on $q, k$) by

  $ (T_(n)f)(z) = n^((k)/(2) - 1) sum_(g in Delta_(n))^() chi(a) (f|_(k) g)(z) $

  For general $f: HH -> CC$ 1 periodic, $ (f|_(k) g)(z) := (det(g))^((k)/(2)) j_(k)(g, z) f(g z) $

  Thus $ (T_(n)f)(z) & = n^((k)/(2) - 1) sum_(g in Delta_(n))^() chi(a) n^((k)/(2)) j_(k)(g, z) f(g z) \
              & = n^(- 1) sum_(mat(a, b; 0, d) in Delta_(n))^() chi(a) n^(k) d^(-k) f((a z + b)/(d)) \
              & = n^(- 1) sum_(a d = n)^() chi(a) a^(k) sum_(b = 0)^(d - 1) f((a z + b)/(d)) \ $
]

#lemma[
  For $g in Delta_(n)$, there is a unique $v in ZZ$ and $h in Delta_(n)$ such that $ g mat(1, 1; 0, 1) = mat(1, v; 0, 1) h $ and moreover $g -> h$ is bijective and $chi(a) = chi(a prime)$
]
#proof[
  $forall mat(a, b; 0, d) in Delta_(n)$.

  $ mat(a, b; 0, d) mat(1, 1; 0, 1) = mat(a, a + b; 0, d) $

  $exists! v in ZZ in.rev a + b + v d = (a + b) mod d$. Thus $ mat(1, v; 0, 1)mat(a, a+ b; 0, d) = mat(a, (a + b) mod d; 0, d) in Delta_(n) $

  Thus $ mat(a, b; 0, d) mat(1, 1; 0, 1) = mat(1, -v; 0, 1) mat(a, (a + b) mod d; 0, d). $ Let $f: Delta_(n) -> Delta_(n)$ where $mat(a, b; 0, d) -> mat(a, (a + b) mod d; 0, d)$. $forall mat(a, b; 0, c), mat(p, q; 0, r) in Delta_(n)$ where $ mat(a, (a + b) mod d; 0, d) = mat(p, (p + q) mod r; 0, r) $

  Thus $a = p$ and $d = r$. Since $+_(a): ZZ_(d) -> ZZ_(d)$ where $x -> a + x$ is a bijection, $b = q$. Thus $f$ is injective. Surjective, $forall mat(a, b; 0, c) in Delta_(n)$. $ f(mat(a, (b - a) mod d; 0, d)) = mat(a, b; 0, d). $
]


#lemma[$T(n)$ is well defined for $f$ is 1 periodic so is the function $T(n)f$ is defined above ]
#proof[$
    T(n)(f)|_(k) mat(1, 1; 0, 1) & = n^((k)/(2) - 1) sum_(g in Delta_(n))^()chi(a) f |_(k) g |_(k) mat(1, 1; 0, 1) \
                                 & = n^((k)/(2) - 1) sum_(h in Delta_(n))^()chi(a) f |_(k) mat(1, v_(g); 0, 1) |_(k) h \
                                 & = n^((k)/(2) - 1) sum_(h in Delta_(n))^()chi(a) f |_(k) h \
                                 & = T(n)(f)
  $

  The 3rd equality comes from the bijection between $g <-> h$ and 1-periodicity.
]

#corollary[
  Suppose $f in P_(k)$ satisfies $ f(z) = sum_(m >= 0)^() a_(m) e(m z) $

  Then $ T(n)f(z) = sum_(m >= 0)^() (sum_(d divides (m, n ))^() chi(d) d^(k - 1) a((m n )/(d^2))) e(m z) $
]

There is a surprising symmetry between $m$ and $n$.

#proof[By Definition,
  $
    (T_(n)f)(z) & = n^((k)/(2) - 1) sum_(g in Delta_(n))^() (f|_(k) g)(z) \
    & = n^(-1) sum_(a d = n)^() chi(a) a^(k) sum_(b = 0)^(d - 1) f((a z + b)/(d)) \
    & = n^(-1) sum_(a d = n)^() chi(a) a^(k) sum_(b = 0)^(d - 1) sum_(m = 0)^(infinity) a_(m) e((m a z + m b)/(d)) \
    &= n^(-1) sum_(m = 0)^(infinity) a_(m) sum_(a d = n)^() chi(a) a^(k) sum_(b = 0)^(d - 1) e((m a z + m b)/(d)) \
    &= n^(-1) sum_(m = 0)^(infinity) a_(m) sum_(a d = n)^() chi(a) a^(k) e((m a z)/(d)) sum_(b = 0)^(d - 1) e((m b)/(d)) \
    &= n^(-1) sum_(m = 0)^(infinity) a_(m) sum_(a d = n)^() chi(a) a^(k) e((m a z)/(d)) sum_(b = 0)^(d - 1) e((m b)/(d)) \
  $

  Since
  $ sum_(b = 0)^(d - 1) e((m b)/(d)) = cases(d "if" d divides m, 0 "otherwise "), $

  $
    (T(n)f)(z) & = sum_(m = 0)^(infinity) a_(m) sum_(a d = n \ d divides m)^() chi(a) (d)/(n) a^(k) e((m a z)/(d)) \
               & = sum_(m = 0)^(infinity) a_(m) sum_(a d = n \ d divides m)^() chi(a) a^(k - 1) e((m a z)/(d)) \
               & = sum_(a d = n \ a, d>=1)^() chi(a) a^(k - 1) sum_(l = 0)^(infinity) a_(l d) e(l a z) \
               & = sum_(r = 0)^(infinity) e(r z) sum_(a d = n \ a divides m)^() chi(a) a^(k - 1) a_((m d)/(a)) \
               & = sum_(r = 0)^(infinity) e(r z) sum_(a d = n \ a divides r)^() chi(a) a^(k - 1) a_((m n)/(a^2)) \
               & = sum_(r = 0)^(infinity) e(r z) sum_(a divides (r, n))^() chi(a) a^(k - 1) a_((m n)/(a^2)) \
  $
]

#corollary[
  For all $f in P_(k)$ with fourier expansion $f(z)= sum_(m = 0)^(infinity) a_(f)(m) e(m z)$

  $
    a_(T_(n)(f))(0) & = a_(f)(0)sum_(d divides n)^() chi(a)a^(k - 1) \
    a_(T_(n)(f))(1) & = a_(f)(n)
  $

  If $T_(n)(f) = lambda f$ then $a_(f)(0) = 0$ or $sum_(d divides n)^() chi(a)a^(k - 1) = 0$. If $T_(n)(f) = lambda f$ then $a_(f)(n) = lambda a_(f)(1) .$
]<heckeoperatorfouriercorrolarary>

#lemma[
  For $g in Delta_(n)$ and $gamma in Gamma_(0)(d)$, $exists! (h, eta) in Delta_(n), Gamma_(0)(d)$ such that $ g gamma = eta h $

  The map $g -> h$ is a bijection.
]
#proof[
  Suppose
  $ mat(a, b; 0, d) gamma = gamma prime mat(a prime, b prime; 0, d prime). $Let $gamma = mat(r, s; t, u)$ and $gamma prime = mat(r prime, s prime; t prime, u prime).$

  $
    mat(a r + b t, a s + b u; d t, d u) = mat(a prime r prime, r prime b prime + s prime d prime; t prime a prime, t prime b prime + u prime d prime)
  $

  Since $q | t, t prime$, $a r equiv a prime r prime mod q$. Note $(r, q) = (r prime, q) = 1$. If $(a, q) = 1$, $(a prime, q) = 1$. $d t = t prime a prime equiv 0 mod q$. Since $(a prime, q) = 1$, $t prime = 0 mod q$. thus $gamma prime in Gamma_(0)(q).$
]

#theorem[
  The Hecke operators give linear maps

  $
    M_(k)(q, chi) & -> M_(k)(q, chi) \
    S_(k)(q, chi) & -> S_(k)(q, chi)
  $
]
#proof[Follows periodicity proof closely.
  Let $gamma in Gamma_(0)(q)$,
  $
    (T_(n) f |_(k) gamma & = n^((k)/(2) - 1) sum_(g in Delta_(n))^() chi(a) f|_(k) g|_(k) gamma \
                         & = n^((k)/(2) - 1) sum_(g in Delta_(n))^() chi(a) chi(eta) f|_(k) eta|_(k) h \
                         & = chi(gamma) n^((k)/(2) - 1) sum_(h in Delta_(n))^() chi(a prime) f|_(k) h \
                         & = chi(gamma) (T_(n) f)
  $

  Thus $T_(n)$ is a map from $M_(k)(q, chi)$ to itself and is linear. Furthermore by @heckeoperatorfouriercorrolarary, $S_(k)(q, chi) -> S_(k)(q, chi)$

]

#theorem[
  The Hecke operator on $M_(k)(q, chi)$ follows the relations

  $ T(m)T(n) = sum_(d divides (m, n))^() chi(d) d^(k - 1) T((m n)/(d^2)) $ In particular, $ T(m)T(n) = T(m n) = T(n)T(m) $ if $(m, n) = 1$.
]
#proof[
  By definition
  $
    T(m) T(n) f & = n^((k)/(2) - 1) sum_(a_(1) c_(1) = m)^() sum_(b_1 = 0)^(c_(1) - 1) chi(a_(1)) (T(n) f|_(k) mat(a_(1), b_(1); 0, c_(1))) \
    & = (m n)^((k)/(2) - 1) sum_(a_(1) c_(1) = m \ a_(2) c_(2) = n)^() sum_(b_1 = 0)^(c_(1) - 1) sum_(b_2 = 0)^(c_(2) - 1) chi(a_1) chi(a_2) (f|_(k) mat(a_(2), b_(2); 0, c_(2)) |_(k) mat(a_(1), b_(1); 0, c_(1))) \
    &= (m n)^((k)/(2) - 1) sum_(a_(1) c_(1) = m \ a_(2) c_(2) = n)^() sum_(b_1 = 0)^(c_(1) - 1) sum_(b_2 = 0)^(c_(2) - 1) chi(a_1) chi(a_2) (f|_(k) mat(a_(2), b_(2); 0, c_(2)) mat(a_(1), b_(1); 0, c_(1)) ) \
    &= (m n)^((k)/(2) - 1) sum_(a_(1) c_(1) = m \ a_(2) c_(2) = n)^() sum_(b_1 = 0)^(c_(1) - 1) sum_(b_2 = 0)^(c_(2) - 1) chi(a_1) chi(a_2) (f|_(k) mat(a_1 a_(2), a_2 b_1 + b_(2) c_1; 0, c_1 c_(2)) ) \
    &= (m n)^((k)/(2) - 1) sum_(a_(1) c_(1) = m \ a_(2) c_(2) = n)^() sum_(b_1 = 0)^(c_(1) - 1) sum_(b_2 = 0)^(c_(2) - 1) chi(a_1 a_2) (f|_(k) mat(a_1 a_(2), a_2 b_1 + b_(2) c_1; 0, c_1 c_(2)) ) \
  $

  If $(m , n) = 1$, then as $b_(1), b_(2)$, $a_(2) b_(1) + b_(2) c_(1)$ sums uniquely over (representatives of) $ZZ_(d_(1) d_(2))$. Because of periodicity, the choice of representative doesn't matter. Thus if $(m, n) = 1$,

  $ T(m)T(n) f = (m n)^((k)/(2) - 1) sum_(a c = m n )^() chi(a) sum_(b = 0)^(c - 1) f|_(k) mat(a, b; 0, c) = T(m n) f $

  For the more general case we need a bit more work. $a_2 b_1 + b_2 c_1$ with $a_2$ and $c_1$ varying is always a multiple of $delta = (a_1, c_2)$. Note $delta divides a_1 a_2$ and $delta divides c_1 c_2$. Thus we can split the sum according to $delta$ and replace $a_1$ by $delta a_1$ and $c_2$ by $delta c_2$. Thus

  $
    T(m)T(n) f &= (m n)^((k)/(2) - 1) sum_(delta divides (m, n))^() chi(delta) sum_(a_(1) c_(1) = (m)/(delta) \ a_(2) c_(2) = (n)/(delta) \ (a_1, c_2) = 1)^() sum_(b = 0)^(c_(1)c_2 - 1) chi(a_1 a_2) (f|_(k) mat(a_1 a_(2), b; 0, c_1 c_(2)) ) \
  $

  //TODO
]

== Simultanous Diagonalization
For $n >= 1$, $T(n): S_(12)(1) -> S_(12)(1)$ is a linear map. Since $dim S_(k)(1) = 1$, generated by $Delta-$function where $ Delta(z) = (E_(4)^3 - E_(6)^2)(z) & = e(z) product_(n>=1)(1 - e(n z))^(2 4) \
                                  & =sum_(n >= 1)^() tau(n) e(n z) $
where $tau(n)$ is the Ramanujan tau function. Since $T(n) Delta = lambda_(n) Delta$ (dimensionality argument), then $ tau(n) = a_(T(n) Delta)(1) = a_(lambda_(n) Delta)(1) = lambda_(n) tau(1). $ We also get:

1. $tau(m) tau(n) = tau(m n) <=> (m, n) = 1$ by the multiplicativity of hecke operators.
2. More generally $ tau(m) tau(n) = sum_(d divides (m, n))^() d^(11) tau((m n)/(d^2)) $
3. Thus $tau(p) tau(p^v) = tau(p^(v + 1)) + p^11 tau((p^(v + 1))/(p^2)) = tau(p^(v + 1)) + p^11 tau(p^(v - 1)) => tau(p^(v + 1)) = tau(p)tau(p^(v)) - p^(11) tau(p^(v - 1))$

$
  (1 - tau(p) p^(-s) + p^(11) p^(-2s))(tau(1) + tau(p)p^(-s) + tau(p^2)p^(-2 s) +#sym.dots.h) & = 1 \
  => tau(1) + tau(p)p^(-s) + tau(p^2)p^(-2 s) +#sym.dots.h &= 1/(1 - tau(p) p + p^(11 - 2s))
$

Thus we obtain,
$ L(Delta, s) = sum_(n >= 1)^() (tau(n))/(n^(s)) = product_(p "prime") (1)/(1 - tau(p) p + p^(11 - 2 s)) $

for $Re(s)$ large enough. We also obtain a analytic continuation to a entire function with $ (2 pi)^(-s) Gamma(s) L(Delta, s) = (2 pi)^(s - 12) Delta(12 - s) L(Delta, 12 - s) $

This allows us to understand the Ramanujan conjecture that $abs(tau(n)) <= d(n) n^((11)/(2))$. Write $1 - tau(p)x + p^(11) x^2 = (1 - alpha_(p) x) (1- beta_(p) x)$. Then $tau(p) = alpha_(p) + beta_(p)$ and $alpha_(p)beta_(p) = p^(11)$.

#theorem(name: "Ramanujan and Deligne")[
  We have $abs(alpha_(p)) = abs(beta_(p)) = p^((11)/(p))$
]
#corollary(name: "Ramanujan and Deligne")[
  We have $abs(tau(n)) <= d(n) n^((11)/(2))$
]
#proof[
  Base case: $k = 1$, $tau(p^(k)) = alpha_(p) + beta_(p)$

  Inductive Hypothesis: Suppose $k in NN$ that for all $n <= k$ , $tau(p^(n)) = alpha_(p)^(k) + alpha_(p)^(k - 1) beta_(p) + #sym.dots.h + alpha_(p) beta_(p)^(k - 1) + beta_(p)^(k)$.

  Inductive step:

  $
    tau(p^(k + 1)) & = tau(p)tau(p^(k)) - p^(11)tau(p^(k - 1)) \
    & = (alpha_(p) + beta_(p))(alpha_(p)^(k) + alpha_(p)^(k - 1) beta_(p) + #sym.dots.h + alpha_(p) beta_(p)^(k - 1) + beta_(p)^(k)) \
    & - alpha_(p)beta_(p)(alpha_(p)^(k - 1) + alpha_(p)^(k - 2) beta_(p) + #sym.dots.h + alpha_(p) beta_(p)^(k - 2) + beta_(p)^(k - 1)) \
    &= (alpha_(p)^(k + 1) + alpha_(p)^(k) beta_(p) + #sym.dots.h + alpha_(p)^(2) beta_(p)^(k - 1) + alpha beta_(p)^(k)) + (alpha_(p)^(k) beta_(p) + alpha_(p)^(k - 1) beta_(p)^(2) + #sym.dots.h + alpha_(p) beta_(p)^(k) + beta_(p)^(k + 1)) \
    &- (alpha_(p)^(k)beta_(p) + alpha_(p)^(k - 1) beta_(p)^(2) + #sym.dots.h + alpha_(p)^(2) beta_(p)^(k - 1) + alpha_(p)beta_(p)^(k)) \
    &= alpha_(p)^(k + 1) + a_(p)^(k) beta_(p) + #sym.dots.h + alpha_(p) beta_(p)^(k) + beta_(p)^(k + 1)
  $

  Thus $tau(p^(n)) = sum_(m = 0)^(n) alpha_(p)^(n - m) beta_(p)^(n)$. Thus $abs(tau(p^(n))) <= sum_(m = 0)^(n) (p^((11)/(2)))^(n) = (n + 1) p^((11n)/(2)) = d(p^(n))p^((11n)/(2))$. Thus $abs(tau(n)) <= d(n) n^((11)/(2))$
]

*Does this situation extend to other spaces of modular forms of dimension $k >= 2$?*

#lemma[
  Let $E$ be a (finite dimensional) Hilbert Space and $(u_(i))_(i in I)$ a family of commuting _normal_ operators. Then there exists a orthonormal basis of $E$ such that all $u_(i)$ are diagonal in this basis.
]
#proof[
  Linear algebra. But quick summary:

  1. Every normal $u in "End"(E)$ is diagonalizable in orthonormal basis.
  2. if $u$and $v$ commute then $v$ is a endomorphism of every eigenspace of $u$.
]

#lemma[
  For $g = mat(a, b; 0, d) in Delta_(n)$ we have $ integral_(D) (f_(1)|_(k) g)(x + i y) overline(f_(2)(x + i y)) y^(k) (dif x dif y)/(y^(2)) = integral_(D) f_(1)(x + i y) overline((f_(2)|_(k) g prime)(x + i y)) y^(k) (dif x dif y)/(y^(2)) $ where $g prime = mat(d, -b; 0, a)$
]
#proof[
  $forall gamma in mat(p, q n; r n, s) in Gamma(n)$ where $gamma equiv I mod n$ . $ g gamma g^(-1) & = (1)/(n) mat(a, b; 0, d) mat(p, q n; r n, s) mat(d, -b; 0, a) \
                 & = (1)/(n)mat(p n + b d n r, - a b p + a^(2) n q - b^(2) n r + a b s; d^(2) n r, a d s - b d n r) \
                 & = (1)/(n)mat(p n + b d n r, - a b p + a^(2) n q - b^(2) n r + a b s; d^(2) n r, n s - b d n r) $

  It suffices to show that $det(g gamma g^(-1)) = 1$, which is true since $det$ is a homomorphism, and the $g gamma g^(-1)$ has entiger entries.

  1. Top left: $(p n + b d n r)/(n) = p + b d r$
  2. Top Right: $a b(s - p) + n(a^(2) q - b^(2) p) equiv a b(s - p) mod n$. Note $s equiv p = 1 mod(n)$. Thus $s - p equiv 0 mod n$. Thus the top right is a integer
  3. Bottom row: trivially integers.

  Thus $exists g prime in SL(ZZ)$ where $g gamma g^(-1) = g prime$.

  Thus
  $
    integral_(D) (f_(1)|_(k) g)(z) overline(f_(2)(z)) y^(k) (dif x dif y)/(y^(2)) &= n^((k)/(2)) d^(-k) integral_(D) f_(1)(g z) overline(f_(2)(z)) y^(k) (dif x dif y)/(y^(2)) \
  $

  $w = g z = (a z + b)/(d) = (a x + b)/(d) + (a i y)/(d) = u + i v$. Thus $y^(k - 2) dif x dif y = ((d)/(a))^(k) v^(k - 2) dif u dif v$

  $
    integral_(D) (f_(1)|_(k) g)(z) overline(f_(2)(z)) y^(k) (dif x dif y)/(y^(2)) &= n^((k)/(2)) d^(-k) integral_(g(D)) f_(1)(w) overline(f_(2)(g prime z)) ((d)/(a))^(k) v^(k - 2) dif u dif v \
    &= n^((k)/(2)) integral_(g(D)) f_(1)(w) overline(f_(2)(g prime z)) (1/(a))^(k) v^(k - 2) dif u dif v \
  $

  $(f_(2) |_(k) g prime )(z) = n^((k)/(2)) a^(-k) f_(2)(g prime z) => f_(2)(g prime z) = n^(-(k)/(2)) a^(k) (f_(2) |_(k) g prime)(z)$.

  Thus $ integral_(D) (f_(1)|_(k) g)(z) overline(f_(2)(z)) y^(k) (dif x dif y)/(y^(2)) &= n^((k)/(2))a^(-k) integral_(D) f_(1)(z) overline(n^(-(k)/(2)) a^(k) (f_(2) |_(k) g prime)(z)) y^(k) (dif x dif y)/(y^(2)) \
  &= integral_(D) f_(1)(z) overline((f_(2)|_k g prime)(z)) y^(k) (dif x dif y)/(y^(2)) $

]

#lemma[
  Each $T(n)$ for $n >= 1$ defines a normal endomorphism of $S_(k)(1)$ with respect to the Petersson inner product ie $ lr(angle.l f, g angle.r) = integral_(D) f(z) overline(g(z)) y^(k) (dif x dif y)/(y) $
]
#proof[
  We will show that $T(p)^(dagger) = T(p)$ which will imply self adjointness for all $T(n)$ by multiplicative.

  $
    lr(angle.l T(p) f_(1), f_(2) angle.r) & = integral_(D) (T_(p) f_(1))(z) overline(f_(2)(z)) y^(k - 2) dif x dif y \
    &= p^((k)/(2) - 1) integral_(D) sum_(g in Delta_(n))^() (f_(1) |_(k) g)(z) overline(f_(2)(z)) y^(k - 2) dif x dif y \
    &= p^((k)/(2) - 1) sum_(g in Delta_(p))^() integral_(D) (f_(1) |_(k) g)(z) overline(f_(2)(z)) y^(k - 2) dif x dif y \
    &= p^((k)/(2) - 1) sum_(g in Delta_(p))^() integral_(D) f_(1)(z) overline((f_(2) |_(k) g prime)(z)) y^(k - 2) dif x dif y \
  $

  $g = mat(1, b; 0, p)$ if $0 <= b < p$ or $g = mat(p, 0; 0, 1)$. Let $gamma, gamma prime in SL(ZZ)$ where

  $ gamma = cases(mat(1, -1; 0, 1) "if" g = mat(p, 0; 0, 1), mat(-b, -1; 1, 0) "if" g = mat(1, b; 0, p)) $

  and $ gamma prime = cases(mat(p, -1; 0, 1) "if" g = mat(p, 0; 0, 1), mat(0, -1; 1, b) "if" g = mat(1, b; 0, p)) $

  Note $gamma prime g prime = g gamma$.

  Thus $ lr(angle.l T_(p) f_(1), f_(2) angle.r) = lr(angle.l f_(1), T_(p) f_(2) angle.r) $ Thus the hecke operator is self adjoint.
]

A corrollary from this result is the fact that eigenvalues of $T(p)$ is real.

#theorem(name: "Hecke")[
  For $k >= 2$, there exists a _unique_ basis $cal(H)_(k)$  of $S_(k)(1)$ whose elements are eigenfunctions of all $T(n)$ for $n >= 1$, and each element has a 1st fourier coefficents of 1.
]
#proof[The previous 3 lemmas, give the existance of $cal(H)_(k)$ the Hecke basis.
  Suppose $f$ is a simultaneous eigenfunction of all $T(n)$ for $n >= 1$. Then since $lambda_(n) a_(f)(1) = a_(lambda_(n) f)(1) = a_(T_(n) f)(1) = a_(f)(n)$. So $a_(f)(1) = 0 <=> f = 0$. Thus we can replace any $f in cal(H)_(k)$ with a scalar multiple to ensure $a_(f)(1) = 1$. Suppose $f$ is a simultaneous eigenfunction of $T(n)$. Then $f = sum_(i in I)^() a_(i) f_(i)$. If $T(n) f_(i) = lambda_(n, i) f_(i)$ and $T(n) f = lambda_(n) f$. Thus we get $ sum_(i in I)^() lambda_(n) a_(i) f_(i) = lambda_(n) f = T(n) f = sum_(i in I)^() a_(i) lambda_(n, i) f_(i) => lambda_(n) a_(i) = a_(i) lambda_(n, i) $

  Take $i$ such that $a_(i)!=0$, then we get $lambda_(n) = lambda_(n, i)$ for all $n$. But since $a_(f)(n) = lambda_(n) a_(f)(1)$ we get $f = a_(f)(1) f_(i)$.
]

== Distribution of Hecke Eigenvalues
#definition[Let $X$ be a compact metric space. Let $(mu_(n))_(n in NN)$ be a sequence of (Radon) measures on $X$ and $mu$ a Radon Measure on $X$. We say $mu_(n) -> mu$ (weakly in law) if $forall f: X -> CC$ continous, $ integral_(X) f dif mu = lim_(n -> infinity) integral f dif mu_(n) $<WeylCriterionEquation>
]

We will apply this to $X$ a compact set in $RR$, and measures $mu_(n)$ of the type $ mu_(n) := sum_(x in X_(n))^() alpha_(x) delta_(x) $ where $X_(n) subset X$ is a finite set. In particular, when $X_(n) != diameter$ and $alpha_(x) = (1)/(abs(X_(n)))$, then the resulting definition is of a $mu$-equidistribution $ integral f dif mu = lim_(n -> infinity) (1)/(abs(X_(n))) sum_(x in X_(n))^() f(x) $
#definition(
  name: [Chebyshev polynomials of the 2nd kind],
)[Let $(U_(n) : [-2, 2] -> CC)_(n in NN)$ be a collection of functions where $U_(n)(2 cos theta) = (sin((n + 1)theta))/(sin(theta))$  ]<ChebyshevPoly>
#lemma[
  $(U_(n))_(n in NN)$ (@ChebyshevPoly) form a orthornomal basis of $L^(2)([-2, 2], mu_("ST"))$ in particular $integral U_(n) mu_("ST") = integral U_(n) U_(0) mu_("ST") = cases(
    1 "if" n = 0, 0 "otherwise"
  )$
]
#proof[
  $
    lr(angle.l U_(m), U_(n) angle.r) = integral_(-2)^(2) U_(m)(x) overline(U_(n)(x)) d mu_("ST") &= integral_(-2)^(2) U_(m)(x) U_(n)(x) d mu_("ST")
  $

  Let $x = 2 cos(theta)$, thus $dif x = - 2 sin(theta) dif theta$. Thus $ mu_("ST") = bb(1)_([0, pi]) (1)/(pi) sqrt(1 - cos^(2)(theta)) (-2 sin(theta)) dif theta &= bb(1)_([0, pi]) (-(2)/(pi) sin^(2)(theta)) dif theta . $ Thus $ lr(angle.l U_(m), U_(n) angle.r) &= integral_(0)^(pi) (sin((m + 1)theta))/(sin(theta)) (sin((n + 1)theta))/(sin(theta)) ((2)/(pi) sin^(2)(theta)) dif theta \
  &= (2)/(pi) integral_(0)^(pi) sin((m + 1)theta)sin((n + 1) theta) dif theta \
  &= cases(1 "if" m = n, 0 "otherwise") $
]

#remark[
  In fact, by Peter-Weyl theory shows that for any compact group $K$, the character $tr(rho)$ of a irreducible unitary representation $rho: K -> "GL"_(r)(CC)$ form a orthonormal basis of the space $L^(2)("conjugacy classes of K", "haar measure of K")$. If $K = "SU"_(2)(CC)$, then $tilde(X) = {"conjugacy classes of X"} = {mat(e^(i theta), 0; 0, e^(-i theta)); theta in [0, pi] }$ and then the Haar measure is $(1)/(pi) sin^(2)(theta) dif theta$ and $tilde(X) ->_(tr) [-2, 2]$ becomes a homeomorphism $theta -> 2 cos(theta)$ and the Haar measure becomes $mu_("ST").$ Now you can compute the irreducible representations of $"SU"_(2)(CC)$; they are parametrized by $n >= 0$ with character $U_(n)(2 cos(theta))$
]

#lemma[
  For $f in cal(H)_(k)$ and $forall n, p$ $ U_(n)(lambda_(f)(p)) = lambda_(f)(p^(n)) $
]
#proof[Note $ sum_(n = 0)^(infinity) lambda_(f)(p^(n)) x^(n) & = (1)/(1 - lambda_(f)(p)x + x^(2)). $ Then $1 - lambda_(f)(p)x + x^(2) = (1 - alpha_(p) x)(1 - beta_(p) x).$ Write $alpha_(p) = e^(i theta_(p))$ and $beta_(p) = e^(-i theta_(p))$, thus $lambda_(f)(p) = 2 cos(theta_(p))$ ($theta_(p)$ may not be in $RR$).     Thus
  $
    sum_(n = 0)^(infinity) lambda_(f)(p^(n)) x^(n) & = (1)/((1 - alpha_(p) x)(1 - beta_(p) x )) \
    & = (1)/((1 - e^(i theta_(p)) x)(1 - e^(-i theta_(p)) x )) \
    & = sum_(n = 0)^(oo) (sum_(j = 0)^(n) alpha_(p)^(j) beta_(p)^(n- j))x^(n)
  $

  Thus $ lambda_(f)(p^(n)) & = sum_(j = 0)^(n) alpha_(p)^(j)beta_(p)^(n - j) \
                    & = sum_(j = 0)^(n) e^(i j theta_(p)) e^(- (n - j) theta_(p)) \
                    & = sum_(j = 0)^(n) e^(i (2 j - n) theta_(p)) \
                    & = e^(- i n theta_(p)) sum_(j = 0)^(n) e^(2 i j theta_(p)) \
                    & = e^(-i n theta_(p)) (e^(2 i (n + 1) theta_(p)) - 1)/(e^(2 i theta_(p)) - 1) \
                    & = (sin((n + 1)theta_(p)))/(sin(theta_(p))) = U_(n)(2cos(theta_(p))) = U_(n)(lambda_(f)(p)) $
]

The lemma shows that the study of this is broadly linked to the irreducible representations of $"SU"_(2)(CC)$

#theorem(name: "Serre, Sarnak, K- Saha-Tsinmann")[
  Let $k$ be s.t $S_(k)(1) != 0$ so $cal(H)_(k) != diameter$. Let $p$ be a prime number. For $f in cal(H)$, let $lambda_(f)(p) = (a_(f)(p))/(p^((k - 1)/(2))).$ Let $ mu_(k) = (Gamma(k - 1))/((4 pi)^(k-1)) sum_(f in cal(H)_(k))^() (1)/(abs(abs(f))^(2) ) delta_(lambda_(f)(p)) $ this is a measure on $RR$, supported on the compact interval since $abs(lambda_(f)(p)) = O(sqrt(p) )$. Then $mu_(k)$ weakly converges to *Sato-Tate Measure* $ mu_("ST") = bb(1)_([-2, 2])(1)/(pi) sqrt(1 - (x^(2))/(4)) dif x $
]
#proof[
  Using the @WeylCriterion (Weyl Criterion), we want a set of test functions $phi: [-2, 2] -> CC$ which span a dense subset, whose integral converges to 0 in the limit (its just eassier to prove that something converges to 0 than some other limit), we also want the functions to "interact well" with $mu_(k)$. Let $X$ be some large interval containing all $lambda_(f)(p)$ and $mu = mu_("ST")$. One can take as test functions $phi_(n)(x) = x^(n)$ for $n >= 0$ which span a dense subset of $cal(C)(X)$ ("method of moments"). You can do this but not really optimal. A better choice is $(U_n)_(n in NN)$ which are "Chebyshev polynomials of the 2nd kind". Where $U_(n)(2 cos theta) = (sin((n + 1)theta))/(sin(theta))$ for $theta in RR$ or $CC$. You can show that $U_(n) in RR[X]$ and $deg U_(n) = n$ and $U_(0) = 1$. Then $U_(n)$ span the same subspace of $cal(C)(X)$ as $(X^(n))$, so a dense subspace.

  $
    integral_(-2)^(2) U_(n)(x) dif mu_(k) & = (Gamma(k-1))/((4 pi)^(k - 1)) sum_(f in cal(H)_(k))^() (1)/(abs(abs(f))^(2)) U_(n)(lambda_(f)(p)) \
    &= (Gamma(k-1))/((4 pi)^(k - 1)) sum_(f in cal(H)_(k))^() (1)/(abs(abs(f))^(2)) lambda_(f)(p^(n))
  $

  (A quick remark, if the the Sarnak Serre measure (see below) was used then we would get $(1)/(abs(H_(k)))(1)/(p^((k -1)/(2))) tr(T(p^(n)))$ which is why the selberg trace formula would be needed.) Now notice that $tilde(H)_(k) = {(f)/(abs(abs(f))) : f in cal(H)_(k) }$ is a orthonormal basis of $S_(k)(1)$. So we have $ integral_(-2)^(2) U_(n)(x) dif mu_(k) &= (Gamma(k-1))/((4 pi)^(k - 1)) sum_(f in cal(H)_(k))^() (a_(f)(p^(n)))/(p^(n( k - 1)/(2))) \
  &= (Gamma(k-1))/((4 pi)^(k - 1) p^(n( k - 1)/(2))) sum_(f in tilde(H)_(k))^() a_(f)(p^(n)) \
  &= (Gamma(k-1))/((4 pi)^(k - 1) p^(n( k - 1)/(2))) sum_(f in tilde(H)_(k))^() a_(f)(p^(n)) a_(f)(1) "(Because " a_(f)(1) = 1) \
  &= delta(p^(n), 1) + (2 pi)/(i^(k)) sum_(c >= 1)^() (1)/(c) S(p^(n), 1; c) J_(k - 1)((4 pi p^((n)/(2)))/(c)) "(Because of Petersson Formula)" \
  &= cases(1 "if" n = 0, 0 "otherwise") + "remainder" $

  we want to show that as $k -> infinity$, the remainder goes to 0. Good thing for us is that nothing in the remainder depends on $k$ other than the bessel function, so all we need to do is to show that $k -> infinity => J_(k - 1) -> 0$ for $x >= 0$. If we look back to the proof of Petersson Formula we have the fact that $integral U_(n) mu_(k) = p^(n)"th Fourier coefficent of" P_(1, k)$. We have $ a_(m)(P_(m, k)) = integral_(0)^(1)P_(m, k)(x + i)e(-m(x + i)) dif x $ by definition. Recall definition of $P_(m, k)$, $ P_(m, k)(z) = sum_(g in overline(T) slash SL(ZZ))^() j_(k)(g, z) e(n g z) $

  Note that $abs(j_(k)(g, z)e(n g z)) <= abs(j_(k)(g, z))$ and $abs(c z + d)^(2) = abs(c (x + i ) + d) >= c^(2)$. So for $c != 0$ we get $ abs(j_(k)(g, z) e(n g z)) ->_(k -> infinity) 0 $ uniformly for $g in overline(T) slash SL(ZZ), c!= 0$ and $z = x + i$. For $c = 0$, we have $g = I$(class mod $overline(T)$) so $e(n g z)j(g, z) = e(n z)$. Since moreover $abs(e(n g z) j_(k)(g, z)) <= j_(4)(g, z)$ for $k >=4$, which defines a convergent series it follows by dominated convergence that $P_(n, k) ->_(k -> infinity) e(n z)$.

  $
    a_(m)(P_(m, k)) = integral_(0)^(1)P_(m, k)(x + i)e(-m(x + i)) dif x &->_(k -> oo) integral_(0)^(1) e((n - m)(x + i)) dif x\ &= delta(m, n)
  $

  Thus the remainder of $integral U_(n)(x) dif mu_(k) -> 0$ as $k -> infinity$
]


#corollary[
  The set ${lambda_(f)(p) mid(|) f in cal(H)_(k) "for some "k }$ is dense in $[-2, 2]$ (closure contains in $[-2, 2]$)
]

#remark[
  1. This shows that that $abs(lambda_(f)(p)) <= 2$ "most of the time". Deligne proved this was always true in a theorem found in 1974 where he proved the Ramanujan Petersson conjecture. But this proof is much harder and requires details from the finite field Riemann Hypothesis.
  2. Natural question to ask is, what about $tilde(mu)_(k) = (1)/(abs(cal(H)_(k))) sum_(f in cal(H)_(k))^() delta_(lambda_(f)(p))$? Sarnak and Serre worked on this and proved that $ tilde(mu)_k ->_(k -> oo) (p + 1)/(pi) (sqrt(1 + x^(2)/4) )/((sqrt(p) + (1)/(sqrt(p) ) )^(2) - x^(2)) bb(1)_([-2, 2]) dif x $ which is the "Plancherel measure for $SL(QQ_(p))$. To prove this they used the Selberg Trace formula for which gives a "explicit" formula for the trace $tr(T(n))$  of the Hecke operators.
  3. One can also ask what happens if we fix $f$ (eg $f = Delta in SL(ZZ)$) and vary $p$? This is the problem which was the Sato Tate conjecture. For $f in cal(H)_(k)$ fixed and for all functions $phi: [-2, 2] -> CC$ continous, $ (1)/(pi) sum_(p <= x)^() phi(lambda_(f)(p)) -> integral_(-2)^(2) dif mu_("ST") $
]

= Theta Functions
Theta functions are functions on $HH$ which give rise to Automorphic forms which are quite different from those already constructed. They are related to integral positive-definite quadratic forms and their modularity properties for representations of integers by such quadratic forms like sums of squares.

#definition[$Q: RR^(n) -> RR^(n)$ is a *positive definite quadratic form* if $exists A in M_(r)(ZZ)$ where $A$ is symmetric  where $ Q(x) = x^(t) A x = sum_(i)^(n) a_(i i) x_(i)^(2) + 2 sum_(1 <= i <= j <= n)^() a_(i, j) x_(i) x_(j). $ Thus if $x != 0 => Q(x) > 0.$ $Q$ is *even* if $forall i in [1, #sym.dots.h, n]$,  $a_(i i) equiv 0 mod(2)$, in which case $Q(x) equiv 0 mod(2)$ for all $x in ZZ^(n)$.]

#definition[The "basic" theta function $theta_(Q): HH -> CC$  associated with a positive definite quadratic form $Q$ is $ theta_(Q)(z) = sum_(m in ZZ^(n))^() e((Q(m) z)/(2)). $ A more general quadratic form is the following $ theta_(Q)(z; f) = sum_(m in ZZ^(n))^() e((Q(m) z)/(2)) f(m) $ for some $f: ZZ^(n) -> CC$    ]

#example[
  Let $Q(x) = x^(2)$, which is the simplest quadratic form. $ theta_(Q)(z) = sum_(m in ZZ)^() e((m^(2) z)/(2)) = sum_(m in ZZ)^() e^(i m^(2) pi z) = 1 + 2 sum_(m = 1)^(infinity) e^(i m^(2) pi z) $
]

== "One variable" theta functions and Dirichlet L function
We will look at the following theta function for $Q(x) = x^(2)$: $ theta_(Q)(z; chi) = sum_(m in ZZ)^() chi(m) e((m^(2) z)/(2)) $ for some Dirichlet character $chi: ZZ_(q)^(*) -> CC$. and $ theta_(Q)(z; a) = sum_(m in ZZ)^() bb(1)_(m equiv a mod(q)) e((m^(2) z)/(2)) = sum_(m in a + q ZZ )^() e((m^(2) z)/(2)) $

#lemma[
  $theta_(Q)(z; chi)$ and $theta_(Q)(z; a)$  are well defined holomorphic functions on $HH$ such that $ theta_(Q)(z + 2; chi) & = theta_(Q)(z; chi) \
    theta_(Q)(z + 2; a) & = theta_(Q)(z; a) $
]
#proof[
  Note for $z = x + i y in HH$. $ abs(e((m^(2) z)/(2))) =abs(e^(i m^(2) pi (x + i y))) = e^(- i m^(2) y) $ thus the series $sum_(m in ZZ)^() e((m^(2) z)/(2))$ converges locally absolutely, thus its a holomorphic function on $HH$. The 2 periodicity is obvious:

  $ e((m^(2) (z + 2))/(2)) = e((m^(2) z)/(2) + m^(2)) = e((m^(2) z)/(2)) $
]

#lemma(name: "Jacobi Transformation Part 1")[
  Let $y > 0$ be a real number. We have $ theta_(Q)(i y; a) = (1)/(q sqrt(y) ) sum_(x = 0)^(q - 1) e((a x)/(q)) theta_(Q)(-(1)/(q^(2) i y); x) $
]<JacobiTransformationPart1>
#proof[
  By definition,
  $
    theta_(Q)(i y; a) & = sum_(m in a + ZZ q)^() e^(- m^(2) pi y) \
                      & = sum_(n in ZZ)^() e^(-(a + n q)^(2) pi y) \
  $

  Let $f_(y): RR -> CC$ where $n -> e^(-(a + n q)^(2) pi y)$. $f_(y)$ has rapid decay and is smooth, thus the poisson summation formula could be used.

  Thus $ theta_(Q)(i y; a) & = sum_(n in ZZ)^() f_(y)(n) \
                    & = sum_(h in ZZ)^() hat(f)(h) $

  $
    hat(f)(t) & := integral_(-oo)^(oo) f(x) e^(- x t) dif t \
    & = integral_(-oo)^(oo) e^(- pi (a + x q)^(2) y) e^(- x t) dif x \
    & = (1)/(q) integral_(-oo)^(oo) e^(- pi u^(2) y) e^(((a - u) t)/(q)) dif u " " (u = a + x q) \
    & = (1)/(q) e^((a t)/(q)) integral_(-oo)^(oo) e^(- pi u^(2) y) e^((-u t)/(q)) dif u \
    & = (e^((a t) / q))/(q sqrt(y) ) integral_(RR) e^(- pi v^(2)) e^(-(v t)/(q sqrt(y) )) dif v " " (v^(2) = u^(2) y)\ &= (e^((a t) / q))/(q sqrt(y) ) hat(g)((t)/(q sqrt(y) ))
  $

  where $g(x) = e^(- pi x^2)$. The fourier transform of a gaussian is a gaussian and in this case it stays fixed thus $hat(g) = g$. Thus $ hat(f)(t) = (e^((a t) / q))/(q sqrt(y) ) g((t)/(q sqrt(y) )). $ Plugging the result back into $theta_(Q)$ we see $ theta_(Q)(z; a) & = 1 /(q sqrt(y) ) sum_(h in ZZ)^() e^((a h) / q) g((h)/(q sqrt(y) )) \
  & = 1 /(q sqrt(y) ) sum_(h in ZZ)^() e^((a h) / q) e^(-(pi h^(2))/(q^(2) y)) \
  & = 1 /(q sqrt(y) ) sum_(h in ZZ)^() e^((a h) / q) e^(-(2 pi i h^(2))/(2 q^(2) i y)) \
  & = 1 /(q sqrt(y) ) sum_(h in ZZ)^() e^((a h) / q) e(-(h^(2))/(2 q^(2) (i y))) \
  & = 1 /(q sqrt(y) ) sum_(x = 0)^(q - 1) sum_(h in ZZ)^() e^((a (x + h q)) / q) e(-((x + h q)^(2))/(2 q^(2) (i y))) \
  & = 1 /(q sqrt(y) ) sum_(x = 0)^(q - 1) e^((a x) / q) sum_(h in x + q ZZ)^() e(-(h^(2))/(2 q^(2) (i y))) \
  &= 1 /(q sqrt(y) ) sum_(x = 0)^(q - 1) e^((a x) / q) theta_(Q)(- (1)/(i y q^(2)); x) $
]

#lemma(name: "Jacobi Transformation Part 2")[
  Let $chi: ZZ -> CC$ is a primitive dirichlet character mod $q$.

  $ theta_(Q)(i y; chi) = (tau(chi))/(q sqrt(y) ) theta_(Q)(-(1)/(q^(2) i y); overline(chi)) $ where $ tau(chi) := sum_(x = 0)^(q - 1) chi(x) e((x)/(q)) $
]<JacobiTransformationPart2>
#proof[
  $
    theta_(Q)(z; chi) & = sum_(m in ZZ)^() chi(m) e((m^(2) z)/(2)) \
                      & = sum_(a = 0)^(q - 1) chi(a) sum_(m in a + q ZZ)^() e((m^(2) z)/(2)) \
                      & = sum_(a = 0)^(q - 1) chi(a) theta_(Q)(z; a)
  $

  Thus by @JacobiTransformationPart1,

  $
    theta_(Q)(i y; chi) & = sum_(a = 0)^(q - 1) chi(a) theta_(Q)(i y; a) \
    & = (1)/(q sqrt(y) ) sum_(a = 0)^(q - 1) chi(a) sum_(b = 0)^(q - 1) e^((a b)/(q)) theta_(Q)(-(1)/(i y q^(2)); b) \
    &= (1)/(q sqrt(y) ) sum_(b = 0)^(q - 1) theta_(Q)(-(1)/(i y q^(2)); b) sum_(a = 0)^(q - 1) chi(a) e^((a b)/(q)) \
  $

  Now a property of primitive characters is that $sum_(a = 0)^(q - 1) chi(a) e^((a b)/(q)) = tau(chi) overline(chi(b)).$

  Thus $ theta_(Q)(i y; chi) & = (tau(chi))/(q sqrt(y) ) sum_(x = 0)^(q - 1) overline(chi(x)) theta_(Q)(-(1)/(i y q^(2)); x)
  \
  &= (tau(chi))/(q sqrt(y) ) sum_(x = 0)^(q - 1) overline(chi(x)) sum_(m in x + q ZZ)^() e^(- pi i m^(2) ((1)/(y q^(2))) ) \
  &= (tau(chi))/(q sqrt(y) ) sum_(m in ZZ)^()overline(chi)(m) e^(- pi i m^(2) ((1)/(y q^(2))) ) = (tau(chi))/(q sqrt(y) ) theta_(Q)(-(1)/(i y q^(2)); overline(chi)) $
]

#corollary(name: "L-Function of Primitive Character and Lambda Functional")[
  Let $q >= 1$ be a integer and $chi$ a dirichlet character mod $q$ which is primitive.

  1. If $q = 1$, $L(s, chi) = sum_(n >= 1)^() (1)/(n^(s)) chi(n) = zeta(s)$, then $zeta(s)$ has a analytic continuation to a meromorphic function on $CC$, with a unique simple pole at $s = 1$ with residue 1, and which satisfies $ pi^(-(s)/(2))zeta((s)/(2))zeta(s) = pi^(-(1 - s)/(2))zeta((1 - s)/(2))zeta(1- s) $
  + If $q >= 2$, then $L(s, chi)$ has a analytic continuation to an *entire* function, and moreover the function $ Lambda(chi, s) = pi^(-(s + t_(chi))/(2)) Gamma((s + t_(x))/(2)) L(chi, s) $ satisfies the functional equation $ Lambda(chi, s) = (1)/(i^(t_(chi))) (tau(chi))/(sqrt(q) ) q^((1)/(2) - s) Lambda(overline(chi), 1-s) $ where $ t_(chi) = cases(
      0 "if" chi(-1) = 1, 1 "if" chi(-1) = -1
    ) $
]
We will prove this for $chi(-1) = 1$.
#proof[
  $
    Lambda(chi, s) & = pi^(-(s)/(2)) Gamma((s)/(2)) sum_(n = 1)^(oo) n^(-s) chi(n) \
                   & = sum_(n = 1)^(oo) pi^(-(s)/(2)) Gamma((s)/(2)) n^(-s) chi(n) \
                   & = sum_(n = 1)^(oo) integral_(0)^(oo) chi(n) e^(- pi n^(2) x) x^((s)/(2) - 1) dif x
  $

  Last equality comes from @gammaproperty2.  Integral and summation can be interchanged because of quick convergence.

  $
    Lambda(chi, s) & = integral_(0)^(infinity) x^((s)/(2) - 1) sum_(n = 1)^(oo) chi(n) e^(- pi n^(2) x) dif x \
                   & = (1)/(2)integral_(0)^(oo) x^((s)/(2) - 1) theta_(Q)(i x; chi) dif x
  $

  This is because $chi(-n) = chi(-1)chi(n) = chi(n)$ since $chi$ is even.

  We will now use the jacobi transformation to solve the integral much in the same way we solved the similar integral for regular modular forms.

  $
    Lambda(chi, s) & = (1)/(2)integral_(0)^(oo) x^((s)/(2) - 1) theta_(Q)(i x; chi) dif x \
    & =(1)/(2)(integral_(0)^((1)/(q)) x^((s)/(2) - 1) theta_(Q)(i x; chi) dif x + integral_((1)/(q))^(oo) x^((s)/(2) - 1) theta_(Q)(i x; chi) dif x)
  $
  Let's deal with the first integral. By the Jacobi transformation @JacobiTransformationPart2,
  $
    integral_(0)^((1)/(q)) x^((s)/(2) - 1) theta_(Q)(i x; chi) dif x &= (tau(chi))/(q)integral_(0)^((1)/(q)) x^((s - 1)/(2)) theta_(Q)((i)/(x q^(2)); overline(chi)) (dif x)/(x)
  $

  Let $u = (1)/(q^(2)x)$ and $dif u = -(1)/(q^(2) x^(2)) dif x => (dif u)/(u) = q^(2) x dif u = - (dif x)/(x)$. Thus

  $
    integral_(0)^((1)/(q)) x^((s)/(2) - 1) theta_(Q)(i x; chi) dif x & = (tau(chi))/(q) integral_((1)/(q))^(infinity) ((1)/(q^(2) u ))^((s - 1)/(2)) theta_(Q)(i u ; overline(chi)) (dif u)/(u) \
    &= tau(chi) q^(-s) integral_((1)/(q))^(oo) u^(-(s- 1)/(2)) theta_(Q)(i u; overline(chi)) dif u
  $

  Thus $ Lambda(chi, s) = (1)/(2)integral_((1)/(q))^oo ((tau(chi))/(sqrt(q) ) q^((1)/(2) - s) x^((1 - s)/(2)) theta_(Q)(i x; overline(chi)) + x^((s)/(2)) theta_(Q)(i x; chi)) dif x $

  This gives analytic continuation and the functional equation after checking that $ tau(chi)tau(overline(chi)) = q chi(-1) = q $

  For $q = 1$, namely $zeta(s)$, argument is the similar

  $
    pi^(-(s)/(2))Gamma((s)/(2))zeta(s) &= (1)/(2)integral_(0)^(oo) (sum_(n in ZZ slash {0})^() e^(- pi n^(2) x)) x^((s)/(2) - 1) dif x \
    &= (1)/(2)integral_(0)^(oo) (theta_(Q)(i x) - 1) x^((s)/(2) - 1) dif x \
  $

  After we recombine keeping sure not to integrate $x^((s)/(2) - 1)$ close to $oo$ the result follows.
]

== The Basic Transformation Formula in General
#proposition[
  Let $Q(x) = x^(T) A x$ be a quadratic form; let $N >= 1$ such that $N A^(-1)$ has integral entries. For $z in HH$, $x in CC^(n)$ we have $ sum_(m in ZZ^(n))^() e((1)/(2) Q(m + x) z) = (1)/(det(A)^((1)/(2))) ((i)/(z))^((n)/(2)) sum_(m in ZZ^(n))^()e(-(1)/(2 z) tilde(Q)(m) + m dot x) $ where $tilde(Q)(x) = x^(T) A^(-1) x$
]
#proof[
  $forall z in HH$, let $phi(y) = e((1)/(2) Q(y) z)$. There is a more general version of the Poisson Summation formula which we will use because of sufficicent decay properties of $phi$.

  $ sum_(m in ZZ^(n))^() phi(m + x) = sum_(h in ZZ^(n))^() hat(phi)(h)e(h dot x) $

  Let us calculate the Fourier Coefficients. We want to show that:

  $
    hat(phi)(t) & = integral_(RR^(n)) phi(y) e(- y dot t) dif y = (1)/(det(A)^((1)/(2))) ((i)/(z))^((n)/(2)) e(-(1)/(2 z) tilde(Q)(t)) \
  $

  By analytic continuation, it suffices to look at the integrals for $z = i w in HH$. By linear algebra, exists a basis of $RR^(n)$ such that $u: RR^(n) -> RR^(n)$ is a invertible linear map and $Q(y) = abs(u(y))^(2) = sum_(i = 1)^(n) u_(i)(y)^(2)$ for $y in RR^(n)$. Thus

  $
    hat(phi)(t) & = integral_(RR^(n)) e((1)/(2) Q(y) z) e(-y dot t) dif y \
                & =integral_(RR^(n)) e((1)/(2) abs(u(y))^(2) z) e(-y dot t) dif y \
  $

  Let $v = u(y)$ and $dif v = abs(det(u)) dif y$.

  $
    hat(phi)(t) & = (1)/(abs(det(u)) ) integral_(RR^(n)) e((1)/(2) abs(v)^(2) z) e(- u^(-1)(v) dot t) dif v \
                & =(1)/(abs(det(u)) ) integral_(RR^(n)) e((1)/(2) abs(v)^(2) z - u^(-1)(v) dot t) dif v \
                & = (1)/(abs(det(u)) ) integral_(RR^(n)) e((1)/(2) abs(v)^(2) z - v dot (u^(-1))^(dagger)t) dif v \
                & = (1)/(abs(det(u)) ) product_(j = 1)^(n) (1)/(sqrt(w)) e(-(1)/(2 i w)((u^(-1))^(dagger)t)^(2)) \
  $

  The last statement comes from Fubini's Theorem.

  $
    hat(phi)(t) & = (1)/(abs(det(u)) ) product_(j = 1)^(n) (i)/(sqrt(w)) e(-(1)/(2 i w)((u^(-1))^(dagger)t)^(2)) \
                & =(1)/(abs(det(u)) ) (i)/(z)^((n)/(2)) e(-(1)/(2 i w)abs((u^(-1))^(dagger)t)^(2) ) \
  $

  Let $B$ be the matrix such that $u(y) = B y$. Then $B^(dagger) B = A$ (linear algebra). Then $ abs((u^(-1))^(dagger)t)^(2) & = tilde(Q)(t) $

  When you plug everything back in you get the statement of the proposition.
]

#definition[
  A *Q-spherical polynomial* is a polynomial $P in CC[x_(1), #sym.dots.h, x_(n)]$ which is a linear combination of polynomials of the form

  1. $P = "constant"$
  2. $P = "Linear form"$
  3. $P(x) = (c^(T) A x)^(nu)$ for $nu >= 2$ and $c in CC^(n) in.rev Q(c) = 0$
]

#proposition[
  Let $Q(x) = x^(T) A x$ be a a positive definite quadratic form and $P$ a $Q$-spherical polynomial. Then $tilde(P)(x) = P(A^(-1) x)$ is a $tilde(Q)$-spherical polynomial.

  $
    sum_(m in ZZ^(n))^() P(m + x) e((z)/(2) Q(m + x)) = (1)/(deg(P))(1)/(sqrt(det(A)) )((i)/(z))^((n)/(2) + deg(P)) sum_(h in ZZ^(n))^() tilde(P)(h) e(-(Q(h))/(2 z) + m dot x )
  $
]<transformationruleforQ-spherical>

#theorem[
  Let $Q(x) = abs(x)^(2) = x^(T) I x.$ Let $P$ be a Q spherical polynomial homogeneous of degree $nu$. Let $theta = theta_(Q)(dot, P) in M_(nu + (n)/(2))(Gamma(4))$ and if $P$ is nonconstant $theta in S_(nu + (n)/(2))(Gamma(4))$
]
#proof[
  Note $Gamma(4) = {mat(a, b; c, d) in SL(ZZ) mid(|) mat(a, b; c, d) equiv I mod 4}.$ and $tilde(P) = P$. Let $k = (n)/(2) + nu$

  We will first find the value of $theta(-(1)/(z))$.

  $
    theta(-(1)/(z)) & = sum_(m in ZZ^(n))^() P(m) e(-(1)/(2 z) Q(m)) \
                    & =(1)/(nu)(1)/(sqrt(det(I)) )(-i z)^(k) sum_(h in ZZ^(n))^() tilde(P)(h) e((Q(h) z)/(2)) \
                    & = (1)/(nu)(-i z)^(k) theta(z) \
  $

  $forall gamma = mat(a, b; c, d) in Gamma(4)$. Let $tilde(gamma) = gamma mat(0, -1; 1, 0) = mat(b, -a; d, -c)$. Then $tilde(gamma)z = (b z - a)/(d z - c) = (b)/(d) - (1)/(d(d z - c))$. Thus

  $
    theta(tilde(g)z) & = sum_(m in ZZ^(n))^() P(m) e((abs(m)^(2) )/(2) ((b)/(d) - (1)/(d(d z - c)))) \
                     & =sum_(m in ZZ^(n))^() P(m) e((abs(m)^(2)b )/(2d) )e( - (abs(m) )/(2d(d z - c)))
  $

  The value of $e((abs(m)^(2)b )/(2d) )$ only depends on $m mod (2d)$, and even modulo d since $b$ is even. So

  $
    theta(tilde(g)z) & = sum_(g in ZZ_(d)^(n))^() e((abs(g)^(2)b )/(2d) ) sum_(m in g + d ZZ^(n))^() P(m) e( - (abs(m) )/(2d(d z - c))) \
    &= sum_(g in ZZ_(d)^(n))^() e((abs(g)^(2)b )/(2d) ) sum_(m in g + d ZZ^(n))^() P(m) e( - (d abs(m) )/(2d^(2)(d z - c))) \
  $
]

= Ranklin Selberg
Earlier we found the bound $abs(a_(f)(n)) <<n^((k)/(2))$ for $f in S_(k)(q, chi)$. We will improve this estimate by tightening the estimate $ sum_(n <= X)^() abs(a_(f)(n))^(n) << X^(k) $ from which we deduced it.
To do this, we will use the basic method of averages of arithmetic functions based on generating Dirichlet series. We will study $ D(s) sum_(n = 1)^(infinity) (abs(a_(n))^(2) )/(n^(s)) $ and its analytic properties. Note that, we at least have have absolute locally uniform convergence as soon as $Re(s) > k + 1$. But ween need analytic continuation beyond this region to do better.

#theorem[
  For $Re(s)$ large enough, we have $ D(s + k - 1) = (4 pi)^(s + k - 1)/(Gamma(s + k - 1)) integral_(D_(F)) y^(k) abs(f(x + i y))^(2) E(z, s) (dif x dif y)/(y^(2)) $  where $E(z, s)$ is a nonholomorphic Eisenstein series defined by $ E(z, s) = sum_(g in overline(T) backslash SL(ZZ))^() Im(g z)^(s) $ which converges absolutely for $Re(s) > 2$
]
#proof[
  Recall
  $ Im(g z) = abs(j_(1)(g, z))^(-2) Im(z) $ so in terms of modulus,

  $ abs(Im(g z))^(s) = (abs(j_(1)(g, z))^(-2) Im(z))^(Re(s)) $

  which defines a absolutely locally uniformly convergent series for $2Re(s) > 2$, much like the convergence of the Eisenstein series. Thus for the integral

  $
    integral_(D_(F)) y^(k) abs(f(x + i y))^(2) E(z, s) (dif x dif y)/(y^(2)) &= integral_(D_(F)) y^(k) abs(f(x + i y))^(2) sum_(g in overline(T) backslash SL(ZZ))^() Im(g z)^(s) (dif x dif y)/(y^(2)) \
    &= sum_(g in overline(T) backslash SL(ZZ))^() integral_(D_(F)) y^(k) abs(f(x + i y))^(2) Im(g z)^(s) (dif x dif y)/(y^(2))
  $

  Since $y^(k) abs(f(x + i y))^(2)$ and $(dif x dif y)/(y^(s))$ is $SL(ZZ)$ invariant, $ integral_(D_(F)) y^(k) abs(f(x + i y))^(2) E(z, s) (dif x dif y)/(y^(2)) &= sum_(g in overline(T) backslash SL(ZZ))^() integral_(g^(-1)D_(F)) y^(k) abs(f(x + i y))^(2) y^(s) (dif x dif y)/(y^(2)) \
  &= integral_(D_(overline(T) slash SL(ZZ))) y^(k + s) abs(f(x + i y))^(2) (dif x dif y)/(y^(2)) \
  &= integral_(D_(overline(T) slash SL(ZZ))) y^(k + s) abs(sum_(n = 1)^(infinity) a_(f)(n) e(n(x + i y)))^(2) (dif x dif y)/(y^(2)) \
  &= integral_(0)^(1) integral_(0)^(oo) y^(k + s) abs(sum_(n = 1)^(infinity) a_(f)(n) e(n(x + i y)))^(2) (dif x dif y)/(y^(2)) \
  &= integral_(0)^(1) integral_(0)^(oo) y^(k + s) sum_(n = 1)^(infinity) sum_(m = 1)^(oo) a_(f)(n) overline(a_(f)(m)) e(n(x + i y)) overline(e(m(x + i y))) (dif x dif y)/(y^(2)) \
  &= integral_(0)^(1) integral_(0)^(oo) y^(k + s) sum_(n = 1)^(infinity) sum_(m = 1)^(oo) a_(f)(n) overline(a_(f)(m)) e(n(x + i y)) e(m overline((x + i y))) (dif x dif y)/(y^(2)) \ $
]

= Appendix
== Poisson Summation Formula
#theorem(name: "Poisson Summation Formula")[
  Let $phi: RR -> CC$ be a integrable, $C^(1)$ function such that

  $ sum_(n in ZZ)^() phi(n + z) $

  and $ sum_(n in ZZ)^() phi prime (n + z) $

  converge locally uniformly for $x in RR$. Then,

  $ sum_(n in ZZ)^() phi(n) = sum_(h in ZZ)^() hat(phi)(h) $

  where $ hat(phi)(t) = integral_(RR) phi(x) e(-x t) dif t $

  is the *Fourier Transform* of $phi$.
]<PoissonSummationFormula>
#proof[
  Let $f: RR -> CC$ where $z -> sum_(n in ZZ)^() phi(z + n)$, so by the assumptions $f in C^(1)(RR)$; and $f in L^(1)(S^(1))$, by averaging. Thus,

  $ f(x) = sum_(h in ZZ)^() hat(f)(h) e(h x) $

  where
  $
    hat(f)(h) & = integral_(0)^1 f(x) e(-h x) dif x \
    & = integral_(0)^1 sum_(n in ZZ)^() phi(x + n) e(-h x) dif x \
    & = sum_(n in ZZ)^() integral_(0)^(1) phi(x + n) e(-h x) dif x & "(By Dominated Convergence)" \
    & = sum_(n in ZZ)^() integral_(n)^(n + 1) phi(u) e(-h(u - n)) dif u & (u = x + n) \
    & = sum_(n in ZZ)^() e(h n) integral_(n)^(n + 1) phi(u) e(-h u) dif u & ("1 periodicity") \
    & = integral_(RR) phi(u) e(- h u) dif u & ("Countable additivity of Lebesgue Measure") \
    &= hat(phi)(h)
  $

  Thus,

  $ sum_(n in ZZ)^() phi(n) = f(0) = sum_(h in ZZ)^() hat(f)(h) = sum_(h in ZZ)^() hat(phi)(h) $


]

== Bruhat Decomposition of $SL(ZZ)$.

#theorem(name: [Bruhat Decomposition of $SL(ZZ)$])[
  $
    SL(ZZ) = (union.big.sq_(c >= 1) (union.big.sq_(d in ZZ^(times )_c) overline(T) mat(*, *; c, d) T)) union.sq overline(N)
  $<bruhatdecomp>

  Where $mat(*, *; c, d)$ is any _*fixed*_ element of $SL(ZZ)$ with $(c, d)$ as the bottom row.
]
#proof[
  Let $g in SL(ZZ)$, then $g in mat(alpha, beta; gamma, delta)$ where $alpha delta - beta gamma = 1$.

  If $gamma = 0$, then $g in overline(N)$. Suppose $gamma != 0$.

  + *$gamma >= 1$*: Let $n = (delta - delta mod gamma)/(gamma)$, thus $delta = d + gamma n$, where $d = delta mod gamma$. Note that since $(delta, gamma) = 1 => (d, gamma) = 1$. Note that

  $
    mat(alpha, beta; gamma, delta) mat(1, n; 0, 1) & = mat(alpha, alpha n + beta; gamma, gamma n + delta) \
    & = mat(alpha, alpha + beta n; gamma, d)
    &= mat(alpha prime, beta prime; c, d)
  $

  Let $mat(a, b; c, d)$ be the choice of fixed matrix with bottom row $(c, d)$ in the union above (@bruhatdecomp). Since

  $ a d - b c = 1 = alpha prime d - beta prime c => d (alpha prime - a) = c(beta prime - b) $

  and $(d, c) = 1$, $d | b prime - b$ and $c divides a prime - a$. Thus $a prime = m c + a$ and $beta = n d + b$. Thus, $d m c = c n d => m = n$. Thus $a prime = m c + a$ and $beta = m d + b$.

  $
    mat(1, m; 0, 1)mat(a, b; c, d) & = mat(alpha prime, beta prime; c, d) = mat(alpha, beta; gamma, delta) mat(1, n; 0, 1)
  $

  Thus,

  $ mat(alpha, beta; gamma, delta) = mat(1, m; 0, 1)mat(a, b; c, d) mat(1, -n; 0, 1) in T mat(a, b; c, d) T $

  2. *$gamma <= 1$ *: $-g in overline(T) mat(a, b; c, d) T => gamma in overline(T) mat(a, b; c, d) T$


  Since $(m ,n)$ were unique, the union is disjoint.
]

#corollary[
  Let $phi: HH -> CC$ be any function such that $ sum_(overline(T) slash SL(ZZ))^() (phi|_(k) g)(z) $
  converges absolutely, then

  $
    sum_(overline(T) slash SL(ZZ))^() (phi|_(k) g)(z) &= phi(z) + sum_(c >= 1)^() sum_(d in ZZ^(times )_(c))^() sum_(m in ZZ)^() (phi(mat(*, *; c, d) mat(1, m; 0, 1) z) )/((c(z + m) + d)^(k))
  $
]<rewritingsumcorollary>

== Gamma Function Properties
#proposition[
  $
    integral_(Im(w) = y) w^(-k) e(-w) dif w = ((2 pi)^(k))/(i^(k)) (1)/(Gamma(k))
  $
]<gammaproperty1>

#proposition[
  $ integral_(0)^(oo) e^(- pi n^(2) x) x^((s)/(2) - 1) dif x = pi^(-(s)/(2)) Gamma((s)/(2)) n^(-s) $
]<gammaproperty2>
#proof[
  $
    integral_(0)^(oo) e^(- pi n^(2) x) x^((s)/(2) - 1) dif x & = integral_(0)^(oo) e^(- pi u) ((u)/(pi n^(2)))^((s)/(2) - 1) dif u "(substitute" u = pi n^(2) x ")" \
    &= n^(-s) pi^((-s)/(2)) integral_(0)^(oo) e^(- pi u) u^((s)/(2) - 1) dif u \
    &= n^(-s) pi^((-s)/(2))Gamma((s)/(2))
  $
]

== Equidistribution

#proposition(name: "Weyl Criterion")[
  If you have $mu_(n) -> mu$, it is enough to prove that $ integral_(X) f dif mu = lim_(n -> infinity) integral f dif mu_(n) $ is true for $f: X -> CC$ which are continous and span a dense subset of $cal(C)(X)$ which contains $1$.
]<WeylCriterion>

