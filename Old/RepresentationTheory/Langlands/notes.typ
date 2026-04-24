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
#let bigx = $times.circle.big$



#set text(lang: "en")
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")


= Adéles, Idéles, and Dirichlet Characters

Let $chi: (Zmod(N))^(times) -> CC^(times )$ be a character. Let $chi: Zmod(N) -> CC$ where $ chi(a) := cases(
  chi(a) "if" a in (Zmod(N))^(times) \
  0 "otherwise"
) $

#definition(name: "Dirichlet Character")[
  Let $chi: Zmod(N) -> CC$ be defined as above. $chi_N: ZZ -> CC$ where $n -> chi(n mod N)$ is a Dirichlet character mod $N$. Unless otherwise stated $chi_(A)$ denotes a Dirichlet character mod $A$.
]

Suppose $chi_(N)$ is a Dirichlet character mod $N$. From $chi_(N)$ we can get a Dirichlet character $chi_(M)$  mod M if $N divides M$. Define $chi_(M) := chi_(N) compose pi_(M, N)$ where $pi_(M, N) := (Zmod(M))^(times)-> Zmod(N)^(times)$. Thus we get the following Dirichlet character $chi_(M)$:

$
  chi_(M)(n) := cases(chi_(N)(n) "if" gcd(n, M) = 1 \ 0 "otherwise")
$

We can say that $chi_(M)$ is induced by $chi_(N)$. A Dirichlet character $chi_(N)$ is *primitive* if it isn't induced by any proper divisor $d < N$, and *imprimitive* is when it is induced. The *conductor* of a Dirichlet character $chi$ is the smallest positive integer such that it induces the Dirichlet character $chi$. The conductor is unique, and it is equal to N $<=>$  chi is primitive.

${Zmodx(N), pi_(M, N)}$ form a poset, in fact they form a inverse system over $(NN, |)$ :

1. $pi_(N, N) = 1_(N)$
2. Suppose $N | M | K$, then $pi_(K, N) = pi_(M, N) compose pi_(K, M)$

Define,

$
  hat(ZZ^(times)) := lim_(<-_(N)) (Zmod(N))^(times) = {(a_(N))_(N >= 1) in product_(N = 1)^(oo)Zmodx(N) mid(|) "for all" N divides M, pi_(M, N)(a_(M)) = a_(N) }.
$

Note $hat(ZZ^(times )) subset product_()^() Zmodx(N)$, and has the subspace topology of the product topology. $hat(ZZ^(times))$ is a compact (product of compact is compact and closed subset is compact), totally disconnected (each $Zmodx(N)$ is totally disconnected because discrete and thus the product is totally disconnected) topological group. Such a topology is called *profinite*. Furthermore every Dirichlet character $chi_(N)$ mod $N$ can be viewed as a _continous_ character from $hat(ZZ^(times))$ to $CC^(times)$ (compose with $pi_(N): hat(ZZ^(times )) -> Zmodx(N)$).

Define for a prime $p$:

