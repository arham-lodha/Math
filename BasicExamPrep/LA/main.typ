#import "template.typ": *
#import "figures.typ" as figs

#show: notes.with(
  title: "Linear Algebra Notes",
  author: "Arham Lodha",
  course: "UCLA Basic Qual Prep",
  cover: false,
  toc: true,
  bibliography-file: "refs.bib",
)

#let span = math.op("span")
#let ann = math.op("ann");

Throughout, $V$ is a finite-dimensional vector space over a field $F$, and $T : V -> V$
is linear (equivalently $A in M_n (F)$ after a choice of basis). Write
$p_T (x) = det(x I - T)$ for the characteristic polynomial and $m_T (x)$ for the
minimal polynomial of $T$.

= Diagonalization

#definition[
  $T$ is _diagonalizable_ if $V$ has a basis consisting of eigenvectors of $T$. For
  $lambda in F$, the _eigenspace_ is $E_lambda = ker(T - lambda I)$.
]

#lemma[
  Eigenvectors corresponding to distinct eigenvalues of $T$ are linearly independent.
] <lem-distinct-indep>
#proof[Let $v_1, ..., v_n in V$ be the smallest set of linearly dependent eigenvectors of $T$ such that $T v_i = lambda_i v_i$ such that $lambda_i != lambda_j <=> i != j$.

  $
                                          sum_(i=1)^(n) a_i v_i & = 0 \
    => T sum_(i=1)^(n) a_i v_i = sum_(i=1)^(n) a_i lambda_i v_i & = 0 quad ("E1") \
                 lambda_1 sum_(i=1)^(n) a_i v_i = 0 quad ("E2")
  $

  $ 0 = "E1" - "E2" = sum_(i=1)^(n) (lambda_i - lambda_1) a_i v_i = 0 $

  We now get a smaller set ${v_2, ..., v_n}$ of linearly dependent eigenvectors and hence we reach a contradiction.

]

#lemma[
  For distinct eigenvalues $lambda_1, dots, lambda_k$ of $T$, the sum
  $E_(lambda_1) + dots.c + E_(lambda_k)$ is direct.
] <lem-sum-direct>

#lemma[
  For every eigenvalue $lambda$ of $T$,
  $dim E_lambda <= op("mult")_(p_T)(lambda)$,
  the multiplicity of $lambda$ as a root of $p_T$. Thus the algebraic multiplicity of a eigenvalue is greater than or equal to the geometric multiplicity of the eigenvalue
] <lem-algmult>
#proof[Let $dim E_(lambda) = g$ and $dim V = n$. Let $v_1, ..., v_g$ be a basis for $dim E_(lambda)$. Extend the basis to $V$, thus let $v_1, ..., v_g, w_1, ..., w_(n - g)$ be a basis for $V$. Let $P: V -> FF^n$ be the linear isomorphism where $v_i -> e_i$ and $w_j -> e_(g + j)$. Thus note that $P T P^(-1) e_i = lambda e_i <=> i = 1, ..., g$. Thus $ P T P^(-1) & = mat(lambda I, B; 0, C) $ where $I$ is the $g times g$ identity matrix. $B in Mat_(g times (n - g))(FF)$ and $D in Mat_((n - g) times (n - g))(FF).$ Note that $p_T (x) = p_(P T P^(-1))(x).$ $ p_(P T P^(-1))(x) & = det mat((lambda - x)I, B; 0, C - x I) \
                    & = det((lambda - x) I) det(C - x I) \
                    & = (lambda - x)^g det (C - x I) = p_T (x) $

  Thus $(lambda - x)^g | p_T (x)$, thus $(lambda - x)$ is a factor of $p_T (x)$ furthermore $g$ is less than or equal to the multiplicity of $lambda$ as a root of $p_T$.
]

#lemma("That Kid's Lemma")[
  Let $U, V, W$ be $FF$-vector spaces. Let $A in Hom_(FF)(U, V)$ and $B in Hom_(FF)(V, W)$. Then $ dim ker B A <= dim ker A + dim ker B $
]<TKL>
#proof[
  Note that $ker A subset.eq ker B A$ and note that $A(ker B A) subset.eq ker B$. By rank nullity we have the following:

  $
    dim ker B A & = dim ker (A|_(ker B A) ) + dim im (A|_(ker B A)) \
                & = dim ker A + dim im (A|_(ker B A)) \
                & <= dim ker A + dim ker B
  $
]

#theorem("Diagonalizability Criterion")[
  The following are equivalent:
  #enum(numbering: "(a)")[
    $T$ is diagonalizable.
  ][
    $V = plus.circle.big_lambda E_lambda$, the sum over all eigenvalues of $T$.
  ][
    $sum_lambda dim E_lambda = dim V$.
  ][
    $m_T (x)$ factors as a product of distinct linear factors over $F$.
  ]
] <thm-diag>
#proof[
  $a <=> b<=> c$: Tautological using the definition and @lem-distinct-indep.

  $a => d$: Suppose $T: V -> V$ is diagonalizable. Thus $v_1, ..., v_n in V$ a basis $V$ consisting of eigenvectors for $T$. Let $lambda_1, ..., lambda_m$ be the distinct eigenvalues with multiplicities $k_1, ..., k_p$. Thus $ T v_(r) = lambda_p v_r "where" K_(p - 1) = sum_(i=1)^(p - 1) k_i <= r < sum_(i=1)^(p) k_i = K_p. $ Note that $ (T - lambda_p I)v_r = 0 $ for $K_(p - 1) <= r < K_p.$ Thus $ product_(i = 1)^(m) (T - lambda_i I) v_i = 0 $ for all $i = 1, ..., n$. Thus $ m_T (x) divides product_(i=1)^(m) (x - lambda_i) = s(x). $ Since $s(x)$ consists of distinct linear factors so does $m_T (x)$.

  $d => b => a:$ Suppose $m_(T) (x)$ consists of distinct linear factors. We will first do a quick lemma: for $A in Hom_(FF) (V, W)$ and $B in Hom_(FF)(U, V)$ $ dim ker A B <= dim ker A + dim ker B. $ Note that $forall k in ker A B$, $B(k) in ker A$. Thus $B|_(ker A B): ker A B -> ker A$. Apply rank nullity theorem:

  $ dim ker A B & = dim ker (B|_(ker A B)) + dim im (B|_(ker A B)) <= dim ker (B|_(ker A B)) + dim ker A. $

  Note that $ker A B inter ker B = ker B$. Thus $ker (B |_(ker A B)) = ker B$. Thus $ dim ker A B <= dim ker B + dim ker A. $


  Hence we have the lemma. Now $ m_T (x) = product_(i=1)^(m) (x - lambda_i) $ where $lambda_1, ..., lambda_m$ are distinct. Note that $m_T (T) = 0$. Thus $ dim V = dim ker m_T (T) <= sum_(i=1)^(n) dim ker (T - lambda_i I) = sum_(i=1)^(m) dim E_(lambda_i). $ Since $E_(lambda_i) inter E_(lambda_j) = {0}$ for $i != j$, $ sum_(i=1)^(m) dim E_(lambda) = dim plus.big_(i = 1)^m E_lambda <= dim V. $

  Thus we have equality and we get $c$ which implies diagonalizable.
]

