#let SL(ring) = $op("SL")_(2)(#ring)$

= Poincare Series and Eisenstein Series
One of the first examples of Modular forms we saw was the Poincare and Eisenstein series. Where $ P_(m, k)(z) = sum_(g in overline(T) slash SL(ZZ))^() (e_(m) mid(|)_(k) g)(z) = sum_(g in overline(T) slash SL(ZZ))^() (c z + d)^(-k) e(m g z) $ and $ E_(k)(z) = P_(0, k)(z) = sum_(g in overline(T) slash SL(ZZ))^() (c z + d)^(-k) $ which were formed by taking a $e_(m)$ which is $overline(T)$ invariant under the slash action and summing over its cosets. Any action by $SL(ZZ)$ simply permutes the order of the sum. But this is all assuming that the sum is well defined. To show that $P_(m, k)$ is well defined we only need to show that it is absolutely locally uniformly convergent. It suffices to show that $P_(0, k) = E_(k)$ is absolutely locally uniformly convergent and the proof involves the fact that $|c z + d|^(-k)$ defines a norm on $ZZ^(2)$ and by a simple norm comparison with $abs((c, d))$ we can show that the sum $sum_((c, d) = 1)^() |c z + d|^(-k)$ converges absolutely locally uniformly for $k > 2$, telling us that $P_(m, k)$ converges properly for all $k > 2$. Another interesting question to ask is what is the Fourier expansion of the two functions, because the Fourier expansions of modular forms often has interesting arithmetic or analytic behavior. So it is quite natural to look at the fourier transforms of the most basic nontrivial modular forms that we have. Here are the exapansions:

$ P_(m, k)(z) & = sum_(n >= 1)^() p_(k)(m, n) e(n z) $ and $ E_(k)(z) & = 1 + (2 i pi)^(k)/(zeta(k) (k - 1)!) sum_(n >= 1)^() sigma_(k - 1)(n) e(n z) $

where $ p(m, n) & = delta(m, n) + ((n)/(m))^(k - 1) (2pi)/(i^(k)) sum_(c >= 1)^() (1)/(c) S(m, n; c) J_(k - 1)((4 pi sqrt(m n) )/(c)) $ and $sigma_(k - 1)(n) = sum_(d divides n)^() d^(k - 1)$ and $J_(k - 1)(x)$ is the bessel function.

Okay that is a whole lot... Before we go into a *very* broad proof summary of this it is quite important to take a second to see what is going on. A couple things we see is:

1. $P_(m, k) in S_(k)(1)$ for $m > 0$. We know the dimensions of the cusp forms so we can see that there are large linear relations between each of the poincare series.
2. $abs(S(m, n; c)) < c$ and as $J_(k - 1)(x) = O(x^(k - 1))$ as $x -> 0$. So fourier expansion is well defined.
3.$J_(k - 1)(x)$ is the bessel function which is the solution to the Bessel Differential Equation and is thus highly analytic. So we see $p_(k)(m, n)$ is a mix of analytic and arithmetic components.

Okay now its time for the proof. Proof is highly technical and given the fact it took nearly 1 class to finish we don't have nearly enough time but I can touch on the main beats.

1. Bruhat Decomposition. We can restructure the original sum for the poincare series with the Decomposition. After some basic algebriac manipulation we get

$
  P_(m, k)(z) & = e(m z) + sum_(c >= 1)^() sum_(d in ZZ_(c)^(times ))^() e((m overline(d))/(c)) sum_(n in ZZ)^() (e(-(1)/(c(c(z + n) + d))))/(c(z + n) + d)^(-k)
$

2. Poisson summation: Look at $ phi(x) = (e(-(1)/(c(c(z + x) + d))))/(c(z + x) + d)^(-k). $ By poisson summation we know that $ sum_(n in ZZ)^() phi(x) = sum_(n in ZZ)^() hat(phi)(n) $

After doing a bunch of integral calculations (change of basis), we see that

$
  hat(phi)(n) = integral_(RR) phi(t) e(-n t) dif t = e(n(z + (d)/(c))) integral_(Im(w) = y) (1)/(c w)^(k) e(-(m)/(c^(2) w) - h w) dif w
$

where $y = Im(z)$.

When you plug everything back in, you see that $ P_(m, k)(z) = e(m z) + sum_(n in ZZ)^() p_(k)(m, n) e(n z) $

where $ p_(k)(m, n) = sum_(c >= 1)^() S(m, n; c) I_(k)(m, n; c) $ where $ I_(k)(m, n; c) = integral_(Im(w) = y) (1)/(c w)^(k) e(-(m)/(c^(2) w) - h w) dif w $.

So now the last step is solving this integral. When we analyze it:
1. Choice of $y$ doesn't matter: We get this from a contour integral
2. When $n <= 0 => I(m, n; c) = 0$. Thus $P_(m, k) in S_(k)(1)$
3. Finally a bunch of nice Gamma identies give the final Bessel function and the analytic constant factor.

Now to go from the fourier expansion of the poincare to the nice simplificatin of the Eisenstein series. It involves the mobius inversion.

Petersson Inner product: $lr(angle.l f, P_(m, k) angle.r) = a_(f)(m)$

