#import "prelude.typ": *
#show: standalone.with(chapter: 1)

= Rings and Ideals

#exercise[
  Let $x$ be a nilpotent element of a ring $A$. Show that $1 + x$ is a unit of $A$. Deduce that the sum of a nilpotent element and a unit is a unit.
]
#proof[
  Idea: Think about Jordan blocks of matrices.
  Let $n in NN$ be the smallest integer such that $x^n = 0$.
  Let $ w = sum_(k = 0)^(n - 1) (-1)^k x^k. $ Then $ w (1 + x) & = (1 + sum_(k = 1)^(n - 1) (-1)^k x^k) + sum_(k = 1)^(n) (-1)^(k - 1) x^k \
            & = 1 + sum_(k = 1)^(n - 1) x^k ((-1)^k + (-1)^(k - 1) ) = 1 $

  Suppose $a in R$ is a unit. Then let $ (a + x)^(-1) & = 1/a sum_(k = 0)^(n - 1) (-1)^k ((x) / (a))^k $
]

#exercise[
  Let $A$ be a ring and let $A[x]$ be the ring of polynomials in an indeterminate $x$, with coefficients in $A$. Let $f = a_0 + a_1 x + ... + a_n x^n in A[x]$. Prove that
  + $f$ is a unit in $A[x] <=> a_0$ is a unit in $A$ and $a_1, ..., a_n$ are nilpotent. [If $b_0 + b_1 x + ... + b_m x^m$ is the inverse of $f$, prove by induction on $r$ that $a_n^(r+1) b_(m-r) = 0$. Hence show that $a_n$ is nilpotent, and then use Ex. 1.]
  + $f$ is nilpotent $<=> a_0, a_1, ..., a_n$ are nilpotent.
  + $f$ is a zero-divisor $<=>$ there exists $a != 0$ in $A$ such that $a f = 0$. [Choose a polynomial $g = b_0 + b_1 x + ... + b_m x^m$ of least degree $m$ such that $f g = 0$. Then $a_n b_m = 0$, hence $a_n g = 0$ (because $a_n g$ annihilates $f$ and has degree $< m$). Now show by induction that $a_(n-r) g = 0$ $(0 <= r <= n)$.]
  + $f$ is said to be *primitive* if $(a_0, a_1, ..., a_n) = (1)$. Prove that if $f, g in A[x]$, then $f g$ is primitive $<=> f$ and $g$ are primitive.
]
#proof[
  + $=>$: This direction requires two steps of induction. We will first induct on the degree and then internally we will do a secondary induction to show that the last coefficient is nilpotent. For all degree 0 units in $A[x]$ the statement is trivially true. Suppose for the sake of induction, that for all degree $k <= n$ polynomials that are units that the constant term is a unit in $A$ and the higher coefficients are nilpotent. Suppose $f$ is a degree $n + 1$ polynomial $ f = sum_(k = 0)^(n + 1) a_k x^k, $ such that $f$ is a unit in $A[x]$. Let $ g = sum_(l = 0)^(m) b_l x^l $ be the inverse of $f$. Then we have that $ f g & = sum_(k = 0)^(n + 1) (sum_(l = 0)^(m) a_k b_(l) )x^(k + l) \
        & = sum_(k = 0)^(n + m + 1) (sum_(l = max(0, k - m))^(min(n + 1, k)) a_l b_(k - l) ) x^(k) \
        & = 1 $ Thus we know that $a_(n + 1) b_(n + 1) = 0$. Assume for the sake of induction that $ a_(n + 1)^(s + 1) b_(m - s) = 0 $ for all $s <= r$. Then examine the coefficient of $x^(n + m - r)$ in $f g$ we have the following sum $ 0 & = sum_(l = max(0, n - r))^(min(n + 1, n + m - r)) a_l b_((n + m - r) - l) \
      & = sum_(l = max(0, n - r))^(n + 1) a_l b_((n + m) - r - l) \
      & = a_(n + 1)^(r + 1) sum_(l = max(0, n - r))^(n) a_l b_((n + m) - r - l) \
      & = a_(n + 1)^(r + 2) b_((n + m) - n - 1 - r) = a_(n + 1)^(r + 2) b_(m - (r - 1)). $ Thus by induction we know that $a_(n + 1)^m b_0 = 0$. Since $b_0$ must be a unit, $a_(n + 1)^m = 0$. Since $f$ is a unit, $f - a_(n + 1) x^(n + 1)$ is a unit and by the inductive hypothesis, $a_1$, ..., $a_n$ are nilpotent.

    $<==$: Immediate using exercise 1.

  + $=>$: Suppose $f = sum_(k = 0)^(n) a_k x^k$ is nilpotent. Then $f + 1$ is unit. But then we know that $a_1, ..., a_n$ are nilpotent. To get that $a_0$ is nilpotent, just look at the constant term in $f^k = 0$ which is $a_0^k$, it must be zero and thus $a_0^k = 0$.

    $<==$: We will prove a general statement. Suppose $a, b in R$ are nilpotent. Then $a + b$ is nilpotent. Suppose $a^n = 0$ and $b^m = 0$. Then $ (a + b)^(n + m) &= sum_(k = 0)^(n + m) vec(n + m, k) a^k b^(n + m - k) \ &= sum_(k = 0)^(n) vec(n + m, k) a^k b^(m + (n - k)) + sum_(k = n + 1)^(n + m) vec(n + m, k) a^k b^(m + n - k) \ &= 0 $
    Thus $a + b$ is nilpotent. In fact, the set of nilpotent elements form a ideal. This means that $f$ is nilpotent since $a_k x^k$ is nilpotent for all $k in {0, ..., n}$.

  + Only one direction is interesting. We first prove the claim that if $f = [a_0, ..., a_m] in A[x]$ is a zero-divisor, then its corresponding $g$ (in the context of this problem) has the property that $a_k g = 0$ for all $k$. We will do this by induction on the degree of $f$. The claim is trivially true for degree 0 zero-divisor. Suppose the claim is true for all zero-divisor divisors of degree less than or equal to $n$. Let $f = [a_0, ..., a_(n + 1)]$ be a degree $n + 1$ zero-divisor and let $g = [b_0, ..., b_(m)]$ be its corresponding zero-divisor (of minimal degree). The $x^(m + n + 1)$ coefficient of $f g$ is $a_(n + 1) b_(m) = 0$. Then $a_(n + 1) g$ has smaller degree than $g$ and $a_(n + 1)g f = 0 => a_(n + 1) g = 0$ by minimality of $g$. Now consider $f prime = f - a_(n + 1) x^n$ is a polynomial of degree at most $n$. Furthermore, $f prime g = f g - a_(n + 1) g = 0$. By the inductive hypothesis, each coefficent of the polynomial must multiply with $g$ to equal 0, the coefficients of $f prime$ are $a_0, ..., a_(n)$. Thus $b_m a_k = 0$. Then $b_m f = 0$.
  + Going forward doesn't seem too bad, basically you show that the ideal generated by the coefficients of $f g$ is contained in the ideal $(a_1, ..., a_n)$ (and equivalently $(b_1, ..., b_n)$). You basically just use the coefficients of $f g$ are polynomial in the coefficents of $f$ and $g$ themselves with the coefficients lying in $A$, hence ideals are closed under addition and multiplication by elements in $A$. Suppose $f$ and $g$ are primitive. Assume the contrary, that $f g$ is not primitive, let $c(f g)$ denote the ideal generated by the coefficients of $f g$. Thus there exists a maximal ideal $frak(m) supset c(f g)$. $A \/ frak(m)$ is a field. Consider $f, g in A \/ frak(m)[x]$ (image under quotient map) are not zero divisors since they are nonzero and $(A \/ frak(m))[m]$ is a integral domain. The image of $f g$ under the quotient map is 0 though which is a contradiction. Hence $f g$ must be primitive.
]

