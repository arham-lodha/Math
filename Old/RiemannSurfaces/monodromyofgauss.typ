#import "@preview/lemmify:0.1.8": *
#import "@preview/unequivocal-ams:0.1.2": ams-article

// ---------------------------------------------------------
// 1. PROJECT SETUP & MACROS
// ---------------------------------------------------------

#show: ams-article.with(
  title: [Monodromy of Gauss's Hypergeometric Equation],
  authors: (
    (
      name: "Arham Rajendra Lodha",
      department: [Department of Mathematics],
      organization: [University of Texas at Austin],
      location: [Austin, TX 78012],
      email: "arham.lodha@utexas.edu",
    ),
  ),
  bibliography: bibliography("ref.bib"),
)

#set math.equation(numbering: "1.")

// Theorem Environment Setup
#let (
  theorem,
  lemma,
  corollary,
  remark,
  proposition,
  example,
  proof,
  definition,
  rules: thm-rules,
) = default-theorems("thm-group", lang: "en")

#show: thm-rules

// Aliases
#let thm = theorem
#let prop = proposition
#let def = definition
#let pf = proof
#let rem = remark
#let ex = example
#let cor = corollary

// Math sets and Operators

#let GL = $"GL"$
#let PGL = $"PGL"$
#let PSL = $"PSL"$
#let SL = $"SL"$
#let id = $mat(1, 0; 0, 1)$

// Project Specific Macros
#let X = $CC without {0, 1, infinity}$
#let P1 = $CC PP^1$
#let hyp(a, b, c, z) = $""_2 F_1 (#a, #b, #c \; #z)$
#let mono = $rho: pi_1(X, x_0) -> GL(2, CC)$
#let poch(x, n) = $(#x)_#n$

// Helper for derivatives to make code cleaner
#let dv(num, den) = $(dif #num)/(dif #den)$
#let pv(num) = $#num prime$

#let dv2(num, den) = $(dif^2 #num)/(dif #den^2)$
#let ppv(num) = $#num prime prime$


// ---------------------------------------------------------
// 2. MAIN CONTENT
// ---------------------------------------------------------
//

#hide[@Donaldson]

= Introduction

Gauss's Hypergeometric equation is a second-order linear differential equation given by:
$ "HG"_(a, b, c)(f) = z(1-z) dv2(f, z) + [c - (a + b + 1)z] dv(f, z) - a b f = 0 $

From basic ODE theory, we know that the space of solutions to this ODE is a 2-dimensional $CC$ vector space. Additionally, we know that on any simply connected domain of $HH$, these solutions are holomorphic. One such distinguished solution is the Hypergeometric Function defined by the series

$
  F(a, b, c; z) = sum_(n = 0)^(oo) (poch(a, n) poch(b, n))/(poch(c, n)) (z^(n))/(n!) = 1 + (a b)/(c) z + (a(a+1)b(b+1))/(c(c+1)) (z^(2))/(2!) +#sym.dots.h
$

where $poch(q, n)$ denotes the Pochhammer symbol, defined as $ poch(q, n) = cases(
  1 "if" n = 0,
  q(q+1) #sym.dots.h (q + n + 1) "otherwise"
) $

Our objective in this paper is to study the monodromy representation of the fundamental group of the $X = P1 - {"3 points"}$ acting on the solution space. Specifically, we will show that the analytic continuation of solutions around singular points gives rise to a representation $ rho: pi_(1)(X) -> PSL_(2)(CC) $ whose image can be described geometrically in terms of reflections across the sides of the Schwarz Triangle.

= Singularities

To understand the monodromy, we must first classify the singularities of the equation.

#thm[
  The hypergeometric equation is an ODE with three regular singular points on $P1$ at $z = 0, 1, "and" oo$.
]

