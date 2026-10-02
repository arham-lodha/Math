#import "template.typ": *

#show: homework.with(
  assignment: "Exams",
  name: "Arham Lodha",
  due: "August 24, 2026",
)

// ── Usage ────────────────────────────────────────────────────────────────────
//
//  Basic problem:
//    #problem[
//      State the problem here.
//    ]
//
//  Problem with a title:
//    #problem("Lagrange's Theorem")[
//      State the problem here.
//    ]
//
//  Sub-parts (lettered a, b, c, ...):
//    #problem[
//      Prove the following:
//      #part[First sub-part.]
//      #part[Second sub-part.]
//    ]
//
//  Solution block (shaded, left-bar):
//    #solution[
//      Write your solution here.
//      Use $inline math$ or $ display math $ as needed.
//    ]
//
//  TODO highlighting (amber highlight + [TODO] badge):
//    #problem(todo: true)[Whole problem still needs work.]
//    #problem[
//      #part[Done.]
//      #part(todo: true)[Still need to do this part.]
//    ]
//    Set `_todos-visible = false` in template.typ for a clean printout.
//
//  Angle brackets (inner products):
//    Use chevron.l and chevron.r — e.g. $chevron.l u, v chevron.r$
//    Note: `angle` is deprecated in favour of `chevron`.
//
//  Full example:
//    #problem("Cauchy's Theorem")[
//      If $p mid(|) abs(G)$, show $G$ has an element of order $p$.
//      #part[Reduce to the case $G$ abelian.]
//      #part[Handle the abelian case by induction.]
//    ]
//    #solution[
//      *(a)* ...
//      *(b)* ...
//    ]
// ─────────────────────────────────────────────────────────────────────────────

= Basic Exam --- Spring 2010

#problem(todo: true)[
  Let $u_1, dots, u_n$ be orthonormal basis of $RR^n$ and let $y_1, dots, y_n$ be a collection of vectors in $RR^n$ satisfying $sum_i ||y_i||^2 < 1$. Prove that vectors $u_1 + y_1, dots, u_n + y_n$ are linearly independent.
]
#solution[
  Consider $U = mat(u_1, ..., u_n)$. $det(U) = 1$. Let $Y = mat(y_1, ..., y_n)$. Note that $norm(Y)_(F)^2 = sum_(i)^() norm(y_i)^2 < 1$. We want to show that $det(U + Y) != 0$. Note that all norms on $Mat_(n times n)$ are equivalent and that $det$ is a smooth function on this vector space.

]

#problem(todo: true)[
  Let $A$ be $n times n$ real symmetric matrix and let $lambda_1 >= dots >= lambda_n$ be the eigenvalues of $A$. Prove that
  $ lambda_k = max_(U, dim U = k) min_(x in U, ||x|| = 1) chevron.l A x, x chevron.r, $
  where $chevron.l dot, dot chevron.r$ denotes the usual scalar product in $RR^n$ and the maximum is taken over all $k$ dimensional subspaces of $RR^n$.
]
#solution[
  Let $v_1, ..., v_n$ be the eigenvectors (and a orthonormal basis, spectral theorem) corresponding to eigenvalues $lambda_1, ..., lambda_n$ respectively. Consider the function $f: RR^k -> RR$ where $ (a_1, ..., a_k) & -> chevron.l A sum_(i = 1)^(k) a_i v_i , sum_(i = 1)^(k) a_i v_i chevron.r \
                  & = chevron.l sum_(i = 1)^(k) a_i lambda_i v_i, sum_(i = 1)^(k) a_i v_i chevron.r \
                  & = sum_(i = 1)^(k) a_i^2 lambda_i $

  Note that $ (partial f) / (partial a_i) = 2 a_i lambda_i. $ We want to optimize $f$ with respect to the condition that $norm(a)^2 = 1$. By the theory of lagrange multipliers it is that $ 2 a_i mu = 2 a_i lambda_i => a_i (lambda_i - mu) = 0 $

  Thus $a_i = 0$ or $lambda_i = mu$. Not all $a_i = 0$ by our condition that $norm(a)^2 = 1$. Thus $mu = lambda_i$ for some $i in {1, ..., k}$. Note that $a_i^2 mu = lambda_i a_i^2$. Sum over all $i$ we see $ f(a) & = mu sum_(i = 1)^(k) a_i^2 = mu. $ Thus at any critical point our function equals the lagrange multiplier $mu$. Remember $ a_i (lambda_i - mu ) = 0 quad forall i in{1, ..., k}. $ There must be at least one $a_i != 0$ since we are on the unit sphere. If a $a_i != 0$, then $lambda_i = mu$. Thus $mu$ can be any eigenvalue of ${lambda_1, ..., lambda_k}$. Since the possible critical values of $f$ on the intersection of $S^(n - 1)$ with $RR(v_1, ..., v_k)$ are the eigenvalues ${lambda_1, ..., lambda_k}$, the absolute minimum of $f$ on this domain is the the smallest of the critical values. Thus $min_(v in RR(v_1, ..., v_k)) f(v) = lambda_k$.
]

