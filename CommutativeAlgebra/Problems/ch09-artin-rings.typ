#import "prelude.typ": *
#show: standalone.with(chapter: 8)

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