#pf[
  We rewrite the hypergeometric equation in the standard form:
  $ dv2(f, z) + P(z) dv(f, z) + Q(z) f = 0 $
  where:
  $
    P(z) & = ([c - (a + b + 1) z])/(z(1 - z)) \
    Q(z) & = - (a b)/(z(1 - z))
  $

  By definition, a point $z_0$ is a regular singular point if $(z-z_0)P(z)$ and $(z-z_0)^2 Q(z)$ are analytic at $z_0$.
  - At $z=0$: $z P(z)$ and $z^2 Q(z)$ are analytic.
  - At $z=1$: $(z-1)P(z)$ and $(z-1)^2 Q(z)$ are analytic.
  Thus, $0$ and $1$ are regular singular points.

  To check $z = oo$, we perform the coordinate change $w = 1/z$. Then:
  $
     dv(f, z) & = dv(f, w) dot dv(w, z) = -w^2 dv(f, w) \
    dv2(f, z) & = dif/(dif w) (-w^2 dv(f, w)) dot dv(w, z) \
              & = (-2w dv(f, w) - w^2 dv2(f, w)) dot (-w^2) \
              & = w^4 dv2(f, w) + 2w^3 dv(f, w)
  $

  Substituting these into the original equation (and noting $z = 1/w$):
  $
    w^4 dv2(f, w) + 2w^3 dv(f, w) + ([c - (a + b + 1)/w])/(1/w (1 - 1/w)) (-w^2 dv(f, w)) - (a b)/(1/w (1 - 1/w)) f = 0
  $

  After simplifying the coefficients, we divide by $w^4$ to normalize the leading term:
  $
    dv2(f, w) + ( (2w - c w + a + b - 1)/(w(w - 1)) ) dv(f, w) - (a b)/(w^2(w - 1)) f = 0
  $ <hypergeometricinfinity>

  Let the coefficients be $tilde(P)(w)$ and $tilde(Q)(w)$. We observe that $w tilde(P)(w)$ and $w^2 tilde(Q)(w)$ are analytic at $w=0$. Thus $w=0$ (corresponding to $z=oo$) is a regular singular point.
]



The set of singularities are $S = {0, 1, oo}$. Thus our domain is
$ X = P1 without S $

Let $x_0 in X$ be a base point. By the standard existence and uniqueness theorem for linear ODEs, the space of solutions near $x_0$, denoted $V$, is a complex vector space of dimension 2. Furthermore, the solutions are holomorphic on $HH$. We want to find a representation of $pi_(1)(X) = lr(angle.l l_(0), l_(1) angle.r)$ where $l_0$ is a nontrivial loop around 0 and $l_1$ is a nontrivial loop around 1.

#figure(image("space.png", width: 50%), caption: [Space $X = P1 - {0, 1, oo}$ ])


= The Behavior of Interest

Let $x_(0) in X$ be a base point. By the existence and uniqueness theorem for linear ODEs, the space of solutions near $x_(0)$, denoted by $V$, is a complex vector space of dimension 2.

We are interested in the ratio of two independent solutions. Suppose $F, G$ a basis of solutions. Consider the quotient map, $f: HH -> P1$ where $f(z) = (G(z))/(F(z)).$ If ${F prime, G prime}$ is another basis for $V$, $exists M = mat(a, b; c, d) in GL_(2)(CC)$ where $ F prime (z) & = d F (z) + c G(z) \
G prime (z) & = b F(z) + a G(z). $ The new ratio $f prime = (G prime) / (F prime)$ is related to $f$ by Mobius Transformation

$
  f prime (z) & = (b F(z) + a G(z))/(d F (z) + c G(z)) \
              & = (a f(z) + b)/(c f(z) + d)
$
Then the action of $pi_(1)(X)$ on $V$ induces an action on the ratio $f$ by Möbius transformations. This gives us the projective monodromy representation

$ rho: pi_(1)(X) -> PGL(V) tilde.equiv PSL_(2)(CC) $

= Local Behavior of Solutions Near Singularities

We want to understand the local behavior of solutions near each of the singularities. We will use the standard Frobenius method.





== Near $z = 0$
Assume a solution of the form $ f(z) = z^rho sum_(n = 0)^(oo) a_(n) z^(n) $.
The lowest order term of the ODE must vanish. Substituting the ansatz into the equation:
$
  0 &= (z - z^2) (a_0 rho (rho - 1) z^(rho-2) + dots) + (c - (a+b+1)z)(a_0 rho z^(rho-1) + dots) + a b (a_0 z^rho + dots) \
  &= a_0 [rho(rho-1) + c rho] z^(rho-1) + O(z^rho)
$
For $a_0 != 0$, the indicial equation is $rho(rho - 1) + c rho = 0$, which simplifies to:
$ rho(rho - 1 + c) = 0 => rho = 0 "or" rho = 1 - c $




== Near $z = 1$
Let $w = z - 1$ be the local coordinate. The ODE transforms similarly. Focusing on the lowest order terms in $w$:
$
  0 & = -w(1+w) (a_0 rho(rho-1)w^(rho-2) + dots) + [c - (a+b+1)(w+1)] (a_0 rho w^(rho-1) + dots) + a b f \
    & = a_0 [-rho(rho-1) + rho(c - a - b - 1)] w^(rho-1) + O(w^rho)
$
The indicial equation is $rho(c - a - b - 1 - rho + 1) = 0$, which simplifies to:
$ rho(c - a - b - rho) = 0 => rho = 0 "or" rho = c - a - b $

== Near $z = oo$
Using the coordinate $w = 1/z$ and @hypergeometricinfinity:
$
  0 & = a_0 [rho(rho-1) + (1 - a - b)rho + a b] w^(rho-2) + O(w^(rho-1)) \
    & = a_0 [rho^2 - rho(a + b) + a b] w^(rho-2) + O(w^(rho-1))
