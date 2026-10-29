#import "prelude.typ": *
#show: standalone.with(chapter: 10)

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