$
  ZZ_(p) := lim_(<-_(n)) Zmod(p^(n)) &= {(a_(N))_(N >= 1) in product_(n = 1)^(oo)Zmod(p^(n)) mid(|) "for all" N divides M, pi_(p^(m), p^(n))(a_(m)) = a_(n) } \
  &= {alpha = alpha_(0) + alpha_(1) p + alpha_(2) p^(2) + #sym.dots.h mid(|) 0 <= alpha_(i) < p}
$

1. Inverse Limit $->$ Formal Power Series (P-adic expansion): Let $(a_(n)) in ZZ_(p)$. We will construct the digits of the p-adic expansion inductively.

  *Base Case*: Let $a_(1) = alpha_(0)$, viewing $a_(1)$ as the unique value in ${0, #sym.dots.h, p - 1}$.

  *Inductive Hypothesis*: Assume that for some $n$, we have $alpha_(k)$ for $k < n$ where $ a_(n) equiv sum_(i = 0)^(n - 1) alpha_(i) p^(i) mod p^(n) $

  *Inductive Step*: Since $a_(n + 1) equiv a_(n) mod p^(n)$, there is a unique $alpha_(n) in {0, #sym.dots.h, p - 1}$ such that, $ a_(n + 1) equiv (sum_(i = 0)^(n) alpha_(i) p^(i)) mod p^(n + 1). $ That is the choice of $alpha_(n + 1)$.


  This produces a unique sequence $(alpha_(n))_(n >= 0)$ since each choice for $alpha$  is unique and the formal series is

  $ alpha = sum_(i = 0)^(oo) alpha_(i) p^(i) $

2. Formal Power Series $->$ Inverse Limits: Let $alpha$ be a formal power series. Let $(a_(n) := alpha mod p^(n))$. This is a compatible sequence, and is in the inverse limit.

In fact, ring structure is preserved as well.

$ ZZ_p^(times) tilde.equiv {alpha in ZZ_(p) mid(|) a mod p != 0} $

Note that $ hat(ZZ^(times)) tilde.equiv product_(p "prime")^() ZZ_(p)^(times) $ because the isomorphism induced by chinese remainder theorem commutes with the maps in the inverse system.

We also have the p-adic numbers:

$ QQ_(p) := {alpha = sum_(i = v)^(oo) a_(i) p^(i) mid(|) 0 <= a_(i) < p, v in ZZ} $

Note the p-adic valuation is the index of the first nonzero element of the formal Laurent Series. Note $QQ subset QQ_(p)$ densely, similarly $ZZ subset ZZ_(p)$ .

#definition[
  P-adic valuation induces a absolute value on $QQ$, where $forall n in QQ$ let $v_(p)(n)$ be the p-adic valuation of $n$. Then $ abs(v)_(p) = p^(-v_(p)(n)). $
]

#definition[Let $abs(dot)_oo$ be the standard absolute value on $QQ$.]

These absolute values gives a different notion of closeness.

#example[Let $n = 1000 = 8 * 125 = 2^3 * 5^3$.
  1. $abs(n)_(infinity) = 1000$ so $n$ is pretty far from 0.
  2. $abs(n)_(2) = 2^(-3) = (1)/(8)$ so $n$ is close to 0 in $2$-adic absolute value.
  2. $abs(n)_(5) = 5^(-3) = (1)/(125)$ so $n$ is even closer to 0 in $5$-adic absolute value.
]

The different absolute values gives a different closure. The closure of $QQ$ with respect to $abs(dot)_(infinity)$ is $RR$. The closure fo $QQ$ with respect to $abs(dot)_(p)$ is $QQ_(p)$.

#definition[For a field $K$ (in our context $QQ$). Let $A$ be the set of absolute values $abs(dot) : K -> RR_(>=0)$ . Define the equivalence relation $~$  on $A$ where two absolute values are equivalent if they generate the same topology. The *places* of A is $lcoset(A, ~)$. A *place* of $K$ is the equivalence class of 1 absolute value.  ]

By #link("https://en.wikipedia.org/wiki/Ostrowski%27s_theorem", [Ostrowski's theorem]), the places of $QQ$ are *${abs(dot)_(infinity)} union {abs(dot)_p : p "prime"}$*. A key idea in number theory, is that one can deduce global properties of $QQ$ from local properties of $QQ$, which come from properties of its completion with respect to its various places. This principle is known as the local-to-global principle or #link("https://en.wikipedia.org/wiki/Hasse_principle", [Hasse's Principle]). One possible approach to this is to combine all the local information so we have a mathematical object that contains all the local information in a way that illuminates the broad behavior of $QQ$ while still respecting $QQ$'s global behavior. The naive way is to construct $ AA prime = RR times product_(p "prime") QQ_(p), $ but this set is too unwieldy an element in the set $alpha = (alpha_(infinity), alpha_(2), alpha_(3), alpha_(5), #sym.dots.h)$ is a product of completely independent components.

1. You can trivially embed $QQ subset AA prime$ where $alpha -> (alpha, alpha, #sym.dots.h)$, but this subgroup of $AA prime$ has no special or useful properties within the vastness of the full product. The product is so large that the relationships between rational numbers become trivial.
2. The topology also kinda sucks. For any useful tools of analysis to be applied you need to be locally compact. The direct product is not locally compact and thus becomes unworkable "wasteland." All the powerful machinery you want to use breaks down.

Okay so what do we do. For any $r in QQ$, $r = (p)/(q)$ where $gcd(p, q) = 1$. $q = s_(1)^(m_(1)) #sym.dots.h s_(n)^m_(n)$ for some n. So for all primes $t$  except $s_(1), #sym.dots.h, s_(n)$, $abs(q)_(t) = 1$, thus $d in ZZ_(t)$. Thus for all rationals, they are in $ZZ_(p)$ for all but finitely many primes. We want to capture this structure in our ring, so we can just enforce that.

$ AA = RR times rproduct(p " prime") ( QQ_(p)) $

#definition[$AA$ is the adele ring of $QQ$. The $rproduct(p "prime")$ denotes the restricted product, where $forall (a_(n)) in AA$ all but finitely many components of $(a_(n))$ must lie in $ZZ_(p)$. Let $ AA_(f) := rproduct(p " prime") ( QQ_(p)), $ thus $AA = RR times AA_(f)$.     ]

This gives us the needed structure for $QQ$. Now lets check the topology. The adele ring is given the restricted product topology. All basis sets of $AA$, look like $ U_(oo) times product_(p in S) U_(p) times product_(p in.not S) ZZ_(p) $ where $S$ is a finite set of primes, $U_(infinity) subset RR$ open, and $U_(p) subset QQ_(p)$ open. $ZZ_(p)$ is compact, and thus the product is compact. By combining with finite product of locally compact spaces $RR$ and $U_(p) subset QQ_(p)$, the basis set is locally compact. Thus $AA$ is locally compact. So it has the necessary topological data. Furthermore, $Q inc AA$, where $alpha -> (alpha, #sym.dots.h)$, but now its a discrete subgroup of $AA$.

#definition[The idele group of $QQ$ is the restricted product $ AA^(times) = rproduct(p "prime") QQ_(p)^(times) $ with respect to $ZZ_(p)^times$. Again there is the natural diagonal embedding of $QQ^(times) inc AA^(times)$.]

#theorem(name: "Decomposition of Adele Ring")[
  $ AA^(times) tilde.equiv QQ^(times) times RR_(+)^(times) times hat(ZZ^(times)) $ under this decomposition let $x = alpha t u$ for $alpha in QQ^(x), t in RR_(+)^(times), "and", u in hat(ZZ^(times))$.
]<DecompositionofAAx>
#proof[
  $forall alpha in AA^(times)$, $alpha = (alpha_(oo), alpha_(2), alpha_(3), #sym.dots.h)$. $alpha_(oo) in RR^(times)$ and $alpha_(oo) = "sgn"(alpha_(oo)) abs(alpha_(oo))$. Thus $ RR^times tilde.equiv RR_(>0)^(times) times {plus.minus 1} $.  For each prime $p$, $exists! (u_(p), k_(p)) in ZZ_(p)^(times) times ZZ$  such that $alpha_(p) := p^k u_(p)$. Thus $ QQ_(p) tilde.equiv p^ZZ times ZZ_(p)^(times) $

  But note that for $alpha$ for all but finitely many primes $alpha_(p) in ZZ_(p)^(times)$. Thus only finitely many $k_(p) != 0$. Thus the sequence $(p^(k_(p)))_(p "prime")$ is in $ plus.circle.big_(i = 0)^(oo) p^ZZ = {(p^(k_(p))) in product_(i = 0)^oo ZZ mid(|) k_(p) = 0 "for almost all" p } $

  Thus $ rproduct(p "prime") QQ_(p) & tilde.equiv rproduct(p "prime") ZZ times ZZ_(p)^(times) \
                             & tilde.equiv (product_(p "prime") ZZ_(p)^(times )) times plus.circle.big_(p "prime") p^ZZ \
                             & tilde.equiv hat(ZZ^(times)) times plus.circle.big_(p "prime") p^ZZ $

  Thus $ AA^(times) &tilde.equiv {plus.minus 1} times RR^(times)_(+) times hat(ZZ^(times)) times plus.circle.big_(p "prime") p^ZZ \
  &= ({plus.minus 1} times plus.circle.big_(p "prime") p^ZZ) times RR^(times)_(+) times hat(ZZ^(times)) \
  &= RR^(times)_(+) times QQ^(times) times hat(ZZ^(times)) $
]

From this decomposition we see that any Dirichlet Charatcer $chi$ defines a continous character $ omega: lcoset(AA^(times), QQ^(times)) -> CC^(x) $ where $omega(x) = omega(alpha t u)$ applying the decomposition equivalence and $omega(alpha t u) = chi(u)$.

#definition[$forall x in AA, x = alpha t u$, $abs(dot): AA -> RR_(>0)$ where $x = alpha t u -> abs(t)$ is a absolute value on $AA$.]

#definition[A *quasicharacter* of a group $G$ is a homomorphism from $G$ to $CC^(times)$.]

Any quasicharacter of $AA$ is of the form $omega abs(dot)^(s)$ for some $s in CC$. The Dirichlet characters are quasicharacters of finite order.

*Okay now here is the kicker:*
By Chinese Remainder theorem, $ Zmodx(N) = product_(p "prime") (Zmodx(p^(n_(p)))), $ any Dirichlet character, $chi_(N)$ has the factorization $ chi_(N) = times.circle_(p) (chi_(N))_(p) $ where $(chi_(N))_(p)$ is the induced Dirichlet in $Zmodx(p^(n))$. This gives rise to the factorization, $chi = times.circle_(p) chi_(p)$ of the corresponding character $chi$ of $hat(ZZ^(times))$. Note that for each place $v$ of $QQ$, there is a natural inclusion $QQ_(v) inc rcoset(AA^(x), QQ^(x))$, $x_(v) -> (#sym.dots.h, 1, 1, x_(v), 1, 1, #sym.dots.h)$. Thus any quasicharacter $omega$ determines quasicharacters $omega_(v)$  of each $QQ^(times)_v$. Thus there is a factorization $omega = times.circle_(v) omega_(v)$.


#theorem(name: [Strong Approximation Theorem for $QQ$])[
  Let $S$ to be finite set of primes. Let $f: S -> QQ$ where $s -> a_(s)$. $forall epsilon > 0$, $exists a in QQ$ such that $abs(a - a_(s))_(s) < epsilon$ and $abs(a)_(p) <= 1$ ie $a in ZZ_(p)$ for all $p in.not S$.
]<StrongApproximationTheoremforQ>
#proof[
  Let $S$ and $f$ be defined as above. $forall a_(s)$, $a_(s) = b_(s)/c_(s)$, $b_(s) , c_(s) in ZZ$ such that $gcd(b_s, c_s) = 1$. The idea, to ensure $abs(a)_p <= 1$ for all $p in.not S$, $a$ has to be of the form $(x)/(D)$ (wlog $gcd(x, D) = 1$) where $D = product_(s in S) s^(K_s)$. $forall s in S$, let $ K_s := max(v_p (c_p) : p in S) $ where $v_(s)$ is the s-adic valuation. $forall s in S$, $v_s (D a_()) = v_(s)(D) + v_(s)(a_p) = v_(s)(D) + v_(s)(b_s) - v_(s)(c_s) >= v_(s)(b_s) >= 0$. Let $b_(s)prime = D a_(s)$ which is now a s-adic integer. Thus $forall z in ZZ$,  $z - b_(s)prime$ is a s-adic integer and $abs(z - b_s prime)_s <= 1$ , thus $exists N_s in NN$ such that $forall n >= N_(s)$ $ z - b_s prime & equiv 0 mod s^(n) \
              x & equiv b_s prime mod s^n $

  $forall (n_s)_(s in S) in NN^(S) in.rev n_(s) >= N_(s)$. By Chinese Remainder Theorem, $exists x$ solution to $ x & equiv b_s_(1) prime mod s_1^(n_(s_(1))) \
    & dots.v \
  x & equiv b_(s_(|S|)) prime mod s_(|S|)^(n_(s_(|S|))) $

  Thus, $abs(x - s)_(s) = s^(-n_(s)) <= s^(-N_(s))$.

  $forall epsilon > 0$, $forall s in S$ $exists N_(s) in NN in.rev s^(-N_(s)) < epsilon |D|_(s) = epsilon s^(-K_(s))$. Take $N = max(N_(s) mid(|) s in S)$. Let $x$ be the solution to the above system with the tuple $(N, #sym.dots.h, N)$. Let $a = (x)/(D)$.  Thus,

  $
    abs(a - a_(s))_(s) = (abs(x - D a_(s))_(s) )/(abs(D)_(s)) = (abs(x - b_(s) prime)_(s) )/(abs(D)_(s)) & <= (s^(-N))/(abs(D)_(s) ) < epsilon
  $

  Additionally, since D is only divisible by primes in $S$, $forall p in.not S, v_(p)(D) = 0$. Thus $v_(p)(a) = v_(p)(x) - v_(p)(D) = v_(p)(x) >= 0$. Thus $abs(a)_(p) <= 1$.
]

#corollary(name: "Strong Approximation Theorem for Adeles")[
  The image of the diagonal embedding $QQ inc AA_(f)$ ($q -> (q, q, #sym.dots.h)$ ) is dense.
]
#proof[
  To show that the $QQ$ is dense under the diagonal embedding we have to show that it intersects with every open set. It suffices to show this for all basis open sets $U$.
  As described above, $forall U$ a element of the basis of the topology of $AA$ $exists S subset PP$ finite such that $ U = (product_(p in S)^() B(a_(s), epsilon)) times (product_(p in PP - S) ZZ_(p)). $ This is slightly different that what it is above (for each $s in S$ we had opens $U_(s) subset QQ_(s)$ but we can just take $epsilon_(s)$ balls as they are basis sets of the topology of $QQ_(s)$ and then just use the same $epsilon$ for all $s$, we also had a open set from $RR$ which we don^t need anymore because we are looking at $AA_(f)$). By @StrongApproximationTheoremforQ, $exists q in QQ$ such that $abs(q)_(s)$ and $abs(q)_(p) <= 1$ ($q in ZZ_(p)$) for all $(s, p) in (S, PP - S)$. Thus $q in U inter QQ$. Thus $QQ$ is dense in $AA_f$, you can extend this to $QQ^(x) subset AA^(x)$ under the same diagonal map.
]

*Why is it natural to factor through $lcoset(AA^(times), QQ^(times))$ rather than say $AA^(times)$ or $lcoset(AA^(times), (QQ^(times) times RR_(>0)^(times)))$?*

The adele ring $AA$ and $AA^(times)$ hold all local information of $QQ$, with all its completions simultaneously. However as shown $QQ inc AA$ and $QQ^(times) inc AA^(times)$ naturally with the diagonal map which acts in a "global" way. When we form the quotient $lcoset(AA^(times), QQ^(times))$ , we are essentially saying: "Let's consider all the local data, but let's identify any two ideles if they differ only by multiplication by a global number." This procedure filters out the "trivial" global structure to isolate the interactions and relationships between the different local components that are not already explained by the global field $QQ$ itself. Thus factoring through $AA$ doesn't make sense because the arithmetic behavior becomes obsured. Now what about, $lcoset(AA^(times), (QQ^(times) times RR_(>0)^(times)))$. While Dirichlet characters are finite order and act trivially on $RR_(>0)^(times)$ not all quasicharacters are finite order and thus act nontrivially on $RR_(>0)^(times)$ as shown above.

= From Modular Forms to Automorphic Representations
Much like the correspondence between $chi_(N)$ Dirichlet characters mod $N$ and quasicharacters $omega: lcoset(AA^(times), QQ^(times)) -> CC^(times)$, there exists a very similar correspondence as we increase dimensions. Here is some stuff which carries over:

1. There is a factorization of characters: For a automorphic representation $pi$ of $GL(AA, 2)$, $pi$ will have the factorization $ pi = times.circle_(v) pi_(v) $ where $v$ is over the places of $QQ$.
2. Furthermore, just like there are many Dirichlet characters for each quasicharacter, there is a distinguished one which is the primitive Dirichlet character, a similar situation happens in $GL(AA, 2)$. There are infinitely many modular forms $f$ corresponding to a automorphic representation of $GL(AA, 2)$ but there is a unique distinguished primitive form, called a new form.

Okay so what are the differences, the representation $pi$ and its local components (factors) $pi_(v)$ may be infinite dimensional so the representation is much more complicated. Furthermore $pi$ can be realized in the "action" of $GL(AA, 2)$ by right translations of functions of $lcoset(GL(AA, 2), GL(QQ, 2))$.

#definition[
  For $k > 2$ even integer. Let $f in S_(k)(Gamma_(0)(N), chi_(N))$ where $chi_(N)$ is a Dirichlet character mod N. Thus $f$ is a holomorphic cusp for where $forall mat(a, b; c, d) in Gamma_(0)(N) = {mat(a, b; c, d) mid(|) c equiv 0 mod N }$ and $forall z in HH$, $ f((a z + b)/(c z + d)) & = chi(d)(c z + d)^(k)f(z) $ and the Fourier expansion of $f$ is $ f(x) := sum_(n = 1)^(oo) a_(n) e(n z). $
]

#definition[
  Let $G$ be the function of the space of fields to the space of all groups of invertible matrices of 2 dimensions such that $F -> GL(F, 2)$. Thus $G(AA) = GL(AA, 2)$.
  Let $G_(v)$ be defined as follows:

  $
    G_(v) := cases(
      GL(RR, 2) "if" v = oo,
      GL(QQ_(p), 2) "if" QQ_(v) = QQ_(p)
    )
  $
]

$
  G(AA) := G(RR times AA_(f) ) tilde.equiv G(RR) times G(rproduct(p in PP) QQ_(p) ) = G(RR) times rproduct(p in PP)G(QQ_(p))
$