#exercise[
  Generalize the results of Exercise 2 to a polynomial ring $A[x_1, ..., x_r]$ in several indeterminates.
]
#proof[
  Note the following, there is a isomorphism between $A[x_1, ..., x_r] iso (A[x_1, ..., x_(r - 1)])[y]$. We will basically exploit this isomorphism to run a inductive argument on the number of indeterminates. Suppose the statements are true for polynomials in $A[x_1, ..., x_k]$. Let $f in A[x_1, ..., x_(k + 1)]$, $f$ can be viewed as a element of $A[x_1, ..., x_k][x_k]$. $   f & = sum_(i = 0)^(n) P_i x_r^i \
  P_i & in A[x_1, ..., x_(k)]. $ Apply the previous exercise to get statements about the coefficients $P_k$ and then use inductive hypothesis.
]

#exercise[
  In the ring $A[x]$, the Jacobson radical is equal to the nilradical.
]
#proof[
  We want to show that $nil subset.eq jac$ (nilradical is contained in Jacobson radical) and $jac subset.eq nil$. All maximal ideals are prime, hence the intersection of all prime ideals $nil$ must lie in the intersection of all maximal ideals $jac$. So the nontrivial direction is showing that $ jac subset.eq nil. $ So now we need to show that if $f in jac$, ie in the intersection of all maximal ideals of $A[x]$, it is also in $f in nil$, or in the intersection of all prime ideals of $A[x]$. By Prop 1.9 (Atiyah-Macdonald), we know that $ f in jac <=> 1 - f g "unit" $ for any choice of $g$. Thus we know that $1 - f x$ is unit. Hence all the coefficients of $f$ must be nilpotent. Hence $f$ must be nilpotent, hence $f in nil$.
]