#lemma("Idempotent Decomposition")[
  If $m_T (x) = product_(i=1)^k (x - lambda_i)$ with the $lambda_i$ distinct, there exist
  polynomials $e_1, dots, e_k in F[x]$ such that $e_i (T)$ is the projection of $V$ onto
  $E_(lambda_i)$ along $plus.circle.big_(j != i) E_(lambda_j)$, with
  $sum_i e_i (T) = I$ and $e_i (T) e_j (T) = 0$ for $i != j$.
] <lem-idempotent>
#proof[
  Let $ e_(i)(x) & = product_(1 <= j <= k \ i != j) (x - lambda_j) / (lambda_i - lambda_j). $
  Note the following $ e_i (lambda_i) & = product_(1 <= j <= k \ i != j) (lambda_i - lambda_j) / (lambda_i - lambda_j) = 1 \
  e_i (lambda_j) & = 0 $

  Thus for $v in E_(lambda_j)$ for $i != j$ and $w in E_(lambda_i)$. Consider $  (T - lambda_m I)v & = T v - lambda_m v = (lambda_j - lambda_m)v \
  (T - lambda_m I) w & = (lambda_i - lambda_m) w $
  $
    e_i (T) v & = (product_(1 <= j <= k \ i != j) (T - lambda_j I) / (lambda_i - lambda_j))v \
              & = (product_(1 <= m <= k \ m != i) (lambda_j - lambda_m) / (lambda_i - lambda_j)) v = e_i (lambda_j) v = 0 \
    e_i (T) w & = (product_(1 <= j <= k \ i != j) (T - lambda_j I) / (lambda_i - lambda_j))w \
              & = e_i (lambda_i) w = w
  $

  Thus $ e_i (T)|_(E_a) & = cases(I "if" a = i, 0 "otherwise") $

  Thus $ sum_(i = 1)^(k) e_i (T) = I "for" plus.big_(i = 1)^(k) E_(lambda_i) = V $




]

#lemma("Invariance of Diagonalizability Under Restriction")[
  If $T$ is diagonalizable and $W <= V$ is a $T$-invariant subspace, then $T|_W$ is
  diagonalizable.
] <lem-restrict>
#proof[It suffices to show that $m_(T|_W) divides m_T$, thus since $m_T$ has distinct linear factors so does $m_(T|_W)$, and hence $T|_(W)$ is diagonalizable. To do this we will show that $ m_T (T|_W) = 0. $

  Note the following by definition $(T|_W) w = T w$ for all $w in W$. Thus $(T|_W)^(n) w = T^n w => m_T (T|_W) w = m_T (T) w = 0.$ Thus $m_T (T|_W): W -> W$ is the 0 map and hence $m_(T|_W) divides m_(T)$.
]

#theorem("Simultaneous Diagonalization")[
  If $S, T : V -> V$ are each diagonalizable and $S T = T S$, then there is a basis of
  $V$ consisting of vectors that are simultaneously eigenvectors of $S$ and of $T$.
] <thm-simdiag>
#proof[
  Let $E_(lambda_i)$ for $i = 1, ..., k$ be the eigenspaces of $S$. $forall v in E_(lambda_i)$ note the following:

  $ S T v = T S v = lambda_i T v => T v in E_(lambda_i) $

  Thus $E_(lambda_i)$ for all $i$ are $T$ invariant subspaces. Hence $T|_(E_(lambda_i))$ is diagonalizable and hence you can find a basis of eigenvectors in $E_(lambda_i)$ (for all $i$) that is a eigenbasis for both $S|_(E_lambda_i)$ and $T|_(lambda_i)$. Combine the basis for all $E_(lambda_i)$ to get a basis for V. The basis is a eigenbasis for $S$ and $T$.
]

= The Cayley--Hamilton Theorem