#problem()[
  Let $S$ and $T$ be two normal transformations in the complex finite dimensional vector space $V$ with a positive definite Hermitian inner product such that $S T = T S$. Prove that $S$ and $T$ have joint basis of eigenvectors.
]
#solution[
  Suppose $S$ and $T$ are two normal transformations then by the spectral theorem of normal matrices $S$ and $T$ are diagonalizable. Thus $S, T$ are diagonalizable commuting matrices. Let $V_(lambda_1), ..., V_(lambda_n)$ be the eigenspaces of $S$. Then $forall v in V_(lambda_i)$, $ S T v = T S v = lambda_i T v => T v in V_(lambda_i). $ Hence $V_(lambda_i)$ are $T$ invariant subspaces of $V$. Note that $m_(T|_(V_i)) divides m_(T)$ hence if $T$ is diagonaliable then $m_T$ can be factored into linear factors hence so can $m_(T|_(V_i))$ hence $T|_(V_i)$ is diagonalizable. Let $v_1^i, ..., v_k^i$ be a eigenbasis for $T|_(V_i)$ (also a eigenbasis for $S|_(V_i)$). Put all basies for $V_i$ together to get a basis of eigenvectors (of both S and T) for V.
]

#problem()[

  #part()[
    Let $A = (a_(i,j))$ be $n times n$ real symmetric matrix such that $sum_(i,j) a_(i,j) x_i x_j <= 0$ for every vector $(x_1, dots, x_n)$ in $RR^n$. Prove that if $tr(A) = 0$ then $A = 0$.
  ]
  #part()[
    Let $T$ be a linear transformation in the complex finite dimensional vector space $V$ with a positive definite Hermitian inner product. Suppose that $T T^* = 4T - 3I$, where $I$ is identity transformation. Prove that $T$ is positive definite Hermitian and find all possible eigenvalues of $T$.
  ]
]
#solution[
  *(a)*: By spectral theorem, $A$ is diagonaliable.  $sum_(i, j) a_(i j) x_j x_i = x^T A x <= 0$ for all $x in RR^n$ then by definition $A$ is a symmetric negative semi definite matrix. Hence all eigenvalues of $A$ are nonpositive. If $tr(A) = 0$, that means all eigenvalues must be 0. Hence $A = 0$, since $A$ is diagonaliable.

  *(b)*: $T T^ast = (T T^(ast))^(ast) = 4 T^ast - 3I = 4T - 3 I => T^ast = T$. Thus $T$ is Hermitian and hence is diagonaliable with real eigenvalues. $ chevron.l T v, T w chevron.r & = chevron.l v, T^ast T w chevron.r \
                               & = chevron.l v, T T^ast w chevron.r \
                               & = chevron.l v, (4T - 3I)w chevron.r \
                               & = 4 chevron.l v, T w chevron.r - 3 chevron.l v, w chevron.r $

  Let $v in V$ be a nonzero eigenvector of $T$ thus $T v = lambda v$. By the above calculation we see that $ lambda^2 chevron.l v, v chevron.r &= chevron.l T v, T v chevron.r \
  &= 4 lambda chevron.l v , v chevron.r - 3 chevron.l v, v chevron.r \
  (lambda^2 - 4 lambda + 3) chevron.l v, v chevron.r = 0 &<=> lambda^2 - 4 lambda + 3 = 0 $

  Thus $ lambda = (3 plus.minus 2) / (2) = 5/2, 1/2 $

  Hence $T$ is positive definite.

]

