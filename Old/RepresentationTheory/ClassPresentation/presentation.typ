#import "@preview/grape-suite:2.0.0": slides
#import slides: *
#import "@preview/frame-it:1.2.0": *
#import "@preview/commute:0.3.0": arr, commutative-diagram, node
#import "@preview/numty:0.0.5"


#let (theorem, feature, variant, syntax, definition, alert, conjecture) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be gene  rated
  theorem: ("Theorem", rgb(249, 234, 242)),
  conjecture: ("Conjecture", rgb(249, 234, 242)),

  // You can add as many as you want
  syntax: ("Syntax",),
  definition: "Definition",
  alert: ("Alert", rgb(255, 0, 0)),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)

#show: slides.with(
  series: [From Classical Theta Functions to the Weil Representation],
  author: "Arham Lodha",
  email: link("arham.lodha@utexas.edu"),
  fontsize: 20pt,
  show-date: false,
  show-outline: false,
  show-semester: false,
  no: none,
)

#slide[
  = Theta Function
  Let us start with the Theta Function $theta: HH -> CC$,
  $ theta(z) := sum_(x in ZZ^(n))^() e^(pi i norm(x)^(2) z ) $

  $theta$ has some nice transformation rules:

  $
    theta(mat(1, 2; 0, 1) z) & = theta(z + 2) = theta(z) \
             theta(-(1)/(z)) & = ((z)/(i))^((n)/(2))theta(z) "(This comes from Poisson Summation)"
  $

  It turns out that $theta$ is a modular form of weight $n slash 2$ for $Gamma_(0)(4)$ if $n$ is even.
]

#slide[
  = Road to The Weil Representation

  $theta$ is a summation of the Schwartz Function $ phi_(z)(x) = e^(pi i norm(x)^(2) z ) in cal(S)(RR^(n)) $ over the lattice $ZZ^(m)$

  $O(n)$ has a obvious action over $cal(S)(RR^(n))$ given by $ omega(g)phi(x) = phi(g^(-1) x). $ But $"SL"_(2)(RR)$ also has an interesting action over $cal(S)(RR^(n))$ that we can study.
]

#slide[
  = Road to The Weil Representation

  *Translations $n(b) = mat(1, b; 0, 1)$:*

  $ n(b) phi_(z)(x) = phi_(z + b)(x) = e^(pi i norm(x)^(2)(z + b)) = e^(pi i b norm(x)^(2))phi_(z)(x) $

  *Dilations $m(a) = mat(a, 0; 0, a^(-1))$:*

  $
    m(a)phi_(z)(x) & = phi_(a^(2) z)(x) = e^(pi i norm(x)^(2) a^(2) z ) \
                   & = e^(pi i norm(a x)^(2) z ) = phi_(z)(a x)
  $

  *Inversion $w = mat(0, -1; 1, 0)$:*
  $
    w phi_(z)(x) = phi_(-(1)/(z))(x) = e^(- i pi norm(x)^(2) z^(-1) ) = ((z)/(i))^((n)/(2)) hat(phi)_(z)(x)
  $
]

#slide[
  = The Weil Representation

  While these aren't exactly the actions that we care about, they are very close. The Weil Representation $omega$ of $"SL"_(2)(RR)$ on $cal(S)(RR^(n))$  are defined as follows:

  *Translations $n(b)$:*

  $ omega(n(b))phi(x) & = e^(pi i b norm(x)^(2) ) phi(x) $

  *Dilations $m(a)$*:
  $ omega(m(a))phi(x) = abs(a)^((n)/(2)) phi(a x) $

  *Inversion $w$*:
  $ omega(w)phi(x) = i^((n)/(2)) hat(phi)(x) $
]

#slide[
  = Relating the Actions
  Both $O(n)$ and $"SL"_(2)(RR)$ are acting on $cal(S)(RR^(n))$. It actually turns out that the actions commute. The only action that technically we need to check is the action of $w in "SL"_(2)(RR)$ and $g in O(n)$. But the good news is that the fourier transform commutes with rotations and reflections!

]

#slide[
  = The Symplectic Group and Dual Pairs

  Yes! $O(n), "SL"_(2)(RR) subset "Sp"(2n, RR)$ where $"Sp"(2n, RR)$ and the Weil Representation is actually a Representation of $"Sp"(2n, RR)$. Furthermore to explain the commutation of the actions, we find out that $         Z_("Sp"(2n, RR))(O(n)) & = "SL"_(2)(RR) \
  Z_("Sp"(2n, RR))("SL"_(2)(RR)) & = O(n) $

  Thus $("SL"_(2)(RR), O(n))$ form something called a *Reductive Dual Pair*.
]

