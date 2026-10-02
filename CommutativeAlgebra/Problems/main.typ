#import "template.typ": *

#show: notes.with(
  title: "Atiyah-Macdonald Exercises",
  author: "Arham Lodha",
  course: "Math 215A",
  instructor: "Burt Totaro",
  cover: false,
  toc: true,
)

#set enum(numbering: "i)")

// ── Usage ────────────────────────────────────────────────────────────────────
//
//  All exercises below are transcribed from Atiyah & Macdonald,
//  "Introduction to Commutative Algebra" (../../Textbooks/atiyah_macdonald-commutative.pdf).
//  Each #exercise[...] auto-numbers via my-prelude as "Exercise <chapter>.<n>",
//  and the counter restarts every chapter — so "Exercise 3.5" here is exactly
//  the book's Chapter 3, Exercise 5, in the book's own order. Bracketed hints
//  from the book are kept inline as [hint text].
// ─────────────────────────────────────────────────────────────────────────────

= Notation
Just a note on notation, $f = sum_(k = 0)^(n) a_k x^k in A[x]$ can be identified with $[a_0, ..., a_k]$ for the sake of notational simplicity.

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

#exercise[
  Let $A$ be a ring and let $A[[x]]$ be the ring of formal power series $f = sum_(n=0)^oo a_n x^n$ with coefficients in $A$. Show that
  + $f$ is a unit in $A[[x]] <=> a_0$ is a unit in $A$.
  + If $f$ is nilpotent, then $a_n$ is nilpotent for all $n >= 0$. Is the converse true? (See Chapter 7, Exercise 2.)
  + $f$ belongs to the Jacobson radical of $A[[x]] <=> a_0$ belongs to the Jacobson radical of $A$.
  + The contraction of a maximal ideal $m$ of $A[[x]]$ is a maximal ideal of $A$, and $m$ is generated by $m^e$ and $x$.
  + Every prime ideal of $A$ is the contraction of a prime ideal of $A[[x]]$.
]

#exercise[
  A ring $A$ is such that every ideal not contained in the nilradical contains a nonzero idempotent (that is, an element $e$ such that $e^2 = e != 0$). Prove that the nilradical and Jacobson radical of $A$ are equal.
]

#exercise[
  Let $A$ be a ring in which every element $x$ satisfies $x^n = x$ for some $n > 1$ (depending on $x$). Show that every prime ideal in $A$ is maximal.
]

#exercise[
  Let $A$ be a ring $!= 0$. Show that the set of prime ideals of $A$ has minimal elements with respect to inclusion.
]

#exercise[
  Let $a$ be an ideal $!= (1)$ in a ring $A$. Show that $a = r(a) <=> a$ is an intersection of prime ideals.
]

#exercise[
  Let $A$ be a ring, $frak(N)$ its nilradical. Show that the following are equivalent:
  + $A$ has exactly one prime ideal;
  + every element of $A$ is either a unit or nilpotent;
  + $A \/ frak(N)$ is a field.
]

#exercise[
  A ring $A$ is Boolean if $x^2 = x$ for all $x in A$. In a Boolean ring $A$, show that
  + $2x = 0$ for all $x in A$;
  + every prime ideal $p$ is maximal, and $A \/ p$ is a field with two elements;
  + every finitely generated ideal in $A$ is principal.
]

#exercise[
  A local ring contains no idempotent $!= 0, 1$.
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
    $ V(union_(i in I) E_i) = inter_(i in I) V(E_i). $
  + $V(a inter b) = V(a b) = V(a) union V(b)$ for any ideals $a, b$ of $A$.

  These results show that the sets $V(E)$ satisfy the axioms for closed sets in a topological space. The resulting topology is called the *Zariski topology*. The topological space $X$ is called the *prime spectrum* of $A$, and is written $Spec(A)$.
]

#exercise[
  Draw pictures of $Spec(ZZ)$, $Spec(RR)$, $Spec(CC[x])$, $Spec(RR[x])$, $Spec(ZZ[x])$.
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

#exercise[
  For psychological reasons it is sometimes convenient to denote a prime ideal of $A$ by a letter such as $x$ or $y$ when thinking of it as a point of $X = Spec(A)$. When thinking of $x$ as a prime ideal of $A$, we denote it by $p_x$ (logically, of course, it is the same thing). Show that
  + the set ${x}$ is closed (we say that $x$ is a "closed point") in $Spec(A) <=> p_x$ is maximal;
  + $overline({x}) = V(p_x)$;
  + $y in overline({x}) <=> p_x subset.eq p_y$;
  + $X$ is a $T_0$-space (this means that if $x, y$ are distinct points of $X$, then either there is a neighborhood of $x$ which does not contain $y$, or else there is a neighborhood of $y$ which does not contain $x$).
]

#exercise[
  A topological space $X$ is said to be *irreducible* if $X != emptyset$ and if every pair of non-empty open sets in $X$ intersect, or equivalently if every non-empty open set is dense in $X$. Show that $Spec(A)$ is irreducible if and only if the nilradical of $A$ is a prime ideal.
]

#exercise[
  Let $X$ be a topological space.
  + If $Y$ is an irreducible (Exercise 19) subspace of $X$, then the closure $overline(Y)$ of $Y$ in $X$ is irreducible.
  + Every irreducible subspace of $X$ is contained in a maximal irreducible subspace.
  + The maximal irreducible subspaces of $X$ are closed and cover $X$. They are called the *irreducible components* of $X$. What are the irreducible components of a Hausdorff space?
  + If $A$ is a ring and $X = Spec(A)$, then the irreducible components of $X$ are the closed sets $V(p)$, where $p$ is a minimal prime ideal of $A$ (Exercise 8).
]

#exercise[
  Let $phi: A -> B$ be a ring homomorphism. Let $X = Spec(A)$ and $Y = Spec(B)$. If $q in Y$, then $phi^(-1)(q)$ is a prime ideal of $A$, i.e., a point of $X$. Hence $phi$ induces a mapping $phi^*: Y -> X$. Show that
  + if $f in A$ then $(phi^*)^(-1)(X_f) = Y_(phi(f))$, and hence that $phi^*$ is continuous.
  + if $a$ is an ideal of $A$, then $(phi^*)^(-1)(V(a)) = V(a^e)$.
  + if $b$ is an ideal of $B$, then $overline(phi^*(V(b))) = V(b^c)$.
  + if $phi$ is surjective, then $phi^*$ is a homeomorphism of $Y$ onto the closed subset $V(ker(phi))$ of $X$. (In particular, $Spec(A)$ and $Spec(A \/ frak(N))$ (where $frak(N)$ is the nilradical of $A$) are naturally homeomorphic.)
  + if $phi$ is injective, then $phi^*(Y)$ is dense in $X$. More precisely, $phi^*(Y)$ is dense in $X <=> ker(phi) subset.eq frak(N)$.
  + let $psi: B -> C$ be another ring homomorphism. Then $(psi compose phi)^* = phi^* compose psi^*$.
  + let $A$ be an integral domain with just one non-zero prime ideal $p$, and let $K$ be the field of fractions of $A$. Let $B = (A \/ p) times K$. Define $phi: A -> B$ by $phi(x) = (overline(x), x)$, where $overline(x)$ is the image of $x$ in $A \/ p$. Show that $phi^*$ is bijective but not a homeomorphism.
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

= Modules

#exercise[
  Show that $(ZZ \/ m ZZ) times.circle_ZZ (ZZ \/ n ZZ) = 0$ if $m, n$ are coprime.
]

#exercise[
  Let $A$ be a ring, $a$ an ideal, $M$ an $A$-module. Show that $(A \/ a) times.circle_A M$ is isomorphic to $M \/ a M$. [Tensor the exact sequence $0 -> a -> A -> A \/ a -> 0$ with $M$.]
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

#exercise[
  Let $p$ be a prime ideal in $A$. Show that $p[x]$ is a prime ideal in $A[x]$. If $m$ is a maximal ideal in $A$, is $m[x]$ a maximal ideal in $A[x]$?
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

= Rings and Modules of Fractions

#exercise[
  Let $S$ be a multiplicatively closed subset of a ring $A$, and let $M$ be a finitely generated $A$-module. Prove that $S^(-1) M = 0$ if and only if there exists $s in S$ such that $s M = 0$.
]

#exercise[
  Let $a$ be an ideal of a ring $A$, and let $S = 1 + a$. Show that $S^(-1) a$ is contained in the Jacobson radical of $S^(-1) A$.

  Use this result and Nakayama's lemma to give a proof of (2.5) which does not depend on determinants. [If $M = a M$, then $S^(-1) M = (S^(-1) a)(S^(-1) M)$, hence by Nakayama we have $S^(-1) M = 0$. Now use Exercise 1.]
]

#exercise[
  Let $A$ be a ring, let $S$ and $T$ be two multiplicatively closed subsets of $A$, and let $U$ be the image of $T$ in $S^(-1) A$. Show that the rings $(S T)^(-1) A$ and $U^(-1)(S^(-1) A)$ are isomorphic.
]

#exercise[
  Let $f: A -> B$ be a homomorphism of rings and let $S$ be a multiplicatively closed subset of $A$. Let $T = f(S)$. Show that $S^(-1) B$ and $T^(-1) B$ are isomorphic as $S^(-1) A$-modules.
]

#exercise[
  Let $A$ be a ring. Suppose that, for each prime ideal $p$, the local ring $A_p$ has no nilpotent element $!= 0$. Show that $A$ has no nilpotent element $!= 0$. If each $A_p$ is an integral domain, is $A$ necessarily an integral domain?
]

#exercise[
  Let $A$ be a ring $!= 0$ and let $Sigma$ be the set of all multiplicatively closed subsets $S$ of $A$ such that $0 in.not S$. Show that $Sigma$ has maximal elements, and that $S in Sigma$ is maximal if and only if $A - S$ is a minimal prime ideal of $A$.
]

#exercise[
  A multiplicatively closed subset $S$ of a ring $A$ is said to be *saturated* if
  $ x y in S <=> x in S "and" y in S. $
  Prove that
  + $S$ is saturated $<=> A - S$ is a union of prime ideals.
  + If $S$ is any multiplicatively closed subset of $A$, there is a unique smallest saturated multiplicatively closed subset $overline(S)$ containing $S$, and that $overline(S)$ is the complement in $A$ of the union of the prime ideals which do not meet $S$. ($overline(S)$ is called the *saturation* of $S$.)

  If $S = 1 + a$, where $a$ is an ideal of $A$, find $overline(S)$.
]

#exercise[
  Let $S, T$ be multiplicatively closed subsets of $A$, such that $S subset.eq T$. Let $phi: S^(-1) A -> T^(-1) A$ be the homomorphism which maps each $a\/s in S^(-1) A$ to $a\/s$ considered as an element of $T^(-1) A$. Show that the following statements are equivalent:
  + $phi$ is bijective.
  + For each $t in T$, $t\/1$ is a unit in $S^(-1) A$.
  + For each $t in T$ there exists $x in A$ such that $x t in S$.
  + $T$ is contained in the saturation of $S$ (Exercise 7).
  + Every prime ideal which meets $T$ also meets $S$.
]

#exercise[
  The set $S_0$ of all non-zero-divisors in $A$ is a saturated multiplicatively closed subset of $A$. Hence the set $D$ of zero-divisors in $A$ is a union of prime ideals (see Chapter 1, Exercise 14). Show that every minimal prime ideal of $A$ is contained in $D$. [Use Exercise 6.]

  The ring $S_0^(-1) A$ is called the *total ring of fractions* of $A$. Prove that
  + $S_0$ is the largest multiplicatively closed subset of $A$ for which the homomorphism $A -> S_0^(-1) A$ is injective.
  + Every element in $S_0^(-1) A$ is either a zero-divisor or a unit.
  + Every ring in which every non-unit is a zero-divisor is equal to its total ring of fractions (i.e., $A -> S_0^(-1) A$ is bijective).
]

#exercise[
  Let $A$ be a ring.
  + If $A$ is absolutely flat (Chapter 2, Exercise 27) and $S$ is any multiplicatively closed subset of $A$, then $S^(-1) A$ is absolutely flat.
  + $A$ is absolutely flat $<=> A_m$ is a field for each maximal ideal $m$.
]

#exercise[
  Let $A$ be a ring. Prove that the following are equivalent:
  + $A \/ fN$ is absolutely flat ($fN$ being the nilradical of $A$).
  + Every prime ideal of $A$ is maximal.
  + $Spec(A)$ is a $T_1$-space (i.e., every subset consisting of a single point is closed).
  + $Spec(A)$ is Hausdorff.

  If these conditions are satisfied, show that $Spec(A)$ is compact and totally disconnected (i.e. the only connected subsets of $Spec(A)$ are those consisting of a single point).
]