#problem()[
  Let $A, B$ be $n times n$ complex matrices which have the same minimal polynomial $M(t)$ and the same characteristic polynomial $P(t) = (t - lambda_1)^(a_1) dots.c (t - lambda_k)^(a_k)$, where $lambda_i != lambda_j$ for $i != j$. Prove that if $P(t) \/ M(t) = (t - lambda_1) dots.c (t - lambda_k)$, then these matrices are similar.
]
#solution[
  Recall the following facts. Two matrices are similar if their invariant factors are the same. Furthermore, for a matrix $A$ its invariant factors are polynomials $a_1, ..., a_k in CC[x]$  such that $a_i divides a_(i + 1)$, $a_k = m_A$ (minimal polynomial), and $p_A = product_(i=1)^(k) a_i$. Let $a_1, ..., a_n$ be the invariant factors of $A$. Let $b_1, ..., b_m$ be the invariant factors of $B$. Since $ p_A & = product_(i = 1)^(n) a_i = product_( i =1)^(m) b_i = p_B $ and that $p / m_A = p / a_n = p/b_m = p/m_B$ is a product of linear terms. We know that $ p/m_A = product_(i = 1)^(m - 1) a_i = product_(i = 1)^(n - 1) b_i $

  Assume the contrary that $a_(m - 2)$ is isn't just a constant term 1. Then since $a_(m - 2) divides a_(m - 1)$, $a_(m - 1) a_(m - 2)$ will have a squared linear term. But $P / M$ is a product of linear terms (square free), thus $a_(m - 2)$ and all previous terms must be 1. Thus $A$ has only two non 1 invariant factors $M$ and $P / M$. The same is true for $B$. Since both invariant factors are equal, A and B are similar.
]

#problem()[
  Let $A = mat(4, -4; 1, 0)$.
  #part()[
    Find Jordan form $J$ of $A$ and a matrix $P$ such that $P^(-1) A P = J$.
  ]
  #part()[
    Compute $A^(100)$ and $J^(100)$.
  ]
  #part()[
    Find a formula for $a_n$, when $a_(n+1) = 4a_n - 4a_(n-1)$ and $a_0 = a$, $a_1 = b$.
  ]
]
#proof[
  *(a)*: $ J & = mat(2, 1; 0, 2) \
  P & = mat(2, 1; 1, 0) $
  *(b)*: $ J = (2 I + E_(1, 2))^(100) = (2 I)^(100) + 100 (2 I)^(99) E_(i j) = mat(2^(100), 100 * 2^(99); 0, 2^(100)) = 2^(99) mat(2, 100; 0, 2) $

  Hence $ A^(100) = 2^(99) P mat(2, 100; 0, 2) P^(-1) $
]

#problem(todo: true)[
  Let ${f_n}$ be a sequence of real-valued functions on the line, and assume that there is a $B < infinity$ such that $|f_n (x)| <= B$ for all $n$ and $x$. Prove that there is a subsequence ${f_(n_k)}$ such that $lim_(k -> infinity) f_(n_k) (r)$ exists for all rational numbers $r$.
]
#solution[This is the diagonalization argument for Arezela Ascoli. Let $QQ = {r_1, r_2, ...}$ be a enumeration of $QQ$. Note that $abs(f_n (r_1)) <= B$. Thus by Bolzano Weirstrass there exists a subsequence $f^((1))_(m)$ of $f_n$ such that $ lim_(m -> oo) f^((1))_(m) (r_1) $ is defined. We will proceed inductively. Suppose that for $f^((k))_(n)$ is a subsequence of $f_n$ which converges pointwise on ${r_1, ..., r_k}$. Then since $abs(f_n^((k))(r_(k + 1) )) <= B$, there exists a subsequence of $f^((k))$, which we will denote $f^((k + 1))$, such that $ lim_(n -> oo) f^((k + 1))_n (r_(k + 1) ) $ exists. Since $f^((k + 1)) subset.eq f^((k))$ it also converges pointwise for ${r_1, ..., r_(k)}$. Thus $f^((k + 1))_n$ is a subsequence of $f_n$ which converges pointwise on ${r_1, ..., r_(k + 1)}$.

  Thus $forall k in NN$, we have the following we have a subsequence $f^((k))_(n)$ of $f_n$ such that $ lim_(n -> oo) f^((k))_n (r_m) $ exists for $m in {1, ..., k}$, furthermore we have that $f^((k)) subset.eq f^((k - 1)) subset.eq ... subset f^((1)) subset.eq f$. Now we will construct a subsequence of $f_n$, which we will call $g_n$ where $ g_n = f^((n))_n. $ Note the following $forall n in NN$, the sequence $(g_(n + k))_(k = 0)^(oo)$ is a subsequence of $f^((n))$ by construction hence converges pointwise on ${r_1, ..., r_n}$. Since this is true for all $n in NN$. $g_n$ is a subsequence of $f_n$ which converges pointwise for all rationals.
]

