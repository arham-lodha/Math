#import "prelude.typ": *
#show: standalone.with(chapter: 4)

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