#exercise[
  Let $A$ be an integral domain and $M$ an $A$-module. An element $x in M$ is a *torsion element* of $M$ if $"Ann"(x) != 0$, that is if $x$ is killed by some non-zero element of $A$. Show that the torsion elements of $M$ form a submodule of $M$. This submodule is called the *torsion submodule* of $M$ and is denoted by $T(M)$. If $T(M) = 0$, the module $M$ is said to be *torsion-free*. Show that
  + If $M$ is any $A$-module, then $M \/ T(M)$ is torsion-free.
  + If $f: M -> N$ is a module homomorphism, then $f(T(M)) subset.eq T(N)$.
  + If $0 -> M' -> M -> M'' -> 0$ is an exact sequence, then the sequence $0 -> T(M') -> T(M) -> T(M'')$ is exact.
  + If $M$ is any $A$-module, then $T(M)$ is the kernel of the mapping $x |-> 1 times.circle x$ of $M$ into $K times.circle_A M$, where $K$ is the field of fractions of $A$.

  [For iv), show that $K$ may be regarded as the direct limit of its submodules $A xi$ $(xi in K)$; using Chapter 1, Exercise 15 and Exercise 20, show that if $1 times.circle x = 0$ in $K times.circle M$ then $xi^(-1) x = 0$ in $A xi times.circle M$ for some $xi != 0$. Deduce that $xi^(-1) x = 0$.]
]

#exercise[
  Let $S$ be a multiplicatively closed subset of an integral domain $A$. In the notation of Exercise 12, show that $T(S^(-1) M) = S^(-1)(T(M))$. Deduce that the following are equivalent:
  + $M$ is torsion-free.
  + $M_p$ is torsion-free for all prime ideals $p$.
  + $M_m$ is torsion-free for all maximal ideals $m$.
]

#exercise[
  Let $M$ be an $A$-module and $a$ an ideal of $A$. Suppose that $M_m = 0$ for all maximal ideals $m supset.eq a$. Prove that $M = a M$. [Pass to the $A\/a$-module $M \/ a M$ and use (3.8).]
]

#exercise[
  Let $A$ be a ring, and let $F$ be the $A$-module $A^n$. Show that every set of $n$ generators of $F$ is a basis of $F$. [Let $x_1, ..., x_n$ be a set of generators and $e_1, ..., e_n$ the canonical basis of $F$. Define $phi: F -> F$ by $phi(e_i) = x_i$. Then $phi$ is surjective and we have to prove that it is an isomorphism. By (3.9) we may assume that $A$ is a local ring. Since $F$ is a flat $A$-module, the exact sequence $0 -> N -> F -> F -> 0$ given us an exact sequence $0 -> k times.circle N -> k times.circle F ->^(1 times.circle phi) k times.circle F -> 0$. Now $k times.circle F = k^n$ is an $n$-dimensional vector space over $k$; $1 times.circle phi$ is surjective, hence bijective, hence $k times.circle N = 0$.

  Also $N$ is finitely generated, by Chapter 2, Exercise 12, hence $N = 0$ by Nakayama's lemma. Hence $phi$ is an isomorphism.]

  Deduce that every set of generators of $F$ has at least $n$ elements.
]

#exercise[
  Let $B$ be a flat $A$-algebra. Then the following conditions are equivalent:
  + $a^(e c) = a$ for all ideals $a$ of $A$.
  + $Spec(B) -> Spec(A)$ is surjective.
  + For every maximal ideal $m$ of $A$ we have $m^e != (1)$.
  + If $M$ is any non-zero $A$-module, then $M_B != 0$.
  + For every $A$-module $M$, the mapping $x |-> 1 times.circle x$ of $M$ into $M_B$ is injective.

  [For i) $=>$ ii), use (3.16). ii) $=>$ iii) is clear. iii) $=>$ iv): Let $x$ be a non-zero element of $M$ and let $M' = A x$. Since $B$ is flat over $A$ it is enough to show that $M'_B != 0$. We have $M' iso A \/ a$ for some ideal $a != (1)$. Since $B$ is flat over $A$, $M'_B iso B \/ a^e$. Now $a subset.eq m$ for some maximal ideal $m$, hence $a^e subset.eq m^e != (1)$. Hence $M'_B != 0$.

  iv) $=>$ v): Let $M'$ be the kernel of $M -> M_B$. But (Chapter 2, Exercise 13, with $N = M_B$) the mapping $M'_B -> M_B$ is injective. Hence $M'_B = 0$ and therefore $M' = 0$.

  v) $=>$ i): Take $M = A \/ a$.]

  $B$ is said to be *faithfully flat* over $A$.
]

#exercise[
  Let $A ->^f B ->^g C$ be ring homomorphisms. If $g compose f$ is flat and $g$ is faithfully flat, then $f$ is flat.
]

#exercise[
  Let $f: A -> B$ be a flat homomorphism of rings, let $q$ be a prime ideal of $B$ and let $p = q^c$. Then $f^*: Spec(B_q) -> Spec(A_p)$ is surjective. [For $B_p$ is flat over $A_p$ by (3.10), and $B_q$ is a local ring of $B_p$, hence flat over $B_p$ by (3.10). Hence $B_q$ is flat over $A_p$ and satisfies condition (3) of Exercise 16.]
]

#exercise[
  Let $A$ be a ring, $M$ an $A$-module. The *support* of $M$ is defined to be the set Supp$(M)$ of prime ideals $p$ of $A$ such that $M_p != 0$. Prove the following results:
  + $M != 0 <=>$ Supp$(M) != emptyset$.
  + $V(a) =$ Supp$(A \/ a)$.
  + If $0 -> M' -> M -> M'' -> 0$ is an exact sequence, then Supp$(M) =$ Supp$(M') union$ Supp$(M'')$.
  + If $M = sum_i M_i$, then Supp$(M) = union_i$ Supp$(M_i)$.
  + If $M, N$ are finitely generated, then Supp$(M times.circle_A N) =$ Supp$(M) inter$ Supp$(N)$. [Use Chapter 2, Exercise 3.]
  + If $M$ is finitely generated, then Supp$(M) = V("Ann"(M))$ (and is therefore a closed subset of $Spec(A)$).
  + If $M$ is finitely generated and $a$ is an ideal of $A$, then Supp$(M \/ a M) = V(a + "Ann"(M))$.
  + If $f: A -> B$ is a ring homomorphism and $M$ is a finitely generated $A$-module, then Supp$(B times.circle_A M) = f^(*-1)($Supp$(M))$.
]

#exercise[
  Let $f: A -> B$ be a ring homomorphism, $f^*: Spec(B) -> Spec(A)$ the associated mapping. Show that
  + Every prime ideal of $A$ is a contracted ideal $<=> f^*$ is surjective.
  + Every prime ideal of $B$ is an extended ideal $=> f^*$ is injective.

  Is the converse of ii) true?
]

#exercise[
  + Let $A$ be a ring, $S$ a multiplicatively closed subset of $A$, and $phi: A -> S^(-1) A$ the canonical homomorphism. Show that $phi^*: Spec(S^(-1) A) -> Spec(A)$ is a homeomorphism of $Spec(S^(-1) A)$ onto its image in $X = Spec(A)$. Let this image be denoted by $S^(-1) X$.

  In particular, if $f in A$, the image of $Spec(A_f)$ in $X$ is the basic open set $X_f$ (Chapter 1, Exercise 17).

  + Let $f: A -> B$ be a ring homomorphism. Let $X = Spec(A)$ and $Y = Spec(B)$, and let $f^*: Y -> X$ be the mapping associated with $f$. Identifying $Spec(S^(-1) A)$ with its canonical image $S^(-1) X$ in $X$, and $Spec(S^(-1) B)$ ($= Spec((f(S))^(-1) B)$) with its canonical image $S^(-1) Y$ in $Y$, show that $S^(-1) f^*$: $Spec(S^(-1) B) -> Spec(S^(-1) A)$ is the restriction of $f^*$ to $S^(-1) Y$, and that $S^(-1) Y = f^(*-1)(S^(-1) X)$.

  + Let $a$ be an ideal of $A$ and let $b = a^e$ be its extension in $B$. Let $overline(f): A\/a -> B\/b$ be the homomorphism induced by $f$. If $Spec(A\/a)$ is identified with its canonical image $V(a)$ in $X$, and $Spec(B\/b)$ with its canonical image $V(b)$ in $Y$, show that $overline(f)^*$ is the restriction of $f^*$ to $V(b)$.

  + Let $p$ be a prime ideal of $A$. Take $S = A - p$ in ii) and then reduce mod $S^(-1) p$ as in iii). Deduce that the subspace $f^(*-1)(p)$ of $Y$ is naturally homeomorphic to $Spec(B_p \/ p B_p) = Spec(k(p) times.circle_A B)$, where $k(p)$ is the residue field of the local ring $A_p$.

  $Spec(k(p) times.circle_A B)$ is called the *fiber* of $f^*$ over $p$.
]

#exercise[
  Let $A$ be a ring and $p$ a prime ideal of $A$. Then the canonical image of $Spec(A_p)$ in $Spec(A)$ is equal to the intersection of all the open neighborhoods of $p$ in $Spec(A)$.
]

#exercise[
  Let $A$ be a ring, let $X = Spec(A)$ and let $U$ be a basic open set in $X$ (i.e., $U = X_f$ for some $f in A$: Chapter 1, Exercise 17).
  + If $U = X_f$, show that the ring $A(U) = A_f$ depends only on $U$ and not on $f$.
  + Let $U' = X_g$ be another basic open set such that $U' subset.eq U$. Show that there is an equation of the form $g^n = u f$ for some integer $n > 0$ and some $u in A$, and use this to define a homomorphism $rho: A(U) -> A(U')$ (i.e., $A_f -> A_g$) by mapping $a\/f^m$ to $a u^m \/ g^(m n)$. Show that $rho$ depends only on $U$ and $U'$. This homomorphism is called the *restriction* homomorphism.
  + If $U = U'$, then $rho$ is the identity map.
  + If $U supset.eq U' supset.eq U''$ are basic open sets in $X$, show that restricting from $U$ to $U''$ directly agrees with restricting first from $U$ to $U'$ and then from $U'$ to $U''$ (i.e., the restriction homomorphisms compose consistently).
  + Let $x (= p)$ be a point of $X$. Show that
    $ lim_(U in.rev x) A(U) iso A_p. $
  The assignment of the ring $A(U)$ to each basic open set $U$ of $X$, and the restriction homomorphisms $rho$, satisfying the conditions iii) and iv) above, constitutes a *presheaf of rings* on the basis of open sets $(X_f)_(f in A)$. v) says that the stalk of this presheaf at $x in X$ is the corresponding local ring $A_p$.
]

#exercise[
  Show that the presheaf of Exercise 23 has the following property. Let $(U_i)_(i in I)$ be a covering of $X$ by basic open sets. For each $i in I$ let $s_i in A(U_i)$ be such that, for each pair of indices $i, j$, the images of $s_i$ and $s_j$ in $A(U_i inter U_j)$ are equal. Then there exists a unique $s in A (= A(X))$ whose image in $A(U_i)$ is $s_i$, for all $i in I$. (This essentially implies that the presheaf is a *sheaf*.)
]

#exercise[
  Let $f: A -> B$, $g: A -> C$ be ring homomorphisms and let $h: A -> B times.circle_A C$ be defined by $h(x) = f(x) times.circle g(x)$. Let $X, Y, Z, T$ be the prime spectra of $A, B, C, B times.circle_A C$ respectively. Then $h^*(T) = f^*(Y) inter g^*(Z)$.

  [Let $p in X$, and let $k = k(p)$ be the residue field at $p$. By Exercise 21, the fiber $h^(*-1)(p)$ is the spectrum of $(B times.circle_A C) times.circle_A k iso (B times.circle_A k) times.circle_k (C times.circle_A k)$. Hence $p in h^*(T) <=> (B times.circle_A k) times.circle_k (C times.circle_A k) != 0 <=> B times.circle_A k != 0$ and $C times.circle_A k != 0 <=> p in f^*(Y) inter g^*(Z)$.]
]

#exercise[
  Let $(A_alpha, g_(alpha beta))$ be a direct system of rings and $B$ the direct limit. For each $alpha$, let $f_alpha: A_alpha -> B_alpha$ be a ring homomorphism such that $g_(alpha beta) compose f_alpha = f_beta$ whenever $alpha <= beta$ (i.e. the $B_alpha$ form a direct system of $A$-algebras). The $f_alpha$ induce $f: A -> B$. Show that
  $ f^*(Spec(B)) = inter_alpha f_alpha^*(Spec(B_alpha)). $
  [Let $p in Spec(A)$. Then $f^(*-1)(p)$ is the spectrum of
  $ B times.circle_A k(p) iso lim_(->) (B_alpha times.circle_A k(p)) $
  (since tensor products commute with direct limits: Chapter 2, Exercise 20). By Exercise 21 of Chapter 2 it follows that $f^(*-1)(p) = emptyset$ if and only if $B_alpha times.circle_A k(p) = 0$ for some $alpha$, i.e., if and only if $f_alpha^(*-1)(p) = emptyset$.]
]