#exercise[
  Let $A$ be a ring and let $A[[x]]$ be the ring of formal power series $f = sum_(n=0)^oo a_n x^n$ with coefficients in $A$. Show that
  + $f$ is a unit in $A[[x]] <=> a_0$ is a unit in $A$.
  + If $f$ is nilpotent, then $a_n$ is nilpotent for all $n >= 0$. Is the converse true? (See Chapter 7, Exercise 2.)
  + $f$ belongs to the Jacobson radical of $A[[x]] <=> a_0$ belongs to the Jacobson radical of $A$.
  + The contraction of a maximal ideal $m$ of $A[[x]]$ is a maximal ideal of $A$, and $m$ is generated by $m^e$ and $x$.
  + Every prime ideal of $A$ is the contraction of a prime ideal of $A[[x]]$.
]
#proof[*(a)*: Refer to homework 2 where a more general arguement is given for $A[[x_1, ..., x_n]]$.

  *(b)*: Suppose $f = [a_i]_(i = 0)^(oo)$ is nilpotent. Consider $g_k = [a_0, ..., a_k]$, we will show that $g_k$ is nilpotent for all $k in NN$ hence $a_0, ..., a_k$ are nilpotent. Let $ 0 & = f^n = sum_(k = 0)^(oo) b_k x^k \ $ not that $b_k$ for $k in {0, ..., n m}$ are the coefficients of $g_m^n$. Thus since $b_k = 0 <=> g_m^n = 0 => g_m$ nilpotent. I am not able to say definitively whether or not $a_n$ being nilpotent implies that $f$ is nilpotent. But we know all finite sums of $f$ are nilpotent. But I am not able to get anything stronger.

  *(c)*: Suppose $f = [{a_n}_(n = 0)^(oo)] in jac$ of $A[[x]]$. Thus for all $b in A$, we know that $1 - f b$ is unit. Hence $1 - a_0 b$ is unit for any choice of $b in A$. Hence by Prop. 1.6 (Atiyah-Macdonald) we know that $a_0 in jac$ of $A$. Suppose $a_0 in jac$ of $A$, for all $g in A[[x]]$ $ 1 - f g "unit" <=> 1 - g_0 a_0 "unit" $ and $1 - g_0 a_0$ is unit because $a_0 in jac$ of $A$. Hence by 1.9 again, $f in jac$ of $A[[x]]$.

  *(d)*: Note the following commutative diagram.

  #align(center)[
    #commutative-diagram(
      node((0, 0), $A$, "A"),
      node((0, 1), $A[[x]]$, "Ax"),
      node((1, 1), $lcoset(A[[x]], frak(m))$, "Axm"),
      arr("A", "Ax", $i$, "inj"),
      arr("Ax", "Axm", $q$, "surj"),
      arr("A", "Axm", $q compose i$, label-pos: right),
    )
  ]

  Note that $ker(q compose i) = i^(-1)(frak(m))$ hence $q compose i$ factors through $conj(i): A -> lcoset(A, i^(-1)(frak(m)))$ and we get the following diagram.

  #align(center)[
    #commutative-diagram(
      node((0, 0), $A$, "A"),
      node((0, 1), $A[[x]]$, "Ax"),
      node((1, 0), $lcoset(A, i^(-1)(frak(m)))$, "Aq"),
      node((1, 1), $lcoset(A[[x]], frak(m))$, "Axm"),
      arr("A", "Ax", $i$, "inj"),
      arr("Ax", "Axm", $q$, "surj"),
      arr("A", "Aq", $overline(q)$, "surj", label-pos: right),
      arr("Aq", "Axm", $j$, "dashed"),
      arr("A", "Axm", $q compose i$, label-pos: right),
    )
  ]

  Note that $j$ is a injection, bc $j(k + i^(-1)(frak(m))) = i(j) + frak(m) = frak(m) <=> i(j) in frak(m) => j in i^(-1)(frak(m))$. Thus $i^(-1)(frak(m))$ must be at least a prime ideal of $A$ because $lcoset(A, i^(-1)(frak(m)))$ injects into a field and hence must at least be a domain. We know that $0 in jac$ trivially. Then for any $[a_n]_(n = 1)^(oo) in A[[x]]$, power series with constant term 0, $[a_n]_(n = 1)^oo in jac$. Consider $a + i^(-1)(frak(m)) != 0$. $ a + i^(-1)(frak(m)) = a + frak(m) $ through $j$. $exists f = [f_k]_(k = 0)^(oo ) in A[[x]]$ such that $ a f & = 1 in lcoset(A[[x]], frak(m)). $ $ sum_(k = 1)^(oo) f_k x^k in jac subset.eq frak(m). $ Thus $ a f_0 & = a (f - sum_(k = 1)^(oo) f_k x^k ) & = 1 + a sum_(k = 1)^(oo) f_k x^k = 1 in lcoset(A[[x]], frak(m)) => a f_0 = 1 in lcoset(A, i^(-1)(frak(m))) $

  $forall g = [g_k]_(k = 0)^(oo) in frak(m)$ we want to show that $g_k in frak(m)^(c)$ for all $k$.
  1. Case 1 $k = 0$: $[g_n]_(n = 1)^(oo) in jac subset frak(m) => g - [g_n]_(n = 1)^(oo) = g_0 in frak(m) => g_0 in frak(m)^(c).$
  2. Case 2 $k > 0$: Assume the contrary that $g_k in.not frak(m)^(c)$. By a similar trick as above and using the fact $g_0 in frak(m)^(c)$ we can isolate the $g_k x^(k)$ term, $g_k x^k in frak(m)$. Thus $(frak(m)^c, g_0) (x) subset.eq frak(m)$. $(frak(m)^c, g_0) = A$, my maximality. Thus $1 in (frak(m)^c, g_0) subset frak(m) => frak(m) = A[[x]]$, contradicting maximality of $frak(m)$.


]

#exercise[
  A ring $A$ is such that every ideal not contained in the nilradical contains a nonzero idempotent (that is, an element $e$ such that $e^2 = e != 0$). Prove that the nilradical and Jacobson radical of $A$ are equal.
]
#proof[
  It suffices to show that $ jac subset.eq nil. $ Assume the contrary, that $jac subset.eq.not nil$. Thus $exists e in jac$ such that $e != 0$ and $e^2 = e$. By Prop 1.9, $1 - e^2 = 1 - e$ is a unit. Let $f = (1 - e)^(-1).$ Note the following computation, $ e = e (1 - e) f & = (e - e^2) f = (e - e) f = 0. $ This is a contradiction. Hence $jac subset.eq nil$ and $jac = nil$.
]

#exercise[
  Let $A$ be a ring in which every element $x$ satisfies $x^n = x$ for some $n > 1$ (depending on $x$). Show that every prime ideal in $A$ is maximal.
]
#proof[
  The problem is equivalent to showing that $lcoset(A, frak(p))$ is a field for any prime ideal $frak(p)$. Fix $frak(p) in Spec(A)$. We want to show that $lcoset(A, frak(p))$ is a field.
  $ x^n - x & = 0 = x (x^(n - 1) - 1). $ Thus in $lcoset(A, frak(p))$ which is a domain, either $x = 0$ or $x^(n - 1) - 1 = 0$. Thus if $x != 0$, then $x^(n - 1) = 1$. Thus $x^(n - 2) x = 1$ and $x$ is unit. Thus every nonzero element in $lcoset(A, frak(p))$ is unit and $lcoset(A, frak(p))$ is a field and $frak(p)$ is maximal.
]