#problem()[
  Assume that $K$ is a closed subset of a complete metric space $(X, d)$ with the property that, for any $epsilon > 0$, $K$ can be covered by a finite number of sets $B_epsilon (x)$, where $B_epsilon (x) = {y in X: d(x, y) < epsilon}$. Prove that $K$ is compact.
]
#solution[
  I am assuming that we need to prove that $K$ is compact without using the fact that completeness and totally boundedness implies compactness. Since $K$ is closed it contains all its limit points, thus for any cauchy sequence in $K$ hence in $X$ there exists a unique limit point in $X$ which must also be in $K$. Thus $K$ is complete. Let $p_n$ be a sequence in $K$. By total boundedness, $forall epsilon > 0$, there exists a $C_epsilon subset.eq K$ finite such that $ K = union.big_(c in C_(epsilon) ) B_(epsilon )(c). $ Consider $C_1$, $exists x in C_1$ such that $B_(1)(x)$ contains a infinite number of elements of $p_n$. Denote such a subsequence $p^((1))_n$. Thus for all $m, n in NN$: $ d(p^((1))_n, p^((1))_m) < 2. $
  Proceed inductively suppose $p^((k))$ is a subsequence of $p^((k - 1))$ such that $p^((k))_n in overline(B)_(2^(-k + 1)) (x) inter K$ for $x in K$. $overline(B)_(2^(-k + 1))(x) inter K$ is closed and totally bounded hence there is a finite number of point $a_1, ..., a_n$ such that $ overline(B)_(2^(-k + 1) )(x) inter K = union.big_(i = 1)^(n) B_(2^(-k))(x_i) $. There exists a $x_i$ such that its ball contains a infinite number of $p^((k))$. Let $p^((k + 1))$ denote such a subsequence. Hence $p^((k + 1)) subset B_(2^(-k)) (x) inter K$. Take the diagonal and then such a sequence is Cauchy hence convergent by completness, hence there exists a convergent subsequence of $p_n$. Hence $K$ is sequentially compact hence compact.
]

#problem(todo: true)[
  Assume that $f(x, y, z)$ is a real valued, continuously differentiable function such that $f(x_0, y_0, z_0) = 0$. If $nabla f(x_0, y_0, z_0) != arrow(0)$, show that there is a differentiable surface, given parametrically by $(x(s,t), y(s,t), z(s,t))$ with $(x(0,0), y(0,0), z(0,0)) = (x_0, y_0, z_0)$, on which $f = 0$.
]
#proof[
  This seems like a adaptation of the regular value theorem, where we replace $C^(oo)$ with $C^(1)$. Let $v_0 = (x_0, y_0, z_0)$.

  Since $d f_(v_0) != 0$, we know there exists some change of basis of the coordinate around $v_0$ and around $0$ such that $d f_(v_0) = mat(1, 0, 0)$ in these coordinates. Ie the basis vectors $RR^3$ and $RR$ are $ partial_(u) & = a_1 partial_(x) + a_2 partial_(x) + a_3 partial_(z) \
    partial_v & = b_1 partial_x + b_2 partial_y + b_3 partial_z \
    partial_w & = c_1 partial_x + c_2 partial_y + c_3 partial_z \
    partial_t & = lambda partial_s $ where $(x, y, z)$ are the coordinates on $RR^3$ and $s$ is the coordinate on $RR$. Then let $ u & = a_1 x + a_2 y + a_3 z \
  v & = b_1 x +b_2 y + b_3 z \
  w & = c_1 x + c_2 y + c_3 z \
  t & = lambda s. $ You are simply applying invertible linear transformations on $RR^3$ and $RR$ which shouldn't affect the regularity of the function. Under these change of basis. $d f_(v_0) = [1, 0, 0]$. Note that $x, y, z$ are also functions of $u, v, w$. By the Implicit Function Theorem, $exists$ a function $g: RR^2 -> RR$ a $C^1$ function where $(s, t) -> (g(s, t), s, t)$ in our basis of $(u,v,w)$ such that $f(g(s,t), s, t) = 0$ $(g(0, 0), 0, 0) = v_0$. Pull back along the invertible, linear - hence smooth change of coordinates to get $(x(s,t), y(s, t), z(s, t))$ in our orginal coordinates. Thus locally around $0 in RR^2$, by the Implicit Function Theorem we can define a $C^1$ surface.
]