#exercise[
  + Let $f_alpha: A -> B_alpha$ be any family of $A$-algebras and let $f: A -> B$ be their tensor product over $A$ (Chapter 2, Exercise 23). Then
    $ f^*(Spec(B)) = inter_alpha f_alpha^*(Spec(B_alpha)). $
    [Use Exercises 25 and 26.]
  + Let $f_alpha: A -> B_alpha$ be any finite family of $A$-algebras and let $B = product_alpha B_alpha$. Define $f: A -> B$ by $f(x) = (f_alpha (x))$. Then $f^*(Spec(B)) = union_alpha f_alpha^*(Spec(B_alpha))$.
  + Hence the subsets of $X = Spec(A)$ of the form $f^*(Spec(B))$, where $f: A -> B$ is a ring homomorphism, satisfy the axioms for closed sets in a topological space. The associated topology is the *constructible* topology on $X$. It is finer than the Zariski topology (i.e., there are more open sets and, or equivalently more closed sets).
  + Let $X_C$ denote the set $X$ endowed with the constructible topology. Show that $X_C$ is quasi-compact.
]

#exercise[
  (Continuation of Exercise 27.)
  + For each $g in A$, the set $X_g$ (Chapter 1, Exercise 17) is both open and closed in the constructible topology.
  + Let $C'$ denote the smallest topology on $X$ for which the sets $X_g$ are both open and closed, and let $X_(C')$ denote the set $X$ endowed with this topology. Show that $X_(C')$ is Hausdorff.
  + Deduce that the identity mapping $X_C -> X_(C')$ is a homeomorphism. Hence a subset $E$ of $X$ is of the form $f^*(Spec(B))$ for some $f: A -> B$ if and only if it is closed in the topology $C'$.
  + The topological space $X_C$ is compact, Hausdorff and totally disconnected.
]

#exercise[
  Let $f: A -> B$ be a ring homomorphism. Show that $f^*: Spec(B) -> Spec(A)$ is a continuous *closed* mapping (i.e., maps closed sets to closed sets) for the constructible topology.
]

#exercise[
  Show that the Zariski topology and the constructible topology on $Spec(A)$ are the same if and only if $A \/ fN$ is absolutely flat (where $fN$ is the nilradical of $A$). [Use Exercise 11.]
]

= Primary Decomposition

#exercise[
  If an ideal $a$ has a primary decomposition, then $Spec(A \/ a)$ has only finitely many irreducible components.
]

#exercise[
  If $a = r(a)$, then $a$ has no embedded prime ideals.
]

#exercise[
  If $A$ is absolutely flat, every primary ideal is maximal.
]

#exercise[
  In the polynomial ring $ZZ[t]$, the ideal $m = (2, t)$ is maximal and the ideal $q = (4, t)$ is $m$-primary, but is not a power of $m$.
]

#exercise[
  In the polynomial ring $K[x, y, z]$ where $K$ is a field and $x, y, z$ are independent indeterminates, let $p_1 = (x, y)$, $p_2 = (x, z)$, $m = (x, y, z)$; $p_1$ and $p_2$ are prime, and $m$ is maximal. Let $a = p_1 p_2$. Show that $a = p_1 inter p_2 inter m^2$ is a reduced primary decomposition of $a$. Which components are isolated and which are embedded?
]

#exercise[
  Let $X$ be an infinite compact Hausdorff space, $C(X)$ the ring of real-valued continuous functions on $X$ (Chapter 1, Exercise 26). Is the zero ideal decomposable in this ring?
]

#exercise[
  Let $A$ be a ring and let $A[x]$ denote the ring of polynomials in one indeterminate over $A$. For each ideal $a$ of $A$, let $a[x]$ denote the set of all polynomials in $A[x]$ with coefficients in $a$.
  + $a[x]$ is the extension of $a$ to $A[x]$.
  + If $p$ is a prime ideal in $A$, then $p[x]$ is a prime ideal in $A[x]$.
  + If $q$ is a $p$-primary ideal in $A$, then $q[x]$ is a $p[x]$-primary ideal in $A[x]$. [Use Chapter 1, Exercise 2.]
  + If $a = inter_(i=1)^n q_i$ is a minimal primary decomposition in $A$, then $a[x] = inter_(i=1)^n q_i [x]$ is a minimal primary decomposition in $A[x]$.
  + If $p$ is a minimal prime ideal of $a$, then $p[x]$ is a minimal prime ideal of $a[x]$.
]

#exercise[
  Let $k$ be a field. Show that in the polynomial ring $k[x_1, ..., x_n]$ the ideals $p_i = (x_1, ..., x_i)$ $(1 <= i <= n)$ are prime and all their powers are primary. [Use Exercise 7.]
]

#exercise[
  In a ring $A$, let $D(A)$ denote the set of prime ideals $p$ which satisfy the following condition: there exists $a in A$ such that $p$ is minimal in the set of prime ideals containing $(0:a)$. Show that $x in A$ is a zero divisor $<=> x in p$ for some $p in D(A)$.

  Let $S$ be a multiplicatively closed subset of $A$, and identify $Spec(S^(-1) A)$ with its image in $Spec(A)$ (Chapter 3, Exercise 21). Show that
  $ D(S^(-1) A) = D(A) inter Spec(S^(-1) A). $
  If the zero ideal has a primary decomposition, show that $D(A)$ is the set of associated prime ideals of $0$.
]

#exercise[
  For any prime ideal $p$ in a ring $A$, let $S_p (0)$ denote the kernel of the homomorphism $A -> A_p$.
  + $S_p (0) subset.eq p$.
  + $r(S_p (0)) = p <=> p$ is a minimal prime ideal of $A$.
  + If $p supset.eq p'$, then $S_p (0) subset.eq S_(p') (0)$.
  + $inter_(p in D(A)) S_p (0) = 0$, where $D(A)$ is defined in Exercise 9.
]

#exercise[
  If $p$ is a minimal prime ideal of a ring $A$, show that $S_p (0)$ (Exercise 10) is the smallest $p$-primary ideal.

  Let $a$ be the intersection of the ideals $S_p (0)$ as $p$ runs through the minimal prime ideals of $A$. Show that $a$ is contained in the nilradical of $A$.

  Suppose that the zero ideal is decomposable. Prove that $a = 0$ if and only if every prime ideal of $0$ is isolated.
]

#exercise[
  Let $A$ be a ring, $S$ a multiplicatively closed subset of $A$. For any ideal $a$, let $S(a)$ denote the contraction of $S^(-1) a$ in $A$. The ideal $S(a)$ is called the *saturation* of $a$ with respect to $S$. Prove that
  + $S(a) inter S(b) = S(a inter b)$
  + $S(r(a)) = r(S(a))$
  + $S(a) = (1) <=> a$ meets $S$
  + $S_1 (S_2 (a)) = (S_1 S_2)(a)$.

  If $a$ has a primary decomposition, prove that the set of ideals $S(a)$ (where $S$ runs through multiplicatively closed subsets of $A$) is finite.
]

#exercise[
  Let $A$ be a ring and $p$ a prime ideal of $A$. The *$n$th symbolic power* of $p$ is defined to be the ideal (in the notation of Exercise 12)
  $ p^((n)) = S_p (p^n) $
  where $S_p = A - p$. Show that
  + $p^((n))$ is a $p$-primary ideal;
  + if $p^n$ has a primary decomposition, then $p^((n))$ is its $p$-primary component;
  + if $p^((m)) p^((n))$ has a primary decomposition, then $p^((m+n))$ is its $p$-primary component;
  + $p^((n)) = p^n <=> p^((n))$ is $p$-primary.
]

#exercise[
  Let $a$ be a decomposable ideal in a ring $A$ and let $p$ be a maximal element of the set of ideals $(a : x)$, where $x in A$ and $x in.not a$. Show that $p$ is a prime ideal belonging to $a$.
]

#exercise[
  Let $a$ be a decomposable ideal in a ring $A$, let $Sigma$ be an isolated set of prime ideals belonging to $a$, and let $q_Sigma$ be the intersection of the corresponding primary components. Let $f$ be an element of $A$ such that, for each prime ideal $p$ belonging to $a$, we have $f in p <=> p in.not Sigma$, and let $S_f$ be the set of all powers of $f$. Show that
  $ q_Sigma = S_f (a) = (a : f^n) $
  for all large $n$.
]

#exercise[
  If $A$ is a ring in which every ideal has a primary decomposition, show that every ring of fractions $S^(-1) A$ has the same property.
]

#exercise[
  Let $A$ be a ring with the following property:

  (L1) For every ideal $a != (1)$ in $A$ and every prime ideal $p$, there exists $x in.not p$ such that $S_p (a) = (a : x)$.

  Then every ideal in $A$ is an intersection of (possibly infinitely many) primary ideals.

  [Let $a$ be an ideal $!= (1)$ in $A$, and let $p_1$ be a minimal element of the set of prime ideals containing $a$. Then $q_1 = S_(p_1)(a)$ is $p_1$-primary (by Exercise 11), and $q_1 = (a : x)$ for some $x in.not p_1$. Show that $a = q_1 inter (a + (x))$.

  Now let $a_1$ be a maximal element of the set of ideals $b supset.eq a$ such that $q_1 inter b = a$, and choose $a_1$ so that $x in a_1$, and therefore $a_1 subset.not p_1$. Repeat the construction starting with $a_1$, and so on. At the $n$th stage we have $a = q_1 inter ... inter q_n inter a_n$ where the $q_i$ are primary ideals, $a_n$ is maximal among the ideals $b supset.eq a_(n-1) = a_n inter q_n$ such that $a = q_1 inter ... inter q_n inter b$, and $a_n subset.not p_n$. If at any stage we have $a_n = (1)$, the process stops, and $a$ is a finite intersection of primary ideals. If not, continue by transfinite induction, observing that each $a_n$ strictly contains $a_(n-1)$.]
]

#exercise[
  Consider the following condition on a ring $A$:

  (L2) Given an ideal $a$ and a descending chain $S_1 supset.eq S_2 supset.eq ... supset.eq S_n supset.eq ...$ of multiplicatively closed subsets of $A$, there exists an integer $n$ such that $S_n (a) = S_(n+1)(a) = ...$.

  Prove that the following are equivalent:
  + Every ideal in $A$ has a primary decomposition;
  + $A$ satisfies (L1) and (L2).

  [For i) $=>$ ii), use Exercises 12 and 15. For ii) $=>$ i) show, with the notation of the proof of Exercise 17, that if $S_n = S_(p_1) inter ... inter S_(p_n)$ then $S_n$ meets $a_n$, hence $S_n (a_n) = (1)$, and therefore $S_n (a) = q_1 inter ... inter q_n$. Now use (L2) to show that the construction must terminate after a finite number of steps.]
]

#exercise[
  Let $A$ be a ring and $p$ a prime ideal of $A$. Show that every $p$-primary ideal of $A$ contains $S_p (0)$, the kernel of the canonical homomorphism $A -> A_p$.

  Suppose that $A$ satisfies the following condition: for every prime ideal $p$, the intersection of all $p$-primary ideals of $A$ is equal to $S_p (0)$. (Noetherian rings satisfy this condition: see Chapter 10.) Let $p_1, ..., p_n$ be distinct prime ideals, none of which is a minimal prime ideal of $A$. Then there exists an ideal $a$ in $A$ whose associated prime ideals are $p_1, ..., p_n$.

  [Proof by induction on $n$. The case $n = 1$ is trivial (take $a = p_1$). Suppose $n > 1$ and let $p_n$ be maximal in the set $\{p_1, ..., p_n\}$. By the inductive hypothesis there exists an ideal $b$ and a minimal primary decomposition $b = q_1 inter ... inter q_(n-1)$, where each $q_i$ is $p_i$-primary. If $b subset.eq S_(p_n)(0)$, let $p$ be a minimal prime ideal of $A$ contained in $p_n$. Then $S_(p_n)(0) subset.eq S_p (0)$, hence $b subset.eq S_p (0)$. Taking radicals and using Exercise 10, we have $p_1 inter ... inter p_(n-1) subset.eq p$, hence some $p_i subset.eq p$, hence $p_i = p$ since $p$ is minimal. This is a contradiction since no $p_i$ is minimal. Hence $b subset.not S_(p_n)(0)$ and therefore there exists a $p_n$-primary ideal $q_n$ such that $b subset.not q_n$. Show that $a = q_1 inter ... inter q_n$ has the required properties.]
]

== Primary decomposition of modules