where the restricted product is taken with respect to the subgroups $K_(p) := G(ZZ_(p)) subset G(QQ_(p))$. $G(RR)$ and $G(AA_(f))$ is a locally compact topological group and $ K = product_(p in PP) K_(p) <= G(AA_(f)) $<standardcompactopen> is a compact open subgroup. Finally just like the 1d case, $G(QQ) inc G(AA)$ where $gamma -> (gamma, gamma, #sym.dots.h)$ under the diagonal embedding, furthermore under the inclusion $G(QQ) < G(AA)$ is a discrete subgroup. We get a similar construction with $SL$.



#lemma[
  Suppose $forall S subset PP$, $forall s in S$ we are given $g_(s) in SL(QQ_(s), 2)$. There $exists gamma in SL(QQ, 2)$ such that:

  1. All the matrix entries of $gamma$ lie in $ZZ_(p)$ for $p in.not S$
  2. For each $p in S$, $gamma^(-1) g_(p) in SL(ZZ_(p), 2)$
]<strongapproxlemma>
#proof[
  Base Case: Suppose $S = {p}$. Let $QQ_((p))$ be the ring of rationals with powers of $p$ in the denominator. For $q != p$, $QQ_((p)) subset QQ_(q)$ also lies in $ZZ_(q)$. Thus if we find a $gamma in SL(QQ_((p)), 2)$ that satisfies condition 2, we automatically satify condition 1 as well. Let $g = g_(p)$. By the Elementary divisors theorem for $M_(2)(QQ_(p))$, $exists delta_(1), delta_(2)$ such that $ g = delta_(1) d delta_(2) $ where $d = "diag"(p^(m), p^(-m))$ for some $m >= 0$. By that $SL(ZZ, 2) ->> SL(Zmod(p), 2)$, $exists gamma_(i)$ such that $ gamma_(i) equiv delta_(i) mod p^(2 m). $ Let $gamma = gamma_(1) d gamma_(2)$.

  Then $ gamma^(-1) d = (gamma_(1) d gamma_(2))^(-1) (delta_(1) d delta_(2)) equiv I mod p^(2 m). $ Thus $gamma^(-1) g in SL(ZZ_(p), 2)$.

  Inductive Hypothesis: Assume for some $n$ that $forall S subset PP in.rev |S| = n$ and for all choices of $g_(p)$ for $p in S$, that $exists g in SL(QQ, 2)$ that the conditions of the theorem hold.

  Inductive Step: Let $S = {p} union {p_(1), #sym.dots.h, p_(n)} subset PP$ and let $p -> g$ and $p_(i) -> g_(i)$ where $g in SL(QQ_(p), 2)$ and $g_(i) in SL(QQ_(p_(i)), 2)$. By the base case, $exists gamma_(1)$ such that $gamma_(1) in SL(ZZ_(q), 2)$ for $q != p$. By the inductive hypothesis $exists gamma_(2)$ for $S = {p_(1), #sym.dots.h, p_(n)}$ and ${gamma_(1)^(-1) g_(1), #sym.dots.h, gamma_(1)^(-1) g_(n)}$. Let $gamma = gamma_(1) gamma_(2)$, thus $gamma in SL(ZZ_(q), 2)$ for all $q in.not S$. Furtheremore, $     gamma^(-1) g = gamma_(2)^(-1) gamma_(1)^(-1) g & in SL(ZZ_(p), 2) \
  gamma^(-1) g_(i) = gamma_(2)^(-1) gamma_(1)^(-1) g & in SL(ZZ_(p_(i)), 2) $

  Thus this holds for all finite sets $S$ and all choices of $g_(p)$ for $p in S$.
]
#theorem(name: [Strong Approximation for $SL(QQ, 2)$])[
  Suppose $forall S subset PP$, $forall s in S$ we are given $g_(s) in SL(QQ_(s), 2)$ and $n_(p) in NN_(0)$. There $exists gamma in SL(QQ, 2)$ such that:

  1. All the matrix entries of $gamma$ lie in $ZZ_(p)$ for $p in.not S$
  2. For each $p in S$, $gamma^(-1) p in SL(ZZ_(p), 2)$ and $gamma^(-1) g_(p) equiv I mod p^(n_(p))$
]<StrongApproximationforSL2Q>

#proof[
  By @strongapproxlemma, $exists eta in SL(QQ, 2)$ such that:

  1. All the matrix entries of $eta$ lie in $ZZ_(p)$ for $p in.not S$
  2. For each $p in S$, $eta^(-1) g_(p) in SL(ZZ_(p), 2)$

  Let $N = product_(p in S)^() p^(n_(p))$. By Chinese Remainder Theorem, $ SL(Zmod(N), 2) tilde.equiv product_(p in S) SL(Zmod(p), 2). $ Thus $exists! overline(h) in SL(Zmod(N), 2)$ such that $ overline(h) equiv eta^(-1) g_(p) mod p^(n_(p)) $ for all $p in S$.  Furthermore since the quotient map $SL(ZZ, 2) ->> SL(Zmod(N), 2)$ is surjective, then $exists h in SL(ZZ, 2)$ such that $h ->> overline(h)$ and satisfies all the same congruences. Let $gamma = eta h$ and since $h$ is a integral matrix $gamma in SL(ZZ_(p), 2)$ for all $p in.not S$. $forall p in S$,

  $
    gamma^(-1) g_(p) = (eta h)^(-1) g_(p) = h^(-1) eta^(-1) g_(p) equiv g_(p)^(-1) eta eta^(-1) g_(p) mod p^(n_(p)) = I mod p^(n_(p)).
  $

  Thus $gamma$ is the needed member of $SL(QQ, 2)$.

]
#theorem[
  Suppose that for each prime $p$ we have a compact open $K_(p) subset SL(Q_(p), 2)$ where for almost all primes $K_(p) = SL(ZZ_(p), 2)$. Let $K_(f) = product_(p in PP) K_(p)$. Then $ SL(AA, 2) = SL(QQ, 2) dot (SL(RR, 2) times K_(f)) $ or equivalently $SL(QQ, 2) times SL(RR, 2)$ is dense in $SL(AA, 2)$.
]<StrongApproximationforSL2A>
#proof[
  $forall g = (g_(oo), (g_(p))_(p in PP)) in SL(AA, 2)$. We want to find a $gamma in SL(QQ, 2)$ such that $gamma^(-1) g in SL(RR, 2) times K_(f)$. We have 2 conditions (1 is trivial):

  1. $gamma^(-1) g_(oo) in SL(RR, 2)$. This is always true since $SL(QQ, 2) subset SL(RR, 2)$.
  2. $(gamma^(-1) g)_(f) = (gamma^(-1) g_(p))_(p) in K_(f)$ so $gamma^(-1) g_(p) in K_(p)$ for all primes.

  Let $S = {p in PP mid(|) K_(p) != SL(ZZ, 2)} union {p in PP mid(|) g_(p) in.not K_(p)}$, both sets are finite, thus $S$ is finite. For any compact open subgroup $K$  of $SL(QQ_(p), 2)$, $exists n_(p) in NN$ such that $ {A in SL(ZZ_(p), 2) mid(|) A equiv I mod p^(n_(p))} subset K. $ Thus for each $p in S$, $exists n_(p) >= 1$. By @StrongApproximationforSL2Q, $exists gamma in SL(QQ, 2)$ such that:

  1. $gamma in SL(ZZ_(q), 2)$ for $q in.not S$.
  2. $gamma^(-1) g_(p) in SL(ZZ_(p), 2)$ and $gamma^(-1) g_(p) equiv I mod p^(n_(p))$ for $p in S$.

  For $p in S$, the second condition on $gamma$ tells us that $gamma^(-1) g_(p) in K_(p)$. For $p in.not S$ then $p in.not {p in PP | K_(p) != SL(ZZ, 2)} => K_(p) = SL(ZZ, 2)$ and since $p in.not {p in PP mid(|) p in.not K_(p)}$ that means $g_(p) in K_(p) = SL(ZZ, 2)$. By the first condition on $gamma$, we know $gamma in SL(ZZ_(p), 2)$. Thus $gamma_(p)^(-1) g_(p) in K_(p) = SL(ZZ, 2)$. Thus $ gamma^(-1) g in SL(RR, 2) times K_(f) => g in gamma dot (SL(RR, 2) times K_(f)). $ Thus $ SL(AA, 2) = SL(QQ, 2) dot (SL(RR, 2) times K_(f)). $
]

#corollary[
  Let $K_(f)$ be a compact open subgroup of $AA_(f)$. Let $Gamma_(K_(f)) = SL(QQ, 2) inter (SL(RR, 2) times K_(f) )$ where $SL(QQ, 2)$ is viewed as a diagonal embedding into $SL(AA, 2)$. Then $ rcoset(Gamma_(K_(f)), SL(RR, 2)) <-> doublecoset(SL(QQ, 2), SL(AA, 2), K_(f)). $
]<doublecosetofSL>
#proof[
  Note, $ rcoset(Gamma_(K_(f)), SL(RR, 2)) & <-> doublecoset(Gamma_(K_(f)), SL(RR, 2) times K_(f), K_(f)) <-> doublecoset(SL(QQ, 2), SL(QQ, 2) dot (SL(RR, 2) times K_(f)), K_(f)) $

  Where the last bijection comes from the fact that $forall H, K <= G$, $rcoset(H inter K, K) <-> rcoset(H, H dot K)$. Finally by @StrongApproximationforSL2A,

  $ doublecoset(SL(QQ, 2), SL(QQ, 2) dot (SL(RR, 2) times K_(f)), K_(f)) <-> doublecoset(SL(QQ, 2), SL(AA, 2), K_(f)). $
]



#corollary[
  Suppose that $H subset G(AA_(f))$ is a compact open subgroup such that $det(H) = hat(ZZ^(times))$. Then $ G(AA) = G(QQ) times G(RR)^(+) times H $ and $ doublecoset(G(QQ), G(AA), H) tilde.equiv rcoset(Gamma, G(R)^(+)) $  where $G(RR)^(+) := {g in G(RR) mid(|) det(g) > 0}$ and $Gamma = G(QQ) inter (G(RR^(+)) times H) <= G(RR)^(+)$ via projection into the archemedian component.
]
#proof[
  Note $det: G(AA) ->> AA^(times) tilde.equiv QQ^(times) RR^(times)_+ hat(ZZ^(times))$. We will match the determinants, $det(G(QQ)) = QQ^(times)$. By the assumption on $H$, $det(G(RR)^(+) times H) = RR^(times)_+ times QQ^(x)$. Take $g in G(AA)$, by the decomposition of $AA^(times)$, $det(g) = alpha beta$ for $alpha in QQ^(times)$, $beta in RR^(times)_+ times hat(ZZ^(times))$. Let $q in det^(-1)(alpha)$ and $x in det^(-1)(beta)$. Let $g prime = q^(-1) g x^(-1)$. $det(g prime) = det(q)^(-1) det(g) det(x)^(-1) = alpha^(-1) alpha beta beta^(-1) = 1$. Thus $g prime in SL(AA, 2)$. By @StrongApproximationforSL2A, $g prime = gamma y$ for $gamma in SL(QQ, 2)$ and $y in (SL(RR, 2) times K_(f))$ where $K_(f) = H inter SL(AA_(f), 2)$. Thus $y in SL(RR, 2) times (H inter SL(AA_(f), 2))$. Thus $g = q g prime x = q gamma y x$, $q, gamma in G(QQ) => q gamma in G(QQ)$ and $y, x in G(RR)^(+) times H => y x in G(RR)^(+) times H$. Thus $ G(A) = G(QQ) dot (G(RR)^(+) times H) $.

  By almost exactly the same argument as @doublecosetofSL, the statement holds for the double coset.
]

#example[
  Take $ H = K = rproduct(p in PP) K_(p). $ where $K_(p) = GL(ZZ_(p), 2)$.  Then $ Gamma = G(QQ) inter (G(RR)^+ times H) & tilde.equiv G(QQ) inter (G(RR)^(+) times rproduct(p in PP) GL(ZZ_(p), 2) ) \
                                        & = G(QQ)^(+) times (G(QQ)^(+) inter rproduct(p in P) GL(ZZ_(p), 2)) $

  $forall mat(a, b; c, d) in G(QQ)^(+) inter GL(ZZ_(2), 2) inter GL(ZZ_(3), 2) inter #sym.dots.h$ that means, $a, b, c, d in ZZ_(p)$ for all $p in PP$. Additionally it means $det(mat(a, b; c, d)) = a d - b c in ZZ_(p)times$ for all $p$. That implies $a d - b c = plus.minus 1$ and since the determinant is positive, that means $a d - b c = 1$.

  Thus $ Gamma = SL(ZZ, 2) times product_(p in PP)^() SL(ZZ, 2) tilde.equiv SL(ZZ, 2), $ again passing through the diagonal embedding.
]



#example[
  Take $ H = K_(0)(N) = {mat(a, b; c, d) in G(ZZ) mid(|) c equiv 0 mod N}. $ Note $H in G(ZZ_(p))$ for all $p in PP$.

  $
    Gamma & = G(QQ) inter (G(RR)^(+) times product_(p in PP)^() H ) \
          & = G(QQ)^(+) times product_(p in PP)^() (G(QQ)^(+) inter H) \
          & = G(ZZ)^(+) times product_(p in PP)^() (G(ZZ) inter H) \
          & = Gamma_(0)(N) times product_(p in PP)^() Gamma_(0)(N) tilde.equiv Gamma_(0)(N)
  $
]

#definition[
  There exists a surjective homomorphism from $K_(0)(N) ->> Zmodx(N)$ where $ mat(a, b; c, d) ->> a mod N $ so a Dirichlet character $chi_(N)$ defines a character $chi$ of $K_(0)(N)$.
]

$G(RR)^(+)$ acts on $HH$ by Mobius transformations and its center $Z(G(RR)^(+)) = Z_(infinity) := {z I : z in RR^(times)}$ acts trivially.