#theorem("Cayley--Hamilton")[
  $p_T (T) = 0$.
] <thm-ch>
#proof[
  We will first prove this theorem is true over $CC$, then we will prove over any arbitrary field.
  1. *Diagonal Matrices*: Let $D = diag(lambda_1, ..., lambda_n)$. Then $ p_D (x) & = det(D - x I) \
            & = det(diag(lambda_1 - x, ..., lambda_n - x)) \
            & = product_(i = 1)^(n) (lambda_i - x). $

  Thus $ p_D (D) & = product_(i=1)^(n) (lambda_i I - D) \
          & = product_(i=1)^(n) diag(lambda_1 - lambda_i, ..., lambda_n - lambda_i) \
          & = 0 $

  2. *Diagonalizable Linear Transformations*: Let $T: V -> V$ be a diagonalizable linear Transformation, thus $exists P: V -> FF^n$ a linear isomorphism and $D in Mat_(n times n)(FF)$ a diagonal matrix where $T = P^(-1) D P$. Note $T^k = P D^k P^(-1)$ for all $k = 0, 1, 2, ...$. Thus since $p_T$ is polynomial. $ p_T (x) & = det(T - x I) \
            & = det(P^(-1) D P - lambda I) \
            & = det(P^(-1) (D - lambda I) P) \
            & = det(P)^(-1) p_D (x) det(P) = p_D (x) $

  $ p_T (T) = p_D (T) = p_D (P^(-1) D P) = P^(-1) p_D (D) P = 0 $

  3. *All Matrices*: Diagonalizable linear Transformations are dense over all $End(V)$ for $V$ a vector space over $CC$. Since $A -> p_A (A)$ is a continous map from $End(V) -> CC$ which is 0 on a dense set and hence 0 identically.

  Thus we have proven for all $End(V)$ for $V$ a $CC$ vector space the statement is true.

  Let $R = ZZ[x_(1 1), ..., x_(n n)].$ Let $M &= [x_(i j)]_(1 <= i, j <= n) in Mat_(n times n)(R)$. Note that the coefficients of $p_M$ are in $R$ (ie polynomials in the variables $x_(1 1),..., x_(n n)$). Thus when we evaluate $p_M (M)$, each entry will be a polynomial in $ZZ[x_(11), ..., x_(n n)]$. Let $P_(i j)$ denote the polynomial in the $(i, j)$-entry of $p_M (M)$. We want to show that $P_(i j) = 0$ for all $1 <= i, j <= n$. Note that by 1 - 3, $forall A in Mat(CC)$, we have that $p_A (A) = 0$. Thus $forall arrow(a) in CC^(n^2)$, the matrix $A = M(arrow(a)) => p_A (A) = p_(M (arrow(a))) (M(arrow(a))) = 0$ thus by definition $P_(i j)(arrow(a)) = 0$. Thus since $P_(i , j)(arrow(a)) = 0$ for all $arrow(a) in CC^(n^2)$, which means that $P_(i j) equiv 0$. Thus $p_(M) (M) = 0$. Let $FF$ be an arbitrary field. Let $B = [B_(i j)] in Mat_(n times n)(FF)$, define the evaluation map: $ Phi: ZZ[x_(1 1), ..., x_(n n)] & -> FF \
                         x_(i j) & -> B_(i j). $

  $ 0 & = Phi(P_(i j)) & = (p_B (B))_(i j) => p_B (B) = 0 $
]

#lemma("Adjugate Identity")[
  Let $B(x) = op("adj")(x I - T) in M_n (F[x])$. Then
  $ (x I - T) B(x) = p_T (x) I. $
] <lem-adj>

#lemma("Triangularizability")[
  If $p_T (x)$ splits into linear factors over $F$, then there is a basis of $V$ in which
  $T$ is represented by an upper triangular matrix.
] <lem-triang>

#corollary[
  $m_T (x) | p_T (x)$.
] <cor-mindivides>

#corollary[
  $m_T (x)$ and $p_T (x)$ have the same roots in $overline(F)$ (equivalently, the same
  irreducible factors over $F$), possibly with different multiplicities.
] <cor-sameroots>

= Jordan Canonical Form

Assume in this section that $p_T (x)$ splits over $FF$.

#definition[
  For $lambda in F$, the _generalized eigenspace_ is
  $K_lambda = ker(T - lambda I)^(dim V)$. An operator $N$ is _nilpotent_ if $N^r = 0$
  for some $r >= 1$. The _Jordan block_ $J_k (lambda) in M_k (F)$ is the upper triangular
  matrix with $lambda$ on the diagonal and $1$ on the superdiagonal.
]

#theorem("Primary Decomposition Theorem")[
  If $m_T (x) = product_(i=1)^r q_i (x)^(e_i)$ with $q_i in F[x]$ distinct monic
  irreducibles, then
  $ V = plus.circle.big_(i=1)^r ker q_i (T)^(e_i), $
  and each summand is $T$-invariant.
] <thm-primary>
#proof[
  1. *Isomorphism* : Let $v_1, ..., v_k$ be the smallest set of nonzero linearly dependent vectors such that $v_i in ker q_i (T)^(e_i).$ Thus there exists $a_1, ..., a_k in FF$ such that $(a_1, ..., a_k) != 0$ and $                sum_(i=1)^(k) a_i v_i & = 0 \
    q_1(T)^(e_1) (sum_(i=1)^(k) a_i v_i) & = 0 \
    sum_(i=2)^(k) a_i q_(1)(T)^(e_i) v_i & = 0 $

  Let $w_i = q_1 (T)^(e_1) v_i$. $q_i (T)^(e_i) w_i = q_i (T)^(e_i) (q_1 (T)^(e_1) v_i) = 0$ since polynomials in $T$ commute. Hence $w_i in ker q_i (T)^(e_i).$ Distinct irreducible polynomials are coprime, hence by Bezout's Theorem there $exists a_i, b_i in FF[x]$ where $ 1 & = a_i (x) q_i (x)^(e_i) + b_i (x) q_(1) (x)^(e_1) $ thus $ I = a_i (T) q_i (T)^(e_i) + b_i (T) q_1 (x)^(e_1) => v_i = b_i (T) q_1 (T)^(e_1) v_i => v_i = b_i (T) w_i => w_i!=0. $

  Thus $ sum_(i = 2)^(n) a_i w_i & = 0 $ is a shorter sum of nonzero linearly dependent vectors. Furthermore $a_i != 0$ for all $i in {2, ..., n}$, because that would imply $a_1 v_1 = 0 => a_1 = 0$ or $v_1 = 0$ both of which introduce contradictions.


  By definition, $m_T (T) = 0$. Hence $dim ker m_T (T) = dim V$. By @TKL, note that $ dim V = dim ker m_T (T) <= sum_(i=1)^(n) dim ker q_i (T)^(e_i) <= dim V. $

  Thus $ V = plus.big_(i = 1)^(r) ker q_i (T)^(e_i) $

  2. *$T$-invariance*: Polynomials in $T$ commute. Hence $q_i (T)^(e_i) T = T q_(i) (T)^(e_i).$ This directly implies $T$ invariance (apply then commute).
]