#problem(todo: true)[
  Let $f(x, y)$ be the function defined by
  $ f(x, y) = frac(x y, sqrt(x^2 + y^2)) $
  when $(x, y) != (0, 0)$ with $f(0, 0) = 0$.
  #part(todo: true)[
    Compute the directional derivatives of $f(x, y)$ at $(0, 0)$ in all directions where they exist.
  ]
  #part(todo: true)[
    Is $f(x, y)$ differentiable at $(0, 0)$? Prove your answer.
  ]
]
#proof[
  *(a)*: $ d f_((0, 0)) (vec(a, b)) &= lim_(t -> 0) (f(t a, t b) - f(0, 0)) / (t) \ &= lim_(t-> 0) ((t^2 a b) / (abs(t))) / (t) \ &= lim_(t -> 0) ((t) / (abs(t))) a b = lim_(t -> 0) sgn (t) a b => d f_(0, 0) vec(a, b) "exists" <=> a b = 0. $
]


#problem(todo: true)[
  Suppose $sum_(n=1)^infinity |a_n| < infinity$. Let $sigma$ be a one-to-one mapping of $NN$ onto $NN$. The series $sum_(n=1)^infinity a_(sigma(n))$ is called a "rearrangement" of $sum_(n=1)^infinity a_n$. Prove that all rearrangements of $sum_(n=1)^infinity a_n$ are convergent and have the same sum.
]

#problem(todo: true)[
  Assume that ${f_n}$ is a sequence of nonnegative continuous functions on $[0, 1]$ such that $lim_(n -> infinity) integral_0^1 f_n (x) dif x = 0$. Is it necessarily true that
  #part(todo: true)[
    There is a $B$ such that $f_n (x) <= B$ for $x in [0, 1]$ for all $n$?
  ]
  #part(todo: true)[
    There are points $x_0$ in $[0, 1]$ such that $lim_(n -> infinity) f_n (x_0) = 0$?
  ]
  Prove your answers.
]

= Basic Exam --- Fall 2011

#problem(todo: true)[
  Let $(X, d)$ be a compact metric space and let $f : X -> X$ be a map satisfying
  $ d(f(x), f(y)) < d(x, y), quad forall x, y in X "with" x != y. $
  Prove that there is a unique point $x in X$ so that $f(x) = x$.
]
#solution[]

#problem(todo: true)[
  A function $f : RR^n -> RR$ is called _convex_ if $f$ satisfies
  $ f(alpha x + (1 - alpha) y) <= alpha f(x) + (1 - alpha) f(y), quad forall x, y in RR^n, quad 0 <= alpha <= 1. $
  Assume that $f$ is continuously differentiable and that for some constant $c > 0$, the gradient $nabla f$ satisfies
  $ (nabla f(x) - nabla f(y)) dot (x - y) >= c (x - y) dot (x - y), quad forall x, y in RR^n, $
  where $dot$ denotes the dot product. Show that $f$ is convex.
]
#solution[]

#problem(todo: true)[
  Prove that the set of real numbers can be written as the union of uncountably many pairwise disjoint subsets, each of which is uncountable.
]
#solution[]

#problem(todo: true)[
  If you rearrange the order of terms in a sum $sum a_n$, sometimes you can change the limiting values. Find all the resulting limiting values of the following series. Prove your assertions.
  #part(todo: true)[
    $display(sum_(n=1)^infinity frac((-1)^n, n))$
  ]
  #part(todo: true)[
    $display(sum_(n=1)^infinity frac((-1)^n, n^2))$
  ]
]
#solution[
  *(a)*: $forall lambda in RR$ we will show that we can rearrange $ sum_(n = 1)^(oo) ((-1)^(n)) / (n) $ such that the resulting rearrangement equals $lambda$.
]