$
The indicial equation is $rho^2 - rho(a + b) + a b = 0$, which factors as:
$ (rho - a)(rho - b) = 0 => rho = a "or" rho = b $

=== Summary of Local Solutions

We can summarize the local exponents and the form of the canonical basis of solutions near each singularity. To define non integer powers like $z^(1 - c)$ we will take a branch cut along the negative imaginary axis (or a suitable ray in the lower half plane).

#align(center, table(
  columns: (auto, auto, auto, auto),
  align: center,
  inset: 5pt,
  table.header([Singularity], [Local Coordinate], [Exponents ($rho$)], [Basis of Solutions $F_(z_(0)), G_(z_(0))$ ]),
  $0$, $z$, $0 \ 1 - c$, $F_(0)(z) = F(a, b, c; z) \ G_(0)(z) = z^(1 - c) tilde(G)_(0)(z)$,
  $1$, $1 - z$, $0 \ c - a - b$, $F_(1)(z) = "Holomorphic at " z = 1 \ G_(1)(z) = (1-z)^(1 - c) tilde(G)_(0)(1 - z)$,
  $oo$, $1/z$, $a \ b$, $F_(oo)(z) = z^(-a) tilde(F)_(oo)((1)/(z)) \ G_(oo)(z) = z^(-b) tilde(G)_(oo)((1)/(z))$,
))

For the explicit construction of the monodromy group later, we will primarily work with the basis at $z=0$:

$ V = CC lr(angle.l G_(0), F_(0) angle.r) $

Furthermore unless otherwise stated $F = F_(0)$ and $G = G_(0)$.
= The Schwarz Triangle

In this section we will show that $f = G_(0)/F_(0)$ provides a conformal map between $HH$ to a curvilinear triangle, called the *Schwarz Triangle*. The triangle which gets mapped into can be seen in @trianglepicture. This geometric picture will be key to understanding the monodromy representation.


Additionally for notation, let $ alpha & = 1 - c \
 beta & = c - a - b \
gamma & = b - a $

We will assume that $0 < alpha, beta, gamma < 1$. Let $f_(0) = G_(0) / F_(0)$, $f_(1) = G_(1) / F_(1)$, $f_(oo) = G_(oo)/F_(oo)$. Unless otherwise specified $f = f_(0)$. As established in Section 3, these functions are related by Möbius transformations. Note $f$ is holomorphic on $HH$, because both $F_(0)$ and $G_(0)$ are holomorphic on $HH$ and for our choice of parameters $F_(0)$ has no zeroes on $HH$.

#figure(image("SchwartzTriangle.png"), caption: [Schwarz Triangle])<trianglepicture>

#theorem[ The function
  $ f = (G_(0))/(F_(0)) : HH -> T $ where $T$ is a curvilinear triangle with vertices $v_0 = f(0), v_1 = f(1)$ and $v_oo = f(oo)$ and interior angles $pi alpha$, $pi beta$, $pi gamma$ respectively. The triangle which gets mapped into can be seen in @trianglepicture.
]
#proof[
  $F_(0)$ is real on the real axis and $G_(0)$ is real on the positive real axis. Since the branch cut is made along a ray in the lower half plane, $forall z in (-oo, 0)$, $arg(z) = pi$. Thus $forall z in (-oo, 0)$, $z = |z| e^(i pi)$. Thus $ G_(0)(z) & = z^(alpha) tilde(G)_(0)(z) \
           & = (|z|e^(i pi))^(alpha) tilde(G)_(0)(z) \
           & = |z|^(1-c)e^(i pi alpha) tilde(G)_(0)(z) $ thus $G_(0)((-oo, 0)) subset {r e^(i pi alpha) : r in RR}$. Moreover it is known that $tilde(G_(0))(z)$ is strictly positive. Thus $G_(0)((-oo, 0)) subset {r e^(i pi alpha) : r in (0, oo)}$. Thus $f_(0)$ maps $S = {z in HH : abs(z) < 1}$ to the wedge shaped region ${w: 0 < arg w < pi alpha}$. Using a similar argument, we can see $f_1$ maps the $S$ to ${w : 0 < arg w < pi beta}$ and $f_oo$ maps $S$ to ${w : 0 < arg w < pi gamma}$.  However we are interested in the behavior of a single global function $f = f_(0)$. We know that near $z = 1$, $exists M in PSL_(2)(CC)$ where $ f(z) = M(f_(1)(z)) $ where $M$ acts by Möbius transformation. Möbius transformations have the following key geometric properties:

  1. Conformality: They preserve angles
  2. Generalized Circles: They map circlines to circlines.

  Since $f$ is holomorphic on $HH$ and continious on $RR - {0, 1}$, the boundary of the image domain is determined by the image of $RR union {oo}$.
  We can analyze the image of the segments of the three segments of the real line:

  1. The segment $(0, 1)$: Since $F$ and $G$ have real coefficients, then for $z in (0, 1)$ $F(z), G(z) in RR$. Consequently $f(z)$ maps the interval to a segment of the real line.
  2. The segment $(-oo, 0)$: We know that near $z = 0$, $f_(0)$ maps this segment to a ray with $arg z = pi alpha$. Since $f = f_(0)$, the image of $(- oo, 0)$ is a straight line meeting the image of $(0, 1)$ at the vertex $f(0)$ with interior angle $pi alpha$
  3. The segment $(1, oo)$: Near $z = 1$, the local function $f_(1)$ maps the boundary to a wedge of angle $pi beta$. Since $f = M compose f_(1)$ and $M$ maps the straight sides of $f_(1)$-wedge to circlines, $f$ maps the segment $(1, oo)$ to a circline. Because $M$ is conformal, the circline must meet $f((0, 1))$ at $v_(1)$ with internal angle $pi beta$
  4. The vertex at $oo$: Similarly, near $z = oo$, the relation between $f$ and $f_(oo)$ implies that the arcs coming from $(-oo, 0)$ and $(1, oo)$ meet the vertex $v_(oo)$ with angle at $pi gamma$

  Thus $f$ maps $HH$ to a curvilinear triangle with vertices $v_(0)$, $v_(1)$, and $v_(oo)$.

  #figure(
    image("Note Dec 6, 2030.png", width: 50%),
    caption: "Mapping semicircles and then stitching",
  )
]