Practically the whole of this chapter can be transposed to the context of modules over a ring $A$. The following exercises indicate how this is done.

#exercise[
  Let $M$ be a fixed $A$-module, $N$ a submodule of $M$. The *radical* of $N$ in $M$ is defined to be
  $ r_M (N) = {x in A: x^q M subset.eq N "for some" q > 0}. $
  Show that $r_M (N) = r(N : M) = r("Ann"(M\/N))$. In particular, $r_M (N)$ is an ideal.

  State and prove the formulas for $r_M$ analogous to (1.13).
]

#exercise[
  An element $x in A$ defines an endomorphism $phi_x$ of $M$, namely $m |-> x m$. The element $x$ is said to be a *zero-divisor* (resp. *nilpotent*) in $M$ if $phi_x$ is not injective (resp. is nilpotent). A submodule $Q$ of $M$ is *primary in $M$* if $Q != M$ and every zero-divisor in $M\/Q$ is nilpotent.

  Show that if $Q$ is primary in $M$, then $(Q : M)$ is a primary ideal and hence $r_M (Q)$ is a prime ideal $p$. We say that $Q$ is $p$-primary (in $M$).

  Prove the analogues of (4.3) and (4.4).
]

#exercise[
  A *primary decomposition* of $N$ in $M$ is a representation of $N$ as an intersection
  $ N = Q_1 inter ... inter Q_n $
  of primary submodules of $M$; it is a *minimal primary decomposition* if the ideals $p_i = r_M (Q_i)$ are all distinct and if none of the components $Q_i$ can be omitted from the intersection, that is if $Q_i subset.not inter_(j != i) Q_j$ $(1 <= i <= n)$.

  Prove the analogue of (4.5), that the prime ideals $p_i$ depend only on $N$ (and $M$). They are called the *prime ideals belonging to* $N$ in $M$. Show that they are also the prime ideals belonging to $0$ in $M\/N$.
]

#exercise[
  State and prove the analogues of (4.6)–(4.11) inclusive. (There is no loss of generality in taking $N = 0$.)
]

= Integral Dependence and Valuations

#exercise[
  Let $f: A -> B$ be an integral homomorphism of rings. Show that $f^*: Spec(B) -> Spec(A)$ is a *closed* mapping, i.e. that it maps closed sets to closed sets. (This is a geometrical equivalent of (5.10).)
]

#exercise[
  Let $A$ be a subring of a ring $B$ such that $B$ is integral over $A$, and let $f: A -> Omega$ be a homomorphism of $A$ into an algebraically closed field $Omega$. Show that $f$ can be extended to a homomorphism of $B$ into $Omega$. [Use (5.10).]
]

#exercise[
  Let $f: B -> B'$ be a homomorphism of $A$-algebras, and let $C$ be an $A$-algebra. If $f$ is integral, prove that $f times.circle 1: B times.circle_A C -> B' times.circle_A C$ is integral. (This includes (5.6) ii) as a special case.)
]

#exercise[
  Let $A$ be a subring of a ring $B$ such that $B$ is integral over $A$. Let $m$ be a maximal ideal of $B$ and let $n = m inter A$ be the corresponding maximal ideal of $A$. Is $B_n$ necessarily integral over $A_n$?

  [Consider the subring $k[x^2 - 1]$ of $k[x]$, where $k$ is a field, and let $n = (x - 1)$. Can the element $1\/(x + 1)$ be integral?]
]

#exercise[
  Let $A subset.eq B$ be rings, $B$ integral over $A$.
  + If $x in A$ is a unit in $B$ then it is a unit in $A$.
  + The Jacobson radical of $A$ is the contraction of the Jacobson radical of $B$.
]

#exercise[
  Let $B_1, ..., B_n$ be integral $A$-algebras. Show that $product_(i=1)^n B_i$ is an integral $A$-algebra.
]

#exercise[
  Let $A$ be a subring of a ring $B$, such that the set $B - A$ is closed under multiplication. Show that $A$ is integrally closed in $B$.
]

#exercise[
  + Let $A$ be a subring of an integral domain $B$, and let $C$ be the integral closure of $A$ in $B$. Let $f, g$ be monic polynomials in $B[x]$ such that $f g in C[x]$. Then $f, g$ are in $C[x]$. [Take a field containing $B$ in which the polynomials $f, g$ split into linear factors: say $f = product (x - xi_i)$, $g = product (x - eta_j)$. Each $xi_i$ and each $eta_j$ is a root of $f g$, hence is integral over $C$. Hence the coefficients of $f$ and $g$ are integral over $C$.]
  + Prove the same result without assuming that $B$ (or $A$) is an integral domain.
]

#exercise[
  Let $A$ be a subring of a ring $B$ and let $C$ be the integral closure of $A$ in $B$. Prove that $C[x]$ is the integral closure of $A[x]$ in $B[x]$. [If $f in B[x]$ is integral over $A[x]$, then
  $ f^m + g_1 f^(m-1) + ... + g_m = 0 quad (g_i in A[x]). $
  Let $r$ be an integer larger than $m$ and the degrees of $g_1, ..., g_m$, and let $f_1 = f - x^r$, so that
  $ (f_1 + x^r)^m + g_1 (f_1 + x^r)^(m-1) + ... + g_m = 0 $
  or say
  $ f_1^m + h_1 f_1^(m-1) + ... + h_m = 0, $
  where $h_m = (x^r)^m + g_1 (x^r)^(m-1) + ... + g_m in A[x]$. Now apply Exercise 8 to the polynomials $-f_1$ and $f_1^(m-1) + h_1 f_1^(m-2) + ... + h_(m-1)$.]
]

#exercise[
  A ring homomorphism $f: A -> B$ is said to have the *going-up property* (resp. the *going-down property*) if the conclusion of the going-up theorem (5.11) (resp. the going-down theorem (5.16)) holds for $B$ and the subring $f(A)$.

  Let $f^*: Spec(B) -> Spec(A)$ be the mapping associated with $f$.
  + Consider the following statements: (a) $f^*$ is a closed mapping. (b) $f$ has the going-up property. (c) Let $q$ be any prime ideal of $B$ and let $p = q^c$. Then $f^*: Spec(B\/q) -> Spec(A\/p)$ is surjective. Prove that (a) $=>$ (b) $<=>$ (c). (See also Chapter 6, Exercise 11.)
  + Consider the following three statements: (a') $f^*$ is an open mapping. (b') $f$ has the going-down property. (c') For any prime ideal $q$ of $B$, if $p = q^c$, then $f^*: Spec(B_q) -> Spec(A_p)$ is surjective. Prove that (a') $=>$ (c') $<=>$ (b').

  [To prove (a') $=>$ (c'), observe that $B_q$ is the direct limit of the rings $B_t$ where $t in B - q$; hence, by Chapter 3, Exercise 26, we have $f^*(Spec(B_q)) = inter_t f^*(Spec(B_t)) = inter_t f^*(Y_t)$. Since $Y_t$ is an open neighborhood of $q$ in $Y$, and since $f^*$ is open, it follows that $f^*(Y_t)$ is an open neighborhood of $p$ in $X$ and therefore contains $Spec(A_p)$.]
]

#exercise[
  Let $f: A -> B$ be a flat homomorphism of rings. Then $f$ has the going-down property. [Chapter 3, Exercise 18.]
]

#exercise[
  Let $G$ be a finite group of automorphisms of a ring $A$, and let $A^G$ denote the subring of $G$-invariants, that is of all $x in A$ such that $sigma(x) = x$ for all $sigma in G$. Prove that $A$ is integral over $A^G$. [If $x in A$, observe that $x$ is a root of the polynomial $product_(sigma in G) (t - sigma(x))$.]

  Let $S$ be a multiplicatively closed subset of $A$ such that $sigma(S) subset.eq S$ for all $sigma in G$, and let $S^G = S inter A^G$. Show that the action of $G$ on $A$ extends to an action on $S^(-1) A$, and that $(S^G)^(-1) A^G iso (S^(-1) A)^G$.
]

#exercise[
  In the situation of Exercise 12, let $p$ be a prime ideal of $A^G$, and let $P$ be the set of prime ideals of $A$ whose contraction is $p$. Show that $G$ acts transitively on $P$. In particular, $P$ is finite.

  [Let $p_1, p_2 in P$ and let $x in p_1$. Then $product_sigma sigma(x) in p_1 inter A^G = p subset.eq p_2$, hence $sigma(x) in p_2$ for some $sigma in G$. Deduce that $p_1$ is contained in $union_(sigma in G) sigma(p_2)$, and then apply (1.11) and (5.9).]
]

#exercise[
  Let $A$ be an integrally closed domain, $K$ its field of fractions and $L$ a finite normal separable extension of $K$. Let $G$ be the Galois group of $L$ over $K$ and let $B$ be the integral closure of $A$ in $L$. Show that $sigma(B) = B$ for all $sigma in G$, and that $A = B^G$.
]

#exercise[
  Let $A, K$ be as in Exercise 14, let $L$ be any finite extension field of $K$, and let $B$ be the integral closure of $A$ in $L$. Show that, if $p$ is any prime ideal of $A$, then the set of prime ideals $q$ of $B$ which contract to $p$ is finite (in other words, that $Spec(B) -> Spec(A)$ has finite fibers).

  [Reduce to the two cases (a) $L$ separable over $K$ and (b) $L$ purely inseparable over $K$. In case (a), embed $L$ in a finite normal separable extension of $K$, and use Exercises 13 and 14. In case (b), if $q$ is a prime ideal of $B$ such that $q inter A = p$, show that $q$ is the set of all $x in B$ such that $x^(p^m) in p$ for some $m >= 0$, where $p$ is the characteristic of $K$, and hence that $Spec(B) -> Spec(A)$ is bijective in this case.]
]

== Noether's normalization lemma

#exercise[
  Let $k$ be a field and let $A != 0$ be a finitely generated $k$-algebra. Then there exist elements $y_1, ..., y_r in A$ which are algebraically independent over $k$ and such that $A$ is integral over $k[y_1, ..., y_r]$. (The result is still true if $k$ is finite, but a different proof is needed.)

  We shall assume that $k$ is *infinite*. Let $x_1, ..., x_n$ generate $A$ as a $k$-algebra. We can renumber the $x_i$ so that $x_1, ..., x_r$ are algebraically independent over $k$ and each of $x_(r+1), ..., x_n$ is algebraic over $k[x_1, ..., x_r]$. Now proceed by induction on $n$. If $n = r$ there is nothing to do, so suppose $n > r$ and the result true for $n - 1$ generators. Let $x_n$ be algebraic over $k[x_1, ..., x_(n-1)]$, then there exists a polynomial $f != 0$ in $n$ variables such that $f(x_1, ..., x_(n-1), x_n) = 0$. Let $F$ be the homogeneous part of highest degree in $f$. Since $k$ is infinite, there exist $lambda_1, ..., lambda_(n-1) in k$ such that $F(lambda_1, ..., lambda_(n-1), 1) != 0$. Put $x'_i = x_i - lambda_i x_n$ $(1 <= i <= n - 1)$. Show that $x_n$ is integral over the ring $A' = k[x'_1, ..., x'_(n-1)]$, and hence that $A$ is integral over $A'$. Then apply the inductive hypothesis to $A'$ to complete the proof.

  From the proof it follows that $y_1, ..., y_r$ may be chosen to be linear combinations of $x_1, ..., x_n$. This has the following geometrical interpretation: if $k$ is algebraically closed and $X$ is an affine algebraic variety in $k^n$ with coordinate ring $A != 0$, then there exists a linear subspace $L$ of dimension $r$ in $k^n$ and a linear mapping of $k^n$ onto $L$ which maps $X$ onto $L$. [Use Exercise 2.]
]

== Nullstellensatz (weak form)

#exercise[
  Let $X$ be an affine algebraic variety in $k^n$, where $k$ is an algebraically closed field, and let $I(X)$ be the ideal of $X$ in the polynomial ring $k[t_1, ..., t_n]$ (Chapter 1, Exercise 27). If $I(X) != (1)$ then $X$ is not empty. [Let $A = k[t_1, ..., t_n]\/I(X)$ be the coordinate ring of $X$. Then $A != 0$, hence by Exercise 16 there exists a linear subspace $L$ of dimension $>= 0$ in $k^n$ and a mapping of $X$ onto $L$. Hence $X != emptyset$.]

  Deduce that every maximal ideal in the ring $k[t_1, ..., t_n]$ is of the form $(t_1 - a_1, ..., t_n - a_n)$ where $a_i in k$.
]