#theorem("Generalized Eigenspace Decomposition")[
  Write $m_T (x) = product_lambda (x - lambda)^(e_lambda)$. Then
  $ V = plus.big_lambda K_lambda, $
  and $dim K_lambda = op("mult")_(p_T)(lambda)$ for each eigenvalue $lambda$.
] <thm-geneig>
#proof[
  Directly apply @thm-primary to get the isomorphism. Since each $K_(lambda)$ is $T$ invariant, define $T_(lambda) = T|_(K_(lambda) )$. Since the total space is a direct product of the $T$ invariant subpsaces, you can define the characteristic polynomial as follows:
  $ p_T (x) = product_(lambda) p_(T_(lambda) )(x) . $

  We will study $p_(T_(lambda) ) (x)$. Note that $K_lambda := ker (T - lambda I)^(dim V)$. Thus by definition on $K_(lambda)$, $(T_(lambda) - lambda I)$ is a Nilpotent operator, hence its only eigenvalue is $0$. Thus $T_(lambda)$ only has a eigenvalue of $lambda$. The characteristic polynomial must have degree equal to the dimension of the domain, so $ p_(T_(lambda) ) (x) & = (x - lambda)^(dim K_(lambda) ). $

  Thus $ p_T (x) = product_(lambda)^() (x - lambda)^(dim K_(lambda)) => dim K_(lambda) = op("mult")_(p_T)(lambda) $
]

#theorem("Nilpotent Structure Theorem")[
  If $N : W -> W$ is nilpotent, there is a basis of $W$ in which $N$ is block diagonal
  with blocks $J_(k_1)(0), dots, J_(k_s)(0)$. The multiset $\{k_1, dots, k_s\}$ is
  uniquely determined by $N$.
] <thm-nilp>
#proof[
  Suppose $N$ is nilpotent (and wlog $N != 0$ otherwise theorem trivializes). That means $N^(r) = 0$ for some $r >= 1$. Note the following $ker N^k subset.eq ker N^(k + 1)$ for all $k >= 0$. Furthermore, you know that $forall k >=0$ we have that $ker N^k subset.eq W$. So you have a nondecreasing sequence of the dimensions of the kernels of $N^k$ which has a upper bound of the dimension of W. Furthermore, by the fact that $N$ is nilpotent you know that $N^(r) = 0$ for some $r$, hence $W = ker N^r$. Hence there is a minimal $r$ such that $ker N^r = W$ but $ker N^(r - 1) != W$.


  The minimal polynomial $m_N (x) divides x^r$, thus the only eigenvalue of $N$ is $0$. To prove this statement we will induct on the dimension of our vector space. For the base case, let for any $1$ dimensional vector space. $N: W -> W$ must be just be scalar multiplication ie $v -> lambda v$. As proven above, the only eigenvalue of $N$ is 0, so $lambda = 0$. Hence $N = J_1 (0)$. Assume the statement is true for all nilpotent linear Transformations acting on vector spaces of dimension less than or equal to $n$. Let $N$ be a nilpotent linear transformation acting on $W$ where $dim W = n + 1$.
  Fix a $w_1 in ker N^r \/ ker N^(r - 1)$. Assume the contrary that $w_1 = N u => N^(r - 1) w_1 = N^r u = 0$, which is a contradiction (hence $w_1 in.not im N$ which will come up later). Consider the set of vectors ${N^j w_1 : 0 <= j <= r}$. We want to show that this is linearly independent. Let $0 <= j_1 < ... < j_k <= r$ be the smallest set of indices such that

  $ sum_(i =1)^(k) a_i N^(j_i) w_1 = 0 $

  and $a_i != 0$. Let $m = s_1 - j_k + 1$. Then $ N^(m) sum_(i = 1)^(k) a_i N^(j_i) w_1 & = 0 \
  sum_(i=1)^(k - 1) a_i N^(j_i + m) w_1 & = 0 $

  Note that $N^(j_i + m) w_1 != 0$ for $i in {1, ..., k-1}$, by definition. Thus we got a smaller set of indicies which are linearly dependent and a contradiction occurs. Thus ${N^j w_1 : 0 <= j < r}$ are linearly independent vectors. Note that the subspace generated by these vectors are $N$-invariant, and $N (N^j w_1) = N^(j + 1) w_1$, so on this subspace $N$ looks like $J_(r) (0)$. Let $W_1 = span(w_1, N w_1, ..., N^(r - 1) w_1)$

  Consider the quotient space $W \/ W_1$. Note that $N(W_1) subset W_1$. Since $W_1$ is $N$-invariant, $N$ induces a nilpotent linear map, which we will call $tilde(N)$, on the quotient space where $v + W_1 -> N(v) + W_1$. Note that $dim W_1 >= 1 => dim (W \/ W_1) <= dim W - 1 = n - 1$, hence by the inductive assumption there exists a basis of disjoint cyclic subspaces. We want to "pull back" the basis from the quotient space to get a appropriate basis for $W$, while maintaining the appropriate block structure. By assumption we have $ tilde(N)^(m + 1) (u + W_1) = N^(m + 1) u + W_1 = W_1. $ Thus $ N^(m + 1) u & = sum_(i = 0)^(r - 1) a_i N^i w_1 \
      N^(r) u & = N^(r - m - 1) sum_(i = 0)^(r - 1) a_i N^i w_i \
              & = sum_(i = 0)^(r - 1) a_i N^(r + i - m - 1) w_i $

  Note for $i = {m + 1, ..., r - 1}$, $N^(r + i - m - 1) = N^r =0$, but for $i <= m$, $r + i - m - 1 <= r - 1$. Hence $ 0 = N^r u & = sum_(i= 1)^(m) a_(i) N^(r + i - m - 1) w_1. $

  This implies that $a_i = 0$ for $1 <= i <= m$. Hence $ N^(m + 1) u & = sum_(i = m + 1)^(r - 1) a_i N^(i) w_1 => N^(m + 1)(u - sum_(i = 1)^(r - m - 2) a_(i + m + 1) N^i w_1 ) = 0. $

  Let $       x & = sum_(i = 1)^(r - m - 2) a_(i + m + 1) N^i w_i \
  u prime & = u - x. $

  Thus the sequence $u prime, N u prime , ..., N^(m + 1) u prime = 0$ exactly when it supposed to. Suppose $N^k u prime in W_1$ for $1 <= k <= m$. Then $tilde(N)^k (u prime + W_1) = tilde(N)^k (u + W_1) = 0$ which contradicts the maximality of $m$. Thus $W_1 inter W_2 = {0}$. Thus we can keep peeling off dimensions off of our vector space $W$ and using the inductive hypothesis on $ W \/ plus.big_i^k W_i $ to get $W_(k + 1)$ subspace we we find to be disjoint from all ther subspaces and by the inductive hypothesis to have a cyclic structure. Now we need to prove uniqueness of the multiset of block sizes. Note the following fact: $dim ker N^k - dim ker N^(k - 1)$ is the number of blocks of at least size $k$ for $k in NN$. Then $-dim ker N^(k + 1) + 2 dim ker N^k -dim ker N^(k - 1)$ is the number of blocks of size $k$ for $k in NN$. Note these numbers have nothing to do with the choice of basis but are invariants of the transformation itself.


  // Pick $v_1 in W \/ {0}$. Then let $ w_1^0 & = v_1 \
  // w_1^k & = N w_1^(k - 1) = N^k w_1^0. $
  // Let $k_1$ be the integer $s$ defined above for $v_1$. As proven above ${w_1^0, ..., w_1^(k_1)}$ is a linearly independent set, let $W_1 := FF chevron.l w_1^(0), ..., w_1^(k_1) chevron.r$. Create a basis for $W$ by taking a $v_k$ not in the span of $plus.big_(i = 1)^(k - 1) W_i$, apply $N$ repeatedly to get a basis for $W_(k)$. Now we have subspaces $W_1, ..., W_m$ that are $N$ invariant. We just need to prove that the subspaces are all disjoint (ie linearly independent) and we are done.
]