#theorem[
  $f: HH -> T$ is a conformal bijection.
]<conformalbijection>
#proof[

  We will first show that $f prime (z) != 0$ on $HH$ to get local injectivity and then use the argument principle to get global injectivity.
  Let $W(z) = G prime (z) F(z) - G(z) F prime (z)$. Thus $ f prime (z) = (W(z))/(F (z))^(2). $ Differentiating $W(z)$, we see $ dv(W, z) & = dv2(G, z) F + dv(G, z) dv(F, z) - dv(G, z) dv(F, z) - G dv2(F, z) \
           & = dv2(G, z) F - G dv2(F, z). $ Since Both $F$ and $G$ are solutions to $"HG"_(a, b, c)(f) = 0$. We know that $ dv2(G, z) & = (1)/(z(z-1))[(c - (a + b + 1) z) dv(G, z) - a b G] \
  dv2(F, z) & = (1)/(z(z-1))[(c - (a + b + 1) z) dv(F, z) - a b F] $

  Plugging into $dv(W, z)$ and simplifying:

  $
    dv(W, z) & = (1)/(z(z-1))[ (c - (a + b + 1) z) (F dv(G, z) - G dv(F, z)) - a b G F + a b G F] \
             & = (1)/(z(z-1))[ (c - (a + b + 1) z) (F dv(G, z) - G dv(F, z))]. \
             & = (1)/(z(z-1))(c - (a + b + 1) z) W \
  $

  Thus $W$ is the solution to the following first order ODE,

  $ z(1 - z) dv(W, z) + (c - (a + b + 1) z) W = 0 $

  We can explicitly solve for $W$.

  $ (dif W)/(W) = -[(c - (a + b + 1) z)/(z(1 - z))] dif z $

  Solving this differential equation we get:

  $ W(z) = C z^(-c)(1-z)^(a + b + 1 - c) = C e^(- c log(z)) e^((a + b + 1 - c) log(1 - z)) $ where $C != 0$ ($F$ and $G$  are independent solutions). Note the following that $log(z)$ is well defined for $z in (HH union RR) - {0, 1}$ because the branch cut is in the lower half plane. Thus $W$ is both well defined and nonzero on $(HH union RR) - {0, 1}$. This implies that $f prime (z)$ is nonzero and thus a local homeomorphism. Furthermore, on $RR - {0, 1}$, $f prime$ is monotonic. Thus it is injective on $RR - {0, 1}$.

  To prove injectivity, we will use the argument principle. Pick $w_(0) in T$. Let $Gamma_(R, epsilon)$ be a indented semicircle contour of radius $R$ centered at the origin, with a indent of radii $epsilon$ at the origin. Since $f$ is holomorphic on $HH$, it has no poles in $HH$. By the argument principle,

  $ (1)/(2 pi i)lim_(R -> oo \ epsilon -> 0) integral_(Gamma_(R, epsilon)) (f prime (z))/(f(z) - w_(0)) dif z = N $ where $N$ are the number of zeros of $f(z) - z_(0)$. The integral also has a topological interpretation as the winding number of $Gamma = f(partial HH)$, the image curve, around the point $w_(0)$. As previously shown, $f(partial HH)$ is the boundary of the triangle, which we have shown gets mapped injectively. Thus $Gamma$ is a simple closed curve and has a winding number of $1$. Thus $N = 1$. Thus $f: HH -> T$ is a conformal bijection.
]