#exercise[
  Let $A$ be a ring $!= 0$. Show that the set of prime ideals of $A$ has minimal elements with respect to inclusion.
]
#proof[
  Let $Spec(A)$ denote the set of prime ideals of $A$, and use $supset.eq$ as the comparison operator on the set. Let $C$ be a arbitrary chain in $Spec(A)$. Consider $ I = inter.big_(frak(p) in C) frak(p), $ which is an ideal of $A$. We want to show $I$ is prime. For $frak(p) in C$, let $f_(frak(p)): A -> lcoset(A, frak(p))$ be the standard quotient. Note that $f$ factors through $tilde(f)_(frak(p)): lcoset(A, I) -> lcoset(A, frak(p)).$ Let $x, y in lcoset(A, I)$ be elements where $x y = 0$ then $0 = tilde(f)_(fp)(x y) = tilde(f)_(fp)(x) tilde(f)_(fp)(y) => tilde(f)_(fp)(x) = 0$ or $tilde(f)_(fp)(y) = 0$. Meaning $forall frak(p) in C$, $x in frak(p)$ or $y in frak(p)$. Note the following, if $fp in.rev.not x => frak(q) in.rev.not x and I in.rev.not x$ for all $frak(q) in C$ where $fp supset.eq frak(q)$.
  1. $forall fp in C$ suppose there $exists z in {x, y}$. Such that $z in frak(p)$, thus $z in I$ and either $x = 0$ or $y = 0$ in $lcoset(A, I)$.
  2. $exists fp in C$ where $x in fp in C$ but $x in.not frak(q) in C$ ($y in frak(q)$). If $fp supset frak(q) => y in fp$ and $y in I => y = 0 in lcoset(A, I)$. If $frak(q) supset.eq fp$, this is not possible.

  Thus $lcoset(A, I)$ is a domain. By Zorn's Lemma, exists minimal elements in $Spec(A)$.
]

#exercise[
  Let $a$ be an ideal $!= (1)$ in a ring $A$. Show that $a = r(a) <=> a$ is an intersection of prime ideals.
]
#proof[
  $=>:$ Suppose $a = r(a)$. Consider $q: A -> lcoset(A, a)$, note that $a = r(a) = q^(-1)(nil(lcoset(A, a)))$. Thus $ a = q^(-1)(inter.big_(p in Spec(lcoset(A, a))) fp ) = inter.big_(fp in Spec(lcoset(A, a))) q^(-1)(fp) = inter.big_(fp in Spec(A) \ a subset.eq fp) fp $

  $<==$: Suppose $ a & = inter.big_(fp in Spec(A) \ a subset.eq fp) fp. $ Let $q: A -> lcoset(A, a)$. Thus $ a & = inter.big_(fp in Spec(lcoset(A, a))) q^(-1)(fp) \
    & = q^(-1)(inter.big_(fp in Spec(lcoset(A, a))) fp ) \
    & = q^(-1)(nil(lcoset(A, a))) \
    & = r(a) $
]

#exercise[
  Let $A$ be a ring, $frak(N)$ its nilradical. Show that the following are equivalent:
  + $A$ has exactly one prime ideal;
  + every element of $A$ is either a unit or nilpotent;
  + $A \/ frak(N)$ is a field.
]
#proof[
  Lowk trivial.
]

#exercise[
  A ring $A$ is Boolean if $x^2 = x$ for all $x in A$. In a Boolean ring $A$, show that
  + $2x = 0$ for all $x in A$;
  + every prime ideal $p$ is maximal, and $A \/ p$ is a field with two elements;
  + every finitely generated ideal in $A$ is principal.
]
#proof[Suppose $A$ is a Boolean ring.
  1. $ x + 1 = (x + 1)^2 = x^2 + 2x + 1 = x + 2x + 1 => 2x = 0. $
  2. First section of the question is exercise 2.7.
  3. We want to show $(x, y) = (x + y + x y)$. One direction is trivial. The other, notice $x (x + y + x y) = x$ and $y(x + y + x y) = y$. To get the generality, proceed by induction on number of generators.
]

#definition("Local Ring")[
  $A$ is a local ring if and only if there is only 1 maximal ideal $frak(m)$. $lcoset(A, frak(m))$ is called the residue field of $A$.
]

#exercise()[
  A local ring contains no idempotent $!= 0, 1$.
]
#proof[
  Let $A$ be a local ring. Let $x in.not {0, 1}$ be a idempotent of $A$.
]

== Construction of an algebraic closure of a field (E. Artin)

#exercise[
  Let $K$ be a field and let $Sigma$ be the set of all irreducible monic polynomials $f$ in one indeterminate with coefficients in $K$. Let $A$ be the polynomial ring over $K$ generated by indeterminates $x_f$, one for each $f in Sigma$. Let $a$ be the ideal of $A$ generated by the polynomials $f(x_f)$ for all $f in Sigma$. Show that $a != (1)$.

  Let $m$ be a maximal ideal of $A$ containing $a$, and let $K_1 = A \/ m$. Then $K_1$ is an extension field of $K$ in which each $f in Sigma$ has a root. Repeat the construction with $K_1$ in place of $K$, obtaining a field $K_2$, and so on. Let $L = union_(n=1)^oo K_n$. Then $L$ is a field in which each $f in Sigma$ splits completely into linear factors. Let $overline(K)$ be the set of all elements of $L$ which are algebraic over $K$. Then $overline(K)$ is an algebraic closure of $K$.
]

#exercise[
  In a ring $A$, let $Sigma$ be the set of all ideals in which every element is a zero-divisor. Show that the set $Sigma$ has maximal elements and that every maximal element of $Sigma$ is a prime ideal. Hence the set of zero-divisors in $A$ is a union of prime ideals.
]

== The prime spectrum of a ring