#lemma[
  If $N : W -> W$ is nilpotent and $W != 0$, then $op("im") N$ is a proper,
  $N$-invariant subspace of $W$, and $N|_(op("im") N)$ is nilpotent.
] <lem-nilpimage>
#proof[Suppose $W != 0$ and $N: W -> W$ is nilpotent. $forall v in im N$, $N v in im N$. Thus $im N$ is a $N$-invariant subspace by definition. Furthermore, since $N^r = 0$ for some $r >= 1$. We know that $N^r v = (N|_(im N))^r v = 0$. Thus $(N|_(im N))^r = 0$ and $N|_(im N)$ is nilpotent.
]

#theorem("Jordan Canonical Form: Existence")[
  There is a basis of $V$ in which the matrix of $T$ is block diagonal, each block a
  Jordan block $J_k (lambda)$ for some eigenvalue $lambda$ of $T$. This block-diagonal
  matrix is unique up to permutation of the blocks.
] <thm-jcf>

#theorem("Jordan Canonical Form: Uniqueness Formula")[
  For an eigenvalue $lambda$ and $k >= 1$, the number of Jordan blocks $J_k (lambda)$ in
  the Jordan form of $T$ equals
  $
    op("rank")(T - lambda I)^(k-1)
    - 2 op("rank")(T - lambda I)^k
    + op("rank")(T - lambda I)^(k+1).
  $
] <thm-jcfunique>

#proof[
  Apply @thm-geneig and @thm-nilp, straight forward.
]

= Rational Canonical Form

$F$ is an arbitrary field. Regard $V$ as an $F[x]$-module via $x dot.c v := T v$.

#definition[
  For $v in V$, the _$T$-cyclic subspace generated by $v$_ is
  $Z(v, T) = op("span"){v, T v, T^2 v, dots}$. The _$T$-annihilator_ of $v$ is the monic
  generator $op("ann")(v)$ of the ideal $\{f in F[x] : f(T) v = 0\}$. For a monic
  polynomial $f(x) = x^d + c_(d-1) x^(d-1) + dots.c + c_0$, the _companion matrix_
  $C(f)$ is the $d times d$ matrix
  $
    C(f) = mat(
      0, 0, dots.c, 0, -c_0;
      1, 0, dots.c, 0, -c_1;
      0, 1, dots.c, 0, -c_2;
      dots.v, , dots.down, , dots.v;
      0, 0, dots.c, 1, -c_(d-1)
    ).
  $
]

#lemma("Cyclic Basis Lemma")[
  If $V = Z(v, T)$ and $op("ann")(v)$ has degree $d$, then
  $\{v, T v, dots, T^(d-1) v\}$ is a basis of $V$, and the matrix of $T$ in this basis
  is $C(op("ann")(v))$.
] <lem-cyclicbasis>
#proof[
  Since $deg ann(v) = d$, we can write it as
  $ ann(v)(x) & = x^d + sum_(k = 0)^(d - 1) c_k x^k. $

  Thus $ 0 =ann(T)v & = (T^d + sum_(k = 0)^(d - 1) c_k T^k)v \
    => T^d v & = -1 (sum_(k = 0)^(d - 1) c_k T^k v) \ $

  Thus $forall k >= d$, $T^k v in span(v, T v, ..., T^(d - 1)v)$. In other words $Z(v, t)$ is generated by ${v, ..., T^(d - 1) v}$. Thus to prove that the set is a basis for $V$, it suffices to prove that they are linearly independent. Suppose $ sum_(k = 0)^(d - 1) a_k T^k v & = 0. $

  Let $   p(x) & := sum_(k = 0)^(d - 1) a_k x^k \
  p(T) v & = 0 => p(T) in {f in F[x] : f(T) v = 0}. $
  $ann(v)$ generates the ideal so $ann(x) | p(x)$ which implies that $a_k = 0$ for all $k$ (if not we have a polynomial $deg p(x) < d$ in a ideal generated by a degree $d$ polynomial). Thus the set is a basis for $Z(T, v)$. Let $w_i = T^i v$. Under the basis ${w_0, ..., w_(d - 1)}$ we know that $T w_i = w_(i + 1)$ if $i < d - 1$ and if $ T w_(d - 1) & = T v_d \
              & = sum_(k = 0)^(d - 1) (-c_k) w_k, $
  as discussed above. Thus under this basis $T$ is similar to the matrix $C(f)$.
]