= Monodromy Representation

Using the geometric picture of the Schwarz triangle we compute $rho(pi_1 (X)) subset PSL_(2)(CC)$. We begin with a technical lemma about reflections.


#lemma[
  Let $cal(L)$ be the set of all circlines in $P1$. For any circline $c in L$, let $r_c: PP^1 -> PP^1$ denote reflection across $c$. Then $r_c$ is antiholomorphic.
]<circlinesanti>

#proof[
  Möbius transformations in $PSL_2(CC)$ act holomorphically and transitively on ordered triples of distinct points in $P1$. Since any circline is uniquely determined by three distinct points on it, and $RR PP^1 subset P1$ is a circline, it follows that Möbius transformations act transitively on circlines.

  Therefore, for any circline $c in L$, there exists $M_c in PSL_2(CC)$ such that $M_c(c) = RR PP^1$. Reflection across $c$ can be expressed as
  $ r_c(z) = M_c^(-1) compose r_(RR PP^1) compose M_c $
  where $r_(RR PP^1)(z) = overline(z)$ is reflection across the real axis.

  Since $r_(RR PP^1)(z) = overline(z)$ satisfies $(partial overline(z))/(partial z) = 0$, it is antiholomorphic. The composition $r_(RR PP^1) compose M_c$ of an antiholomorphic function with a holomorphic function is antiholomorphic. Finally, $r_c = M_c^(-1) compose (r_(RR PP^1) compose M_c)$ is the composition of a holomorphic function $M_c^(-1)$ with an antiholomorphic function, which is antiholomorphic.
]

The next theorem is the technical foundation for computing monodromy.

#theorem[
  Let $f: HH -> T$ be the conformal map defined in @conformalbijection, from upper half-plane to the Schwarz triangle. Suppose $f$ extends continously to a real interval $[a, b] in RR union oo$, mapping it to a side $s$ of $T$.  Let $r_s: P1 -> P1$ denote reflection across the side $s$.

  Define $g: HH^(-) -> P1$ by
  $ g(z) = r_s (f(overline(z))) $
  where $HH^(-) = {z in CC : Im(z) < 0}$ is the lower half-plane. Then $g$ is holomorphic and provides an analytic continuation of $f$ to $HH^(-)$ across the interval $[a,b]$.
]<schwarzreflection>
#proof[
  $r_(s)$ is antiholomorphic by @circlinesanti. $z -> f(overline(z))$ is a composition of a holomorphic and antiholomorphic function and is thus antiholomorphic. Thus $g$ is holomorphic, because it is the composition of a antiholomorphic function with a antiholomorphic one.

  Note that $x in (a, b)$, $f$ extends continously to $[a, b]$ and maps it to the side $s$, so $f(x) in s$. Reflection across a side fixes the points on the side, thus $g(x) = r_(s)(f(overline(x))) = r_(s)(f(x)) = f(x)$.

  Let $F: HH^(+) union (a, b) union HH^(-) -> P1$ where $ F(z) := cases(f(z) "if" z in HH^(+) union (a, b), g(z) "if" z in HH^(-)) $

  Let $gamma$ be a any closed curve on $HH^(+) union (a, b) union HH^(-)$.

  1. $gamma subset HH^(+)$: Since $f$ is holomorphic, $ integral_(gamma) F = integral_(gamma)f = 0 $
  2. $gamma subset HH^(-)$: Since $g$ is holomorphic, $ integral_(gamma) F = integral_(gamma) = 0 $
  3. Otherwise: Split $gamma$ into pieces in $HH^(+)$ and $HH^(-)$ respectively that approach the boundary $(a, b)$. $F$ is continous and holomorphic on each peice, and the integrals along $(a, b)$ from opposite sides cancel (since $f$ and $g$  agree there ), we have $integral_(gamma) f = 0$

  By Morera's Theorem, $F$ is holomorphic on $HH^(+) union (a, b) union HH^(-)$.
]

We now use Theorem 6.2 to determine the effect of loops around each singular point.

