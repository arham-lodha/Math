#import "@preview/lemmify:0.1.8": *

// ---------------------------------------------------------
// 1. FORMATTING & VISUALS
// ---------------------------------------------------------
#import "@preview/unequivocal-ams:0.1.2": ams-article

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
  abstract: lorem(100),
  // bibliography: bibliography("refs.bib"),
)

#set math.equation(numbering: "1.")


// ---------------------------------------------------------
// 2. THEOREM SETUP (LEMMIFY)
// ---------------------------------------------------------
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

// Speed Aliases for Environments
#let thm = theorem
#let prop = proposition
#let def = definition
#let pf = proof
#let rem = remark
#let ex = example
#let cor = corollary

// ---------------------------------------------------------
// 3. MATH ALIASES (GENERAL)
// ---------------------------------------------------------
#let CC = $bb(C)$
#let RR = $bb(R)$
#let ZZ = $bb(Z)$
#let PP = $bb(P)$
#let QQ = $bb(Q)$
#let id = $mat(1, 0; 0, 1)$ // Identity matrix
#let GL = $"GL"$
#let SL = $"SL"$

// ---------------------------------------------------------
// 4. PROJECT SPECIFIC MACROS (HYPERGEOMETRIC)
// ---------------------------------------------------------

// 1. The Punctured Plane (The domain of the equation)
// Usage: #X
#let X = $CC without {0, 1, infinity}$

// 2. The Riemann Sphere
// Usage: #P1
#let P1 = $PP^1(CC)$

// 3. Hypergeometric Function 2F1
// Usage: #hyp(a, b, c, z)
#let hyp(a, b, c, z) = $""_2 F_1 (#a, #b, #c \; #z)$

// 4. The Monodromy Representation
// Usage: #mono
#let mono = $rho: pi_1(X, x_0) -> GL(2, CC)$

// 5. Differential Operator (Hypergeometric Operator)
// Usage: #Diff
#let Diff = $cal(D)$

// 6. Pochhammer Symbol (Rising Factorial)
// Usage: #poch(a, n)
#let poch(x, n) = $(#x)_#n$

= Introduction

Gauss' Hypergeometric equation is a second-order linear differential equation given by:

$ z(1-z) (dif^2 f)/(dif z^2) + [c - (a + b + 1)z] (dif f)/(dif z) - a b f = 0 $

From basic ODE theory, we know that the space of solutions to the ODE is 2 dimensional $CC$ vector space.

= Singularities

#thm[
  The hypergeometric is an ODE with three regular singular points at $0, 1, "and" oo$.
]
#pf[
  We will rewrite the hypergeometric equation as $ (dif^(2) f)/(dif z^(2)) + ([c - (a + b + 1) z])/(z(1 - z)) (dif f)/(dif z) - (a b)/(z(1 - z)) f = 0. $

  Let $ g(a, b, c \; z) & = ([c - (a + b + 1) z])/(z(1 - z)) \
  h(a, b, c \; z) & = - (a b)/(z(1 - z)) $

  By the definition of a regular singular point, $g$ and $h$ have a pole of at most order 1. Thus by the definition of a regular singular point, the hypergeometric has singular points at $0$ and $1$.

  Furthermore, let $w = (1)/(z)$. Then $         (dif f)/(dif z) & = -(1)/(z^(2)) (dif f)/(dif w) = -w^(2) (dif f)/(dif w) \
  (dif^(2) f)/(dif z^(2)) & = (dif)/(dif z) ((dif f)/(dif z)) \
                          & = (dif)/(dif w) ( -w^(2) (dif f)/(dif w)) dot (dif w)/(dif z) \
                          & = (-2 w (dif f)/(dif w) - w^(2) (dif^(2) f)/(dif w^(2))) dot (-w^(2)) \
                          & = w^(4)(dif^(2) f)/(dif w^(2)) + 2 w^(3) (dif f)/(dif w) $

  We will substitute the calculated values into the hypergeometric equation, so we are in terms of $w$.

  $
    (w^(4)(dif^(2) f)/(dif w^(2)) + 2 w^(3) (dif f)/(dif w)) + ([c - (a + b + 1) (1)/(w)])/((1)/(w)(1 - (1)/(w))) (-w^(2) (dif f)/(dif w)) - (a b)/((1)/(w)(1 - (1)/(w))) f = 0
  $

  After a preliminary simplification, we see:

  $
    w^(4)(dif^(2) f)/(dif w^(2)) + ( 2 w^(3) - (w^(3)[c w - (a + b + 1)])/(w - 1)) (dif f)/(dif w) - (a b )/(w^(2)(w - 1)) f = 0
  $

  Divide the entire equation by $w^(4)$ to normalize the coefficient on $(dif^(2) f)/(dif w^(2))$ and simplify:

  $
    (dif^(2) f)/(dif w^(2)) + ( ([w(2 - c) + (a + b - 1)])/(w(w - 1))) (dif f)/(dif w) - (a b )/(w^(2)(w - 1)) f = 0
  $<hypergeometricinfinity>

  $P(w) = (w(2 - c) + (a + b - 1))/(w(w - 1))$ and $Q(w) = (- a b )/(w^(2)(w - 1))$ have a pole of order 1 and order 2 at $w = 0$ respectively. Thus $w = 0$ or $z = oo$ is a regular singular point.
]