#lemma[
  For $v, w in V$ where $gcd(ann(v), ann(w)) = 1$, $ann(v + w) = ann(v) ann(w)$
]<coprimeann>
#proof[
  We know that $ann(v + w) | ann(v) ann(w)$ because polynomials in $T$ commute. $          ann(v + w)(T)(v + w) & = 0 \
                ann(v + w)(T) v & = - ann(v + w)(T)w \
  0 = ann(v)(T) ann(v + w)(T) v & = -ann(v)(T) ann(v + w)(T) w $

  Thus $ann(w) | ann(v) ann(v + w) => ann(w) | ann(v + w)$. You can get $ann(v) | ann(v + w)$ in a similar fashion. Thus $ann(v)ann(w) | ann(v + w)$.
]

#lemma("Existence of a Vector of Maximal Order")[
  There exists $v in V$ with $op("ann")(v) = m_T (x)$.
] <lem-maxorder>
#proof[
  Note that $m_T (T) = 0$ (by definition), thus for all $v in V$ we have $ann(v) divides m_(T)$. Furthermore, note the following fact that $ann(v) != m_T$ if and only if $ker ann(v)(T) != V$. Since $FF[x]$ is a PID we can write $ m_T (x) = product_(i=1)^(n) (q_i (x))^(a_i) $ where $gcd(q_i, q_j) = 1$ for $i != j$. Now note the following $p_i=(m_T) / (q_i)$ is a polynomial of degree less than $m_T$ and hence $ker p_i (T) != V$. Thus there exists a $w_i$ such that $p_i (T) w_i$.
  Let $ v_i = (m_T (T)) / (q_i (T))^(a_i) w_i $
  But then note that $(q_i (T))^(a_i - 1) v_i = p_i (T) w_i != 0$ but $(q_i (T))^(a_i) v_i = 0$. Thus $ann(v_i) = (q_i)^(a_i)$. Now we have a set of vectors $v_1, ..., v_n$ where $ann(v_i) = (q_i)^(a_i)$. Then $ann(v_1 + ... + v_n) = m_T$ by @coprimeann.
]

#lemma("Cyclic Complement Lemma")[
  For $v$ as in @lem-maxorder, there exists a $T$-invariant subspace $W <= V$ with
  $ V = Z(v, T) plus.circle W. $
] <lem-complement>
#proof[
  Let $Z = Z(v, T)$. Consider $cal(W)$, the set of T invariant subspaces $W subset V$ such that $W inter Z = {0}$. ${0} in cW$, so its nonempty. $V$ f.d so that means there exists $W in cW$ such that $dim W = max (dim U : U in cW)$. Suppose for contradiction, $V != Z plus.o W$. Then there exists $u in V$ such that $u in.not Z plus.o W$. Consider the set $ I = {p in F[x] : p(T) u in Z plus.o W}. $ Note that $m_T in I$. Thus $I$ is a nonzero ideal of $FF[x]$, let $f$ be its unique monic generator. By definition of $f in I$, $f(T) u = z + w$ for $z in Z$ and $w in W$. Since $m_T in I$, $f divides m_T$. Thus $m_T = f g$ for $g in FF[x]$. $ 0 = m_T (T) u = g(T) f(T) u = g(T) z + g(T) w. $ Both $Z$ and $W$ are $T$-invariant hence $g(T) z in Z$ and $g(T) w in W$. Since intersection is trivial they must both be 0. Since $z in Z(v, T)$, there is a polynomial $h in FF[T]$ such that $z = h(T) v$. Thus $g(T)h(T) v = 0$. Because since $v$ has maximal order ie $ann(v) = m_T$. That means $m_T divides g h => g f divides g h => f divides h => h = f(x) q(x)$. Thus $z = f(T) q(T) v$. Let $u prime = u - q(T) v$. Note that $u in.not Z plus.o W$ because $u in.not Z plus.o W$ and $q(T) v in Z$. $f(T) u prime = f(T) u - f(T) q(T) v = f(T) u - h(T) v = f(T) u - z = w in W$. Let $W prime = W + Z(u prime , T)$, which is a $T$ invariant space and strictly contains $W$ because $u prime in.not W$ but it is in $W prime$. Let $x in W prime inter Z$, $x = w prime + k(T) u prime$. Thus $ k(T) u prime = x - w prime in Z plus.o W. $ Since $u - u prime = q(T) v in Z$ (shown above), anything mapping $u prime$ to $Z plus.o W$ also maps $u$ there as well. Thus $k in I$ and $f divides k => k = c f$. Thus $ k (T) u prime = f(T) c(T) u prime = c(T) w in W $

  Thus $x = w prime + c(T) w in W$. But $x in Z inter W => x = 0.$. Thus $W prime inter Z = {0}$. This contradicts the assumption of the maximality of $W$.
]

#theorem("Cyclic Decomposition Theorem")[
  There exist $v_1, dots, v_k in V$ with
  $ V = Z(v_1, T) plus.circle dots.c plus.circle Z(v_k, T), $
  and, writing $a_i = op("ann")(v_i)$, one has $a_(i+1) | a_i$ for $1 <= i <= k - 1$.
] <thm-cyclicdecomp>
#proof[
  It is true for a 1 dimensional vector space.
  Suppose its true for a vector space of dimension at least $k - 1$. Let $V$ be a vector space of at dimension $k$. Let $v_1 in V$ be such that $ann(v_1) = m_T$. Then $V = Z(v_1, T) plus.o W$ @lem-complement. Note the following $m_(T|_W) divides m_T$. By the induction hypothesis $W = plus.o.big_i^(m) Z(w_1, T|_(W))$. Basically done since $ann(w_i) divides m_(T|_W) divides ann(v_1).$
]

#definition[
  The polynomials $a_1, dots, a_k$ in @thm-cyclicdecomp are the _invariant factors_ of $T$.
]

#theorem("Rational Canonical Form")[
  There is a basis of $V$ in which the matrix of $T$ is block diagonal:
  $ [T] = C(a_1) plus.circle C(a_2) plus.circle dots.c plus.circle C(a_k), $
  with $a_1, dots, a_k$ the invariant factors of $T$.
] <thm-rcf>
#proof[
  By @thm-cyclicdecomp: $ V = plus.o.big_(i = 1)^(k) Z(v_i, T) $ and each subspace is T -invariant. Thus $[T] = plus.o.big_(i = 1)^k [T|_(Z(v_i, T))] = plus.o.big_(i = 1)^k C(ann(v_i)).$
]