#definition[
  Let $j_(k): G(RR)^(+) times HH -> CC$ where $ j_(k)(g = mat(a, b; c, d), z) := (det(g))^((-k)/(2)) (c z + d)^(-k). $
]

#lemma[
  $forall g_(1), g_(2) in G(RR)^(+)$ and $forall z in HH$,

  $ j_(k)(g_(1) g_(2), z) $
]
<cyclicpropertyofjkfunction>
#proof[
  $forall mat(a_(1), b_(1); c_(1), d_(1)), mat(a_(2), b_(2); c_(2), d_(2)) in G(RR)^(+)$,

  $ g_(1) g_(2) = mat(*, *; c_1a_2 + d_1 c_2, c_1 b_2 + d_1 d_2) $

  $
    j_(k)(g_1 , g_2 z) j_(k)(g_2, z) & = (c_(1)((a_(2) z + b_(2))/(c_(2) z + d_(2))) + d_(1))^(-k) (c_(2) z + d_(2))^(-k) \
    & = (c_(1)(c_(2) z + d_(2)) ((a_(2) z + b_(2))/(c_(2) z + d_(2))) + d_(1)(c_(2) z + d_(2)))^(-k) \
    &= (c_(1) (a_(2) z + b_(2)) + d_(1)(c_(2) z + d_(2)))^(-k) \
    &= ((c_(1) a_(2) + d_(1) c_(2)) z + (c_(1) b_(2) + d_(1) d_(2)))^(-k) = j_(k)(g_(1) g_(2), z)
  $
]


$forall g in G(RR)^(+)$ and $z in RR^(x)$, $ j(z g, tau) & = (det(z g))^((-k)/(2))(z c z + z d)^(-k) \
            & = z^(-k) det(g)^(-(k)/(2)) z^(k) (c z + d)^(-k) \
            & = (z)/(abs(z)) j(g, z) $

Furthermore, $k_(theta) = mat(cos(theta), sin(theta); -sin(theta), cos(theta)) in SO(2) =: K_(infinity)^(+) subset G(RR)^(+)$, the maximal compact subgroup of $G(RR)^(+)$.

#lemma[
  $Z_(oo)K_(oo)^(+)$ is the stabilizer of $i$.
]
#proof[
  Let $mat(a, b; c, d) in G(RR)^(+)$ stabilize $i$. Thus $ (a i + b)/(c i + d) = i & => a i + b = d i - c \
                          & => a = d and b = -c $


  Thus $ mat(a, b; -b, a) dot i = i $. Let $k = det(mat(a, b; -b, a))$. Let $ mat(q, r; -r, q) = (1)/(k)mat(a, b; -b, a) => mat(q, r; -r, q) in SL(RR, 2) $

  $mat(q, r; -r, q) in SO(2)$, by definition. Thus $mat(a, b; c, d) = (1)/(k) I mat(q, r; -r, q) in Z_(oo)K_(oo)^(+)$. Thus $Stab(G(RR)^(+), i) subset Z_(oo)K_(oo)^(+)$.

  $forall lambda I in Z_(oo)^(+)$ and $forall k_(theta) in K_(oo)^(+)$,

  $
    (lambda I k_(theta)) i &= (cos(theta) i + sin(theta))/(- sin(theta) i + cos(theta)) (cos(theta) + i sin(theta))/(cos(theta) + i sin(theta)) \
    &= (cos(theta)^(2) i - cos(theta) sin(theta) + cos(theta) sin(theta) + i sin(theta))/(1) \
    &= (cos(theta)^(2) + sin(theta)^(2)) i = i
  $

  Thus $Stab(G(RR)^(+), i) = Z_(oo)K_(oo)^(+)$.
]

Additionally,

$
  j_(k)(lambda k_(theta), i) & = ((lambda)/(abs(lambda)))^(-k) (-sin(theta) i + cos(theta))^(-k) = (lambda)/(abs(lambda) )e^(i k theta)
$

#definition[
  For $f in S_(k)(Gamma_(0)(N), chi_(N))$, let $phi = phi_(f) := G(RR)^(+) -> CC$ where $ phi(g) = phi_(f)(g) = j_(k)(g, i) f(g i) $
]


#lemma[
  1. For $gamma in Gamma_(0)(N)$ and $g in G(RR)^(+)$ , $ phi(gamma g) = phi(g) chi_(N)(d) $
  2. $forall lambda k_(theta) in Z_(oo) K_(oo)^(+)$ and $forall g in G(RR)^(+)$
  $ phi(g lambda k_(theta)) = ((lambda)/(abs(lambda)))^(-k) phi(g) e^(i k theta) $
]<automorphywithrespecttoscalingandrotation>
#proof[
  1. $phi(gamma g) = j_(k)(gamma g, i)f(gamma g i) = j_(k)(gamma g, i) j_(-k)(gamma, g i) chi_(N)(d) f(g i)$. By @cyclicpropertyofjkfunction, $ phi(gamma g) = j_(k)(gamma, g i) j_(k)(g, i) j_(-k)(gamma, g i) chi_(N)(d) f(g i) = chi_(N)(d) phi(g) $
  2. $
      phi(g lambda k_(theta)) & = j_(k)(g lambda k_(theta), i) f(g lambda k_(theta) i) \
                              & = j_(k)(g lambda k_(theta), i) f(g i) \
                              & = j_(k)(g, lambda k_(theta) i) j_(k)(lambda k_(theta), i) f(g i) \
                              & = phi(g) ((lambda)/(abs(lambda)))^(-k) e^(i k theta)
    $
]

You can extend $phi$ to a function on $G(AA)$ using the coset decompositon where $H = K_(0)(N )$  by setting $ phi(g) = phi(gamma g_(oo) k) = phi(g_(oo))chi(k). $ This was all done without considering the fact that $f$ is holomorphic.

#lemma[
  A smooth function $f: HH -> CC$ with the modularity property of $Gamma_(0)(N)$ and $chi_(N)$ is holomorphic if and only if $phi_(f)$ satisfies $X_(-)phi= 0$ (Lie algebra action) where $ X_(plus.minus) = (1)/(2)mat(1, plus.minus i; plus.minus i, -1) $
]
#proof[
  The real lie algebra $ frak(g)_(0) = "Lie"(G(RR)) = M_(2)(RR) $ acts on smooth functions on $G(RR)^(+)$ by $ X psi(g_(oo)) = (dif)/(dif t) {psi(g_(oo) exp(t X))}|_(t = 0). $

  For example $X = mat(0, 1; -1, 0)$, then
  $
    exp(t X) & = sum_(n = 0)^(oo) (1)/(n!) t^(n) mat(0, 1; -1, 0)^(n) \
    & = sum_(n = 0)^(oo) ((t^(4n))/((4n)!) I + t^(4n + 1)/((4n + 1)!)mat(0, 1; -1, 0) - (t^(4n + 2))/((4n + 2)!)I - t^(4n + 3)/((4n + 3)!)mat(0, 1; -1, 0)) \
    &= I sum_(n = 0)^(oo) (t^(2n) (-1)^(n))/((2n)!) + mat(0, 1; -1, 0) sum_(n = 0)^(oo) (t^(2n + 1))/((2n + 1)!)(-1)^(n) \
    &= cos(t) I + sin(t) mat(0, 1; -1, 0) = k_(t) in K_(oo)^(+)
  $

  By @automorphywithrespecttoscalingandrotation,
  $ phi(g_(oo) exp(t X)) = phi(g_(oo) k_(t)) = phi(g_(oo))(e^(i t))^(k) $

  Thus $ X phi(g_(oo)) = (dif )/(dif t){phi(g_(oo))(e^(i t))^(k)}|_(t = 0) = phi(g_(oo)) (dif)/(dif t) {e^(i k t)}|_(t = 0) = i k phi(g_(oo)). $ This action of $frak(g)_(0)$ can be extended to $frak(g) = frak(g)_(0) times.circle_(RR) CC$ by setting $(X + i Y) phi = X phi + i Y phi$.

  Let $X_(plus.minus)$ be defined as above. By checking the matrx multiplication we see $ k_(theta)X_(plus.minus) k_(theta)^(-1) = e^(plus.minus 2 i theta) X_(plus.minus) $

  $
    X_(plus.minus) phi(g_(oo) k_(theta)) & = (dif)/(dif t) {phi(g_(oo) k_(theta) exp(t X_(plus.minus)))} |_(t = 1) \
    & = (dif)/(dif t) {phi(g_(oo) exp(t k_(theta) X_(plus.minus) k_(theta)^(-1) k_(theta)))} |_(t = 0) \
    &= (dif)/(dif t) {phi(g_(oo) exp(t k_(theta) X_(plus.minus) k_(theta)^(-1))) k_(theta)} |_(t = 0) \
    &= (dif)/(dif t) {phi(g_(oo) exp(t e^(plus.minus 2 i theta) X_(plus.minus)) k_(theta))} |_(t = 0) \
    &= (dif)/(dif t) {phi(g_(oo) exp(t e^(plus.minus 2 i theta) X_(plus.minus))) e^(i k theta)} |_(t = 0) \
  $

  Last equality comes from @automorphywithrespecttoscalingandrotation. Let $s = t e^(plus.minus 2 i theta) => (dif)/(dif t) = (dif s)/(dif t) (dif)/(dif s) = e^(plus.minus 2 i theta) (dif)/(dif s)$

  Thus,

  $
    X_(plus.minus) phi(g_(oo) k_(theta)) & = e^(i k theta) e^(plus.minus 2 i theta) (dif)/(dif s) {phi(g_(oo) exp(s X_(plus.minus)))} |_(s = 0) = e^(i theta (k plus.minus 2)) X_(plus.minus) phi(g_(oo))
  $

  Thus $X_(+)$ increases the weight by 2 and $X_(-)$ decreases the weight by 2. Thus for the representations of $"GL"_(2)$ corresponding to holomorphic representations, $X_(-) phi = 0$ is the lowest weight vector condition and is equivalent to holomorphicity.

  Let $z = x + i y$. Let $ g_(z) = mat(y^((1)/(2)), x y^(-(1)/(2)); 0, y^(-(1)/(2))). $

  $ g_(z) dot i = (y^((1)/(2)) i + x y^(-(1)/(2)))/(y^(-(1)/(2))) = y i + x = z "and" j_(k)(g_(z), i) = y^((k)/(2)) $

  Let $X_(-) = A + B i$ where $A = (1)/(2) mat(1, 0; 0, -1)$ and $B = (1)/(2)mat(0, -1; -1, 0)$

  $
    (A phi)(g_z) & = (dif)/(dif t) {phi(g_(z) exp(t A))} |_(t = 0) \
                 & = (dif)/(dif t) {j_(k)(g_(z) exp(t A), i) f(g_(z) exp(t A) dot i)} |_(t = 0) \
    (B phi)(g_z) & = (dif)/(dif t) {phi(g_(z) exp(t B))} |_(t = 0) \
                 & = (dif)/(dif t) {j_(k)(g_(z) exp(t B), i) f(g_(z) exp(t B) dot i)} |_(t = 0) \
  $

  $
    g_(z) exp(t A) & = g_(z) mat(e^((t)/(2)), 0; 0, e^(-(t)/(2))) \
                   & = mat(y^((1)/(2)), x y^(-(1)/(2)); 0, y^(-(1)/(2)))mat(e^((t)/(2)), 0; 0, e^(-(t)/(2))) \
                   & = mat((e^(t) y)^((1)/(2)), x(e^(t) y)^(-(1)/(2)); 0, (e^(t) y)^(-(1)/(2)))
  $

  and

  $
    g_(z) exp(t B) & = g_(z) (sum_(n = 0)^(oo) (1)/(n!) t^(n) B^(n)) \
    & = g_(z) (sum_(n = 0)^(oo) ((1)/(2n!) t^(2n) I + (1)/((2n + 1)!) t^(2n + 1) B)) \
    & = g_(z) (I cosh t + B sinh t) \
    & = mat(y^((1)/(2)), x y^(-(1)/(2)); 0, y^(-(1)/(2)))mat(cosh(t), -sinh(t); -sinh(t), cosh(t)) \
    & = mat(y^((1)/(2)) cosh(t) - x y^(-(1)/(2)) sinh(t), x y^(-(1)/(2)) cosh(t) - y^((1)/(2)) sinh(t); -y^(-(1)/(2)) sinh(t), y^(-(1)/(2)) cosh(t))
  $

  Thus,

  $
    j_(k)(g_(z) exp(t A), i) f(g_(z) exp(t A) dot i) & = y^((k)/(2)) e^((k t)/(2)) f((e^((t)/(2)) y^((1)/(2)) i + x e^(-(t)/(2)) y^(-(1)/(2)))/(e^(-(t)/(2)) y^(-(1)/(2)))) \
    &= y^((k)/(2)) e^((k t)/(2)) f(e^(t) y i + x) = y^((k)/(2)) e^((k t)/(2)) f(x + i y e^(t))
  $

  and

  $
    j_(k)(g_(z) exp(t B), i) f(g_(z) exp(t B) dot i) & = y^((k)/(2))(cosh(t) + i sinh(t))^(-k) f((x y^(-(1)/(2)) cosh(t) - y^((1)/(2)) sinh(t) + i (y^((1)/(2)) cosh(t) - x y^(-(1)/(2)) sinh(t)))/(y^(-(1)/(2)) cosh(t) - i y^(-(1)/(2)) sinh(t)))
  $

  Thus,

  $
    (A phi)(g_z) & = (d)/(d t) {y^((k)/(2)) e^((k t)/(2)) f(x + i y e^(t))} |_(t = 0) \
    & = y^((k)/(2)) [(k)/(2) e^((k t)/(2)) f(x + i y e^(t)) + e^((k t)/(2)) (d)/(d t){f(x + i y e^(t))}]_(t = 0) \
    & = y^((k)/(2)) [(k)/(2) e^((k t)/(2)) f(x + i y e^(t)) + e^((k t)/(2)) ((diff f)/(diff y) (dif (y e^(t)))/(dif t))]_(t = 0) \
    &=y^((k)/(2)) [(k)/(2) e^((k t)/(2)) f(x + i y e^(t)) + e^((k t)/(2)) y e^(t) ((diff f)/(diff y))]_(t = 0) \
    &=y^((k)/(2)) [(k)/(2) f(z) + y ((diff f)/(diff y))(z)] \
  $

  and after a tedious calculation you get, $ (B phi)(g_(z)) = y^((k)/(2))[-y (diff f)/(diff x)(z) + (i k)/(2) f(z)] $

  Finally, $ (X_(-) phi)(g_(z)) &= [y^((k)/(2))((k)/(2) f(z) + y ((diff f)/(diff y))(z))] + i [y^((k)/(2))[-y (diff f)/(diff x)(z) + (i k)/(2) f(z)]] \
  &= y^((k)/(2))((k)/(2) f(z) - (k)/(2) f(z) + y ((diff f)/(diff y) - i (diff f)/(diff x))(z)) \
  &= y^((k)/(2) + 1)((diff f)/(diff y) - i (diff f)/(diff x))(z) \
  &= y^((k)/(2) + 1) (-i)((diff f)/(diff x) + i (diff f)/(diff y))(z) = -2 i y^((k)/(2) + 1) (diff f)/(diff overline(z))(z) $

  Thus we can prove the statement.

  Suppose $(X_(-) phi) = 0 => (X_(-) phi)(g_(z))$ for all $z in HH$. The identity derived above implies that $(diff f)/(diff overline(z))(z) = 0 => f$ is holomorphic.

  Suppose $f$ is holomorphic. Then by the above $(X_(-) phi)(g_(z)) = 0$ for all $z in HH$ and thus for all upper triangular matrices. Since you can decompose all $G(RR)$ as $K_(infinity) U$ and by identity above, $X_(-) phi = 0$.
]


