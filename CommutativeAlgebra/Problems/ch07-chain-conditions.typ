#import "prelude.typ": *
#show: standalone.with(chapter: 6)

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