#theorem("Uniqueness of Invariant Factors")[
  The invariant factors $a_1, dots, a_k$ of $T$ are uniquely determined by $T$
  (equivalently, by the similarity class of $[T]$). Moreover
  $ a_1 = m_T (x), quad a_1 a_2 dots.c a_k = p_T (x). $
] <thm-rcfunique>
#proof[

]

#theorem("Similarity Criterion")[
  Let $A, B in M_n (FF)$. The following are equivalent:
  #enum(numbering: "(a)")[
    $A$ and $B$ are similar over $FF$.
  ][
    $A$ and $B$ have the same invariant factors.
  ][
    $x I - A$ and $x I - B$ have the same Smith normal form over $FF[x]$.
  ]
] <thm-simcriterion>


= Matrix Exponential and Logarithm

#definition[
  For $A in M_n (CC)$, the _matrix exponential_ is
  $ e^A = exp(A) = sum_(k=0)^infinity A^k / k! in M_n (CC). $
  The series converges absolutely (in any matrix norm) for every $A$.
]

== Basic Properties of the Matrix Exponential

#theorem("Elementary Properties")[
  For all $A in M_n (CC)$:
  #enum(numbering: "(a)")[
    $e^0 = I$.
  ][
    $e^A$ is invertible, with $(e^A)^(-1) = e^(-A)$.
  ][
    If $P$ is invertible, then $e^(P A P^(-1)) = P e^A P^(-1)$.
  ][
    $det(e^A) = e^(op("tr")(A))$.
  ]
] <thm-exp-basic>
#proof[
  *(A)*: $ e^bold(0) & = sum_(k = 0)^(oo ) (bold(0)^k) / (k!) = bold(0)^0 = I $
  *(B)*: Suppose $(e^(A))^(-1)$ is invertible. $ e^(-A)e^(A) & = (sum_(k = 1)^(oo ) ((-A)^k) / (k!)) (sum_(k = 1)^(oo ) (A^k) / (k!)) \
              & = sum_(n = 1)^(oo) sum_(k = 0)^(n) ((-A)^(n - k) / ((n - k)!)) ((A^k) / (k!)) \
              & = sum_(n = 1)^(oo ) 1/n! sum_(k = 1)^(n) (n!) / (k! (n - k)!) A^(k) (-A)^(n - k) \
              & = sum_(n = 1)^(oo ) (A + (-A))^n = exp(0) = I $

  This is true for $exp(A + B) = exp(A)exp(B)$

  *(C)*: Straightforward

  *(D)*: $A = P J P^(-1)$ where $J = D + N$ (diagonal + upper diagonal nilpotent) is a Jordan Normal Form Matrix. $ det(exp(A)) & = det(exp(J)) \
              & = det(exp(D + N)) = det(exp(D) exp(N)) $

  Let $k$ be minimal where $N^k = 0$. Thus $ exp(N) & = I + N + 1/2 N^2 + ... + 1/(k - 1) N^(k - 1). $ Note $exp(N)$ is upper diagonal hence $det(exp(n)) = 1$. thus $ det(exp(A)) = det(exp(D)) & = det(exp(sum_(i = 1)^(n) lambda_i E_(i i))) \
                            & = det(product_(i = 1)^(n) exp(lambda_i E_(i i))) \
                            & = product_(i = 1)^(n) det(exp(lambda_i E_(i i))) \
                            & = product_(i = 1)^(n) exp(lambda_i) = exp(tr D) = exp(tr A) $
]

#theorem("Product Formula")[
  If $A B = B A$, then $e^(A + B) = e^A e^B$.
  In particular, $e^A e^(-A) = I$.
] <thm-exp-product>
#proof[

]

#remark[
  Commutativity is necessary: in general $e^(A+B) != e^A e^B$ when $[A, B] != 0$.
  The Baker--Campbell--Hausdorff formula describes $log(e^A e^B)$ as an infinite series
  in nested commutators of $A$ and $B$.
]

#theorem("Derivative")[
  For all $A in M_n (CC)$,
  $ dif / (dif t) e^(t A) = A e^(t A) = e^(t A) A. $
] <thm-exp-deriv>
#proof[

]

== Spectral Theory of the Matrix Exponential

#theorem("Spectral Mapping")[
  If $lambda_1, dots, lambda_n$ are the eigenvalues of $A$ (counted with multiplicity),
  then $e^(lambda_1), dots, e^(lambda_n)$ are the eigenvalues of $e^A$ (counted with
  multiplicity).
] <thm-exp-spectral>
#proof[

]

#theorem("Jordan Block Formula")[
  Let $J_k (lambda) = lambda I + N$ where $N$ is the $k times k$ nilpotent shift. Then
  $
    e^(J_k (lambda)) = e^lambda sum_(j=0)^(k-1) N^j / j! = e^lambda mat(
      1, 1, 1/2!, dots.c, 1/(k-1)!;
      0, 1, 1, dots.c, 1/(k-2)!;
      dots.v, , dots.down, , dots.v;
      0, 0, 0, dots.c, 1
    ).
  $
] <thm-exp-jordan>
#proof[
  Since $lambda I$ and $N$ commute, $e^(J_k (lambda)) = e^(lambda I) e^N = e^lambda e^N$.
  The nilpotent series $e^N = sum_(j=0)^(k-1) N^j / j!$ terminates because $N^k = 0$.
]

#corollary[
  If $A = P J P^(-1)$ is the Jordan decomposition of $A$, then $e^A = P e^J P^(-1)$,
  where $e^J = op("diag")(e^(J_(k_1)(lambda_1)), dots, e^(J_(k_r)(lambda_r)))$.
]

== Matrix Logarithm

#definition[
  A _logarithm_ of $A in M_n (CC)$ is any $B in M_n (CC)$ satisfying $e^B = A$.
  The _principal logarithm_ $op("Log")(A)$ is the unique logarithm (when it exists)
  whose eigenvalues all lie in the strip $\{z in CC : op("Im")(z) in (-pi, pi]\}$.
]