#slide[
  = Theta Kernel

  For our dual pair $("SL"_(2)(RR), O(n))$ we can we can define a kernel function $ Theta_(Lambda, phi): "SL"_(2)(RR) times O(n) -> CC $ for a Schwartz function $phi$ and a lattice $Lambda$ where $ Theta_(Lambda, phi)(g, h) = sum_(lambda in Lambda)^() (omega(g, h) phi)(lambda) $

  *Key Property*: $Theta_(Lambda, phi)$ transforms nicely in both variables.
  1. In $g$: It is a automorphic form for $"SL"_(2)(RR)$ with respect to some discrete subgroup $Gamma$
  2. In $h$: It is a automorphic form for $O(n)$ with respect to $O(n, ZZ)$
]

#slide[
  = Theta Lift

  Thus $Theta_(Lambda, phi): "SL"_(2)(RR) times O(n)) -> CC$.

  // https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQASACgHF6BbfvQAEAI3oBjANZxG9OAAthAHRABlADKqA+lwBMASi4AlYwYPC8-eMK4B5LmFLCAWi4vjps+UodhzHCAAvqTomLj4hCjkpMTUdEys7Bx8giKeMnKKKupaILqGJmaBIWHYeAREerHxDCxsiJx+zm4ekpk+wn4GJfEwUADm8ESgAGYAThD8SDEgOBBIZAn1yWjaxIE0cqIwjAAK4RVRIONYAwo4waEgE1MzNPNI1ctJjRxrer1BQA
  #align(center, commutative-diagram(
    node((0, 1), [$"SL"_(2)(RR) times O(n)$]),
    node((1, 0), [$"SL"_(2)(RR)$]),
    node((1, 2), [$O(n)$]),
    arr((0, 1), (1, 0), [$p_1$], label-pos: right),
    arr((0, 1), (1, 2), [$p_2$]),
  ))

  So we can get a integral lift by doing the standard pull back, multiply, and push forward method to get an automorphic form from one side to the other. In fact this is how the Theta Series can be constructed representation theoretically.
]


#slide[
  = Howe Duality
  #align(
    horizon,
    [    *Howe Duality*: For a dual pair $(G, H)$, the theta lift is one-to-one (under certain conditions). Thus the representations spaces of $"SL"_(2)(RR)$ and $O(n)$ paired by the correspondence are unique.
    ],
  )
]

#slide[
  = Other Reductive Pairs
  1. Symplectic-Orthogonal (The Classic Case):
    $(O(V), "Sp"(W))$. This gives us Shimura correspondence
  2. General Linear (GL-GL): $("GL"(n), "GL"(m))$ which sit inside $"Sp"_(2m n)$. This gives us a convolution formula for L-functions
  3. Unitary-Unitary- Useful for studying automorphic forms on unitary groups



]



// #slide[
//   = Integral Points on Spheres

//   Understanding the behavior of $ I_(n)(d) = {x in ZZ^(n) mid(|) norm(x)^(2) = d } $ is a very classical problem in number theory. Some natural questions to ask include:

//   1. When is $I_(n)(d) != emptyset$?
//   2. What is the size of $I_(n)(d)$ and how does it grow as $d -> oo$?
//   3. *How is $I_(n)(d)$ on $S^(n - 1)(d)$  distributed as $d -> oo$? *

//   We will study problem 3, specifically in the cases $n>=4$ and even.
// ]


// #slide[

//   = Detecting Equidistribution

//   To prove the points are uniformly distributed, by Weyl's Criterion, it is sufficient to show that for every non-trivial spherical harmonic $P in cal(H)_(k)^(n)$ (homogeneous polynomial of n variables with degree $k$), the weighted sum over the shell grows slower than the total count of integral points.

//   $ (1)/(abs(I_(n)(d))) sum_(x in I_(n)(d))P(x) ->_(d -> oo) 0 $

//   So the problem reduces to understanding the behavior of the sum $ sum_(x in I_(n)(d))P(x) $

// ]


// #slide[
//   = The Building Block

//   Let $P in cal(H)_(k)^(n)$, define $f_(P): RR^(n) times HH -> CC$ by $ f_(P)(x, z) = P(x) e^(pi i norm(x)^(2) z ) $

//   For fixed $z$: $f_(p)(dot, z)$ is a Gaussian weighted by a harmonic polynomial and thus $f_(p)(dot, z) in cal(S)(RR^(n))$ (Schwartz Space)

//   For fixed $x$: $f_(p)(x, dot)$ is a holomorphic exponential $q^(abs(x)^(2)/2)$ where $q =e^(2 pi i z)$
// ]

// #slide[
//   = The Theta Series

//   We want to examine the sum of $f_P$ over all elements of the lattice $ZZ^(n)$. We will call this new function $theta_(P): HH -> CC$. $forall P in cal(H)_(k)^(n)$ let

//   $
//     theta_(P)(z) = sum_(x in ZZ^(n))^() f_(P)(x) = sum_(d = 0)^(oo) a_(P)(d) q^((d)/(2))
//   $