#exercise[
  Let $A$ be a ring and let $X$ be the set of all prime ideals of $A$. For each subset $E$ of $A$, let $V(E)$ denote the set of all prime ideals of $A$ which contain $E$. Prove that
  + if $a$ is the ideal generated by $E$, then $V(E) = V(a) = V(r(a))$.
  + $V(0) = X$, $V(1) = emptyset$.
  + if $(E_i)_(i in I)$ is any family of subsets of $A$, then
    $ V(union.big_(i in I) E_i) = inter.big_(i in I) V(E_i). $
  + $V(a inter b) = V(a b) = V(a) union V(b)$ for any ideals $a, b$ of $A$.

  These results show that the sets $V(E)$ satisfy the axioms for closed sets in a topological space. The resulting topology is called the *Zariski topology*. The topological space $X$ is called the *prime spectrum* of $A$, and is written $Spec(A)$.
]
#proof[
  1. If $E subset.eq frak(p)$, then all finite $A$-linear combinations of $E$ is contained in $frak(p)$ (by definition of ideal), thus $E subset.eq a subset.eq frak(p)$. Thus $V(E) subset.eq V(a)$. Suppose $a subset.eq fp => E subset.eq frak(p) => V(a) subset.eq V(E).$ Look at $ r(a) = inter.big_(fp in Spec(A) \ a subset.eq fp ) fp. $ Thus if $r(a) subset.eq fp => a subset.eq fp => V(a) subset.eq V(r(a))$. Furthermore, if $a subset.eq fp => r(a) subset.eq fp => V(r(a)) subset.eq V(a)$. Thus $V(a) = V(r(a))$.
  2. $V(0) := {frak(p) in Spec(A): (0) subset.eq frak(p)} = {frak(p) in Spec(A) : 0 in frak(p)} = Spec(A)$. On the other hand $V(X) := {frak(p) in Spec(A) : A subset.eq fp} = emptyset$ because each prime ideal is contained in $A$ and $A$ itself is not prime.
  3. Let $(E_i)_(i in I)$ be a family of subsets of $A$. $ V(union.big_(i in I) E_i ) & = {fp in Spec(A) : union.big_(i in I) E_i subset.eq fp } \
                               & = {fp in Spec(A) : "for all" i in I, E_i subset.eq fp} \
                               & = inter.big_(i in I) {fp in Spec(A) : E_i subset.eq fp} \
                               & = inter.big_(i in I)V(E_i). $
  4. $
      V(a) union V(b) & = {fp in Spec(A) : a subset.eq fp} union {fp in Spec(A) : b subset.eq fp } \
                      & = {fp in Spec(A) : a subset.eq fp or b subset.eq fp} \
                      & subset.eq {fp in Spec(A) : a inter b subset.eq fp} = V(a inter b)
    $

  $ V(a inter b) & = {fp in Spec(A) : a inter b subset.eq fp} subset.eq V(a b). $
  $ V(a b) & = {fp in Spec(A) : a b subset.eq fp}. $ Suppose $a b subset fp.$Assume the contrary, that $a subset.eq.not fp$ and $b subset.eq.not fp$, Thus $exists alpha in a - fp$ and $beta in b - fp$. $alpha beta = 0 in lcoset(A, fp) => alpha in fp$ or $beta in fp$. Thus by contradiction, $alpha subset.eq fp$ or $beta subset.eq fp$. Thus $ V(a b) subset V(A) union V(b). $ Thus we have the chain $ V(a) union V(b) subset.eq V(a inter b) subset.eq.eq V(a b) subset.eq V(a) inter V(b). $

]

#exercise[
  Draw pictures of $Spec(ZZ)$, $Spec(RR)$, $Spec(CC[x])$, $Spec(RR[x])$, $Spec(ZZ[x])$.
]
#proof[

]

#exercise[
  For each $f in A$, let $X_f$ denote the complement of $V(f)$ in $X = Spec(A)$. The sets $X_f$ are open. Show that they form a basis of open sets for the Zariski topology, and that
  + $X_f inter X_g = X_(f g)$;
  + $X_f = emptyset <=> f$ is nilpotent;
  + $X_f = X <=> f$ is a unit;
  + $X_f = X_g <=> r((f)) = r((g))$;
  + $X$ is quasi-compact (that is, every open covering of $X$ has a finite subcovering).
  + More generally, each $X_f$ is quasi-compact.
  + An open subset of $X$ is quasi-compact if and only if it is a finite union of sets $X_f$.

  The sets $X_f$ are called *basic open sets* of $X = Spec(A)$.

  [To prove (v), remark that it is enough to consider a covering of $X$ by basic open sets $X_(f_i)$ $(i in I)$. Show that the $f_i$ generate the unit ideal and hence that there is an equation of the form
  $ 1 = sum_(i in J) g_i f_i quad (g_i in A) $
  where $J$ is some finite subset of $I$. Then the $X_(f_i)$ $(i in J)$ cover $X$.]
]
#proof[
  $
    X_f inter X_g & = (V(f))^c inter (V(g))^c \
                  & = (V(f) union V(g))^c \
                  & = (V(f g))^c = X_(f g)
  $

  $ X_f = emptyset <=> Spec(A) = V(f) = {frak(p) in Spec(A) : (f) subset.eq fp} <=> f in nil $ the last iff follows from the fact that $ nil = inter.big_(fp in Spec(A)) fp. $

  $ X_f = X <=> V(f) = emptyset <=> f "not in any maximal ideal" <=> f "unit" $

  $ X_f = X_g <=> V(r(f)) = V(f) = V(g) = V(r(g)) $. By definition $ r(f) & = inter.big_(fp in V(r(f))) fp = r(g). $

  Did quasi-compactness of $X$ in homework 3 but used closed set definition of compactness.
]

#exercise[
  For psychological reasons it is sometimes convenient to denote a prime ideal of $A$ by a letter such as $x$ or $y$ when thinking of it as a point of $X = Spec(A)$. When thinking of $x$ as a prime ideal of $A$, we denote it by $p_x$ (logically, of course, it is the same thing). Show that
  + the set ${x}$ is closed (we say that $x$ is a "closed point") in $Spec(A) <=> p_x$ is maximal;
  + $overline({x}) = V(p_x)$;
  + $y in overline({x}) <=> p_x subset.eq p_y$;
  + $X$ is a $T_0$-space (this means that if $x, y$ are distinct points of $X$, then either there is a neighborhood of $x$ which does not contain $y$, or else there is a neighborhood of $y$ which does not contain $x$).
]
#proof[
  1. Suppose ${x}$ is closed in $Spec(A)$. By $2$. ${x} = V(p_x)$. Thus there are no other prime ideals (hence maximal ideals), containing $p_x$ and hence $p_x$ must be maximal. The opposite direction follows immediately from the definition of maximal ideals.
  2. $cl({x}) subset.eq V(p_x)$ due to $x in V(p_x)$ and $V(p_x)$ being closed and closure is the smallest closed set containing ${x}$. We want to show that $V(p_x) subset.eq cl({x})$. Let $y in V(p_x)$, by definition $p_x subset.eq p_y$. Since $X_f$ form a basis for the topology of $Spec$, we know that if a open subset  $U in.rev y$, then $exists f in p_y$ such that $X_f subset.eq U$. We want to show that $x in X_f <=> x in.not V(f) <=> f in.not p_x$. Note that $y in X_f => y in.not V(f) => f in.not p_y$. Since $p_x subset.eq p_y$ and if $f in.not p_y => f in.not p_x$. Thus $x in X_f$.
  3. $y in cl({x}) = V(p_x) => p_y subset.eq p_x$. Suppose $p_y subset.eq p_x => y in V(p_x) => y = cl({x})$
  4. This is obvious.
]