#definition[
  Let $cal(A)_(0) := cal(A)_(0)("hol", k, N, chi)$ be the space of functions $phi$ on $G(A)$ with the following properties

  1. $forall gamma in G(QQ)$ and $k in K_(0)(N)$,

  $ phi(gamma g k) = phi(g) chi(k) $

  2. $forall g_(f) in G(AA_(f))$ the function $g_(oo) -> phi(g_(oo) g_(f))$ is smooth on $G(RR)^(+)$ invariant under $Z_(oo)^(+)$ and satisfies $ phi(g k_(theta)) = e^(i k theta) phi(g) $ and $ X_(-) phi = 0 $

  3. The function is cuspidal ie $ integral_(lcoset(AA, QQ)) phi(mat(1, x; 0, 1) g) dif x =0 $ for all $g in G(AA)$
]


#theorem[
  The map $f -> phi_(f)$ determines a isomorphism
  $ S_(k)(Gamma_(0)(N), chi) tilde.equiv cal(A)_(0)("hol", k, N, chi) $
]

Just for context, $forall phi in cal(A)_(0)$, $forall gamma in G(QQ)$ and $forall z in ZZ_(oo)^(+)$ and $forall g in G(AA)$, by previous lemmas we know:

$ phi(gamma g) = phi(g) "and" phi(z g) = phi(g) $

Thus, $phi$ factors through $lcoset(G(AA), (G(QQ) Z_(oo)^(+)))$.

== The representation theory of $cal(A)_(0)(G)$
We want to bring the representation theory of $G(AA)$ into play. But to use representation theory we need a space that is stable under the action of the group. The space $cal(A)_(0)(G)("hol", k, N, chi)$ and the space of classical modular forms is not stable under the action of the full adelic group $G(AA)$.

What that means:

1. *Group action*: $G(AA)$ acts on $V = cal(A)_(0)(G)("hol", k, N, chi)$ where $(g dot phi)(h) = phi(h g)$.
2. *The Problem*: The space $cal(A)_(0)(G)("hol", k, N, chi)$ has very strict conditions:
  - Specific invariance on the right by $K_(0)(N)$
  - A specific weight $k$ property: $phi(g k_(theta)) = phi(g) (e^(i theta))^(
    k
    )$
  - Holomorphy condition of $X_(-) phi = 0$.
  So if you take a function $phi in V$ that satisfies this and act on it by $h in G(AA)$. $(h dot phi)$ will not satisfy this condition. It will be invariant under a different subgroup ($h^(-1) K_(0)(N) h$) and its weight and holomorphy properties will be mixed up.
3. We need to enlarge our space of functions to $A_(0)(G)$ that we define to be stable under the group action.

So how do we enlarge our space of functions.

1. *Naive Idea*: The most obvious idea is to take $phi$ and throw in $span_(CC){g dot phi : g in G(AA)}$.
2. *Problem* : The issue is that $phi$, which has a nice pure weight k, when you translate it by $g in G(RR) - SO(2)$ the new function $g dot phi$ becomes a ugly, possibly infinite, combination of different weights and thus our space is not stable under the action of $G(RR)$
3. *Solution* Since the group $G(RR)$ doesn't work nicely, we will use its Infinitesimal version: the Lie algebra $frak(g)$. The action of $frak(g)$ is essentially an action by differential operators. It turns out that the space of functions that are "finite sums of pure weights" is stable under the action of the Lie algebra $frak(g)$.


Let $omega$ be a character of $lcoset(AA^(times), QQ^(times))$ with $omega_(oo)$ trivial on $RR_(+)^(times )$
https://chat.qwen.ai/s/f1b2d322-a25c-408a-bbf0-c454ec68fd66?fev=0.0.233
#definition[
  The space of *automorphic forms* $cal(A)(G) = cal(A)(G, omega)$ on $G(AA)$ with central character $omega$ is the space of $CC$-valued functions $phi$ on $G(AA)$ such that:

  1. For $z in Z(AA) tilde.equiv AA^(times)$ and $gamma in G(QQ)$, $phi(z gamma g) = omega(z) phi(g)$ (Functions factor through $lcoset(G(AA), (G(QQ) Z_(oo)^(+)))$) also $phi$ is an eigenfunction under the action of $Z(AA)$.
  2. For each $gamma in G(AA_(f))$ the function on $G(RR)^(+)$, $g -> phi(g gamma)$ is smooth.
  3. The space spanned by right translates of $phi$ by elements of $K_(oo)$ is finite dimensional, i.e, $phi$. is right $K_(oo)$ finite. Thus a function $phi$ is a finite sum of different pure weight functions?
  4. There is a compact open subgroup $K prime$ of $G(AA_(f))$ such that $phi$ is invariant under right translation by $K prime$. We may as well asume that $K prime subset K$ (definition of $K$ in @standardcompactopen). Examples include $K$, $K_(0)(N)$, etc.
  5. $Z(frak(g))$-finite: $Z(frak(g))$ is the center of the unversal enveloping algebra where $frak(g) = frak(g)_(0) times.circle_(RR) CC$. Elements of $Z(frak(g))$ act as differential operators that commute with the action of $G(RR)$ and the most important one is the Casamir (It returned!). $Z(frak(g))$ finitenessed that $phi$ lies in the generalized eigenspace for all Casamir type operators. This condition ensures the representation has bounded infinitesimal character, which is crucial for
    - Preventing pathological growth
    - Ensuring the representation decomposes nicely
    - Connecting to spectral theory

  Note the casamire is $ C = H^(2) + 2 X_(+) X_(-) + 2 X_(-) X_(+) $ where $H = -i mat(0, 1; -1, 0)$. This condition tells you that there is a polynomial $R[T] in C[T]$ such that $R(C) phi = 0$.
  + The function $phi$ is slowly increasing: We need the growth condition to ensure convergence of integrals.
]

For the growth condition, we use the norm on $G(AA)$. There is a embedding $ G(AA) inc M_(2)(AA) times AA tilde.equiv AA^(5) "where" g -> (g, det(g)^(-1)). $ For each place $v$, and $x = (x_(i)) in A^(5)$ put $ abs(x)_(v) = max_(i)(abs(x_(i))_(v)) $ and let $abs(x) = product_(v) abs(x)_(v)$. Note for example, that if $v != oo$ and if $g_(v) in K_(v)$ then $det(g_(v))$ is a unit so $abs(g)_(v) = 1$. Thus almost all factors in the product ae 1. Then $phi$ is slowly increasing or of moderate growth if there is an integrer $n$ such that $ abs(phi(g)) = O(abs(g)^(n)) $

#definition[
  The space $cal(A)_(0)(G) = cal(A)_(0)(G, omega) subset A(G)$ is the space of cuspidal automorphic forms with central character $omega$ and is defined by adding the cuspidal condition that $phi$ is cuspidal if $ integral_(lcoset(AA, QQ)) phi(mat(1, x; 0, 1) g) dif x = 0 $ for all $g in G(AA)$.
]

It is easy to see that $cal(A)_(0)(G)("hol", k, N, chi) subset cal(A)_(0)(G)$. The weight and holomorphy condition in $cal(A)_(0)(G)("hol", k, N, chi)$ imply that $ C phi = k(k - 2) phi $ for $phi in cal(A)_(0)(G)("hol", k, N, chi)$.

#definition[
  Let $G(RR)$ acts on $frak(g)$ by conjugation and call the action $adj$.
]

#definition[
  - A $(frak(g), K_(oo))-$module is a $CC$-representation $V$ of $frak(g)$ and $K_(oo)$ such that the two actions are compatible ie

  $ k dot X dot v = adj(k)(X) dot k dot v $ and for $X in "Lie"(K_(oo)) subset frak(g)$

  $ X dot v = (d)/(d t)(exp(t X) dot v) |_(t = 0) $

  - A $(frak(g), K_(oo)) times G(AA_(f))$ is a $(frak(g), K_(oo))$ module with a smooth action of $G(AA_(f))$ commuting with the action of $(frak(g), K_(oo))$. Here smooth means that $v in V$ is fixed by some compact open subgroup $K prime subset G(AA_(f))$.
]

Thus $cal(A)(G)$ and $cal(A)_(0)(G)$ are $(frak(g), K_(oo)) times G(AA_(f))$ modules

