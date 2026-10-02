#import "template.typ": *

#show: homework.with(
  course: "MATH 245A",
  assignment: "Homework 3",
  name: "Arham Lodha",
  due: "November 25, 2026",
)

// Only exercises marked (*) will be collected; two or three will be graded
// from each set. All exercises are suggested practice.

#problem(num: "3.1*")[
  Let $(Omega, mu)$ be an outer measure space, suppose $u_n, u in L^1(mu)$ and $u_n -> u$ a.e. Show the following assertions are equivalent:
  #part[$lim_(n -> oo) integral_Omega abs(u_n (x) - u(x)) mu(dif x) = 0$.]
  #part[$lim_(n -> oo) integral_Omega abs(u_n (x)) mu(dif x) = integral_Omega abs(u(x)) mu(dif x)$.]
]
#solution[]

#problem(num: "3.2*")[
  Let $f: [0,1] -> [0, +oo)$ be a $cL^1$-measurable function such that $integral_0^1 f(x) dif x < +oo$. Suppose that for all $n = 1, 2, dots.c$, $integral_0^1 f^n dif cL^1 = integral_0^1 f(x) dif cL^1$. Show that $f$ must be equal almost everywhere to the characteristic function of a set $E subset.eq [0,1]$.
]
#solution[]

#problem(num: "3.3*")[
  Suppose $mu$ is an outer finite measure on $X$ and $f_1, f_2, dots.c$ is a sequence of $mu$-measurable functions from $X$ to $[0, +oo)$ such that $lim_(k -> +oo) f_k (x) = +oo$ for each $x in X$. Prove that for every $epsilon > 0$ there exists a $mu$-measurable set $E$ such that $mu(X without E) < epsilon$ and $f_1, f_2, dots.c$ converges uniformly to $+oo$ on $E$ (meaning for every $t > 0$ there exists $n in NN$ such that $f_k (x) > t$ for all $k >= n$ and all $x in E$).
]
#solution[]

#problem(num: "3.4*")[
  Suppose $X subset.eq RR^d$ is a compact set and $(f_n)_n subset.eq C(X)$ is a sequence of functions such that $f_n <= f_(n+1)$ for all natural numbers $n$. Assume
  $ f(x) := lim_(n -> +oo) f_n (x) < +oo quad forall x in X. $
  Show that $f$ is continuous if and only if $(f_n)_n$ converges uniformly to $f$.
]
#solution[]

#problem(num: "3.5*")[
  Let $mu$ and $nu$ be two outer measures on $Omega$. We say that $nu$ is absolutely continuous with respect to $mu$ and we write $nu << mu$ if $nu(E) = 0$ whenever $E subset.eq Omega$ is $nu$-measurable and $mu(E) = 0$. Assume $nu[Omega] < oo$. Show that the following are equivalent:
  #part[$nu << mu$]
  #part[For every $epsilon > 0$ there exists $delta > 0$ such that $nu(E) < epsilon$ whenever $E$ is $nu$-measurable and $mu(E) < delta$.]
]
#solution[]

#problem(num: "3.6*")[
  A collection of functions ${f_alpha}_(alpha in A) subset.eq L^1(mu)$ is called uniformly integrable if for every $epsilon > 0$ there exists $delta > 0$ such that $integral_E abs(f_alpha (x)) mu(dif x) < epsilon$ for all $alpha in A$ whenever $E$ is measurable and $mu(E) < delta$. Show that
  #part[any finite subset of $L^1(mu)$ is uniformly integrable.]
  #part[if ${f_n}_(n in NN) subset.eq L^1(mu)$ is a sequence that converges to $f$ in $L^1(mu)$ then ${f_n}_(n in NN)$ is uniformly integrable.]
]
#solution[]