#exercise[
  A topological space $X$ is said to be *irreducible* if $X != emptyset$ and if every pair of non-empty open sets in $X$ intersect, or equivalently if every non-empty open set is dense in $X$. Show that $Spec(A)$ is irreducible if and only if the nilradical of $A$ is a prime ideal.
]
#proof[
  Suppose that $Spec(A)$ is irreducible, thus every nonempty open set in $X$ intersects nontrivially or equivalently that the union of any two closed sets not equal to $Spec(A)$ is also not equal to $Spec(A)$. Translating this to a algebraic definition, if $I, J$ are ideals of $A$ which are not contained in all prime ideals of $A$, $I inter J$ is a ideal of $A$ which is not contained in all of the prime ideals of $A$. Note $Spec(A) = V(nil)$. Translating this further, if $a in.not nil$ and $b in.not nil$ then $a b in.not nil$. Meaning that if $a b in nil$ then $a$ or $b$ is in $nil$ and $nil$ is prime. Note all implications are bidirectional. ]

#exercise[
  Let $X$ be a topological space.
  + If $Y$ is an irreducible (Exercise 19) subspace of $X$, then the closure $overline(Y)$ of $Y$ in $X$ is irreducible.
  + Every irreducible subspace of $X$ is contained in a maximal irreducible subspace.
  + The maximal irreducible subspaces of $X$ are closed and cover $X$. They are called the *irreducible components* of $X$. What are the irreducible components of a Hausdorff space?
  + If $A$ is a ring and $X = Spec(A)$, then the irreducible components of $X$ are the closed sets $V(p)$, where $p$ is a minimal prime ideal of $A$ (Exercise 8).
]
#proof[
  + Suppose $Y$ is an irreducible subspace of $X$. Let $A, B$ be closed sets of $cl(Y)$ such that $A subset cl(Y)$ and $B subset cl(Y)$. Note that $A, B$ are closed in $X$. Note that $Y subset.not A$ and $Y subset.not B$ because otherwise $A$ or $B$ would have to be equal to $cl(Y)$. $(Y inter A)$ and $(Y inter B)$ are closed subsets of $Y$, in the subspace topology, whose union is not $Y$. $    Y & != (Y inter A) union (Y inter B) \
         & = Y inter (A union B) \
    => Y & subset.eq.not A union B => A union B != cl(Y). $
  + Let $S$ be a irreducible subspace of $X$. $I = {T subset.eq X : T "irreducible", T supset.eq S}$, $I$ is a poset with the ordering given by $subset.eq$. Let $C$ be a chain. Consider $ U = union.big_(T in C) T, $ we want to show that $U$ is a irreducible subspace of $X$. It suffices to assume that $U = cl(U)$, because if $U$ is irreducible then $cl(U)$ is irreducible and then $cl(U) = U$ and $U$ in chain. Let $A, B$ be closed subsets of $X$ where $A subset U$ and $B subset U$. We want to show that $A union B subset.neq U$. We have a couple cases:
    1. $forall T in S$, $T subset.eq A$ or $T subset.eq B$, then we have a contradiction.
    2. $exists T in S$, where $T subset.eq.not A$ and $T subset.eq.not B$. Thus $A inter T$ and $B inter T$ are closed under the subspace topology of $T$ which don't both cover $T$. Then $T inter (A union B) != T => A union B != U$.

    Thus $A union B != U$. Thus $U$ is irreducible. Thus every chain has a maximal element. Hence by Zorn's Lemma, $S$ is contained in a maximal irreducible subspace.
  + Closure is trivial. A singleton is irreducible and hence must lie in a maximal irreducible subspace of $X$.
]