#theorem("Existence of Complex Logarithm")[
  Every invertible matrix $A in M_n (CC)$ has a logarithm.
  Equivalently, every $A in GL_n (CC)$ lies in the image of $exp : M_n (CC) -> GL_n (CC)$.
] <thm-log-exists>
#proof[

]

#remark[
  Non-invertible matrices have no logarithm: $0 = det(e^B) = e^(op("tr")(B)) != 0$
  for any $B$.
]

#theorem("Principal Logarithm via Series")[
  If $norm(A - I) < 1$ (for any submultiplicative matrix norm), then $A$ is invertible and
  $ op("Log")(A) = sum_(k=1)^infinity (-1)^(k+1) / k (A - I)^k. $
] <thm-log-series>
#proof[

]

#theorem("Non-Uniqueness of Logarithm")[
  Unlike the scalar case, a matrix $A in GL_n (CC)$ may have uncountably many distinct
  logarithms. Specifically, if $B$ is one logarithm of $A$ and $C$ commutes with $A$
  and satisfies $e^C = I$ (e.g.\ $C = 2 pi i k P$ for a suitable projection $P$), then
  $B + C$ is another logarithm of $A$.
] <thm-log-nonunique>

#theorem("Real Logarithm")[
  A real invertible matrix $A in GL_n (RR)$ has a real logarithm (i.e.\ $B in M_n (RR)$
  with $e^B = A$) if and only if every real negative eigenvalue of $A$ has even algebraic
  multiplicity.
] <thm-log-real>
#proof[

]

#theorem("Spectral Mapping for Logarithm")[
  If $A in GL_n (CC)$ has eigenvalues $mu_1, dots, mu_n$ (none zero), then the eigenvalues
  of $op("Log")(A)$ are $op("Log")(mu_1), dots, op("Log")(mu_n)$, where $op("Log")$ on
  the right denotes the principal branch of the scalar logarithm.
] <thm-log-spectral>

#corollary("Inverse of Exponential")[
  If all eigenvalues of $A in M_n (CC)$ lie in the strip
  $\{z : op("Im")(z) in (-pi, pi]\}$, then $op("Log")(e^A) = A$.
]

= Selected Problems from Past UCLA Basic Exams

== Diagonalization

#exercise("F21 · 6")[
  Let $A$ be a complex $n times n$ matrix such that $A^2 = A$.
  + Prove that $A$ is similar to a diagonal matrix.
  + Prove that $op("tr")(A)$ is a non-negative integer.
]

#exercise("F21 · 7")[
  Let $A, B$ be complex $n times n$ matrices with $A B = B A$. Prove that $A$ and $B$
  have a common eigenvector.
]

#exercise("F23 · 9")[
  Show that two diagonalizable matrices are simultaneously diagonalizable if and only if
  they commute.
]

#exercise("F24 · 2")[
  Let $n >= 2$ and let $A$ be a normal complex $n times n$ matrix with
  $dim ker(lambda - A) <= 1$ for all $lambda in CC$. Prove that any normal complex
  $n times n$ matrix $B$ that commutes with $A$ takes the form
  $ B = b_0 I + b_1 A + dots.c + b_(n-1) A^(n-1) $
  for some $b_0, dots, b_(n-1) in CC$.
]

#exercise("F20 · 4")[
  Let $A$ be a $2 times 2$ real matrix with eigenvalues $2$ and $-1$. Let $X$ be the set
  of all $2 times 2$ real matrices $B$ such that the $4 times 4$ block matrix
  $ mat(A, B; 0, A) $
  is diagonalizable over $CC$. Prove that $X$ is a $2$-dimensional subspace of $M_2 (RR)$.
]

== Jordan Canonical Form

#exercise("F24 · 3")[
  Let $T$ be a linear operator on a finite-dimensional complex vector space with spectrum
  $sigma(T) = {0}$. Show that $T$ is nilpotent.
]

#exercise("F24 · 4")[
  Consider the polynomial
  $ p(x) = x^4 + 2x^3 - 3x^2 - 4x + 4. $
  (Note: $p$ vanishes only at $x = 1$ and $x = -2$.) Let $A$ be a complex $4 times 4$
  matrix such that $p(A) = 0$. Assume also that $op("Tr")(A) = 1$ and
  $op("Rank")(A - I) = 2$. Determine the Jordan canonical form of $A$. Justify fully.
]

#exercise("F20 · 3")[
  Let $M$ be a complex $4 times 4$ matrix satisfying
  $ M^6 = M^4 = 2M^3 - M^2. $
  Describe all possible Jordan canonical forms of $M$.
]

#exercise("F22 · 3")[
  Let $A$ be an $n times n$ real matrix such that $e^A = I$. Show, via consideration of
  the Jordan normal form, that the minimal polynomial of $A$ has no repeated roots.
]

#exercise("S22 · 3")[
  Let $A$ be the $n times n$ shift matrix
  $
    A = mat(
      0, 1, 0, dots.c, 0;
      0, 0, 1, dots.c, 0;
      dots.v, , , dots.down, dots.v;
      0, 0, 0, dots.c, 1;
      0, 0, 0, dots.c, 0
    ).
  $
  Find the Jordan normal form of $A^2$. (Here $n$ is an arbitrary positive integer.)
]

#exercise("S22 · 4")[
  Let $A$ be a complex $n times n$ matrix such that $A^2 = I_n$. Show that
  $ op("rank")(A + I_n) + op("rank")(A - I_n) = n. $
]

== Square Roots and Spectral Theory

#exercise("F21 · 10")[
  Let $V$ be a finite-dimensional inner product space over $CC$, and let $T$ be a linear
  operator on $V$.
  + Prove that if $T$ is invertible, then $T$ has a square root, i.e., there exists a
    linear operator $R$ on $V$ such that $R^2 = T$.
  + Now assume $T$ is diagonalizable but not necessarily invertible. Under what conditions
    does $T$ have only finitely many distinct square roots, and how many are there?
]

#exercise("F23 · 12")[
  Let $A$ be a non-singular complex $n times n$ matrix. Show that there exists a
  non-singular complex $n times n$ matrix $B$ such that $B^2 = A$.
]