= Local Behavior of Solutions Near Singularities
We want to understand the local behavior of solutions near each of the singularities. We will use the standard Frobenius method of understanding the local behavior.

Near $z = 0$: Assume a solution of the form $ f(x) = x^(rho) sum_(n = 0)^(oo) a_(n) x^(n) & = sum_(n = 0)^(oo) a_(0) x^(n + rho) \
                                            & ~ a_(0) x^(rho) + #sym.dots.h $ where $a_(0) != 0$. Thus $     (dif f)/(dif z) & = sum_(n = 0)^(oo) a_(n) (n + rho) x^(n + rho - 1) \
                    & ~ a_(0) rho x^(rho - 1) + #sym.dots.h \
(dif^(2) f)/(dif z) & = sum_(n = 0)^(oo) a_(n)(n + rho)(n+rho -1) x^(n + rho - 2) \
                    & ~ a_(0)rho(rho - 1)x^(rho - 2) + #sym.dots.h $

Thus plugging the ansatz into the hypergeometric equation:

$
  0 & = (x - x^(2))(a_(0)rho(rho - 1)x^(rho - 2) + #sym.dots.h) + (c - (a + b + 1)x)(a_(0) rho x^(rho - 1) + #sym.dots.h) + (a b)(a_(0) x^(rho) + #sym.dots.h) \
  &= a_(0) (rho(rho - 1) + c rho )x^(p - 1) + O(x^(rho))
$

$a_(0)(rho(rho - 1) + c rho ) =0 <=> rho(rho - 1) + c rho = 0$ is the indicial equation which will give us the allowed values of $rho$ in our series expansion. Thus $ rho((rho - 1) + c) = 0 <=> rho = 1 - c "or" rho = 0 $

Near $z = 1$: Let $w = z - 1$, so $z = w + 1$, thus $(dif)/(dif z) = (dif)/(dif w)$. We will rewrite the ODE in terms of $w$. Thus $ -(w + w^(2)) (dif^(2) f)/(dif w^(2)) + [c -(a + b + 1)(w + 1)](dif f)/(dif w) + a b f = 0. $ Again, we only need to understand the behavior of solutions near $f$, so it suffices to look at the lowest order. For the sake of simplicity, we will use the formulas for the ansatz used above and plug it in the transformed ODE.

$
  0 &= -(w + w^(2))(a_(0)rho(rho - 1)w^(rho - 2) + #sym.dots.h) + (c - (a + b + 1)(w + 1))(a_(0) rho w^(rho - 1) + #sym.dots.h) + (a b)(a_(0) w^(rho) + #sym.dots.h) \
  &= a_(0)(rho(c - a - b - 1) - rho (rho - 1)) w^(rho - 1) + O(w^(rho))
$

Again solving $a_(0)rho(c - a - b - rho) = 0$ will tell us the valid orders of $rho$. $ a_(0)rho(c - a - b - rho) = 0 <=> rho = 0 "or" rho = c - a - b $

Near $rho = infinity$:
We will plug our ansatz into the transformed hypergeometric equation $z = (1)/(w)$.
By @hypergeometricinfinity,

$
  0 &= (w^(2) - w)(a_(0) rho (rho - 1) w^(rho - 2) + #sym.dots.h) + (w(2 - c) + (a + b - 1))(a_(0) rho w^(rho - 1) + #sym.dots.h) + a b w^(-1) (a_(0) w^(rho) + #sym.dots.h) \
  &= a_(0) (-rho^(2) + rho + rho(a + b - 1) - a b) w^(rho - 1) + O(w^(rho)) \
  & = - a_(0) (rho^(2) - rho(a + b) + a b) w^(rho - 1) + O(w^(rho))
$

Thus $rho^(2) - rho(a + b) + a b = 0$ is our indicial equation. $ 0 & = rho^(2) - rho(a + b) + a b \
  & = (rho - a)(rho - b). $ Thus $rho = a$ or $rho = b$.

Thus we know the following about the possible behavior of solutions near the singularities,
#table(
  columns: (auto, auto, auto),
  align: center,
  table.header([Singularity], [Local coordinate], [Possible Local Exponent]),
  $0$, $z$, $0, 1 - c$,
  $1$, $1 - z$, $0, c - a - b$,
  $oo$, $(1)/(z)$, $a, b$,
)

Suppose $f$ is a solution and near the origin the solution looks like $z^(rho)$ then if we loop around the origin $f compose [z -> z e^(2 pi i)] = e^(2 pi i rho) f$. Thus the local exponents determine the eigenvalues of the action of monodromy (or fundamental group of $X := PP^(1) - {0, 1, oo}$) on our space of solutions. Thus $pi_(1)(X)$ has a linear action on the space of solutions. Thus $mu: pi_(1)(X) -> GL_(2)(CC)$ is the map we want to study.