#exercise[
  Let $k$ be a field and let $B$ be a finitely generated $k$-algebra. Suppose that $B$ is a field. Then $B$ is a finite algebraic extension of $k$. (This is another version of Hilbert's Nullstellensatz. For other proofs, see (5.24), (7.9).)

  Let $x_1, ..., x_n$ generate $B$ as a $k$-algebra. The proof is by induction on $n$. If $n = 1$ the result is clearly true, so assume $n > 1$. Let $A = k[x_1]$ and let $K = k(x_1)$ be the field of fractions of $A$. By the inductive hypothesis, $B$ is a finite algebraic extension of $K$, hence each $x_2, ..., x_n$ satisfies a monic polynomial equation with coefficients in $K$, i.e. coefficients of the form $a\/b$ where $a$ and $b$ are in $A$. If $f$ is the product of the denominators of all these coefficients, then each of $x_2, ..., x_n$ is integral over $A_f$. Hence $B$ and therefore $K$ is integral over $A_f$.

  Suppose $x_1$ is transcendental over $k$. Then $A$ is integrally closed, because it is a unique factorization domain. Hence $A_f$ is integrally closed (5.12), and therefore $A_f = K$, which is clearly absurd. Hence $x_1$ is algebraic over $k$, hence $K$ (and therefore $B$) is a finite extension of $k$.
]

#exercise[
  Deduce the result of Exercise 17 from Exercise 18.
]

#exercise[
  Let $A$ be a subring of an integral domain $B$ such that $B$ is finitely generated over $A$. Show that there exists $s != 0$ in $A$ and elements $y_1, ..., y_n$ in $B$, algebraically independent over $A$ and such that $B_s$ is integral over $B'_s$, where $B' = A[y_1, ..., y_n]$.

  [Let $S = A - \{0\}$ and let $K = S^(-1) A$. Then $S^(-1) B$ is a finitely generated $K$-algebra and therefore by the normalization lemma (Exercise 16) there exist $x_1, ..., x_n$ in $S^(-1) B$, algebraically independent over $K$ and such that $S^(-1) B$ is integral over $K[x_1, ..., x_n]$. Let $z_1, ..., z_m$ generate $B$ as an $A$-algebra. Then each $z_j$ (regarded as an element of $S^(-1) B$) is integral over $K[x_1, ..., x_n]$. By writing an equation of integral dependence for each $z_j$, show that there exists $s in S$ such that $x_i = y_i \/ s$ $(1 <= i <= n)$ with $y_i in B$, and such that each $s z_j$ is integral over $B'$. Deduce that this $s$ satisfies the conditions stated.]
]

#exercise[
  Let $A, B$ be as in Exercise 20. Show that there exists $s != 0$ in $A$ such that, if $Omega$ is an algebraically closed field and $f: A -> Omega$ is a homomorphism for which $f(s) != 0$, then $f$ can be extended to a homomorphism $B -> Omega$.

  [With the notation of Exercise 20, $f$ can be extended first of all to $B'$, for example by mapping each $y_i$ to $0$; then to $B'_s$ (because $f(s) != 0$), and finally to $B_s$ (by Exercise 2, because $B_s$ is integral over $B'_s$).]
]

#exercise[
  Let $A, B$ be as in Exercise 20. If the Jacobson radical of $A$ is zero, then so is the Jacobson radical of $B$.

  [Let $v != 0$ be an element of $B$. We have to show that there is a maximal ideal of $B$ which does not contain $v$. By applying Exercise 21 to the ring $B_v$ and its subring $A$, we obtain an element $s != 0$ in $A$. Let $m$ be a maximal ideal of $A$ such that $s in.not m$, and let $k = A\/m$. Then the canonical mapping $A -> k$ extends to a homomorphism $g$ of $B_v$ into an algebraic closure $Omega$ of $k$. Then $g(v) != 0$ and $"ker"(g) inter B$ is a maximal ideal of $B$.]
]

#exercise[
  Let $A$ be a ring. Show that the following are equivalent:
  + Every prime ideal in $A$ is an intersection of maximal ideals.
  + In every homomorphic image of $A$ the nilradical is equal to the Jacobson radical.
  + Every prime ideal in $A$ which is not maximal is equal to the intersection of the prime ideals which contain it strictly.

  [The only hard part is iii) $=>$ ii). Suppose ii) false, then there is a prime ideal which is not an intersection of maximal ideals. Passing to the quotient ring, we may assume that $A$ is an integral domain whose Jacobson radical $fN$ is not zero. Let $f$ be a non-zero element of $fN$. Then $A_f != 0$, hence $A_f$ has a maximal ideal, whose contraction in $A$ is a prime ideal $p$ such that $f in.not p$, and which is maximal with respect to this property. Then $p$ is not maximal and is not equal to the intersection of the prime ideals strictly containing $p$.]

  A ring $A$ with the three equivalent properties above is called a *Jacobson ring*.
]

#exercise[
  Let $A$ be a Jacobson ring (Exercise 23) and $B$ an $A$-algebra. Show that if $B$ is either (i) integral over $A$ or (ii) finitely generated as an $A$-algebra, then $B$ is Jacobson. [Use Exercise 22 for (ii).]

  In particular, every finitely generated ring, and every finitely generated algebra over a field, is a Jacobson ring.
]

#exercise[
  Let $A$ be a ring. Show that the following are equivalent:
  + $A$ is a Jacobson ring;
  + Every finitely generated $A$-algebra $B$ which is a field is finite over $A$.

  [i) $=>$ ii). Reduce to the case where $A$ is a subring of $B$, and use Exercise 21. If $s in A$ is as in Exercise 21, then there exists a maximal ideal $m$ of $A$ not containing $s$, and the homomorphism $A -> A\/m = k$ extends to a homomorphism $g$ of $B$ into the algebraic closure of $k$. Since $B$ is a field, $g$ is injective, and $g(B)$ is algebraic over $k$, hence finite algebraic over $k$.

  ii) $=>$ i). Use criterion iii) of Exercise 23. Let $p$ be a prime ideal of $A$ which is not maximal, and let $B = A\/p$. Let $f$ be a non-zero element of $B$. Then $B_f$ is a finitely generated $A$-algebra. If it is a field it is finite over $B$, hence integral over $B$ and therefore $B$ is a field (5.7). Hence $B_f$ is not a field and therefore has a non-zero prime ideal, whose contraction in $B$ is a non-zero ideal $p'$ such that $f in.not p'$.]
]

#exercise[
  Let $X$ be a topological space. A subset $X_0$ of $X$ is *locally closed* if it is the intersection of an open set and a closed set, or equivalently if it is open in its closure.

  The following conditions on a subset $X_0$ of $X$ are equivalent: (1) Every non-empty locally closed subset of $X$ meets $X_0$; (2) For every closed set $E$ in $X$ we have $overline(E inter X_0) = E$; (3) The mapping $U |-> U inter X_0$ of the collection of open sets of $X$ onto the collection of open sets of $X_0$ is bijective.

  A subset $X_0$ satisfying these conditions is said to be *very dense* in $X$.

  If $A$ is a ring, show that the following are equivalent:
  + $A$ is a Jacobson ring;
  + The set of maximal ideals of $A$ is very dense in $Spec(A)$;
  + Every locally closed subset of $Spec(A)$ consisting of a single point is closed.

  [ii) and iii) are geometrical formulations of conditions ii) and iii) of Exercise 23.]
]

== Valuation rings and valuations

#exercise[
  Let $A, B$ be two local rings. $B$ is said to *dominate* $A$ if $A$ is a subring of $B$ and the maximal ideal $m$ of $A$ is contained in the maximal ideal $n$ of $B$ (or, equivalently, if $m = n inter A$). Let $K$ be a field and let $Sigma$ be the set of all local subrings of $K$. If $Sigma$ is ordered by the relation of domination, show that $Sigma$ has maximal elements and that $A in Sigma$ is maximal if and only if $A$ is a valuation ring of $K$. [Use (5.21).]
]

#exercise[
  Let $A$ be an integral domain, $K$ its field of fractions. Show that the following are equivalent: (1) $A$ is a valuation ring of $K$; (2) If $a, b$ are any two ideals of $A$, then either $a subset.eq b$ or $b subset.eq a$.

  Deduce that if $A$ is a valuation ring and $p$ is a prime ideal of $A$, then $A_p$ and $A\/p$ are valuation rings of their fields of fractions.
]

#exercise[
  Let $A$ be a valuation ring of a field $K$. Show that every subring of $K$ which contains $A$ is a local ring of $A$.
]

#exercise[
  Let $A$ be a valuation ring of a field $K$. The group $U$ of units of $A$ is a subgroup of the multiplicative group $K^*$ of $K$.

  Let $Gamma = K^* \/ U$. If $xi, eta in Gamma$ are represented by $x, y in K$, define $xi >= eta$ to mean $x y^(-1) in A$. Show that this defines a total ordering on $Gamma$ which is compatible with the group structure (i.e., $xi >= eta => xi omega >= eta omega$ for all $omega in Gamma$). In other words, $Gamma$ is a totally ordered abelian group. It is called the *value group* of $A$.

  Let $v: K^* -> Gamma$ be the canonical homomorphism. Show that $v(x + y) >= min(v(x), v(y))$ for all $x, y in K^*$.
]

#exercise[
  Conversely, let $Gamma$ be a totally ordered abelian group (written *additively*), and let $K$ be a field. A *valuation of $K$ with values in $Gamma$* is a mapping $v: K^* -> Gamma$ such that (1) $v(x y) = v(x) + v(y)$, (2) $v(x + y) >= min(v(x), v(y))$, for all $x, y in K^*$. Show that the set of elements $x in K^*$ such that $v(x) >= 0$ is a valuation ring of $K$. This ring is called the *valuation ring* of $v$, and the subgroup $v(K^*)$ of $Gamma$ is the *value group* of $v$.

  Thus the concepts of valuation ring and valuation are essentially equivalent.
]

#exercise[
  Let $Gamma$ be a totally ordered abelian group. A subgroup $Delta$ of $Gamma$ is *isolated* in $Gamma$ if, whenever $0 <= beta <= alpha$ and $alpha in Delta$, we have $beta in Delta$. Let $A$ be a valuation ring of a field $K$, with value group $Gamma$ (Exercise 31). If $p$ is a prime ideal of $A$, show that $v(A - p)$ is the set of elements $>= 0$ in an isolated subgroup $Delta$ of $Gamma$, and that the mapping so defined of $Spec(A)$ into the set of isolated subgroups of $Gamma$ is bijective.

  If $p$ is a prime ideal of $A$, what are the value groups of the valuation rings $A\/p$, $A_p$?
]

#exercise[
  Let $Gamma$ be a totally ordered abelian group. We shall show how to construct a field $K$ and a valuation $v$ of $K$ with $Gamma$ as value group. Let $k$ be any field and let $A = k[Gamma]$ be the group algebra of $Gamma$ over $k$. By definition, $A$ is freely generated as a $k$-vector space by elements $x_alpha$ $(alpha in Gamma)$ such that $x_alpha x_beta = x_(alpha + beta)$. Show that $A$ is an integral domain.

  If $u = lambda_1 x_(alpha_1) + ... + lambda_n x_(alpha_n)$ is any non-zero element of $A$, where the $lambda_i$ are all $!= 0$ and $alpha_1 < ... < alpha_n$, define $v_0(u)$ to be $alpha_1$. Show that $v_0: A - \{0\} -> Gamma$ satisfies conditions (1) and (2) of Exercise 31.

  Let $K$ be the field of fractions of $A$. Show that $v_0$ can be uniquely extended to a valuation $v$ of $K$, and that the value group of $v$ is precisely $Gamma$.
]

#exercise[
  Let $A$ be a valuation ring and $K$ its field of fractions. Let $f: A -> B$ be a ring homomorphism such that $f^*: Spec(B) -> Spec(A)$ is a *closed* mapping. Then if $g: B -> K$ is any $A$-algebra homomorphism (i.e., if $g compose f$ is the embedding of $A$ in $K$) we have $g(B) = A$.

  [Let $C = g(B)$; obviously $C supset.eq A$. Let $n$ be a maximal ideal of $C$. Since $f^*$ is closed, $C_n$ dominates $A_m$, whence $A_m = A$. Also the local ring $C_n$ dominates $A_m$. Hence by Exercise 27 we have $C_n = A$ and therefore $C subset.eq A$.]
]