#problem(todo: true)[
  Give an example of a function $f(x)$ on $[0, 1]$ with infinitely many discontinuities, but which is Riemann integrable. Include proof (don't just quote some theorem).
]
#solution[
  Let $a_n = 1/n$. Consider the following function: $ f(x) = cases(1 "if" = 1/n, 0 "otherwise"). $ $f$ has infinitely many discontinuities. Let $m_n = 1/(2n(n-1))$

  $ P_n = {0, 1/n - m_n, 1/n + m_n, 1/(n - 1) - m_n, ..., 1/2 + m_n, 1 - m_n, 1 }. $

  Let $ G(I) = sup_(x in I) f(x) - inf_(x in I) f(x). $ Note that $G([0, 1/n - m_n]) = 1$, $G([1/(k) - m_n, 1/(k) + m_n]) = 1$ for all $k$, but $G([1/(k) + m_n, 1/k - m_n]) = 0$. Finally $G([1 - m_n, 1]) = 1$. Thus $ R(P_n) = U(f, P_n) - L(f, P_n) & = (1/n - m_n) + 2(n - 1) m_n + m_n \
                                 & = 1/n + 2(n - 1)m_n = 2/n ->_(n -> oo) 0. $ Thus $forall epsilon > 0$, we have that $exists N in NN$ such that for all $n >= N$, $R(P_n) < epsilon$. We have more than proven the Riemann integrablility of $f$.

]

#problem(todo: true)[
  Let $f_n$ be a sequence of continuous functions on $[0, 1]$. Assume: (i) $f_n (x) >= f_(n+1)(x)$ for all $x in [0, 1]$; and (ii) $lim_(n -> infinity) f_n (x) = 0$ for all $x in [0, 1]$. Prove (don't just quote some theorem) that $f_n -> 0$ _uniformly_ on $[0, 1]$.
]
#solution[]

#problem(todo: true)[
  Let $f : RR -> M_(n times n)$ be a continuous function, where $M_(n times n)$ is the space of $n times n$ matrices. Show that the function $g(t) = "rank"(f(t))$ is lower semi-continuous, meaning that if a sequence $t_n$ converges to $t$ then $g(t) <= liminf_n g(t_n)$. Is $g$ always continuous?
]
#solution[]

#problem(todo: true)[
  Assume that a complex matrix $A$ satisfies $ker((A - lambda I)) = ker((A - lambda I)^2)$ for all $lambda in CC$. Show from first principles (i.e. without using the theory of canonical forms) that $A$ must be diagonalizable.

]
#solution[]

#problem(todo: true)[
  Let $V$ be a finite dimensional inner product space, and let $L : V -> V$ be a self-adjoint linear operator. Let $mu$ and $epsilon$ be given. Suppose there is a unit vector $x in V$ such that
  $ norm(L(x) - mu x) <= epsilon. $
  Prove that $L$ has an eigenvalue $lambda$ so that $abs(lambda - mu) <= epsilon$.
]
#solution[]

#problem(todo: true)[
  Let $A$ be a $3 times 3$ real matrix with $A^3 = I$. Show that $A$ is similar to a matrix of the form
  $ mat(1, 0, 0; 0, cos theta, -sin theta; 0, sin theta, cos theta) $
  for some (real) $theta$. What values of $theta$ are possible?
]
#solution[]

#problem(todo: true)[
  #part(todo: true)[
    State and prove the rank-nullity theorem.
  ]
  #part(todo: true)[
    Suppose $V$, $W$, and $U$ are finite dimensional vector spaces over $RR$ and that $T : V -> W$ and $S : W -> U$ are linear operators. Suppose further that $T$ is one-to-one, $S$ is onto, and $S compose T = 0$. Prove that $ker(S) supset.eq "image"(T)$ and that
    $ -dim(V) + dim(W) - dim(U) = dim(ker(S) \/ "image"(T)). $
  ]
]
#solution[]

#problem(todo: true)[
  Let $A$ be an $m times n$ real matrix, and let $b in RR^m$. Suppose $A x$ and $A y$ are both of minimal distance to $b$ (minimizing among members of $"image"(A)$). Prove that $x - y in ker(A)$.
]
#solution[]

= Basic Exam --- Winter 2012

#problem(todo: true)[
  Let $Omega$ denote the set of all closed subsets of $[0, 1]$ and let $rho: Omega times Omega -> [0, 1]$ be defined by
  $ rho(A, B) := max{sup_(x in A) inf_(y in B) |x - y|, sup_(y in B) inf_(x in A) |x - y|}. $
  Show that $(Omega, rho)$ is a metric space.
]
#solution[]

#problem(todo: true)[
  Recall that $f: [a, b] -> RR$ is convex if for all $x, y in [a, b]$ and $alpha in [0, 1]$, $f(alpha x + (1 - alpha) y) <= alpha f(x) + (1 - alpha) f(y)$. Let $f_n: [a, b] -> RR$ be convex functions and suppose that $f(x) := lim_(n -> oo) f_n (x)$ exists at all $x in [a, b]$ and is continuous on $[a, b]$. Prove that $f_n -> f$ uniformly.
]
#solution[]

