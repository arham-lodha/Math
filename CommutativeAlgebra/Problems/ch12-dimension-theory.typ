#import "prelude.typ": *
#show: standalone.with(chapter: 11)

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