#exercise[
  From Exercises 1 and 3 it follows that, if $f: A -> B$ is integral and $C$ is any $A$-algebra, then the mapping $(f times.circle 1)^*: Spec(B times.circle_A C) -> Spec(C)$ is a closed map.

  Conversely, suppose that $f: A -> B$ has this property and that $B$ is an integral domain. Then $f$ is integral. [Replacing $A$ by its image in $B$, reduce to the case where $A subset.eq B$ and $f$ is the injection. Let $K$ be the field of fractions of $B$ and let $A'$ be a valuation ring of $K$ containing $A$. By (5.22) it is enough to show that $A'$ contains $B$. By hypothesis, $Spec(B times.circle_A A') -> Spec(A')$ is a closed map. Apply the result of Exercise 34 to the homomorphism $B times.circle_A A' -> K$ defined by $b times.circle a' |-> b a'$. It follows that $b a' in A'$ for all $b in B$ and all $a' in A'$; taking $a' = 1$, we have what we want.]

  Show that the result just proved remains valid if $B$ is a ring with only finitely many minimal prime ideals (e.g., if $B$ is Noetherian). [Let $p_i$ be the minimal prime ideals. Then each composite homomorphism $A -> B -> B\/p_i$ is integral, hence $A -> product (B\/p_i)$ is integral, hence $A -> B\/fN$ is integral (where $fN$ is the nilradical of $B$), hence finally $A -> B$ is integral.]
]

= Chain Conditions

#exercise[
  Let $M$ be a Noetherian $A$-module and $u: M -> M$ a module homomorphism.
  + If $u$ is surjective, then $u$ is an isomorphism.
  + If $M$ is Artinian and $u$ is injective, then again $u$ is an isomorphism.

  [For (i), consider the submodules $"ker"(u^n)$; for (ii), the quotient modules $"coker"(u^n)$.]
]

#exercise[
  Let $M$ be an $A$-module. If every non-empty set of finitely generated submodules of $M$ has a maximal element, then $M$ is Noetherian.
]

#exercise[
  Let $M$ be an $A$-module and let $N_1, N_2$ be submodules of $M$. If $M\/N_1$ and $M\/N_2$ are Noetherian, so is $M\/(N_1 inter N_2)$. Similarly with Artinian in place of Noetherian.
]

#exercise[
  Let $M$ be a Noetherian $A$-module and let $a$ be the annihilator of $M$ in $A$. Prove that $A\/a$ is a Noetherian ring.

  If we replace "Noetherian" by "Artinian" in this result, is it still true?
]

#exercise[
  A topological space $X$ is said to be *Noetherian* if the open subsets of $X$ satisfy the ascending chain condition (or, equivalently, the maximal condition). Since closed subsets are complements of open subsets, it comes to the same thing to say that the closed subsets of $X$ satisfy the descending chain condition (or, equivalently, the minimal condition). Show that, if $X$ is Noetherian, then every subspace of $X$ is Noetherian, and that $X$ is quasi-compact.
]

#exercise[
  Prove that the following are equivalent:
  + $X$ is Noetherian.
  + Every open subspace of $X$ is quasi-compact.
  + Every subspace of $X$ is quasi-compact.
]

#exercise[
  A Noetherian space is a finite union of irreducible closed subspaces. [Consider the set $Sigma$ of closed subsets of $X$ which are not finite unions of irreducible closed subspaces.] Hence the set of irreducible components of a Noetherian space is finite.
]

#exercise[
  If $A$ is a Noetherian ring then $Spec(A)$ is a Noetherian topological space. Is the converse true?
]

#exercise[
  Deduce from Exercise 8 that the set of minimal prime ideals in a Noetherian ring is finite.
]

#exercise[
  If $M$ is a Noetherian module (over an arbitrary ring $A$) then Supp$(M)$ is a closed Noetherian subspace of $Spec(A)$.
]

#exercise[
  Let $f: A -> B$ be a ring homomorphism and suppose that $Spec(B)$ is a Noetherian space (Exercise 5). Prove that $f^*: Spec(B) -> Spec(A)$ is a closed mapping if and only if $f$ has the going-up property (Chapter 5, Exercise 10).
]

#exercise[
  Let $A$ be a ring such that $Spec(A)$ is a Noetherian space. Show that the set of prime ideals of $A$ satisfies the ascending chain condition. Is the converse true?
]

= Noetherian Rings

#exercise[
  Let $A$ be a non-Noetherian ring and let $Sigma$ be the set of ideals in $A$ which are not finitely generated. Show that $Sigma$ has maximal elements and that the maximal elements of $Sigma$ are prime ideals.

  [Let $a$ be a maximal element of $Sigma$, and suppose that there exist $x, y in A$ such that $x in.not a$ and $y in.not a$ and $x y in a$. Show that there exists a finitely generated ideal $a_0 subset.eq a$ such that $a_0 + (x) = a + (x)$, and that $a = a_0 + x dot.op (a : x)$. Since $(a : x)$ strictly contains $a$, it is finitely generated and therefore so is $a$.]

  Hence a ring in which every prime ideal is finitely generated is Noetherian (I. S. Cohen).
]

#exercise[
  Let $A$ be a Noetherian ring and let $f = sum_(n=0)^oo a_n x^n in A[[x]]$. Prove that $f$ is nilpotent if and only if each $a_n$ is nilpotent.
]

#exercise[
  Let $a$ be an irreducible ideal in a ring $A$. Then the following are equivalent:
  + $a$ is primary;
  + for every multiplicatively closed subset $S$ of $A$ we have $(S^(-1) a)^c = (a : x)$ for some $x in S$;
  + the sequence $(a : x^n)$ is stationary, for every $x in A$.
]

#exercise[
  Which of the following rings are Noetherian?
  + The ring of rational functions of $z$ having no pole on the circle $|z| = 1$.
  + The ring of power series in $z$ with a positive radius of convergence.
  + The ring of power series in $z$ with an infinite radius of convergence.
  + The ring of polynomials in $z$ whose first $k$ derivatives vanish at the origin ($k$ being a fixed integer).
  + The ring of polynomials in $z, w$ all of whose partial derivatives with respect to $w$ vanish for $z = 0$.

  In all cases the coefficients are complex numbers.
]

#exercise[
  Let $A$ be a Noetherian ring, $B$ a finitely generated $A$-algebra, $G$ a finite group of $A$-automorphisms of $B$, and $B^G$ the set of all elements of $B$ which are left fixed by every element of $G$. Show that $B^G$ is a finitely generated $A$-algebra.
]

#exercise[
  If a finitely generated ring $K$ is a field, it is a finite field. [If $K$ has characteristic 0, we have $ZZ subset.eq QQ subset.eq K$. Since $K$ is finitely generated over $ZZ$ it is finitely generated over $QQ$, hence by (7.9) is a finitely generated $QQ$-module. Now apply (7.8) to obtain a contradiction. Hence $K$ is of characteristic $p > 0$, hence is finitely generated as a $ZZ\/(p)$-algebra. Use (7.9) to complete the proof.]
]

#exercise[
  Let $X$ be an affine algebraic variety given by a family of equations $f_alpha (t_1, ..., t_n) = 0$ $(alpha in I)$ (Chapter 1, Exercise 27). Show that there exists a finite subset $I_0$ of $I$ such that $X$ is given by the equations $f_alpha (t_1, ..., t_n) = 0$ for $alpha in I_0$.
]

#exercise[
  If $A[x]$ is Noetherian, is $A$ necessarily Noetherian?
]

#exercise[
  Let $A$ be a ring such that (1) for each maximal ideal $m$ of $A$, the local ring $A_m$ is Noetherian; (2) for each $x != 0$ in $A$, the set of maximal ideals of $A$ which contain $x$ is finite.

  Show that $A$ is Noetherian.

  [Let $a != 0$ be an ideal in $A$. Let $m_1, ..., m_r$ be the maximal ideals which contain $a$. Choose $x_0 != 0$ in $a$ and let $m_1, ..., m_(r+s)$ be the maximal ideals which contain $x_0$. Since $m_(r+1), ..., m_(r+s)$ do not contain $a$ there exist $x_j in a$ such that $x_j in.not m_(r+j)$ $(1 <= j <= s)$. Since each $A_(m_i)$ $(1 <= i <= r)$ is Noetherian, the extension of $a$ in $A_(m_i)$ is finitely generated. Hence there exist $x_(s+1), ..., x_t$ in $a$ whose images in $A_(m_i)$ generate $a A_(m_i)$ for $i = 1, ..., r$. Let $a_0 = (x_0, ..., x_t)$. Show that $a_0$ and $a$ have the same extension in $A_m$ for every maximal ideal $m$, and deduce by (3.9) that $a_0 = a$.]
]

#exercise[
  Let $M$ be a Noetherian $A$-module. Show that $M[x]$ (Chapter 2, Exercise 6) is a Noetherian $A[x]$-module.
]

#exercise[
  Let $A$ be a ring such that each local ring $A_p$ is Noetherian. Is $A$ necessarily Noetherian?
]

#exercise[
  Let $A$ be a ring and $B$ a faithfully flat $A$-algebra (Chapter 3, Exercise 16). If $B$ is Noetherian, show that $A$ is Noetherian. [Use the ascending chain condition.]
]

#exercise[
  Let $f: A -> B$ be a ring homomorphism of finite type and let $f^*: Spec(B) -> Spec(A)$ be the mapping associated with $f$. Show that the fibers of $f^*$ are Noetherian subspaces of $B$.
]

== Nullstellensatz, strong form

#exercise[
  Let $k$ be an algebraically closed field, let $A$ denote the polynomial ring $k[t_1, ..., t_n]$ and let $a$ be an ideal in $A$. Let $V$ be the variety in $k^n$ defined by the ideal $a$, so that $V$ is the set of all $x = (x_1, ..., x_n) in k^n$ such that $f(x) = 0$ for all $f in a$. Let $I(V)$ be the ideal of $V$, i.e. the ideal of all polynomials $g in A$ such that $g(x) = 0$ for all $x in V$. Then $I(V) = r(a)$.

  [It is clear that $r(a) subset.eq I(V)$. Conversely, if $f in.not r(a)$, then there is a prime ideal $p$ containing $a$ such that $f in.not p$. Let $overline(f)$ be the image of $f$ in $B = A\/p$, let $C = B_(overline(f)) = B[1\/overline(f)]$, and let $m$ be a maximal ideal of $C$. Since $C$ is a finitely generated $k$-algebra we have $C\/m iso k$, by (7.9). The images $x_i$ in $C\/m$ of the generators $t_i$ of $A$ thus define a point $x = (x_1, ..., x_n) in k^n$, and the construction shows that $x in V$ and $f(x) != 0$.]
]

#exercise[
  Let $A$ be a Noetherian local ring, $m$ its maximal ideal and $k$ its residue field, and let $M$ be a finitely generated $A$-module. Then the following are equivalent:
  + $M$ is free;
  + $M$ is flat;
  + the mapping of $m times.circle M$ into $A times.circle M$ is injective;
  + $Tor_1^A (k, M) = 0$.

  [To show that iv) $=>$ i), let $x_1, ..., x_n$ be elements of $M$ whose images in $M\/m M$ form a $k$-basis of this vector space. By (2.8), the $x_i$ generate $M$. Let $F$ be a free $A$-module with basis $e_1, ..., e_n$ and define $phi: F -> M$ by $phi(e_i) = x_i$. Let $E = "ker"(phi)$. Then the exact sequence $0 -> E -> F -> M -> 0$ gives us an exact sequence
  $ 0 -> k times.circle_A E -> k times.circle_A F ->^(1 times.circle phi) k times.circle_A M -> 0. $
  Since $k times.circle F$ and $k times.circle M$ are vector spaces of the same dimension over $k$, it follows that $1 times.circle phi$ is an isomorphism, hence $k times.circle E = 0$, hence $E = 0$ by Nakayama's Lemma ($E$ is finitely generated because it is a submodule of $F$, and $A$ is Noetherian).]
]

#exercise[
  Let $A$ be a Noetherian ring, $M$ a finitely generated $A$-module. Then the following are equivalent:
  + $M$ is a flat $A$-module;
  + $M_p$ is a free $A_p$-module, for all prime ideals $p$;
  + $M_m$ is a free $A_m$-module, for all maximal ideals $m$.

  In other words, flat $=$ locally free. [Use Exercise 15.]
]

#exercise[
  Let $A$ be a ring and $M$ a Noetherian $A$-module. Show (by imitating the proofs of (7.11) and (7.12)) that every submodule $N$ of $M$ has a primary decomposition (Chapter 4, Exercises 20–23).
]

#exercise[
  Let $A$ be a Noetherian ring, $p$ a prime ideal of $A$, and $M$ a finitely generated $A$-module. Show that the following are equivalent:
  + $p$ belongs to $0$ in $M$;
  + there exists $x in M$ such that $"Ann"(x) = p$;
  + there exists a submodule of $M$ isomorphic to $A\/p$.

  Deduce that there exists a chain of submodules
  $ 0 = M_0 subset M_1 subset ... subset M_r = M $
  such that each quotient $M_i \/ M_(i-1)$ is of the form $A \/ p_i$, where $p_i$ is a prime ideal of $A$.
]

