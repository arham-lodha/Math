#import "template.typ": *

#show: homework.with(
  course: "Math 215A",
  assignment: "Homework 8",
  name: "Arham Lodha",
  due: "November 18, 2026",
)

Rings are understood to be commutative, unless stated otherwise.

#problem()[
  Let $A$ be a unique factorization domain with fraction field $K$. Let $L$ be a quadratic extension field of $K$. Show that if $QQ subset A$, then the integral closure of $A$ in $L$ is finite and flat over $A$. (Hint: using basic results from field theory, describe $L$ as simply as possible in terms of $K$. Then try to describe the integral closure of $A$ in $L$ explicitly.) (This problem suggests further questions, not part of the homework: can you omit the assumption $QQ subset A$? Keeping the assumption $QQ subset A$, does the statement hold if $A$ is a normal domain but not necessarily a UFD? What happens if $[L : K]$ is 3, or more than 3?)
]
#proof[
  $L = K(sqrt(d))$ where $d in K$ is squarefree. Moreover $"Gal"(lcoset(L, K)) = lcoset(ZZ, 2) = chevron.l sigma : sigma^2 = 1 chevron.r$. For any element $alpha = a + b sqrt(d) in L$ where $b != 0$, $ P(x) = (x - alpha)(x - sigma(alpha)) = x^2 - x(alpha + sigma (alpha)) + sigma (alpha) alpha $ is the minimum polynomial. Furthermore, $ alpha + sigma(alpha) = a + b sqrt(d) + a - b sqrt(d) = 2 a $ and $ sigma (alpha) alpha = a^2 - b^2 d. $ Suppose $alpha$, is integral over $A$ in $L$. Hence $2 a in A$. Since $QQ subset.eq A => a in A$. Furthermore, $a in A => a^2 in A => -b^2 d in A => b^2 d in A$. Let $b = x/y in K = Frac(A)$ where $gcd(x, y) = 1$. Thus $ (x^2 d) / (y^2) in A => y^2 divides x^2 d =>^(gcd(x, y) = 1) y^2 divides d. $ However since $d$ is squarefree, $y in A^times => x^2 d in A$ and $b = (x/y)^2 in A$ since $x in A$ and $1/y in A$. Hence $cO_L subset.eq A oplus A[sqrt(d)]$. Finally, if $alpha in A oplus A sqrt(d)$, $alpha = a + b sqrt(d)$ where $a, b in A$ and $alpha$ is a root of the minimum polynomial, above. $2 a in A$ and $a^2 - b^2 d in A$. Thus $cO_L = A oplus A sqrt(d)$  ]


#problem()[
  #part()[
    Let $R$ be the subring of the polynomial ring $CC[x]$ defined by
    $ R = {f in CC[t] : f(0) = f(1)}. $
    Find a presentation for $R$ as a commutative $CC$-algebra. (That is, express $R$ as a quotient of a polynomial ring over $CC$, $CC[x_1, ..., x_r] \/ (f_1, ..., f_s)$.) Draw a picture of $Spec R$. (If you describe $Spec R$ as a closed subspace of $Spec CC[x_1, x_2]$, then you can draw the corresponding subset of $CC^2$, or really just $RR^2$ because that's all there is room to draw.)
  ]
  #part()[
    The _normalization_ $S$ of a domain $R$ means the integral closure of $R$ in its fraction field. Show that the normalization of a domain is normal. For the specific ring $R$ in part (a), compute its normalization $S$. Draw the map $Spec S -> Spec R$.
  ]
]
#solution[
  Consider $f in R$. $g(t) = f(t) - f(0)$ is a polynomial with roots at $0$ and $1$. Thus $g(t) = t(t - 1)h(t)$ where $h in CC[t]$. Thus $f(t) = t(t - 1)h(t) + f(0)$. It is easy to see all elements of such a form are also in $R$ thus, $R = CC oplus a CC[t]$. Let $a = t(t - 1)$, note that $ t^2 = t + a. $ Note that $ CC[t] = CC[a] oplus CC[a] t, $ as we can reduce any power of $t$ to something with degree less than 1 polynomials in $a$ as coefficients. Consider $ phi: CC[x, y] -> R $ where $x -> a$ and $y -> t a$. Note that, $ a CC[t] & = a CC[a] + (t a) CC[a] \
          & = phi(x) CC[a] + phi(y) CC[a] = phi(x) CC[phi(x)] + phi(y) CC[phi(x)]. $ thus $ R & = CC oplus (phi(x) CC[phi(x)] + phi(y) CC[phi(x)]) \
    & = phi (CC oplus (x CC[x] + y CC[x])) subset.eq phi(CC[x, y]) subset.eq R. $ Thus $phi$ is surjective. Note that $R subset.eq CC[t]$ is a domain. Hence $ker phi$ must be prime. Note that $ phi(y^2 - x y - x^3) & = t^2 a^2 - a^2 t - a^3 \
                       & = a^2(t + a) - a^2 t - a^3 = 0 => (y^2 - x y - x^3) subset ker phi. $ Note that $y^2 - x y - x^3$ is degree 2 for $y$ over $CC[x]$ and has descrimant, $ x^2 + 4x^3 = x^2 (1 + 4x) $ that is not square. Hence $y^2 - x y - x^3$ is irreducible, and $frak(p) = (y^2 - x y - x^3)$ is prime. If we consider $CC[x, y]/frak(p)$ and see the induced map. We can see its injective. Hence $ker phi = (y^2 - x y - x^3)$. Hence $ R iso (CC[x, y]) / ((y^2 - x y - x^3)). $ $Spec R$ looks like the curve $ y^2 - x y - x^3 $ which is a curve with a self intersection at $(x, y) = (0, 0)$ and a loop.

  *b*: Let $S$ be a integral closure of $R$ in $Frac(R)$. $z in Frac(R)$ is integral over $S$ if
  $ z^n + s_(n-1) z^(n-1) + dots.c + s_0 = 0, quad s_i in S. $
  Each $s_i$ is integral over $R$, so $R' = R[s_0, ..., s_(n-1)]$ is a finitely generated $R$-module. Also $z$ is integral over $R'$, so $R'[z]$ is a finitely generated $R'$-module, and hence a finitely generated $R$-module. Therefore $z$ is integral over $R$, that is, $z in S$. So $S$ is integrally closed in $Frac(S)$, and $S$ is normal.

  Now $t$ is integral over $R$, since $t^2 - t - a = 0$ with $a in R$. Hence $CC[t] = R[t]$ is integral over $R$, so $CC[t] subset.eq S$. Conversely, $CC[t]$ is a UFD, so it is integrally closed in $CC(t)$. Any element of $CC(t)$ that is integral over $R$ is also integral over $CC[t]$, hence lies in $CC[t]$. So $S subset.eq CC[t]$, and
  $ S = CC[t]. $

]