//   where $q = e^(2 pi i z)$ and $ a_(P)(d) = sum_(x in I_(n)(d))P(x) $

//   - *If $k=0$ ($P=1$):* $a_P (d)$ is the count $|I_n (d)|$ ("Main Term").
//   - *If $k > 0$:* $a_P (d)$ measures deviation from uniformity ("Error Term").


// ]

// #slide[
//   = Symmetries


//   1. The Geometric Symmetry: $O(n)$ acts on x variable
//   $ (g dot f_P)(x, z) = f_P (g^(-1) x, z) = P(g^(-1) x) e^(i pi norm(x)^(2) z ) $

//   2. The Hidden Symmetry: There is also a $"SL"_(2)(RR)$ coming from $HH$. $forall b in RR$ and $forall a in RR^(times)$

//   - *Translations* $n(b) = mat(1, b; 0, 1)$

//   $
//     n(b)f_(p)(x, z) = P(x)e^(i pi norm(x)^(2) (z + b)) = e^(i pi b norm(x)^(2) ) f_(P)(x, z) \
//   $

//   - *Dilations* $m(a) = mat(a, 0; 0, a^(-1))$

//   $
//     m(a)f_(p)(x, z) = f_(p)(x, a^(2) z) = P(x)e^(i pi norm(x)^(2) a^(2) z) = P((a)/(a) x) e^(i pi norm(a x)^(2) z) = abs(a)^(-k) f_(p)(a x, z) \
//   $

//   - *Inversions*: What about $S = mat(0, -1; 1, 0)$?

// ]

// // #slide[
// //   = The Symmetries of $theta_P$
// //   #theorem[
// //     For $P in cal(H)_(k)^(n)$,
// //     $theta_(P) in M_(r + n slash 2)(Gamma(4))$ i.e is a modular form of weight $r + (n)/(2)$ with respect to $ Gamma(4) = {g in "SL"_(2)(ZZ) mid(|) g equiv I mod 4} $
// //   ]
// //   The theta series $theta_P$ has one obvious symmetry:
// //   $
// theta_(P)(mat(1, 2; 0, 1) dot z) = theta_(P)(z+2) =theta_(P)(z)
// //   $

// //   But we also want to understand how $theta_(P)(-1 slash z)$ transforms. Something important is that harmonic polynomials are eigenfunctions of the Fourier transform! In fact $ hat(P) = i^(k) P $
// // ]

// #slide[
//   = The Fourier Transform
//   // Speech: Something to note is that $theta_(P)$ is a sum of a Schwartz function over a lattice and a very natural thing to do here is Poisson Summation and examine the Fourier Transform of $f_(P)$ to see if we get anything.  The good part is both harmonic polynomials and gaussians behave nicely with respect to Fourier Transform. In fact harmonic polynomials are eigenvalues of the Fourier Transform and $hat(P) = i^(k) P$.  Thus if  take the Fourier transform of $f_(p)$ you get

//   $
//     hat(f_(P))(xi, z) = ((i)/(z))^((n)/(2)) i^(-k) P(xi) e^(- i pi norm(xi)^(2)/(z) ) = ((i)/(z))^((n)/(2)) i^(-k) f_(P)(xi, -(1)/(z))
//   $

//   Thus,

// $ (S f_(p))(x, z) = ((z)/(i))^((n)/(2))i^(k) hat(f)_(P)(xi, z) $

//   The modular transformation law $z -> -1/z$ is merely the shadow of the Fourier transform acting on the Schwartz function $f_(P)$.
// ]

// #slide[
//   = The Weil Representation

//   We found an action of $"SL"_(2)(RR)$ on $f_(P)$.  But ${f_(P)(dot, z)}$ are very special functions—can we extend this to all of $cal(S)(RR^(n))$?

//   #definition[
//     Let $omega: "SL"_(2)(RR) -> "GL"(cal(S)(RR^(n)))$ be the Weil Representation where $ (n(b)f)(x) = e^(i pi norm(x)^(2) b ) f \
//     (m(a)f)(x) = abs(a)^((n)/(2))f(x) \
//     () $
//   ]
// ]

// // #slide[
// //   = Actions on $theta_(P)$

// //   1. Action of $"SL"_(2)(ZZ)$ on $z$:
// //   $
// //     T & = mat(1, 2; 0, 1): z -> z + 2 "stabilizes" theta_(P) \
// //     S & = mat(0, -1; 1, 0): z -> -(1)/(z) "applies Fourier Transform"
// //   $
// //   2. $O(n)$ acts on $P$:

// //   $ g in O(n): theta_(P) -> theta_(P g^(-1)) $
// //   Thus $O(n)$ rotates the harmonic polynomial.

// //   *Key Observation*: Action of $S L_(2)(ZZ)$ and $O(n)$ commute!
// // ]