#exercise[
  Let $a$ be an ideal in a Noetherian ring $A$. Let
  $ a = inter_(i=1)^r b_i = inter_(j=1)^s c_j $
  be two minimal decompositions of $a$ as intersections of *irreducible* ideals. Prove that $r = s$ and that (possible after re-indexing the $c_j$) $r(b_i) = r(c_i)$ for all $i$. [Show that for each $i = 1, ..., r$ there exists $j$ such that
  $ a = b_1 inter ... inter b_(i-1) inter c_j inter b_(i+1) inter ... inter b_r. $]

  State and prove an analogous result for modules.
]

#exercise[
  Let $X$ be a topological space and let $cal(F)$ be the smallest collection of subsets of $X$ which contains all open subsets of $X$ and is closed with respect to the formation of finite intersections and complements.
  + Show that a subset $E$ of $X$ belongs to $cal(F)$ if and only if $E$ is of the form $U inter C$, where $U$ is open and $C$ is closed.
  + Suppose that $X$ is irreducible and let $E in cal(F)$. Show that $E$ is dense in $X$ (i.e., that $overline(E) = X$) if and only if $E$ contains a non-empty open set in $X$.
]

#exercise[
  Let $X$ be a Noetherian topological space (Chapter 6, Exercise 5) and let $E subset.eq X$. Show that $E in cal(F)$ if and only if, for each irreducible closed set $X_0 subset.eq X$, either $overline(E inter X_0) != X_0$ or else $E inter X_0$ contains a non-empty open subset of $X_0$. [Suppose $E in.not cal(F)$. Then the collection of closed sets $X' subset.eq X$ such that $E inter X' in.not cal(F)$ is not empty and therefore has a minimal element $X_0$. Show that $X_0$ is irreducible and then that each of the alternatives above leads to the conclusion that $E inter X_0 in cal(F)$.]

  The sets belonging to $cal(F)$ are called the *constructible* subsets of $X$.
]

#exercise[
  Let $X$ be a Noetherian topological space and let $E$ be a subset of $X$. Show that $E$ is open in $X$ if and only if, for each irreducible closed subset $X_0$ in $X$, either $E inter X_0 = emptyset$ or else $E inter X_0$ contains a non-empty open subset of $X_0$. [The proof is similar to that of Exercise 21.]
]

#exercise[
  Let $A$ be a Noetherian ring, $f: A -> B$ a ring homomorphism of finite type (so that $B$ is Noetherian). Let $X = Spec(A)$, $Y = Spec(B)$ and let $f^*: Y -> X$ be the mapping associated with $f$. Then the image under $f^*$ of a constructible subset $E$ of $Y$ is a constructible subset of $X$.

  [By Exercise 20 it is enough to take $E = U inter C$ where $U$ is open and $C$ is closed in $Y$; then, replacing $B$ by a homomorphic image, we reduce to the case where $E$ is open in $Y$. Since $Y$ is Noetherian, $E$ is quasi-compact and therefore a finite union of open sets of the form $Spec(B_g)$. Hence reduce to the case $E = Y$. To show that $f^*(Y)$ is constructible, use the criterion of Exercise 21. Let $X_0$ be an irreducible closed subset of $X$ such that $f^*(Y) inter X_0$ is dense in $X_0$. We have $f^*(Y) inter X_0 = f^*(f^(*-1)(X_0))$, and $f^(*-1)(X_0) = Spec((A\/p) times.circle_A B)$, where $X_0 = Spec(A\/p)$. Hence reduce to the case where $A$ is an integral domain and $f$ is injective. If $Y_1, ..., Y_n$ are the irreducible components of $Y$, it is enough to show that some $f^*(Y_i)$ contains a non-empty open set in $X$. So finally we are brought down to the situation in which $A, B$ are integral domains and $f$ is injective (and still of finite type); now use Chapter 5, Exercise 21 to complete the proof.]
]

#exercise[
  With the notation and hypotheses of Exercise 23, $f^*$ is an open mapping $<=> f$ has the going-down property (Chapter 5, Exercise 10). [Suppose $f$ has the going-down property. As in Exercise 23, reduce to proving that $E = f^*(Y)$ is open in $X$. The going-down property asserts that if $p' subset.eq p$ and $p in E$, then $p' in E$: in other words, that if $X_0$ is an irreducible closed subset of $X$ and $X_0$ meets $E$, then $E inter X_0$ is dense in $X_0$. By Exercises 20 and 22, $E$ is open in $X$.]
]

#exercise[
  Let $A$ be Noetherian, $f: A -> B$ of finite type and *flat* (i.e., $B$ is flat as an $A$-module). Then $f^*: Spec(B) -> Spec(A)$ is an open mapping. [Exercise 24 and Chapter 5, Exercise 11.]
]

== Grothendieck groups

#exercise[
  Let $A$ be a Noetherian ring and let $F(A)$ denote the set of all isomorphism classes of finitely generated $A$-modules. Let $C$ be the free abelian group generated by $F(A)$. With each short exact sequence $0 -> M' -> M -> M'' -> 0$ of finitely generated $A$-modules we associate the element $(M') - (M) + (M'')$ of $C$, where $(M)$ is the isomorphism class of $M$, etc. Let $D$ be the subgroup of $C$ generated by these elements, for all short exact sequences. The quotient group $C\/D$ is called the *Grothendieck group* of $A$, and is denoted by $K(A)$. If $M$ is a finitely generated $A$-module, let $gamma(M)$, or $gamma_A (M)$, denote the image of $(M)$ in $K(A)$.
  + Show that $K(A)$ has the following universal property: for each additive function $lambda$ on the class of finitely generated $A$-modules, with values in an abelian group $G$, there exists a unique homomorphism $lambda_0: K(A) -> G$ such that $lambda(M) = lambda_0 (gamma(M))$ for all $M$.
  + Show that $K(A)$ is generated by the elements $gamma(A\/p)$, where $p$ is a prime ideal of $A$. [Use Exercise 18.]
  + If $A$ is a field, or more generally if $A$ is a principal ideal domain, then $K(A) iso ZZ$.
  + Let $f: A -> B$ be a *finite* ring homomorphism. Show that restriction of scalars gives rise to a homomorphism $f_!: K(B) -> K(A)$ such that $f_! (gamma_B (N)) = gamma_A (N)$ for a $B$-module $N$. If $g: B -> C$ is another finite ring homomorphism, show that $(g compose f)_! = f_! compose g_!$.
]

#exercise[
  Let $A$ be a Noetherian ring and let $F_1 (A)$ be the set of all isomorphism classes of finitely generated *flat* $A$-modules. Repeating the construction of Exercise 26 we obtain a group $K_1 (A)$. Let $gamma_1 (M)$ denote the image of $(M)$ in $K_1 (A)$.
  + Show that tensor product of modules over $A$ induces a commutative ring structure on $K_1 (A)$, such that $gamma_1 (M) dot.op gamma_1 (N) = gamma_1 (M times.circle N)$. The identity element of this ring is $gamma_1 (A)$.
  + Show that tensor product induces a $K_1 (A)$-module structure on the group $K(A)$, such that $gamma_1 (M) dot.op gamma(N) = gamma(M times.circle N)$.
  + If $A$ is a (Noetherian) local ring, then $K_1 (A) iso ZZ$.
  + Let $f: A -> B$ be a ring homomorphism, $B$ being Noetherian. Show that extension of scalars gives rise to a ring homomorphism $f^!: K_1 (A) -> K_1 (B)$ such that $f^! (gamma_1 (M)) = gamma_1 (B times.circle_A M)$. [If $M$ is flat and finitely generated over $A$, then $B times.circle_A M$ is flat and finitely generated over $B$.] If $g: B -> C$ is another ring homomorphism (with $C$ Noetherian), then $(g compose f)^! = f^! compose g^!$.
  + If $f: A -> B$ is a finite ring homomorphism then
  $ f_! (f^! (x) y) = x f_! (y) $
  for $x in K_1 (A)$, $y in K(B)$. In other words, regarding $K(B)$ as a $K_1 (A)$-module by restriction of scalars, the homomorphism $f^!$ is a $K_1(A)$-module homomorphism.

  *Remark.* Since $F_1(A)$ is a subset of $F(A)$ we have a group homomorphism $epsilon: K_1(A) -> K(A)$, given by $epsilon(gamma_1(M)) = gamma(M)$. If the ring $A$ is finite-dimensional and *regular*, i.e., if all its local rings $A_p$ are regular (Chapter 11) it can be shown that $epsilon$ is an isomorphism.
]

= Artin Rings

#exercise[
  Let $q_1 inter ... inter q_n = 0$ be a minimal primary decomposition of the zero ideal in a Noetherian ring, and let $q_i$ be $p_i$-primary. Let $p_i^((r))$ be the $r$th *symbolic power* of $p_i$ (Chapter 4, Exercise 13). Show that for each $i = 1, ..., n$ there exists an integer $r_i$ such that $p_i^((r_i)) subset.eq q_i$.

  Suppose $q_i$ is an isolated primary component. Then $A_(p_i)$ is an Artin local ring, hence if $m_i$ is its maximal ideal we have $m_i^r = 0$ for all sufficiently large $r$, hence $q_i = p_i^((r))$ for all large $r$.

  If $q_i$ is an embedded primary component, then $A_(p_i)$ is *not* Artinian, hence the powers $m_i^r$ are all distinct, and so the $p_i^((r))$ are all distinct. Hence in the given primary decomposition we can replace $q_i$ by any of the infinite set of $p_i$-primary ideals $p_i^((r))$ where $r >= r_i$, and so there are infinitely many minimal primary decompositions of $0$ which differ only in the $p_i$-component.
]

#exercise[
  Let $A$ be a Noetherian ring. Prove that the following are equivalent:
  + $A$ is Artinian;
  + $Spec(A)$ is discrete and finite;
  + $Spec(A)$ is discrete.
]

#exercise[
  Let $k$ be a field and $A$ a finitely generated $k$-algebra. Prove that the following are equivalent:
  + $A$ is Artinian;
  + $A$ is a finite $k$-algebra.

  [To prove that i) $=>$ ii), use (8.7) to reduce to the case where $A$ is an Artin local ring. By the Nullstellensatz, the residue field of $A$ is a finite extension of $k$. Now use the fact that $A$ is of finite length as an $A$-module. To prove ii) $=>$ i), observe that the ideals of $A$ are $k$-vector subspaces and therefore satisfy d.c.c.]
]

#exercise[
  Let $f: A -> B$ be a ring homomorphism of finite type. Consider the following statements:
  + $f$ is finite;
  + the fibres of $f^*$ are discrete subspaces of $Spec(B)$;
  + for each prime ideal $p$ of $A$, the ring $B times.circle_A k(p)$ is a finite $k(p)$-algebra ($k(p)$ is the residue field of $A_p$);
  + the fibres of $f^*$ are finite.

  Prove that i) $=>$ ii) $<=>$ iii) $=>$ iv). [Use Exercises 2 and 3.]

  If $f$ is integral and the fibres of $f^*$ are finite, is $f$ necessarily finite?
]

#exercise[
  In Chapter 5, Exercise 16, show that $X$ is a finite covering of $L$ (i.e., the number of points of $X$ lying over a given point of $L$ is finite and bounded).
]

#exercise[
  Let $A$ be a Noetherian ring and $q$ a $p$-primary ideal in $A$. Consider chains of primary ideals from $q$ to $p$. Show that all such chains are of finite bounded length, and that all maximal chains have the same length.
]

= Discrete Valuation Rings and Dedekind Domains

#exercise[
  Let $A$ be a Dedekind domain, $S$ a multiplicatively closed subset of $A$. Show that $S^(-1) A$ is either a Dedekind domain or the field of fractions of $A$.

  Suppose that $S != A - \{0\}$, and let $H, H'$ be the ideal class groups of $A$ and $S^(-1) A$ respectively. Show that extension of ideals induces a surjective homomorphism $H -> H'$.
]

#exercise[
  Let $A$ be a Dedekind domain. If $f = a_0 + a_1 x + ... + a_n x^n$ is a polynomial with coefficients in $A$, the *content* of $f$ is the ideal $c(f) = (a_0, ..., a_n)$ in $A$. Prove *Gauss's lemma* that $c(f g) = c(f) c(g)$.

  [Localize at each maximal ideal.]
]

#exercise[
  A valuation ring (other than a field) is Noetherian if and only if it is a discrete valuation ring.
]

#exercise[
  Let $A$ be a local domain which is not a field and in which the maximal ideal $m$ is principal and $inter_(n=1)^oo m^n = 0$. Prove that $A$ is a discrete valuation ring.
]

#exercise[
  Let $M$ be a finitely-generated module over a Dedekind domain. Prove that $M$ is flat $<=> M$ is torsion-free.

  [Use Chapter 3, Exercise 13 and Chapter 7, Exercise 16.]
]