#problem(todo: true)[
  Prove the Bolzano--Weierstrass theorem in the following form: Each sequence $(a_n)_(n in NN)$ of numbers $a_n$ in the closed interval $[0, 1]$ has a convergent subsequence.
]
#solution[]

#problem(todo: true)[
  For a sequence ${a_n}$ of non-negative numbers, let $s_n := sum_(k=1)^(n) a_k$ and suppose that $s_n$ tends to a number $s in RR$ in Cesaro sense:
  $ lim_(n -> oo) (s_1 + dots.c + s_n) / n = s. $
  Show that $sum_(k=1)^(oo) a_k$ exists and equals $s$.
]
#solution[]

#problem(todo: true)[
  Prove that there is a unique continuous function $y: [0, 1] -> RR$ solving the equation
  $ y(x) = e^x + y(x^2) / 2, quad x in [0, 1]. $
]
#solution[]

#problem(todo: true)[
  Let $gamma$ be a smooth curve from $(1, 0)$ to $(1, 0)$ in $RR^2 without {(0, 0)}$ winding once around the origin in the clockwise direction. Compute the integral
  $ I(gamma) := integral_gamma (y dif x - x dif y) / (x^2 + y^2). $
]
#solution[]

#problem(todo: true)[
  Let $FF$ be the finite field of $p$ elements, let $V$ be a $n$-dimensional vector space over $FF$, and let $0 <= k <= n$. Compute the number of invertible linear maps $V -> V$.
]
#solution[]

#problem(todo: true)[
  Let $A$ be a $n times n$ complex matrix. Prove that there are two sequences of matrices ${B_i}$ and ${L_i}$, such that $L_i$ are diagonal with distinct eigenvalues, and $B_i L_i B_i^(-1) -> A$ as $i -> oo$.
]
#solution[]

#problem(todo: true)[
  Let $a_1 = 1$, $a_2 = 4$, $a_(n+2) = 4 a_(n+1) - 3 a_n$ for all $n >= 1$. Find a $2 times 2$ matrix $A$ such that
  $ A^n dot vec(1, 0) = vec(a_(n+1), a_n) $
  for all $n >= 1$. Compute the eigenvalues of $A$ and use them to determine the limit $lim_(n -> oo) (a_n)^(1\/n)$.
]
#solution[]

#problem(todo: true)[
  Let $A$ be a complex $n times n$ matrix. State and prove under which conditions on $A$ the following identity holds:
  $ det(e^A) = exp("tr" A). $
  Here the matrix exponentiation is defined via the Taylor series $e^A = 1 + A + A^2 \/ 2! + A^3 \/ 3! + dots.c$. You can assume known that this sum converges (entrywise) for all complex matrices $A$.
]
#solution[]

#problem(todo: true)[
  #part(todo: true)[
    Find a polynomial $P(x)$ of degree 2, such that $P(A) = 0$, for $A = mat(1, 3; 4, 2)$.
  ]
  #part(todo: true)[
    Prove that such $P(x)$ is unique, up to multiplication by a constant.
  ]
]
#solution[]

#problem(todo: true)[
  Recall that the quadratic forms $Q_1 (x, y)$ and $Q_2 (x', y')$ are said to be equivalent if they are related by a non-singular change of coordinates $(x, y) |-> (x', y')$. Decide whether $Q_1 = x y$ and $Q_2 = x^2 + y^2$ are equivalent over $CC$ and whether they are equivalent over $RR$. If not, give a proof. If yes, find the matrix for change of coordinates.
]
#solution[]

= Basic Exam --- Fall 2012

#problem(todo: true)[
  Let ${b_n}_(n=1)^(oo)$ be a sequence of real numbers with bounded partial sums, i.e., there is $M < oo$ such that for all $N$, $abs(sum_(n=1)^(N) b_n) <= M$, and let ${a_n}_(n=1)^(oo)$ be a sequence of positive numbers decreasing to 0. Prove the series $sum a_n b_n$ converges.
]
#solution[]

#problem(todo: true)[
  Let $f(x)$ be a bounded real-valued function on the closed interval $[0, 1]$.
  #part(todo: true)[
    Give a (correct) definition of the Riemann integral $integral_0^1 f(x) dif x$ that includes a necessary and sufficient condition for the integral to exist.
  ]
  #part(todo: true)[
    Use your answer to (a) to prove that $integral_0^1 f(x) dif x$ exists if $f$ is non-decreasing (i.e. $f(x) <= f(y)$ whenever $x <= y$).
  ]
]
#solution[]