The Fourier expansion of the poincare series is a key player in the Petersson formula where $ (Gamma(k - 1))/((4 pi m)^(k - 1)) sum_(f in B)^() a_(f)(n) overline(a_(f)(m)) = p_(k)(m, n) $

= Distribution of Hecke Eigenvalues

The Hecke Operator $T(n)$ is a family of self adjoint operators on $M_(k)$ and $S_(k)$. A key result that was proven was that the family of operators can be simultaneously diagonalized. However the eigenvalues and the eigenforms of the Hecke Operators are often extremely complex so much like how in random matrix theory we analyze asymptotic and aggregate behavior to understand the eigenvalues of large hermitian matrices, we do something similar for the eigenvalues of the hecke operators which are also the fourier coefficients of the eigenforms.

The key theorem in this study was proved by Serre and Sarnak. Let $k > 2$ be such that $S_(k)(1) != 0$ thus $H_(k)$ (Hecke Eigenbasis) is nonempty. Let $p$ be a prime number. For $f in H_(k)$ and $lambda_(f)(p) = (a_(f)(n))/(p^((k-1)/(2)))$,

$ mu_(k) = (Gamma(k - 1))/((4 pi)^(k - 1)) sum_(f in H_(k))^() delta_(lambda_(f)(p)) $ is a measure on $RR$ and is compactly supported on the interval because $abs(lambda_(f)(p)) = O(sqrt(p))$ then $mu_(k)$ weakly converges to $ mu_("
ST") = 1_([-2, 2]) sqrt(1 - (x^(2))/(4)) dif x $

Weak convergence means $forall f in cal(C)(RR, CC)$, $integral_(RR) f dif mu_(k) -> integral_(RR) f dif mu_("ST")$

Instead of having to check the convergence condition for all continous functions, the weyl criterion tells us that we can just check for a set $D subset cal(C)(RR, CC)$ which span a dense subset of all functions. Now the question of what set we want arises. The following would be "nice":

1. It would be nice if the functions behave "nicely" with respect to each $mu_(k)$.
2. It would be nice if the integral of the functions with respect to $mu_("ST")$ is 0. Always easier to prove something has a limit of 0 than something else.

Idea 1: $(x^n)_(n in NN)$ is often the most natural choice for a first look. But it isn't the best for our given problem. It doesn't behave as nicely with respect to each $mu_(k)$ as our second choice.

Idea 2: The second order chebyshev Polynomials. $U_(n)(2 cos(theta)) = (sin((n + 1) theta))/(sin(n theta))$. Which we will see will behave nicely with our $mu_(k)$

We see that $(U_(n))_(n in NN)$ forms a orthonormal basis of $L^(2)([-2, 2], mu_("ST"))$. The standard computational proof is relatively elementary, a simple trignometric change of basis is used. But an important question to ask is why this is true. By representation theory we know that the space of characters of a group is given by $L^(2)(tilde(G), mu_("Haar"))$ where $tilde(G)$ is the conjugacy classes of $G$. For the group $"SU"_(2)(ZZ)$ we see that $L^(2)(tilde(G), mu_("Haar"))$ is isomorphic to $L^(2)([-2, 2], mu_("ST"))$. You also learn that $U(n)$ are the irreducible characters (under the isomorphism) of $"SU"_(2)(CC)$ and since the irreducible characters form the orthonormal basis over the set of characters we arrive to the original result. This just seemed really cool to me, because I had studied representation theory of locally compact groups.

A cool property we also see is that $U_(n)(lambda_(f)(p))) = lambda_(f)(p^(n))$ and to get we use the euler product of the series $ sum_(n >= 0)^() lambda_(f)(p^(n)) x^(n) = (1)/(1 - lambda_(f)(p) x + x^(2)) $ this comes from the multiplicity of the operators,

$
  lambda_(f)(p) lambda_(f)(p^(n - 1)) & = (1)/(p^(n + 1)) a_(f)(p) a_(f)(p^(n)) \
                                      & = (1)/(p^((n + 1)(k - 1))) (a_(f)(p^(n + 1)) + p^(k - 1) a_(f)(p^(n - 1))) \
                                      & = lambda_(f)(p^(n + 1)) + (1)/(p^(n(k - 1))) a_(f)(p^(n - 1)) \
                                      & = lambda_(f)(p^(n + 1)) + p^(k - 1) lambda_(f)(p^(n - 1))
$

Put $U_(n)$ into integrals with $mu_(k)$. You end up getting petterson formula $delta(p^(n), 1) + sum_(c >= 0)^() (1)/(c) S(p^(n), 1; c) J_(k - 1)((4 pi p^((n)/(2)))/(c))$. You see that the only dependence on $k$ comes from $J$. as $k -> infinity$ $J_(k - 1) -> 0$. Thus the remainder term goes to 0.


${lambda_(f)(p)}$ dense in $[-2, 2]$

1. The theorem shows that $abs(lambda_(f)(p)) <= 2$ almost surely. Deligne proved this was always true with the Finite Field Riemann Hypothesis.
2. What about $ tilde(mu) = (1)/(abs(H_(k)) ) sum_(f in H_(k) )^() delta_(f)(p) $
Serre and sarnak worked that you get the Plancherel measure for $SL(QQ_p)$ with the selberg trace formula
3. Perpendicular question is what if you fix $f$ and vary $p$. This problem is the sato tate conjecture