#theorem(name: "Monodromy Representation via reflection")[
  Let $T$ be the Schwarz triangle defined above with vertices $v_0 = f(0)$, $v_1 = f(1)$, $v_oo = f(oo)$ and interior angles $pi alpha$, $pi beta$, and $pi gamma$ respectively. Let $s_(0), s_(1), s_(oo)$ be the sides opposite to $v_0, v_(1), v_(oo)$ respectively. Let $R_(0)$ be a rotation of $2 pi alpha$ about $v_(0)$ and $R_(1)$ be a rotation of $2 pi beta$ about $v_(1)$. The monodromy representation $rho: pi_(1)(X) -> "PSL"_(2)(CC)$ is given by $ rho(l_(0)) & = r_(s_(1)) compose r_(s_(oo)) = R_(0) \
    rho(l_1) & = r_(r_(oo)(s_(0))) compose r(s_(oo)) = R_(1) $
]
#proof[
  We will analyze the effect of analytic continuation of $f = G_(0)/F_(0)$ around the generators of $pi_(1)(X)$. By @conformalbijection, $f: HH -> T$ is a conformal bijection where

  1. $f$ maps $(0, 1)$ to the side $s_(oo)$
  2. $f$ maps $(1, oo)$ to the side $s_(0)$
  3. $f$ maps $(-oo, 0)$ to the side $s_(1)$

  By @schwarzreflection, analytic continuation across a boundary segment cooresponds to reflection of the image across the corresponding side of the triangle.

  *Analytic continuation around $l_(0)$*:
  Let $l_(0)$ be a small loop based at $z_(0) in HH$ that loops around 0 once counter clockwise. Thus $l_(0)$ crosses $(-oo, 0)$ into $HH^(-)$ and then crosses $(0, 1)$ into $HH^(+)$. By @schwarzreflection, analytic continuation of $f$ into $HH^(-)$ across $(-oo, 1)$ is given by $f^((1))(z) = r_(s_(1))(f(overline(z)))$. The image of $HH^(-)$, is given by reflecting the triangle $T$ across the side $s_(1)$, which we will denote as $T prime = r_(s_(1))(T)$. Continuing along $l_(0)$, we cross back from $HH^(-)$ to $HH$ through the interval $(0, 1)$. To continue $f^((1))$ across $(0, 1)$, note that $f^(1)$ maps $(0, 1)$ (now approached from below) to $r_(s_(1))(s_(oo))$. By @schwarzreflection, continuation across this boundary is given by $f^((2))(z) = r_(r_(s_(1))(s_(oo)))(f^((1))(overline(z))) = r_(r_(s_(1))(s_(oo)))(r_(s_(1))(f(z)))$. By the geometry of reflections, $r_(r_(s_(1))(s_(oo))) = r_(s_(1)) compose r_(s_(oo)) compose r_(s_(1))$. This is because you first transform the reflected circline back to the original circline, reflect here, and then transform back. Thus $ f^((2))(z) = (r_(s_(1)) compose r_(s_(oo)) compose r_(s_(1)))(r_(s_(1))(f(z))) = (r_(s_1) compose r_(s_(oo)))(f(z)). $ Thus traveling a $l_(0)$ sends $f -> r_(s_1) compose r_(s_(oo)) compose f$. Thus $rho(l_(0)) = r_(s_1) compose r_(s_(oo))$. Furthermore, by the geometry of rotations and reflections, $r_(s_(1)) compose r_(s_(oo)) = R_(0)$. Thus $rho(l_(0)) = R_(0)$.

  *  We will do a similar argument for the analytic continuation around $l_(1)$.
  *  Let $l_(1)$ be a small loop based at $z_(0) in HH$ that loops around 1 once counter clockwise. Thus $l_(1)$ crosses $(0, 1)$ into $HH^(-)$ and then crosses $(1, oo)$ into $HH^(+)$. By @schwarzreflection, analytic continuation of $f$ into $HH^(-)$ across $(0, 1)$ is given by $f^((1))(z) = r_(s_(oo))(f(overline(z)))$. The image of $HH^(-)$, is given by reflecting the triangle $T$ across the side $s_(oo)$, which we will denote as $T prime = r_(s_(oo))(T)$. Continuing along $l_(1)$, we cross back from $HH^(-)$ to $HH$ through the interval $(0, 1)$. To continue $f^((1))$ across $(1, oo)$, note that $f^(1)$ maps $(1, oo)$ (now approached from below) to $r_(s_(oo))(s_(0))$. By @schwarzreflection, continuation across this boundary is given by $f^((2))(z) = r_(r_(s_(oo))(s_(0)))(f^((1))(overline(z))) = r_(r_(s_(oo))(s_(0)))(r_(s_(oo))(f(z)))$. By the geometry of reflections, $r_(r_(s_(oo))(s_(0))) = r_(s_(oo)) compose r_(s_(0)) compose r_(s_(oo))$. This is because you first transform the reflected circline back to the original circline, reflect here, and then transform back. Thus $ f^((2))(z) = (r_(s_(oo)) compose r_(s_(0)) compose r_(s_(oo)))(r_(s_(oo))(f(z))) = (r_(s_oo) compose r_(s_(0)))(f(z)). $ Thus traveling a $l_(1)$ sends $f -> r_(s_oo) compose r_(s_(0)) compose f$. Thus $rho(l_(1)) = r_(s_oo) compose r_(s_(0))$. Furthermore, by the geometry of rotations and reflections, $r_(s_(oo)) compose r_(s_(0)) = R_(1)$. Thus $rho(l_(0)) = R_(1)$.


  Let $l_(oo)$ be the loop that loops around infinity. Since $pi_(1)(X) = lr(angle.l l_0, l_1 angle.r)$, let $l_(oo)$ be oriented such that $ l_(oo) = l_(0) l_(1) in pi_(1)(X) $. Then $ rho(l_(oo)) = rho(l_(0))rho(l_(1)) = r_(s_1) compose r_(s_(oo)) compose r_(s_oo) compose r_(s_(0)) = r_(s_(1)) compose r_(s_(0)). $ This is a rotation by $2 pi gamma$ around $v_(oo)$.
]