#exercise[
  Let $M$ be a finitely-generated torsion module $(T(M) = M)$ over a Dedekind domain $A$. Prove that $M$ is uniquely representable as a finite direct sum of modules $A \/ p_i^(t_i)$, where $p_i$ are non-zero prime ideals of $A$. [For each $p != 0$, $M_p$ is a torsion $A_p$-module; use the structure theorem for modules over a principal ideal domain.]
]

#exercise[
  Let $A$ be a Dedekind domain and $a != 0$ an ideal in $A$. Show that every ideal in $A \/ a$ is principal.

  Deduce that every ideal in $A$ can be generated by at most $2$ elements.
]

#exercise[
  Let $a, b, c$ be three ideals in a Dedekind domain. Prove that
  $ a inter (b + c) = (a inter b) + (a inter c) $
  $ a + (b inter c) = (a + b) inter (a + c) $
  [Localize.]
]

#exercise[
  (Chinese Remainder Theorem). Let $a_1, ..., a_n$ be ideals and let $x_1, ..., x_n$ be elements in a Dedekind domain $A$. Then the system of congruences $x equiv x_i quad (mod a_i)$ $(1 <= i <= n)$ has a solution $x$ in $A <=> x_i equiv x_j quad (mod a_i + a_j)$ whenever $i != j$.

  [This is equivalent to saying that the sequence of $A$-modules
  $ A ->^phi plus.circle.big_(i=1)^n A\/a_i ->^psi plus.circle.big_(i<j) A\/(a_i + a_j) $
  is exact, where $phi$ and $psi$ are defined as follows: $phi(x) = (x + a_1, ..., x + a_n)$; $psi(x_1 + a_1, ..., x_n + a_n)$ has $(i,j)$-component $x_i - x_j + a_i + a_j$. To show that this sequence is exact it is enough to show that it is exact when localized at any $p != 0$: in other words we may assume that $A$ is a discrete valuation ring, and then it is easy.]
]

= Completions

#exercise[
  Let $alpha_n: ZZ\/p ZZ -> ZZ\/p^n ZZ$ be the injection of abelian groups given by $alpha_n (1) = p^(n-1)$, and let $alpha: A -> B$ be the direct sum of all the $alpha_n$ (where $A$ is a countable direct sum of copies of $ZZ\/p ZZ$, and $B$ is the direct sum of the $ZZ\/p^n ZZ$). Show that the $p$-adic completion of $A$ is just $A$ but that the completion of $A$ for the topology induced from the $p$-adic topology on $B$ is the direct product of the $ZZ\/p ZZ$. Deduce that $p$-adic completion is *not* a right-exact functor on the category of all $ZZ$-modules.
]

#exercise[
  In Exercise 1, let $A_n = alpha^(-1)(p^n B)$, and consider the exact sequence
  $ 0 -> A_n -> A -> A\/A_n -> 0. $
  Show that $lim_(<-)^1$ is not right exact, and compute $lim_(<-)^1 A_n$.
]

#exercise[
  Let $A$ be a Noetherian ring, $a$ an ideal and $M$ a finitely-generated $A$-module. Using Krull's Theorem and Exercise 14 of Chapter 3, prove that
  $ inter_(n=1)^oo a^n M = inter_(m supset.eq a) "ker"(M -> M_m), $
  where $m$ runs over all maximal ideals containing $a$.

  Deduce that
  $ hat(M) = 0 <=> "Supp"(M) inter V(a) = emptyset quad ("in" Spec(A)). $
  [The reader should think of $hat(M)$ as the "Taylor expansion" of $M$ transversal to the subscheme $V(a)$: the above result then shows that $M$ is determined in a neighborhood of $V(a)$ by its Taylor expansion.]
]

#exercise[
  Let $A$ be a Noetherian ring, $a$ an ideal in $A$, and $hat(A)$ the $a$-adic completion. For any $x in A$, let $hat(x)$ be the image of $x$ in $hat(A)$. Show that
  $ x "not a zero-divisor in" A => hat(x) "not a zero-divisor in" hat(A). $
  Does this imply that
  $ A "is an integral domain" => hat(A) "is an integral domain"? $
  [Apply the exactness of completion to the sequence $0 -> A ->^x A$.]
]

#exercise[
  Let $A$ be a Noetherian ring and let $a, b$ be ideals in $A$. If $M$ is any $A$-module, let $M^a, M^b$ denote its $a$-adic and $b$-adic completions respectively. If $M$ is finitely generated, prove that $(M^a)^b iso M^(a+b)$.

  [Take the $a$-adic completion of the exact sequence
  $ 0 -> b^n M -> M -> M\/b^n M -> 0 $
  and apply (10.13). Then use the isomorphism
  $ lim_(<-)_m (lim_(<-)_n M\/(a^n M + b^m M)) iso lim_(<-)_n M\/(a^n M + b^n M) $
  and the inclusions $(a+b)^(2n) subset.eq a^n + b^n subset.eq (a+b)^n$.]
]

#exercise[
  Let $A$ be a Noetherian ring and $a$ an ideal in $A$. Prove that $a$ is contained in the Jacobson radical of $A$ if and only if every maximal ideal of $A$ is closed for the $a$-topology. (A Noetherian topological ring in which the topology is defined by an ideal contained in the Jacobson radical is called a *Zariski ring*. Examples are local rings and (by (10.15)(iv)) $a$-adic completions.)
]

#exercise[
  Let $A$ be a Noetherian ring, $a$ an ideal of $A$, and $hat(A)$ the $a$-adic completion. Prove that $hat(A)$ is faithfully flat over $A$ (Chapter 3, Exercise 16) if and only if $A$ is a Zariski ring (for the $a$-topology).

  [Since $hat(A)$ is flat over $A$, it is enough to show that
  $ M -> hat(M) "injective for all finitely generated" M <=> A "is Zariski;" $
  now use (10.19) and Exercise 6.]
]

#exercise[
  Let $A$ be the local ring of the origin in $CC^n$ (i.e., the ring of all rational functions $f\/g$ with $f, g in CC(z_1, ..., z_n)$ with $g(0) != 0$), let $B$ be the ring of power series in $z_1, ..., z_n$ which converge in some neighborhood of the origin, and let $C$ be the ring of formal power series in $z_1, ..., z_n$, so that $A subset.eq B subset.eq C$. Show that $B$ is a local ring and that its completion for the maximal ideal topology is $C$. Assuming that $B$ is Noetherian, prove that $B$ is $A$-flat. [Use Chapter 3, Exercise 17, and Exercise 7 above.]
]

#exercise[
  Let $A$ be a local ring, $m$ its maximal ideal. Assume that $A$ is $m$-adically complete. For any polynomial $f(x) in A[x]$, let $overline(f)(x) in (A\/m)[x]$ denote its reduction mod $m$.

  Prove *Hensel's lemma*: if $f(x)$ is monic of degree $n$ and if there exist coprime monic polynomials $overline(g)(x), overline(h)(x) in (A\/m)[x]$ of degrees $r, n-r$ with $overline(f)(x) = overline(g)(x) overline(h)(x)$, then we can lift $overline(g)(x), overline(h)(x)$ back to monic polynomials $g(x), h(x) in A[x]$ such that $f(x) = g(x) h(x)$.

  [Assume inductively that we have constructed $g_k (x), h_k (x) in A[x]$ such that $g_k (x) h_k (x) - f(x) in m^k A[x]$. Then use the fact that since $overline(g)(x)$ and $overline(h)(x)$ are coprime we can find $overline(a)_p (x), overline(b)_p (x)$, of degrees $<= n - r, r$ respectively, such that $x^p = overline(a)_p (x) overline(g)(x) + overline(b)_p (x) overline(h)(x)$, where $p$ is any integer such that $1 <= p <= n$. Finally, use the completeness of $A$ to show that the sequences $g_k (x), h_k (x)$ converge to the required $g(x), h(x)$.]
]

#exercise[
  + With the notation of Exercise 9, deduce from Hensel's lemma that if $overline(f)(x)$ has a simple root $alpha in A\/m$, then $f(x)$ has a simple root $a in A$ such that $alpha = a mod m$.
  + Show that $2$ is a square in the ring of $7$-adic integers.
  + Let $f(x,y) in k[x,y]$, where $k$ is a field, and assume that $f(0,y)$ has $y = a_0$ as a simple root. Prove that there exists a formal power series $y(x) = sum_(n=0)^oo a_n x^n$ such that $f(x, y(x)) = 0$.

  (This gives the "analytic branch" of the curve $f = 0$ through the point $(0, a_0)$.)
]

#exercise[
  Show that the converse of (10.26) is false, even if we assume that $A$ is local and that $hat(A)$ is a finitely-generated $A$-module.

  [Take $A$ to be the ring of germs of $C^oo$ functions of $x$ at $x = 0$, and use Borel's Theorem that every power series occurs as the Taylor expansion of some $C^oo$ function.]
]

#exercise[
  If $A$ is Noetherian, then $A[[x_1, ..., x_n]]$ is a faithfully flat $A$-algebra. [Express $A -> A[[x_1, ..., x_n]]$ as a composition of flat extensions, and use Exercise 5(v) of Chapter 1.]
]

= Dimension Theory

#exercise[
  Let $f in k[x_1, ..., x_n]$ be an irreducible polynomial over an algebraically closed field $k$. A point $P$ on the variety $f(x) = 0$ is *non-singular* $<=>$ not all the partial derivatives $diff f \/ diff x_i$ vanish at $P$. Let $A = k[x_1, ..., x_n] \/ (f)$, and let $m$ be the maximal ideal of $A$ corresponding to the point $P$. Prove that $P$ is non-singular $<=> A_m$ is a regular local ring.

  [By (11.18) we have $dim A_m = n - 1$. Now
  $ m \/ m^2 iso (x_1, ..., x_n) \/ (x_1, ..., x_n)^2 + (f) $
  and has dimension $n - 1$ if and only if $f in.not (x_1, ..., x_n)^2$.]
]

#exercise[
  In (11.21) assume that $A$ is complete. Prove that the homomorphism $k[[t_1, ..., t_d]] -> A$ given by $t_i |-> x_i$ $(1 <= i <= d)$ is injective and that $A$ is a finitely-generated module over $k[[t_1, ..., t_d]]$. [Use (10.24).]
]

#exercise[
  Extend (11.25) to non-algebraically-closed fields. [If $overline(k)$ is the algebraic closure of $k$, then $k[x_1, ..., x_n]$ is integral over $overline(k)[x_1, ..., x_n]$.]
]

#exercise[
  An example of a Noetherian domain of infinite dimension (Nagata). Let $k$ be a field and let $A = k[x_1, x_2, ..., x_n, ...]$ be a polynomial ring over $k$ in a countably infinite set of indeterminates. Let $m_1, m_2, ...$ be an increasing sequence of positive integers such that $m_(i+1) - m_i > m_i - m_(i-1)$ for all $i > 1$. Let $p_i = (x_(m_i + 1), ..., x_(m_(i+1)))$ and let $S$ be the complement in $A$ of the union of the ideals $p_i$.

  Each $p_i$ is a prime ideal and therefore the set $S$ is multiplicatively closed.

  The ring $S^(-1) A$ is Noetherian by Chapter 7, Exercise 9. Each $S^(-1) p_i$ has height equal to $m_(i+1) - m_i$, hence $dim S^(-1) A = oo$.
]

#exercise[
  Reformulate (11.1) in terms of the Grothendieck group $K(A_0)$ (Chapter 7, Exercise 26).
]

#exercise[
  Let $A$ be a ring (not necessarily Noetherian). Prove that
  $ 1 + dim A <= dim A[x] <= 1 + 2 dim A. $
  [Let $f: A -> A[x]$ be the embedding and consider the fiber of $f^*: Spec(A[x]) -> Spec(A)$ over a prime ideal $p$ of $A$. This fiber can be identified with the spectrum of $k times.circle_A A[x] iso k[x]$, where $k$ is the residue field at $p$ (Chapter 3, Exercise 21), and $dim k[x] = 1$. Now use Exercise 7(ii) of Chapter 4.]
]

#exercise[
  Let $A$ be a Noetherian ring. Then
  $ dim A[x] = 1 + dim A, $
  and hence, by induction on $n$,
  $ dim A[x_1, ..., x_n] = n + dim A. $
  [Let $p$ be a prime ideal of height $m$ in $A$. Then there exist $a_1, ..., a_m in p$ such that $p$ is a minimal prime ideal belonging to the ideal $a = (a_1, ..., a_m)$. By Exercise 7 of Chapter 4, $p[x]$ is a minimal prime ideal of $a[x]$ and therefore height $p[x] <= m$. On the other hand, a chain of prime ideals $p_0 subset p_1 subset ... subset p_m = p$ gives rise to a chain $p_0 [x] subset ... subset p_m [x] = p[x]$, hence height $p[x] >= m$. Hence height $p[x] =$ height $p$. Now use the argument of Exercise 6.]
]