#definition[
  1. A $(frak(g), K_(oo)) times G(AA_(f))$ module $(pi, V)$ is admissible if, for every irreducible representation $sigma$ of $K_(oo) times K$, the multiplicity of $sigma$ in $V$ is finite.
  2. $(pi, V)$ is irreducible if it has no proper subspaces preseved by $frak(g)$, $K_(oo)$, and $G(A_(f)).$
]

There are analogues for this when we look at the local definitions. The case for nonarchemedian $v$ is standard. For archemedian place $v$, a reprsentation V of $G_(v)$ is smooth if for every $w in V$ is fixed by open subgroup and admissable if and only if for every open subgroup $K$, the space $V^(K)$ is finite dimensional, and irreducible if it has no proper subspaces. Furthermore an irreducible admissable representation $(pi, V)$ is unramified or spherical if the space of $K_(v)$ invariants is nonzero. In this case $dim V^(K_(v)) = 1$ .

#theorem[
  Suppose that, for each archedimedian (respectively nonarchemedian) place $v$ of $QQ$ $(pi_(v), V_(v))$ is an irreducible, admissible $(frak(g_(v)), K_(v))$-module (respectively representation of $G_(v)$). Suppose, moreover, that for almost all $p in PP$, the representation $(pi_(p), V_(p))$ is unramified and a basis vector $xi_(v)^(0) in V_(p)^(K_(p))$ is given. Then the restricted tensor product,

  $ V = V_(oo) times.circle times.circle.big_(p in PP)^* V_(p) $ with respect to the vectors $xi_(v)^(0)$ is a irreducible admissiable $(frak(g), K_(oo)) times G(AA_(f))$ module.


  Conversely if $(pi, V)$ is a irreducible admissable $(frak(g), K_(oo)) times G(AA_(f))$-module then there is a collection ${(pi_(v), V_(v))}_(v)$ such that $V tilde.equiv V_(oo) times.circle_(p in PP)^(*) V_(p)$.
]
#proof[
  $=> :$ We will define the $(frak(g), K_(oo)) times G(AA_(f))$ module structure for $V$.
  For $g = g_oo g_f in G(RR)^(+) times G(AA_f)$, $ pi(g)(v_(oo) times.circle times.circle.big_(p in PP)^(*) v_(p)) & = pi_(oo)(g_oo)v_(oo) times.circle times.circle.big_(p in PP)^(*) pi_(p)(g_(p))v_(p) $ since almost all $g_(p) in K_(p)$ and almost all $v_(p) = xi_(p)^(0)$, only finitely many factors change. For $X in frak(g)$,

  $
    pi(X)(v_(oo) times.circle times.circle.big_(p in PP)^(*) v_(p)) = pi_(oo)(X) v_(oo) times.circle times.circle.big_(p in PP)^(*) v_(p)
  $

  1. *Admissible*: To show this we have to show for every irreducible representation $sigma$ of $K_(oo) times K$ that $dim V^(sigma) < oo$. Where $V^(sigma) = {v in V mid(|) pi(k) v = sigma(k) v, forall in K_(oo) times K}$. We can write $ sigma = sigma_(oo) times times.circle.big_(p in PP)^(*) sigma_(p) $ where $sigma_(p)$ is trivial for almost all $p$ since $K$ is compact open subgroup. Thus $V^(sigma) = V_(oo)^(sigma_(oo)) times.circle times.circle.big_(p in PP)^(*) V_(p)^(sigma_(p))$. $V_(oo)$ is a admissable representation, $dim V_(oo)^(sigma_(oo)) < oo$ and same for $dim V_(p)^(sigma_(p)) < oo$.  Furthermore for almost all $p$, $sigma_(p)$ is trivial thus $V_(p)^(sigma_(p)) = V_(p)^(K_(p)) = CC xi_(p)^(0)$ which is 1 dimensional. Thus the tensor product is finite dimensional.

  2. *Irreducible*: Suppose $W subset V$ is a nonzero $(g, K_(oo)) times G(AA_(f))$-invariant subspace. We need to show that $W = V$. By Flath's Tensor Product Theorem, if $pi_(v)$ is irreducible for all $v$ then $V = times.circle_(v)^(*) V_(v)$ is a irrep as a $(g ,K_(oo)) times G(AA_(f))$ module. The key part is that you can seperate the variables. $forall w in W$ nonzero, $w = sum_(i = 1)^(n) w_(oo)^(i) times.circle w_(f)^(i)$. By acting with $G(AA_(f))$ and using irreduciblility of $pi_(p)$ we can generate any vector in $times.circle.big_(p in PP)^(*) V_(p)$. Similarly, by acting by $frak(g)$ and $K_(oo)$ you can get anything in $V_(oo)$. Thus $W = {v_(oo) times.circle v_(f) : v_(oo) in V_(oo) and v_(f) in V_(f)} = V$.

  $arrow.l.double.long :$ For each prime $p$ consider $V_(p) = {v in V : exists K_(p) prime subset G(QQ_(p)) "with" pi(k) v = v, forall k in K_(p) prime }$. This is the space of $K_(p)$ spooth vectors at $p$.
]

#theorem[
  1. The space $cal(A)_(0)(G) = cal(A)_(0)(G, omega)$ is a algebraic direct sum of irreducible admissable $(frak(g), K_(oo)) times G(AA_(f))$-modules, $ cal(A)_(0)(G) = plus.circle.big_(pi) cal(A)_(0)(pi) $
  2. Multiplicity One: If $pi_(1)$ and $pi_(2)$ are irreducible admissable $(frak(g), K_(oo)) times G(AA_(f))$ modules, then $ pi_1 tilde.equiv pi_2 => cal(A)_(0)(pi_1) = cal(A)_(0)(pi_2). $ Thus $dim cal(A)_(0)(pi) <= 1$.
  3. Strong Multiplicity One: Suppose that $pi_(1, v) tilde.equiv pi_(2, v)$ for all v outside of places of $QQ$ with density less than $(1)/(8)$. Then $pi_(1) tilde.equiv pi_(2)$ and $A_(0)(pi) = A_(0)(pi_2)$
]

== Local Representation Theory
The following is completly generalizable to a $F$ be a p-adic field and $cal(O)$ be the ring of integers, but we will use $QQ_(p)$ and $ZZ_(p)$ for simplicity.

$ G = GL(QQ_(p), 2) "and" K = GL(ZZ_(p), 2) $ so K is the maximal compact, and open, subgroup of $G$. Let $B$ be the Borel subgroup. $ B = {"upper trianglular"} = lr(angle.l M, N angle.r) $ where $M = {"diagonal matrices"} = { m(a) = "diag"(a_(1), a_(2)) mid(|) a = (a_1, a_2) in QQ_(p)^(times) times QQ_(p)^(times)}$ (the maximally split torus in $GL(QQ_(p), 2)$ ) and $N = {n(x) = mat(1, x; 0, 1) mid(|) x in QQ_(p)}$. $Z = Z(G)$. Let $mu_1, mu_2: QQ_(p)^(times) -> CC^(times)$ be characters. Let $mu: B -> CC^(times)$ where $mat(a, ast; 0, c) -> mu_1(a) mu_2(b)$.

$
  mu(mat(a, b; 0, c) mat(p, q; 0, r)) & = mu(mat(a p, *; 0, c r)) \
                                      & = mu_1(a p) mu_2( c r) \
                                      & = mu_1(a) m_2(c) m_1(p)mu_2(r) \
                                      & = mu(mat(a, b; 0, c))mu(mat(p, q; 0, r))
$

Thus $mu$ is a character of $B$. Let $delta: BB -> RR_(>0)$ where $ delta(mat(a_1, ast; 0, a_2)) = abs((a_1)/(a_2))_(p) $. Let $ I(mu) = "Ind"_(G)^B (mu dot delta^((1)/(2))) = {f: G -> CC : f(b g) = mu(b) delta(b)^((1)/(2)) f(g)} $ where $f$ is smooth, ie right invariant under an open subgrup $K prime subset G$ (this depends on $f$, and wlog $K prime subset K$).

$ dif(b n b^(-1)) = delta(b) dif n $ Thus we normalize the induction so that you get a unitarizable representation $I(mu)$. The Iwasawa Decomposition tells us that $G = B K$. This gives us

#lemma[
  $ I(mu) tilde.equiv I_(B inter K)^(K)(mu) := "Ind"_(B inter K)^(K)(mu dot delta^((1)/(2))) $
]
#proof[
  $phi: I(mu) -> I_(B inter K)^(K)(mu)$ where $f -> f |_(K)$.

  1. Well Defined: $forall h in K inter B$ and $k in K$ we have $ f(h k) & = mu(h) delta^((1)/(2))(h)f(k) $
  2. Injective: Suppose $f|_(K) = 0$. Then for $g in G(QQ_(p)), g = b k$ by the iwasawa decomposition. $f(g) = mu(b) delta(b)^((1)/(2)) f(k) = 0$.
  3. Surjective: It is surjective by definition.

  Thus $phi$ is a isomorphism.
]

#theorem[
  + $I(mu)$ is irreducible if and only if $mu_1 mu_2^(-1) = omega_(plus.minus 1)(x)$ where $omega(x) = abs(x)_(p)^(s)$

  + If $mu_1mu_2^(-1) = omega_(1) => I(mu)$ has a one dimensional quotient on which G acts by the character $chi compose det$, where $mu = (chi omega_((1)/(2)), chi omega_(-(1)/(2)))$ and an the infinite dimensional irreducible subrepresentation $sigma(mu)$

  + If $mu_1 mu_2^(-1) = omega_(-1) => I(mu)$ has a one dimensional submodule on which G acts by the character $chi compose det$ where where $mu = (chi omega_(-(1)/(2)), chi omega_((1)/(2)))$ and on the infinite dimensional quotient $sigma(mu)$

  + The only equivalences among these representations are teh following. Let $nu = (mu_2, mu_1)$. If $mu_1 mu_2^(-1) != omega_(plus.minus 1)$ then $I(mu) tilde.equiv I(mu prime)$. If $mu_1 mu_2^(-1) = omega_(plus.minus 1)$ then $sigma(mu) tilde.equiv sigma(nu)$
]
#proof[
  $N(M) = lr(angle.l M, mat(0, 1; 1, 0) angle.r)$. Thus $W = rcoset(N(M), M) = lr(angle.l w = mat(0, 1; 1, 0) angle.r) tilde.equiv ZZ_(2)$ is the weyl group. Let $T: I( mu = (mu_1, mu_2)) -> I(nu = (mu_2, mu_1))$ where $ f -> [g -> integral_N f(w n g) d n = integral_QQ_p f(w n(x) g) dif x] $

  $
    (T f)(mat(a, b; c, d) g) & = integral_QQ_p f(w n(x) mat(a, b; 0, c) g) dif x \
                             & =integral_QQ_p f(w n(x) mat(1, (b)/(c); 0, 1) mat(a, 0; 0, c) g) dif x \
                             & = integral_QQ_p f(w n(x + (b)/(c)) mat(a, 0; 0, c) g) dif x \
                             & = integral_QQ_p f(w n(x ) mat(a, 0; 0, c) g) dif x \
                             & = integral_QQ_p f(w mat(a, x c; 0, c) g) dif x \
                             & = integral_QQ_p f(w mat(a, 0; 0, c) mat(1, (x c)/(a); 0, 1) g) dif x \
                             & = integral_QQ_p f(w mat(a, 0; 0, c) mat(1, (x c)/(a); 0, 1) g) dif x \
                             & = abs((a)/(c))_(p) integral_QQ_p f(m(c, a) w n(x) g) dif x \
  $

  We can use the fact that $f in I(mu)$, thus

  $
    (T f)(mat(a, b; c, d) g) & = abs((a)/(c))_(p) integral_QQ_p mu_1(c) mu_2(a) abs((c)/(a))^((1)/(2))_(p) f(w n(x) g) dif x \
    &= mu_2(a) mu_1(c) abs((a)/(c))_(p)^((1)/(2)) integral_QQ_p f(w n(x) g) dif x \
    &= nu(mat(a, b; 0, c)) delta(mat(a, b; 0, c))^((1)/(2)) (T f)(g)
  $

  Thus $T f in I(nu)$. Note but this is all depending on the convergence of $T f$. Let $f$ be a spherical function (invariant under $K$ action on the right). By the iwasawa decomposition, $forall g in G(QQ_(p)), g = mat(a, b; 0, c) k$ where $a, c != 0$ and $k in K$.

  By above and the fact that $f_0$ is a spherical vector,

  $
    (T f_0)(g) = (T f_0)(mat(a, b; 0, c) k) & = integral_QQ_p f_0(w n(x) mat(a, b; 0, c) k) dif x \
    & = nu(mat(a, b; 0, c)) delta(mat(a, b; 0, c))^((1)/(2)) integral_QQ_p f_0(w n(x) k) dif x \
    &= nu(mat(a, b; 0, c)) delta(mat(a, b; 0, c))^((1)/(2)) integral_QQ_p f_0(w n(x)) dif x \
  $

  By the Iwasawa decomposition, $w n(x) = beta_(x) k_(x)$ for $beta_(x) in B$ and $k_(x) in K$.
  1. Case $x in ZZ_(p)$: $w n(x) in K$ and $beta_(x) = I$.
  2. Case $x in.not ZZ_(p)$:

  $ w n(x) = mat(-(1)/(x), 1; 0, x) mat(1, 0; (1)/(x), 1) $

  Thus

  $
    integral_QQ_p f_0(w n(x)) dif x & = integral_(ZZ_(p)) f_0(w n(x)) dif x + integral_(QQ_(p) - ZZ_(p)) f_0(w n(x)) dif x \
    & = integral_(ZZ_(p)) f_0(I) dif x + integral_(QQ_(p) - ZZ_(p)) f_0(mat(-(1)/(x), 1; 0, x) mat(1, 0; (1)/(x), 1)) dif x \
    & = integral_(ZZ_(p)) 1 dif x + integral_(QQ_(p) - ZZ_(p)) mu_(2)(x)mu_(1)(-(1)/(x)) abs(-(1)/(x^2))_(p)^((1)/(2)) f_0(I) dif x \
    & = integral_(ZZ_(p)) 1 dif x + mu_(1)(-1) integral_(QQ_(p) - ZZ_(p)) (mu_2 mu_1^(-1))(x) abs(x)_(p)^(-1) dif x \
  $

  // TODO

]