#figure(image("loop.png"), caption: [Behavior as we traverse $l_(0)$])

#corollary[
  $rho(pi_(1)(X)) subset PSL_(2)(CC)$ is a group generated by rotations by angles $2pi alpha$, $2 pi beta$, and $2pi gamma$ about the vertices of the Schwarz Triangle. When $alpha = (1)/(p)$, $beta = (1)/(q)$, and $gamma = (1)/(r)$ for positive $p, q, r$. $rho(pi_(1)(X)) = Delta(p, q, r)$ the triangle group.
]

=== Explicit Matricies
We will explicitly calculate $rho(pi_(1)(X))$ under a basis of the action close to $v_(0)$. $l_(0)$ is a loop around 0, $F_(0)(z e^(2 pi i)) = F_(0)(z)$ where as $G_(0)(z e^(2 pi i)) = e^(2 pi i alpha) G_(0)(z)$. Thus analytically continuing $f$ around 0, sends $f -> e^(2 pi i alpha) f$. This means that $ rho(l_(0)) = mat(e^(2pi i alpha), 0; 0, 1). $ Furthemore, we know that $rho(l_(1))$ is a rotation around $v_1$. That means under this basis,

$
  rho(l_(1)) & = mat(1, v_1; 0, 1)mat(e^(2pi i beta), 0; 0, 1) mat(1, -v_(1); 0, 1) \
             & = mat(e^(2 pi i beta), v_(0) + v_(0)e^(2 pi i beta); 0, 1)
$

From the classical theory of hypergeometric functions (Whittaker & Watson), the connection formula gives:
$ v_(1) = f(1) = (Gamma(2 - c)Gamma(c - a)Gamma(c - b))/(Gamma(c)Gamma(1-a)Gamma(1-b)). $


= Appendix: Explicit Construction of Solution Bases
In this section, we explicitly derive the basis solutions near each singularity by transforming the hypergeometric equation. The main technique is the Frobenius method, where we substitute the ansatz $f(z) = z^(r) tilde(f)(z)$.

Let $f$ be a solution to $"HG"_(a, b, c)(f) = 0$. We wish to find a solution of the form $f(z) = z^(r) tilde(f)(z)$. Computing derivatives $       f prime (z) & = r z^(r - 1) tilde(f)(z) + z^(r) tilde(f) prime (z) \
f prime prime (z) & = r(r - 1) z^(r - 2) tilde(f)(z) + 2r z^(r - 1)tilde(f) prime (z) + z^(r) f prime prime (z). $ Plugging $f$, $f prime$, and $f prime prime$ into $"HG"_(a, b, c)(f)$ we see that,

$
  0 & = z(1-z) ppv(f) + [c - (a + b + 1)z] pv(f) - a b f \
    & = z^(r+ 1)(1-z)ppv(f) + [2r z^(r)(1 - z) + z^(r)(c - (a + b + 1)z)]pv(f) \
    & - [r(r-1)z^(r-1)(1-z) + r z^(r - 1)(c - (a + b + 1)z) + z^(r)] tilde(f) \
    & = z^(r+ 1)(1-z)ppv(f) + z^(r)[2r (1 - z) + (c - (a + b + 1)z)]pv(f) \
    & + z^(r-1)[r(r-1)(1-z) + r (c - (a + b + 1)z) - a b z] tilde(f) \
$


=== At $z = 0$

We have two values for $r$, $r =0$ and $r = 1 - c$. $r = 0$ gives us the standard Hypergeometric Equation back. But for $r = 1 - c$, we see our 2nd order differential equation for $tilde(f)$ transforms. We will take this coefficient by coefficient.