#exercise[
  Let $phi: A -> B$ be a ring homomorphism. Let $X = Spec(A)$ and $Y = Spec(B)$. If $q in Y$, then $phi^(-1)(q)$ is a prime ideal of $A$, i.e., a point of $X$. Hence $phi$ induces a mapping $phi^*: Y -> X$. Show that
  + if $f in A$ then $(phi^*)^(-1)(X_f) = Y_(phi^(-1) (f))$, and hence that $phi^*$ is continuous.
  + if $a$ is an ideal of $A$, then $(phi^*)^(-1)(V(a)) = V(a^e)$.
  + if $b$ is an ideal of $B$, then $overline(phi^*(V(b))) = V(b^c)$.
  + if $phi$ is surjective, then $phi^*$ is a homeomorphism of $Y$ onto the closed subset $V(ker(phi))$ of $X$. (In particular, $Spec(A)$ and $Spec(A \/ frak(N))$ (where $frak(N)$ is the nilradical of $A$) are naturally homeomorphic.)
  + if $phi$ is injective, then $phi^*(Y)$ is dense in $X$. More precisely, $phi^*(Y)$ is dense in $X <=> ker(phi) subset.eq frak(N)$.
  + let $psi: B -> C$ be another ring homomorphism. Then $(psi compose phi)^* = phi^* compose psi^*$.
  + let $A$ be an integral domain with just one non-zero prime ideal $p$, and let $K$ be the field of fractions of $A$. Let $B = (A \/ p) times K$. Define $phi: A -> B$ by $phi(x) = (overline(x), x)$, where $overline(x)$ is the image of $x$ in $A \/ p$. Show that $phi^*$ is bijective but not a homeomorphism.
]
#proof[
  + Let $f in A$ and $q in Y$. Then
    $
      q in (phi^*)^(-1)(X_f) & <=> phi^*(q) in X_f
                               <=> f in.not phi^(-1)(q) \
                             & <=> phi(f) in.not q
                               <=> q in Y_(phi(f)).
    $
    Hence $(phi^*)^(-1)(X_f) = Y_(phi(f))$. Since the sets $X_f$ form a basis
    for the topology of $X$ and their preimages $Y_(phi(f))$ are open in $Y$,
    $phi^*$ is continuous.
  + $a subset.eq A$, an ideal.$ (phi^*)^(-1)(V(a)) & = (phi^*)^(-1)({x in Spec(A) : a subset.eq p_x}) \
                       & = {x in Spec(B): a subset.eq p_(phi^*(x))} \
                       & = {x in Spec(B) : a subset.eq phi^(-1)(p_x) } \
                       & = {x in Spec(B) : phi(a) subset.eq p_x} \
                       & = {x in Spec(B) : (phi(a)) subset.eq p_x} \
                       & = {x in Spec(B) : a^e subset.eq p_x} \
                       & = V(a^e) $

  + $b subset.eq B$ an ideal: $ V(b^c) & = {x in Spec(A): b^c subset.eq p_x} \
           & = {x in Spec(A): phi^(-1)(b) subset.eq p_x } \
           & = {x in Spec(A) : b subset.eq phi(p_x)} $

    TODO
  + Suppose $phi$ is surjective. We know $phi^*$ is continuous. Note that $B iso lcoset(A, ker(phi))$ as a ring. Note the preimage of a prime ideal of $B$, and hence a prime ideal of $lcoset(A, ker(phi))$, is a prime ideal of $A$ which contains $ker(phi)$. Furthermore, note that this correspondence is bijective. Thus $phi^*$ is a continuous bijection. We just need to show its either open or closed, I will show its closed. $ phi^*(V(I)) & = phi^(*)({x in Spec(B) : I subset.eq p_x}) \
                & = { phi^(*)(x) : x in Spec(B), I subset.eq p_x} \
                & = {x in V(ker(phi)) : I subset.eq phi(p_x)} \
                & = {x in V(ker(phi)) : phi^(-1)(I) subset.eq p_x } \
                & = V(ker(phi)) inter V(phi^(-1)(I)) $ and thus $phi^(*)(V(I))$ is closed. Thus $phi^*$ is a homeomorphism onto its image. Note that $I subset phi(p_x) <=> phi^(-1)(I) subset.eq p_x:$ Suppose $phi^(-1)(I) subset.eq p_x$, apply $phi$ to both sides and because of surjectivity $phi(phi^(-1)(I)) = I$. Suppose $I subset.eq phi(p_x)$, $phi^-1(I) subset.eq phi^(-1)(phi(p_x)) = p_x + ker(phi) = p_x$ because $p_x supset.eq ker(phi)$.

  + $
      cl(phi^(*) (Spec B)) & = V(inter.big_(x in Spec(B)) phi^(-1)(fp_x) ) \
                           & = V(phi^(-1) (inter.big_(x in Spec(B)) p_x) ) \
                           & = V(phi^(-1)(nil(B)) ) \
                           & = V(sqrt(ker phi))
    $
    The last equality follows, because $a in phi^(-1)(nil(B)) <=> phi (a)^n = 0 <=> phi(a^n) = 0 <=> a^n in ker phi.$

    Then $ V(sqrt(ker phi)) & = V(ker phi) \
                     & = Spec(A) $ because $ker phi subset.eq nil(A)$ which is in   inside all prime ideals.
  + Functoriality
  +
]

#exercise[
  Let $A = product_(i=1)^n A_i$ be the direct product of rings $A_i$. Show that $Spec(A)$ is the disjoint union of open (and closed) subspaces $X_i$, where $X_i$ is canonically homeomorphic with $Spec(A_i)$.

  Conversely, let $A$ be any ring. Show that the following statements are equivalent:
  + $X = Spec(A)$ is disconnected.
  + $A iso A_1 times A_2$ where neither of the rings $A_1, A_2$ is the zero ring.
  + $A$ contains an idempotent $!= 0, 1$.

  In particular, the spectrum of a local ring is always connected (Exercise 12).
]

#exercise[
  Let $A$ be a Boolean ring (Exercise 11), and let $X = Spec(A)$.
  + For each $f in A$, the set $X_f$ (Exercise 17) is both open and closed in $X$.
  + Let $f_1, ..., f_n in A$. Show that $X_(f_1) union ... union X_(f_n) = X_f$ for some $f in A$.
  + The sets $X_f$ are the only subsets of $X$ which are both open and closed. [Let $Y subset.eq X$ be both open and closed. Since $Y$ is open, it is a union of basic open sets $X_f$. Since $Y$ is closed and $X$ is quasi-compact (Exercise 17), $Y$ is quasi-compact. Hence $Y$ is a finite union of basic open sets; now use (ii) above.]
  + $X$ is a compact Hausdorff space.
]

#exercise[
  Let $L$ be a lattice, in which the sup and inf of two elements $a, b$ are denoted by $a or.big b$ and $a and.big b$ respectively. $L$ is a *Boolean lattice* (or *Boolean algebra*) if
  + $L$ has a least element and a greatest element (denoted by $0, 1$ respectively).
  + Each of $or.big, and.big$ is distributive over the other.
  + Each $a in L$ has a unique "complement" $a' in L$ such that $a or.big a' = 1$ and $a and.big a' = 0$.

  (For example, the set of all subsets of a set, ordered by inclusion, is a Boolean lattice.)

  Let $L$ be a Boolean lattice. Define addition and multiplication in $L$ by the rules
  $ a + b = (a and.big b') or.big (a' and.big b), quad a b = a and.big b. $
  Verify that in this way $L$ becomes a Boolean ring, $A(L)$.

  Conversely, starting from a Boolean ring $A$, define an ordering on $A$ as follows: $a <= b$ means that $a = a b$. Show that, with respect to this ordering, $A$ is a Boolean lattice. [The sup and inf are given by $a or.big b = a + b + a b$ and $a and.big b = a b$, and the complement by $a' = 1 - a$.] In this way we obtain a one-to-one correspondence between (isomorphism classes of) Boolean rings and (isomorphism classes of) Boolean lattices.
]