#theorem[
  For an irreducible admissable representation $(pi, V)$ of $G$ the following are equivalent:

  1. For all $mu$, $"Hom"_(G)(pi, I(mu)) = 0$
  2. The matrix coefficents $phi_(v, v prime)$ of $pi$ are compactly supporeted moduler $Z$, ie, the image of $G / Z$ of the support of $phi_(v, v prime)$. Note the space of matrix coefficents we will use $V times.circle tilde(V)$ where $tilde(V) subset V^*$ of smooth vectors.

  Such representations $(pi, V)$ are called *supercuspidal*.
]

The set of irreducible admissible representation of $G$ are the following:

+ Supercuspidal representation
+ Irreducible principle series representations $I(mu)$
+ The special Representations $sigma(mu)$
+ 1 dimensional representations $sigma compose det$

A representation $(pi, V)$ of $G$ is unramified if $dim V^(K) > 0$ ie there exists a spherical vector. If the characters $mu = (mu_1, mu_2)$ are unramified then $ mu_(j)(x) = t_(j)^(v_(p)(x)) $ for some pair $(t_(1), t_(2)) in CC^(times) times CC^(times)$ then $mu|_(B inter K) = 1$ and the restriction to $K$ gives the isomorphism $ I(mu) tilde.equiv C^(oo)(lcoset(K, B inter K)) $ this isomorphism is equivariant for the action of K by right multiplication. Thu $dim I(mu)^(K) = 1$.


#theorem[
  1. For every pair $(t_1, t_2) in (CC^(times))^(2)$ there is a irreducible admissable unramified representation $pi(t_1, t_2)$ of $G$.
  2. Every irreducible admissible unramified representation of $G$ is isomorphic to one of the $pi(t_1, t_2)$. The only equivalence between such representatiosn is $pi(t_2, t_1) tilde.equiv pi(t_1, t_2)$
  3. If $mu_1 mu_2^(-1) != omega_(plus.minus 1)$ ie if $t_1 t_2^(-1) != q^(plus.minus 1)$ then $pi(t_1, t_2) = I(mu)$. Otherwise $pi(t_1, t_2) = chi compose det$ the one dimensional constitunt of $I(mu)$.
]

#remark[
  Let $ I = {k = mat(a, b; c, d) in K mid(|) v_(p)(c) >= 1} = {k = mat(a, b; c, d) in K mid(|) c equiv 0 mod p} $ be the Iwahori Subgroup of $K$. Then the only irreducible admissable representations $(pi, V)$ of $G$ with $V^(I) != 0$ are the unramified reprsentations or the unramified special representatiosn ie $sigma(mu)$ where $mu$ is unramified.
]

#corollary[
  There is a isomorphism between the isomorphism classes of irreducible admissable unramified representations of $G$ and the semisimple conjugacy classes of $G(CC)$ given by $ pi = pi(t_1, t_2) <-> t(pi) := [mat(t_1; , t_2)] $

  $t(pi)$ is called the *Satake parameter* of $pi$.
]<satakecorollary>

#definition[
  The (spherical) *Hecke Algebra* $ cal(H) = cal(H)(G, K) = CC lr(angle.l doublecoset(K, G, K) angle.r) $ is the space of compactly supprted functions $xi$ on $G$ that are invariant under left and right multiplication by $K$. $cal(H)$ is a algebra under convolution with the identity element being the characteristic function of $K$.
]

Let $ A^(+) := {mat(p^(lambda_1), 0; 0, p^(lambda_2))) : lambda_1 >= lambda_2 in ZZ}. $ The Cartan Decomposition tells us that $G = K A^(+) K.$ Thus $doublecoset(K, G, K) = A$. We will look at two distinguished elements in $A^(+)$, $xi_1 = p I$ and $xi_2 = "diag"(p, 1)$.


Thus ${1_(K a K) : a = (a_(1), a_2) = "diag"(p^(a_(1)), p^(a_(2))) in A}$ generate $cal(H)$.
For a unramified rep. $V$ of $G$, $cal(H)$ acts on $V^(K)$ by $ xi (v) = integral_(G) xi(g) g v dif g = lambda_(V)(xi) v $

Note $dim V^(K) = 1$ (look above). Furthermore this means that $lambda_(V) : cal(H) -> CC$ is a algebra homomorphism.

Furthermore every algebra homomorphism $cal(H) -> CC$ arises this way. In fact $cal(H)$ can be viewed as the space of reugular functions on the space of semisimple conjugacy classes of $G(CC)$ via the map $xi -> lambda_(pi)(xi)$


#theorem[
  $
    cal(H) = CC[xi_1, xi_2] & tilde.equiv CC[t_1 + t_2, t_(1) t_2] \
                       xi_1 & -> t_1 t_2 = lambda_(pi)(xi_(2)) \
                     xi_(2) & -> p^(-(1)/(2))(t_1 + t_2) = lambda_(pi)(xi_(1)) \
  $
]
#proof[By @satakecorollary, $binom(CC^(times), 2)$ (conjugacy classes of $G(CC)$) is identified with isomorphism classes of irreducible admissable unramified representations. Furthermore, $G = B K$. Thus $forall t in binom(CC^(times), 2)$, $(pi(t), I(mu))$ for $mu(mat(a, b; 0, c)) = (t_(1)^("val"_p (a)), t_2^("val"_(p)(c)))$. Let $phi in I(mu)^(K)$. For $xi in cal(H)$,


  $
    (pi_(t)(xi) phi)(e) & = lambda_(pi_(t))(xi)(phi)(e) = lambda_(pi_(t))(xi) \
                        & = integral_(G) xi(g)(pi_(t)(g) phi)(e) dif g \
                        & = integral_(G) xi(g)phi(g e) dif g \
                        & = integral_(G) xi(g)phi(g) dif g \
  $

  Normalize the measure so $"vol"(K) = 1$.

  Let $S: cal(H) -> "Hom"(binom(CC^(times), 2), CC) = CC[t_1, t_2]^(ZZ_(2)) = CC[t_1 + t_2, t_(1) t_2]$ where $ xi -> [t = {t_1, t_2} -> lambda_(pi_(t))(xi)] $

  We want to show that $S$ is a isomorphism. We will show that it is injective and that surjective just with $xi_(1)$ and $xi_(2)$. Thus $cal(H)$ is generated by $xi_(1)$ and $xi_(2)$.

  $
    lambda_(pi(t))(1_(K a K)) & := integral_(G) 1_(K a K) (g) phi(g) dif g \
                              & = integral_(K a K) phi(g) dif g \
                              & = "vol"(K) integral_(K) phi(k a) dif k = integral_(K) phi(k a) dif k \
  $

  1. Calculation for $xi_(1) = K p I K = p I K = p K$:

    $
      lambda_(pi(t))(1_(p K)) & = integral_(K) phi(p k) dif k \
                              & = integral_(K) phi(p I) dif k \
                              & = integral_(K) t_(1)^(1) t_(2)^(1) p^0 dif k = t_1 t_2 \
    $

  2. Calculation for $xi_2 = 1_(K mat(p, 0; 0, 1) K)$:

    There is a coset decomposition of $K mat(p, 0; 0, 1) K$ which is $ K mat(p, 0; 0, 1) K = (union.sq_(j = 0)^(p - 1) c_(j) K) union.sq c_(oo)K $ where $  c_(j) & = mat(p, j; 0, 1) \
    c_(oo) & = mat(1, 0; 0, p). $ Thus $ lambda_(pi_(t))(xi_(2)) &= sum_(j = 0)^(p - 1) integral_(K) phi(mat(p, j; 0, 1) k) dif k + integral_(K) phi(mat(1, 0; 0, p) k) dif k \
    &= sum_(j = 0)^(p - 1) integral_(K) t_(1)^(1)t_(2)^(0) p^(-(1)/(2)) dif k + integral_(K) t^0_(1) t_(2)^(1) p^((1)/(2)) dif k \
    &= sum_(j = 0)^(p - 1) t_(1)^(1)t_(2)^(0) p^(-(1)/(2)) + t^0_(1) t_(2)^(1) p^((1)/(2)) \
    & = p(t_(1)^(1)t_(2)^(0) p^(-(1)/(2))) + t^0_(1) t_(2)^(1) p^((1)/(2)) \
    &= p^((1)/(2))(t_(1) + t_(2)) $




  $
    lambda_(pi(t))(alpha ast beta) & = integral_(G) integral_(G) alpha(h) beta(h^(-1) g) pi(g) dif h dif g \
                                   & =integral_(G) integral_(G) alpha(h) beta(h^(-1) g) pi(g) dif g dif h \
  $

  Let $k = h^(-1) g$ since haar measure is left invariant, $dif k = dif g$. thus

  $
    lambda_(pi(t))(alpha ast beta) & = integral_(G) integral_(G) alpha(h) beta(k) pi(h k) dif k dif h \
                                   & =integral_(G) integral_(G) alpha(h) beta(k) pi(h) pi(k) dif g dif h \
                                   & = (integral_(G) alpha(h) pi(h) dif h)(integral_(G) beta(k) pi(k) dif k) \
                                   & = lambda_(pi_(t))(alpha) lambda_(pi_(t))(beta)
  $

  Thus by linearity the map is a homomorphism and surjective. All that is left to show is that $ker S = 0$. Suppose $f in ker(S)$, then for all $t in binom(CC, 2)$

  $ lambda_(pi_(t))(f) = 0 = integral_(G) f(g) pi(g) dif g $

]



== Classical Newforms
Coming back to automorphic representations and the isomorphism:

$
  S_(k)(Gamma_()(0)(N), chi_(N)) & ->^(tilde.equiv) cal(A)_(0)(G)("hol", k, N, chi) \
                               f & -> phi_(f)
$

#proposition[
  If $p$ doesn't divide $N$, then $phi_(f)$ is invariant under right translation by $K_(p)$.
]
#proof[
  $
    K_(0)(N) = product_(p in PP) K_(0)(p^(v_(p)(N)))
  $

  Suppose $p divides.not N$, then $K_(0)(p^(v_(p)(N))) = K_(0)(p^(0)) = {mat(a, b; c, d): c = 0 mod 1} = G(ZZ_(p)) = K_(p)$. Since $p divides.not N$, for $k_(p) in K_(p)$, $chi_(p)(k_(p)) = 1$. By the transfomation law of $phi_(f)$ we have $ phi_(f)(g dot k_(p)) = chi_(p)(k_(p)) phi_(f)(g) = phi_(f)(g) $
]

Thus if $p divides.not N$, then $cal(H)_(p)$ acts. On $S_(k)(Gamma_()(0)(N), chi_(N))$, $cal(H)_(p) tilde.equiv CC[xi_(p, 1), xi_(p ,1)]$ act like standard classical hecke operators:

$
   xi_(p, 1)f_(0) & = R_(p) f_(0) \
  xi_(p, 2) f_(0) & = p^((k-1)/(2)) T_(p) f_(0)
$

Thus there is a action of $cal(H)^(N) = times.circle_(p divides.not N) prime cal(H)_(p)$

== Rederiving Properties of Hecke Operators using Hecke Algebras
Remember $G_(p) := G(QQ_(p))$ and $K_(p) := ZZ_(p)$. Let $cal(H) = cal(H)(G_(p), K_(p))$. We want to study where $1_(K_(p)(n, 1)K_(p))$ maps to with the Satake isomorphism.

#theorem[

]
#proof[
  The coset decomposition of $ K_(p)mat(p^(n), 0; 0, 1)K_(p) := union.sq.big_(i = 0)^(n) union.sq.big_(j = 0)^(p^(i) - 1) mat(p^(i), j; 0, p^(n - i)) K_(p) $

  Thus $ lambda_(pi(t))(1_(K_(p)(p^(n), 1)K_(p))) & = sum_(i = 0)^(n) sum_(j = 0)^(p^(i) - 1) integral_(K) phi(mat(p^(i), j; 0, p^(n - i)) k) dif k \
  &= sum_(i = 0)^(n) sum_(j = 0)^(p^(i) - 1) t_1^(i)t_(2)^(n - i) abs(p^(i)/p^(n - i))^((1)/(2)) \
  &= sum_(i = 0)^(n) sum_(j = 0)^(p^(i) - 1) t_1^(i)t_(2)^(n - i) abs(p)^((-(n - 2 i))/(2)) \
  &= p^((n)/(2)) sum_(i = 0)^(n) sum_(j = 0)^(p^(i) - 1) t_1^(i)t_(2)^(n - i) p^(-i) \
  &= p^((n)/(2)) sum_(i = 0)^(n) t_1^(i)t_(2)^(n -i) $

  $
    (t_1 + t_2)sum_(i = 0)^(n) t_1^(i)t_(2)^(n -i) & = sum_(i = 0)^(n) (t_1^(i + 1)t_(2)^(n - i) + t_1^(i)t_(2)^(n - i + 1)) \
    & = sum_(i = 0)^(n) (t_1^(i + 1)t_(2)^(n - i) + t_1^(i)t_(2)^(n - i + 1)) \
    & = sum_(i = 0)^( n + 1)(t_(1)^(i) t_(2)^((n + 1) - i)) + (t_(1)t_2)sum_(i = 0)^(n - 1) t_1^(i)t_(2)^(n - 1 - i)
  $

  Thus

  $
    1_(K_(p)(p, 1)K_(p)) &ast 1_(K_(p)(p^(n), 1) K_(p)) tilde.equiv p^((n + 1)/(2))(t_1 + t_2)sum_(i = 0)^(n) t_1^(i)t_(2)^(n -i)\ & = p^((n + 1)/(2))(sum_(i = 0)^( n + 1)(t_(1)^(i) t_(2)^((n + 1) - i)) + (t_(1)t_2)sum_(i = 0)^(n - 1) t_1^(i)t_(2)^(n - 1 - i)) \
    &= p^((n + 1)/(2))sum_(i = 0)^( n + 1)(t_(1)^(i) t_(2)^((n + 1) - i)) + p^((n + 1)/(2))(t_(1) t_(2)) sum_(i = 0)^(n - 1) t_1^(i)t_(2)^(n - 1 - i)\
    &= 1_(K_(p)(p^(n + 1), 1) K_(p)) + p 1(1_(K_(p)(p, p)K_(p)) ast 1_(K_(p) (p^(n - 1), 1) K_(p)))
  $
]


// = Hecke Operators
// Let $Gamma$ be a congruence subgroup of $GL(RR, 2)^(+)$

// #definition[
//   $cal(H)_(Gamma) := ZZ lr(angle.l doublecoset(Gamma, G(QQ)^(+), Gamma) angle.r)$. For $alpha in G(QQ)^(+)$, let $T_(alpha) = Gamma alpha Gamma in cal(H)_(k)$.
// ]

// #lemma[
//   $forall alpha in G(QQ)^(+)$, $Gamma alpha Gamma = union.sq_(i) Gamma alpha_(i)$ for finitely many $a_(i) in Gamma alpha Gamma$
// ]

// We can define multiplication on $cal(H)_(k)$. Suppose $T_(alpha) = Gamma alpha Gamma = union.sq_(i = 1)^(N_(alpha)) Gamma alpha_(i)$ and $T_(beta) = Gamma beta Gamma = union.sq_(i = 1)^(N_(beta)) beta_(i)$. Then

// $
//   T_(alpha) T_(beta) & = (union.sq Gamma alpha_(i))(union.sq Gamma beta_(i)) \
// $

// To do this we have to form all possible products by taking 1 representative from the first decomposition and 1 representative from the second: $alpha_(i) beta_(j)$. There will be $N_(alpha) times N_(beta)$ such products. Each product $alpha_(i) beta_(j) in G(QQ)^(+)$. Thus each product must be part of one double coset $T_(gamma)$ where $gamma = alpha_(i) beta_(j)$. Then we just need to count how many $alpha_(i) beta_(j)$ land in the desired coset.

// $
//   T_(alpha) T_(beta) & = sum_((i, j))^() c_(alpha beta gamma) T_(gamma)
// $

// Note $cal(H)_(Gamma)$ is isomorphic to set of functions $C_(c)(doublecoset(Gamma, G(QQ)^(+), Gamma), ZZ) = f: doublecoset(Gamma, G(QQ)^(+), Gamma) -> ZZ$ with finite support: namely for $T in cal(H)_(Gamma)$, the value of $f_(T)(Gamma alpha Gamma)$ for $alpha in G(QQ)^(+)$ is the coefficient of $Gamma alpha Gamma$ in $T$. The map is injective and surjective. Thus $cal(H)_(Gamma) tilde.equiv C_(c)(doublecoset(Gamma, G(QQ)^(+), Gamma), ZZ)$ as a additive abelian group. We will show that the multiplication rules on both groups are analoguous and so multiplication on $H_(Gamma)$ is well defined and $H_(Gamma)$ is a associative $ZZ$-algebra.

// #proposition[
//   The set of functions $f: doublecoset(Gamma, G(QQ)^(+), Gamma) -> ZZ$ with finite support has a convolution structure

//   $ (f_(1) ast f_(2))(g) = sum_(Gamma h in rcoset(Gamma, G(QQ)^(+)))^() f_1(g h^(-1)) f_2(h) $

//   which agrees with the multiplication on $cal(H)_(Gamma)$
// ]
// #proof[
//   Note that $f_(2)$ has finite support. Thus for all but finite $h in G(QQ)^(+)$, $f_2(h) = 0$. Thus the sum is finite. $forall h in G(QQ)^(+)$ and $gamma in Gamma$, $ f_1(g (gamma h )^(-1)) f_(2)(h gamma) & = f(g h^(-1) gamma^(-1))f_2(gamma h) = f_(1)(g h^(-1)) f_2(gamma) $ by the right invariance of $Gamma$ for $f_(1)$ and the left invariance of $Gamma$ for $f_2$.

//   Thus $ (f_(1) ast f_2)(g gamma) & = sum_(Gamma h in rcoset(Gamma, G(QQ)^(+)))^() f_1(g gamma h^(-1)) f_2(h) \
//   & = sum_(Gamma h prime in rcoset(Gamma, G(QQ)^(+)))^() f_1(g gamma gamma^(-1) (h prime)^(-1)) f_2(h prime gamma) \
//   & = sum_(Gamma h prime in rcoset(Gamma, G(QQ)^(+)))^() f_1(g (h prime)^(-1) ) f_2(h prime) = (f_1 ast f_2)(g) $

//   Thus $f_(1) ast f_2$ is right $Gamma$-invariant. Additionally, $ (f_(1) ast f_2)(gamma g) = sum_(Gamma h in rcoset(Gamma, G(QQ)^(+)))^() f_1(gamma g h^(-1)) f_2(h) = sum_(Gamma h in rcoset(Gamma, G(QQ)^(+)))^() f_1(g h^(-1)) f_2(h) = (f_(1) ast f_(2))(g). $ Thus $f_1 ast f_2$ is left $Gamma-$invariant and thus $f_1 ast f_2$ is a function on $doublecoset(Gamma, G(QQ)^(+), Gamma)$. If $(f_1 ast f_2)(g) != 0$, then $exists h in f_2^(-1)(ZZ - {0})$ such that $g h^(-1) in f_(1)^(-1)(ZZ - {0})$. Thus $g in f_1^(-1)(ZZ - {0})f_2^(-1)(ZZ - {0})$. But since $f_(1)^(-1)(ZZ - {0})$ and $f_(2)^(-1)(ZZ - {0})$ is a finite union of double cosets from our assumption, and since each double coset is a finite union of right cosets of $Gamma$, $f_1^(-1)(ZZ - {0})f_2^(-1)(ZZ - {0})$ is a finite union of sets of the form $(Gamma alpha)(Gamma beta)$. Since each $Gamma alpha Gamma$ is a finite union of right cosets of $Gamma$ and hence so is $(Gamma alpha) (Gamma beta)$ which means $f_1^(-1)(ZZ - {0})f_2^(-1)(ZZ - {0})$ is a finite union of right cosets of $Gamma$, thus $f_1 ast f_2$ has finite support.

//   $forall alpha, beta in G(QQ)^(+)$, let $f_(alpha)$ and $f_(beta)$ be the delta functions for $T_(alpha) = union.sq Gamma alpha_(i)$ and $T_(beta) = union.sq Gamma beta_(j)$. Then,

//   $
//     (f_(alpha) ast f_(beta))(g) & = sum_(Gamma h)^() f_(alpha)(g h^(-1)) f_(beta)(h) \
//                                 & = sum_(j)^() f_(alpha)(g beta_(j)^(-1)) f_(beta)(beta_(j)) \
//                                 & = sum_(j)^() f_(alpha)(g beta_(j)^(-1)) \
//   $

//   This counts the number of $j$ such that $g beta_(j)^(-1) in Gamma alpha Gamma$, equivalently, the number of $j$ such that $g beta_(j)^(-1) in Gamma alpha_(i)$ for some (necessarily unique) $i$. Thus $(f_(alpha) ast f_(beta))(g) = \#{(i, j) : g in Gamma alpha_(i) beta_(j)}$ thus $f_(alpha) ast f_(beta)$ is the function corresponding to $T_(alpha) T_(beta)$. Since the convulution is bilinear it will agree iwth $H_(Gamma)$ by extending linearly.
// ]

= Appendix

#theorem(name: "Cartan Decomposition")[
  Let $G = GL(F, 2)$ and $K = GL(cal(O), 2)$. Then $$
]