#problem(num: "3.7*")[
  Let $I = [-1/2, 1/2]$. For each $x, y in I$ we write that $x tilde y$ if $x - y in QQ$. For $x in I$ set $K(x) = {y in I : y tilde x}$. Let ${r_k}_(k=0)^oo$ be an enumeration of $[-1,1] inter QQ$ such that $r_0 = 0$.
  #part[Show that $tilde$ is an equivalence relation.]
  #part[Let $A$ be a set containing exactly one member of each equivalence class (the axiom of choice ensures existence of such an $A$) and set $A_k = A + r_k$. Show that
    $ I subset.eq union_(k=0)^oo A_k subset.eq [-3/2, 3/2]. $
  ]
  #part[Conclude that $A$ is not $cL^1$-measurable if $cL^1$ is the one-dimensional Lebesgue measure. (Hint: compare $cL^1 [A_k]$ to $cL^1 [A]$.)]
]
#solution[]

#problem(num: "3.8")[
  Suppose $mu$ is an outer measure on $X$. Prove that the following are equivalent:
  #part[The measure $mu$ is $sigma$-finite.]
  #part[There exists an increasing sequence $X_1 subset.eq X_2 subset.eq dots.c$ of $mu$-measurable sets such that $X = union_(k=1)^oo X_k$ and $mu(X_k) < oo$ for each $k in NN$.]
  #part[There exists a disjoint sequence $Z_1, Z_2, dots.c$ of $mu$-measurable sets such that $X = union_(k=1)^oo Z_k$ and $mu(Z_k) < oo$ for each $k in NN$.]
]
#solution[]

#problem(num: "3.9")[
  Let $mu$ be an outer measure on a set $X$ and let $nu$ be an outer measure on a set $Y$. Define
  $ cP_o := {A times B : A "is" mu"-measurable", B "is" nu"-measurable"}. $
  #part[Prove that if $A_1, A_2 subset.eq X$ and $B_1, B_2 subset.eq Y$ then
    $ (A_1 times B_1) inter (A_2 times B_2) = (A_1 inter A_2) times (B_1 inter B_2) $
    and
    $ (A_1 times B_1) without (A_2 times B_2) = [(A_1 without A_2) times B_1] union [A_1 inter A_2 times (B_1 without B_2)]. $
  ]
  #part[Deduce that any finite union of elements of $cP_o$ can be written as a finite union of disjoint elements of $cP_o$.]
  #part[Deduce that any countable union of elements of $cP_o$ can be written as a countable union of disjoint elements of $cP_o$.]
]
#solution[]

#problem(num: "3.10")[
  Let $mu$ be an outer measure on a set $X$ and let $nu$ be an outer measure on a set $Y$. Define $cP_o$ as in Exercise 3.9,
  $ cP_1 := {union_(i=1)^(+oo) S_i : S_i in cP_o}, quad "and" quad cP_2 := {inter_(i=1)^(+oo) S_i : S_i in cP_1}. $
  Let $cF$ be the collection of all sets $S subset.eq X times Y$ such that the function $x -> chi_S (x,y)$ is $mu$-measurable for $nu$-almost every $y in Y$, and the function $y -> integral_X chi(x,y) dif mu(x)$ is $nu$-measurable. Define
  $ rho[S] := integral_Y (integral_X chi(x,y) dif mu(x)) dif nu(y), quad (S in cF). $
  Note in fact that if $S subset.eq X times Y$ then there exists $R in cP_2$ such that $S subset.eq R$ and $mu times nu [S] = rho[R]$.
  #part[Use that $cP_o subset.eq cF$ to deduce that $cP_1 subset.eq cF$.]
  #part[Prove that if $T subset.eq X times Y$ and $mu times nu [T] = 0$ then $T in cF$ and $rho[T] = 0$.]
  #part[Prove that if $S subset.eq X times Y$ is $mu times nu$-measurable and $mu times nu [S] < +oo$ then there exists $R in cP_2$ such that $rho[R without S] = 0$ and $R without S in cF$.]
]
#solution[]