#exercise[
  From the last two exercises deduce Stone's theorem, that every Boolean lattice is isomorphic to the lattice of open-and-closed subsets of some compact Hausdorff topological space.
]

#exercise[
  Let $A$ be a ring. The subspace of $Spec(A)$ consisting of the maximal ideals of $A$, with the induced topology, is called the *maximal spectrum* of $A$ and is denoted by $"Max"(A)$. For arbitrary commutative rings it does not have the nice functorial properties of $Spec(A)$ (see Exercise 21), because the inverse image of a maximal ideal under a ring homomorphism need not be maximal.

  Let $X$ be a compact Hausdorff space and let $C(X)$ denote the ring of all real-valued continuous functions on $X$ (add and multiply functions by adding and multiplying their values). For each $x in X$, let $m_x$ be the set of all $f in C(X)$ such that $f(x) = 0$. The ideal $m_x$ is maximal, because it is the kernel of the (surjective) homomorphism $C(X) -> RR$ which takes $f$ to $f(x)$. If $tilde(X)$ denotes $"Max"(C(X))$, we have therefore defined a mapping $mu: X -> tilde(X)$, namely $x |-> m_x$.

  We shall show that $mu$ is a homeomorphism of $X$ onto $tilde(X)$.
  + Let $m$ be any maximal ideal of $C(X)$, and let $V = V(m)$ be the set of common zeros of the functions in $m$: that is,
    $ V = {x in X: f(x) = 0 "for all" f in m}. $
    Suppose that $V$ is empty. Then for each $x in X$ there exists $f_x in C(X)$ such that $f_x (x) != 0$. Since $f_x$ is continuous, there is an open neighborhood $U_x$ of $x$ in $X$ on which $f_x$ does not vanish. By compactness a finite number of the neighborhoods, say $U_(x_1), ..., U_(x_n)$, cover $X$. Let
    $ f = f_(x_1)^2 + ... + f_(x_n)^2. $
    Then $f$ does not vanish at any point of $X$, hence is a unit in $C(X)$. But this contradicts $f in m$, hence $V$ is not empty.

    Let $x$ be a point of $V$. Then $m subset.eq m_x$, hence $m = m_x$ because $m$ is maximal. Hence $mu$ is surjective.
  + By Urysohn's lemma (this is the only non-trivial fact required in the argument) the continuous functions separate the points of $X$. Hence $x != y => m_x != m_y$, and therefore $mu$ is injective.
  + Let $f in C(X)$; let
    $ U_f = {x in X: f(x) != 0} $
    and let
    $ tilde(U)_f = {m in tilde(X): f divides.not m}. $
    Show that $mu(U_f) = tilde(U)_f$. The open sets $U_f$ (resp. $tilde(U)_f$) form a basis of the topology of $X$ (resp. $tilde(X)$) and therefore $mu$ is a homeomorphism.

  Thus $X$ can be reconstructed from the ring of functions $C(X)$.
]

== Affine algebraic varieties

#exercise[
  Let $k$ be an algebraically closed field and let
  $ f_alpha (t_1, ..., t_n) = 0 $
  be a set of polynomial equations in $n$ variables with coefficients in $k$. The set $X$ of all points $x = (x_1, ..., x_n) in k^n$ which satisfy these equations is an *affine algebraic variety*.

  Consider the set of all polynomials $g in k[t_1, ..., t_n]$ with the property that $g(x) = 0$ for all $x in X$. This set is an ideal $I(X)$ in the polynomial ring, and is called the *ideal of the variety* $X$. The quotient ring
  $ P(X) = k[t_1, ..., t_n] \/ I(X) $
  is the ring of polynomial functions on $X$, because two polynomials $g, h$ define the same polynomial function on $X$ if and only if $g - h$ vanishes at every point of $X$, that is, if and only if $g - h in I(X)$.

  Let $xi_i$ be the image of $t_i$ in $P(X)$. The $xi_i$ $(1 <= i <= n)$ are the *coordinate functions* on $X$: if $x in X$, then $xi_i (x)$ is the $i$th coordinate of $x$. $P(X)$ is generated as a $k$-algebra by the coordinate functions, and is called the *coordinate ring* (or *affine algebra*) of $X$.

  As in Exercise 26, for each $x in X$ let $m_x$ be the ideal of all $f in P(X)$ such that $f(x) = 0$; it is a maximal ideal of $P(X)$. Hence, if $tilde(X) = "Max"(P(X))$, we have defined a mapping $mu: X -> tilde(X)$, namely $x |-> m_x$.

  It is easy to show that $mu$ is injective: if $x != y$, we must have $x_i != y_i$ for some $i$ $(1 <= i <= n)$, and hence $xi_i - y_i$ is in $m_x$ but not in $m_y$, so that $m_x != m_y$. What is less obvious (but still true) is that $mu$ is surjective. This is one form of Hilbert's Nullstellensatz (see Chapter 7).
]

#exercise[
  Let $f_1, ..., f_m$ be elements of $k[t_1, ..., t_n]$. They determine a *polynomial mapping* $phi: k^n -> k^m$: if $x in k^n$, the coordinates of $phi(x)$ are $f_1(x), ..., f_m(x)$. Let $X, Y$ be affine algebraic varieties in $k^n, k^m$ respectively. A mapping $phi: X -> Y$ is said to be *regular* if $phi$ is the restriction to $X$ of a polynomial mapping from $k^n$ to $k^m$.

  If $eta$ is a polynomial function on $Y$, then $eta compose phi$ is a polynomial function on $X$. Hence $phi$ induces a $k$-algebra homomorphism $P(Y) -> P(X)$, namely $eta |-> eta compose phi$. Show that in this way we obtain a one-to-one correspondence between the regular mappings $X -> Y$ and the $k$-algebra homomorphisms $P(Y) -> P(X)$.
]