$
  z^(1-c)[2(1-c) (1 - z) + (c - (a + b + 1)z)] & = z^(1 - c) (2 - c - 3 z - a z - b z + 2 c z) \
                                               & = z^(1 - c)[(2-c) - (a + b - 2 c + 2 + 1)z]
$

and

$ z^(-c)[(1-c)(-c)(1-z) + (1-c) (c - (a + b + 1)z) - a b z] & = -z^(1-c)a prime b prime $

where $a prime = a - c + 1$ and $b prime = b - c + 1$. Let $c prime = 2 - c$. Thus $"HG"_(a prime, b prime, c prime) (tilde(f)) = 0$ and thus $tilde(f)(z) = F(a - c + 1, b - c + 1, 2 - c; z)$. Thus $ F_(0)(z) & = F(a, b, c; z) \
G_(0)(z) & = z^(1 - c) F(a - c + 1, b - c + 1, 2 - c; z) $
=== At $z = 1$:
We will first transform our standard hypergeometric equation $"HG"_(a,b,c)(f)$ with the $w = 1 - z$ variable transformation and study how the differential equation changes.

$
      (dif)/(dif z) & = -(dif)/(dif w) \
  (dif)/(dif z^(2)) & = (dif)/(dif w^(2))
$

Thus,

$ w(1-w) dv2(f, w) + [(a + b + 1)(1-w) - c] dv(f, w) - a b f & = 0 $

We will specifically study, $ (a + b + 1)(1-w) - c = (a + b + 1 - c) - w(a+b+1) $

Let $a prime = a$, $b prime = b$, and $c prime = a + b + 1 - c$. Thus

$
  "HG"_(a prime, b prime, c prime)(f) = w(1-w)dv2(f, w) + [c prime - w(a prime + b prime + 1)] dv(f, w) + a prime b prime f = 0
$

By the Frobenius method we know the two solutions of $"HG"_(a prime, b prime, c prime)(f)$ at  $w = 0$,

$
  f_(1)(w) & = F(a prime, b prime, c prime; w) \
  f_(2)(w) & = w^(1-c prime)F(a prime - c prime +1, b prime - c prime + 1, 2 - c prime; w) \
           & = w^(c - a - b)F(c - b, c - a, c - a - b + 1; w)
$

Thus,

$
  F_(1)(w) & = F(a, b, c; z ) \
  G_(2)(z) & = (1-z)^(c - a - b)F(c - b, c - a, c - a - b + 1; 1-z)
$

=== $z = oo$
Using @hypergeometricinfinity, we have

$ dv2(f, w) + ( (2w - c w + a + b - 1)/(w(w - 1)) ) dv(f, w) - (a b)/(w^2(w - 1)) f = 0 $

thus,

$ w^(2)(w-1)dv2(f, w) + w(2w - c w + a + b - 1) dv(f, w) - a b f = 0 $

We have to use the fact that we know that $f(w) = w^(a) tilde(f)(w)$ for some $tilde(f)(w)$. We will solve for $tilde(f)$ and then by symmetry we should also know what $g(w) = w^(b) tilde(g)(w)$ is.

$
        f prime (w) & = a w^(a - 1) tilde(f)(w) + w^(a) tilde(f) prime (w) \
  f prime prime (w) & = a(a - 1) w^(r - 2) tilde(f)(w) + 2r w^(a - 1)tilde(f) prime (w) + w^(a) f prime prime (w)
$

Thus

$
            0 = w^(2)(w-1)( & a(a - 1) w^(a - 2) f + 2r w^(a - 1)dv(tilde(f), w) + w^(r) dv2(tilde(f), w)) \
  +w(2w - c w + a + b - 1)( & a w^(a - 1) tilde(f)(w) + w^(a) dv(tilde(f), w) ) \
                          - & a b w^(a) f
$

Grouping like terms and dividing by $w^(a)$ we see

$
  w^(2)(w-1) dv2(tilde(f), w) + w[w(2a + 2 - c) + (b - a - 1)] dv(tilde(f), w) + a(a-c+1)w tilde(f) = 0
$

Dividing by $-w$ to reduce order and get it into correct form,

$ w(1-w)dv2(tilde(f), w) + [-w(2a + 2 - c) + (1+a-b)] dv(tilde(f), w) + a(a-c+1)w tilde(f) = 0 $

This is $"HG"_(a, a-c+1, 1+a-b)(tilde(f)) = 0$. Thus $ tilde(f)(w) = F(a, a-c+1, a-b+1; w) $. Thus $ F_(oo)(z) = z^(-a)F(a, a-c+1, a-b+1; (1)/(z)) $ and by symmetry,

$
  G_(oo)(z) = z^(-b)F(b, b-c+1, b-a+1; (1)/(z))
$