#problem(todo: true)[
  Let ${f_n (x)}$ be a sequence of non-negative continuous functions on a compact metric space $X$. Assume $f_n (x) >= f_(n+1)(x)$ for all $n$ and $x$, so that $lim_(n -> oo) f_n (x) = f(x)$ exists for every $x in X$. Prove $f$ is continuous if and only if $f_n$ converges to $f$ uniformly on $X$.
]
#solution[]

#problem(todo: true)[
  A subset $K$ of a metric space $(X, d)$ is called _nowhere dense_ if $K$ has empty interior (i.e., if $U subset.eq K$, $U$ open in $X$ imply $U = emptyset$). Prove the Baire theorem that if $(X, d)$ is a complete metric space, then $X$ is not a countable union of closed nowhere dense sets.
]
#solution[]

#problem(todo: true)[
  A subset $E$ of a metric space $X$ is a $G_delta$ set if $E = inter.big_(n=1)^(oo) G_n$ where each $G_n$ is open in $X$. Use Problem 4 to prove that the set of rational numbers is _not_ a $G_delta$ subset of the set of real numbers.
]
#solution[]

#problem(todo: true)[
  #part(todo: true)[
    Let $F(x, y)$ be a continuous function on the plane such that for every square $S$ having its sides parallel to the axes, $integral.double_S F(x, y) dif x dif y = 0$. Prove $F(x, y) = 0$ for all $(x, y)$.
  ]
  #part(todo: true)[
    Assume $f(x, y)$, $(partial f(x,y)) / (partial x)$, $(partial f(x,y)) / (partial y)$, $partial / (partial y)((partial f(x,y)) / (partial x))$ and $partial / (partial x)((partial f(x,y)) / (partial y))$ are all continuous in the plane. Use part (a) to prove that
    $ partial / (partial y) (partial f(x,y)) / (partial x) = partial / (partial x) (partial f(x,y)) / (partial y). $
  ]
]
#solution[]

#problem(todo: true)[
  Let $A$ be an invertible $n times n$ matrix with entries in $CC$. Suppose that the set of powers $A^n$ of $A$, for $n in ZZ$, is bounded. Show that $A$ is diagonalizable.
]
#solution[]

#problem(todo: true)[
  Let $H$ be an $n times n$ Hermitian matrix with non-zero determinant. Use $H$ to define a Hermitian form $[dot, dot]$ by the formula: for $x, y in CC^n$ (column vectors!), $[x, y] = {}^t overline(x) H y$, where the bar over $x$ denotes complex conjugation and the $t$ denotes transpose. Let $W$ be a complex subspace of $CC^n$ such that $[w_1, w_2] = 0$ for all $w_1$ and $w_2$ in $W$. Show that $dim W <= n\/2$. Give also for each $n$ an example of an $H$ for which $dim W = n\/2$ if $n$ is even, or $dim W = (n-1)\/2$ if $n$ is odd.
]
#solution[]

#problem(todo: true)[
  Let $A$ be an $m times n$ real matrix with $m >= n$. Let $b in RR^m$. Let $M$ be the set of vectors $x in RR^n$ which minimize $|A x - b|$. Show that $M = x_0 + N$ where $N$ is the kernel of $A$, and $x_0$ is any element of $M$.
]
#solution[]

#problem(todo: true)[
  Let $A$ be a linear operator on a four dimensional complex vector space that satisfies the polynomial equation $P(A) = A^4 + 2A^3 - 2A - I = 0$, where $I$ is the identity operator. Let $B = A + I$ and suppose $dim("range"(B)) = 2$. Finally, suppose that $|"Tr"(A)| = 2$. Give a Jordan canonical form of $A$.
]
#solution[]

#problem(todo: true)[
  Show that an $n times n$ matrix $A$ can be factored as $A = L U$, where $L$ is lower triangular and $U$ is upper triangular, provided each determinant $det A_j$, for $j = 1, ..., n-1$, is non-zero, where $A_j$ is the submatrix of $A$ consisting of the first $j$ rows and the first $j$ columns.
]
#solution[]

#problem(todo: true)[
  Let $M$ be an $n times m$ matrix. Prove that the row rank of $M$ equals the column rank of $M$. Also, however you prove it, interpret this result as an equality of the dimensions of two vector spaces naturally attached to the map defined by $M$.
]
#solution[]
