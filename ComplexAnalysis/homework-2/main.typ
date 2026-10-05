#import "template.typ": *

#show: homework.with(
  course: "MATH 246A",
  assignment: "Homework 2",
  name: "Arham Lodha",
  due: "TBD",
)

// ── Section 3: Differentiation ───────────────────────────────────────────────

#problem(num: "3.1")[
  Let $D = overline(B)(a, r)$ be a closed Euclidean disk in $CC$ of radius $r > 0$ centered at $a in CC$.
  #part[Suppose $z_1, dots, z_n$ are points in $D$, and $lambda_1, dots, lambda_n$ are real numbers in $[0, 1]$ with $lambda_1 + dots + lambda_n = 1$. Show that $lambda_1 z_1 + dots + lambda_n z_n in D$.]
  #part[Suppose $P(z) = product_(k=1)^n (z - z_k)$ is a complex polynomial whose zeros $z_1, dots, z_n$ lie in $D$. Show that the zeros of $P'$ also lie in $D$.]
]
#solution[
  *(a)*: Suppose $z_1, ..., z_n in D$ and $lambda_1, ..., lambda_n in [0, 1]$ where $ lambda_1 + ... + lambda_n = 1. $ Then the claim follows from a immediate application of the triangle inequality: $ abs(sum_(k = 1)^(n) lambda_k z_k) & = sum_(i=1)^(n) lambda_k abs(z_k) \
                                    & <= r sum_(k = 1)^(n) lambda_k \
                                    & = r $

  *(b)*:
]

#problem(num: "3.2")[
  #part[Let $S^1 := {w in CC : abs(w) = 1}$. Show that $f: RR -> S^1$, $t mapsto e^(i t)$, is a covering map of $RR$ onto $S^1$, i.e., for each $w_0 in S^1$ there is an open neighborhood $U subset.eq S^1$ of $w_0$ such that $f^(-1)(U) = union.big_(k in ZZ) U_k$ for pairwise disjoint open sets $U_k subset.eq RR$ with $f|_(U_k)$ a homeomorphism of $U_k$ onto $U$ for each $k in ZZ$.]
  #part[Show that $exp: CC -> CC^* = CC without {0}$ is a covering map.]
]
#solution[ Throughout, $op("Arg")$ denotes the principal branch of the argument, $op("Arg")(z) in (-pi, pi]$.

  *(a)*: $forall w in S^1$, $w = e^(i t_k)$ where $ t_k := theta + 2 pi k, quad "where" theta := op("Arg")(w) in (-pi, pi], k in ZZ. $ Take $U = B(w, sqrt(2)) inter S^1$. Take $U_k := (theta + (pi (4 k - 1)) / 2, theta + (pi (4 k + 1)) / 2) = (theta + 2 pi k - pi/2, theta + 2 pi k + pi/2)$. Note that $U_k subset (theta + pi (2 k - 1), theta + pi (2 k + 1))$. Note that for distinct $a, b in ZZ$, $(theta + pi (2a - 1), theta + pi (2 a + 1)) inter (theta + pi (2b - 1), theta + pi (2b + 1)) = emptyset$. Note that $f(U_k) = U$. Suppose that $alpha, beta in U_k$ where $f(alpha) = e^(i alpha) = e^(i beta) = f(beta) => abs(alpha - beta) = 2 pi a$ where $a in NN$. But the length of $U_k$, is $pi$ hence $a = 0$ and $alpha = beta$. Thus $f|_(U_k)$ is injective onto $U$ hence $f|_(U_k)$ is a continuous bijection. It remains to show the inverse is continuous. Let $H := {z in CC : op("Re")(z) > 0}$. On $H$ we have $op("Arg")(z) in (-pi/2, pi/2)$ and $sin(op("Arg")(z)) = op("Im")(z) / abs(z)$. Since $arcsin: [-1, 1] -> [-pi/2, pi/2]$ inverts $sin$ there, $ op("Arg")(z) = arcsin(op("Im")(z) / abs(z)) quad (z in H), $ which is a composition of continuous functions, hence $op("Arg")$ is continuous on $H$. Define $ g_k: U -> RR, quad g_k (w) := theta + 2 pi k + op("Arg")(w e^(-i theta)). $ If $w = e^(i s) in U$ with $abs(s - theta) < pi/2$, then $w e^(-i theta) = e^(i (s - theta)) in H$ with $s - theta in (-pi/2, pi/2) subset.eq (-pi, pi]$, so $op("Arg")(w e^(-i theta)) = s - theta$ and $g_k (w) = s + 2 pi k in U_k$. Hence $g_k$ is well defined, continuous, and $g_k (U) subset.eq U_k$. (We apply $op("Arg")$ to $w e^(-i theta) in H$ rather than to $w$ because $op("Arg")$ is discontinuous at $-1$, and $-1$ may lie in $U$.) Moreover $ f(g_k (w)) = e^(i theta) e^(2 pi i k) e^(i op("Arg")(w e^(-i theta))) = e^(i theta) dot w e^(-i theta) = w, $ i.e. $f|_(U_k) compose g_k = id_U$. Since $f|_(U_k): U_k -> U$ is a bijection, $g_k = (f|_(U_k))^(-1)$. Thus $f|_(U_k)$ is a continuous bijection with continuous inverse, i.e. a homeomorphism of $U_k$ onto $U$.

  *(a)*: $exp$ is surjective this is just a matter of checking using polar form. $forall w in CC^(times)$, $w = r e^(i y_k)$ where $ y_k := theta + 2 pi k, theta in (-pi , pi) $ and $r > 0$. Let $x = log(r)$. Let $U = {z in CC^times : z/abs(z) in B(w/abs(w), sqrt(2))}$

  #figure(
    canvas({
      import cetz.draw: *
      let th = 45deg // w = 1 + i
      let R = 2.4
      let u = (calc.cos(th), calc.sin(th))
      // U: open half-plane Re(z conj(w)) > 0, drawn truncated to a disk
      arc(
        (0, 0),
        start: th - 90deg,
        stop: th + 90deg,
        radius: R,
        mode: "PIE",
        anchor: "origin",
        fill: blue.lighten(85%),
        stroke: none,
      )
      // boundary line (not in U)
      line(
        (R * calc.cos(th - 90deg), R * calc.sin(th - 90deg)),
        (R * calc.cos(th + 90deg), R * calc.sin(th + 90deg)),
        stroke: (paint: blue, dash: "dashed"),
      )
      // axes
      line((-R - 0.2, 0), (R + 0.2, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, -R - 0.2), (0, R + 0.2), mark: (end: ">"), stroke: 0.5pt)
      content((R + 0.2, 0), $op("Re")$, anchor: "west", padding: 0.1)
      content((0, R + 0.2), $op("Im")$, anchor: "south", padding: 0.1)
      // unit circle, with the arc S^1 inter U highlighted
      circle((0, 0), radius: 1, stroke: (paint: gray, dash: "dotted"))
      arc((0, 0), start: th - 90deg, stop: th + 90deg, radius: 1, anchor: "origin", stroke: 1.5pt + blue)
      // the disk B(w/|w|, sqrt 2) that cuts out that arc
      circle(u, radius: calc.sqrt(2), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      // points
      line((0, 0), (calc.sqrt(2) * u.at(0), calc.sqrt(2) * u.at(1)), stroke: 0.6pt)
      circle(u, radius: 0.05, fill: black)
      content(u, $w / abs(w)$, anchor: "north-west", padding: 0.12)
      circle((calc.sqrt(2) * u.at(0), calc.sqrt(2) * u.at(1)), radius: 0.05, fill: black)
      content((calc.sqrt(2) * u.at(0), calc.sqrt(2) * u.at(1)), $w$, anchor: "south-west", padding: 0.1)
      circle((0, 0), radius: 0.06, fill: white, stroke: 0.8pt)
      arc((0, 0), start: 0deg, stop: th, radius: 0.45, anchor: "origin", stroke: 0.5pt)
      content((0.6 * calc.cos(th / 2), 0.6 * calc.sin(th / 2)), $theta$)
      content((R * 0.55 * calc.cos(th - 50deg), R * 0.55 * calc.sin(th - 50deg)), text(fill: blue)[$U$])
    }),
    caption: [Let $w = 1 + i$. Then $U$ is shown.],
  )

  We have the following inverse image for $U$.
  $ f^(-1)(U) := union.sq.big_(k in ZZ) RR times (theta + 2pi k - pi/2, theta + 2pi k + pi/2). $



  #figure(
    canvas({
      import cetz.draw: *
      let th = calc.pi / 4 // w = 1 + i
      let sy = 0.32 // vertical scale
      let X = 2.6
      let (ylo, yhi) = (-2.4 * calc.pi, 2.6 * calc.pi)
      let clampy(y) = calc.max(ylo, calc.min(yhi, y))
      for k in (-1, 0, 1) {
        let a = clampy(th + 2 * calc.pi * k - calc.pi / 2)
        let b = clampy(th + 2 * calc.pi * k + calc.pi / 2)
        // strip: open, so dashed edges
        rect((-X, a * sy), (X, b * sy), fill: blue.lighten(85%), stroke: none)
        for e in (a, b) {
          if e > ylo and e < yhi {
            line((-X, e * sy), (X, e * sy), stroke: (paint: blue, dash: "dashed"))
          }
        }
        // centre line Im z = theta + 2 pi k, which exp sends onto the ray through w
        let c = th + 2 * calc.pi * k
        line((-X, c * sy), (X, c * sy), stroke: (paint: blue, thickness: 0.5pt, dash: "dotted"))
        content((X - 0.15, c * sy), text(fill: blue, size: 8pt)[$k = #k$], anchor: "south-east", padding: 0.05)
      }
      // axes
      line((-X - 0.2, 0), (X + 0.3, 0), mark: (end: ">"), stroke: 0.5pt)
      line((0, ylo * sy - 0.2), (0, yhi * sy + 0.3), mark: (end: ">"), stroke: 0.5pt)
      content((X + 0.3, 0), $op("Re")$, anchor: "west", padding: 0.1)
      content((0, yhi * sy + 0.3), $op("Im")$, anchor: "south", padding: 0.1)
      // ticks on the imaginary axis
      for (y, lbl) in (
        (-calc.pi / 4, $-pi/4$),
        (3 * calc.pi / 4, $(3pi)/4$),
        (2 * calc.pi, $2pi$),
        (-2 * calc.pi, $-2pi$),
      ) {
        line((-0.07, y * sy), (0.07, y * sy), stroke: 0.5pt)
        content((-0.1, y * sy), text(size: 8pt, lbl), anchor: "east", padding: 0.05)
      }
      content((-X + 0.1, yhi * sy), $dots.v$, anchor: "north-west")
      content((-X + 0.1, ylo * sy), $dots.v$, anchor: "south-west")
    }),
    caption: [$exp^(-1)(U)$ for $w = 1 + i$ ($theta = pi/4$): the disjoint open horizontal strips $op("Im")(z) in (theta + 2 pi k - pi/2, theta + 2 pi k + pi/2)$, each of height $pi$, shown for $k = -1, 0, 1$. The dotted centre line goes onto the ray through $w$.],
  )

  Much like section 1, $f$ is injective and surjective. The inverse $U -> RR times U_k$ is given by $w -> log(abs(w)) + i g_k(z)$ everything is continuous and behaves nicely

]

#problem(num: "3.3")[
  Let $P(z) = a_0 + a_1 z + dots$ and $Q(z) = b_0 + b_1 z + dots$ be polynomials with complex coefficients. Show that if $P(z) = Q(z)$ for all $z$, then $a_0 = b_0$, $a_1 = b_1$, etc.
]
#solution[
  $P(x) - Q(x) = 0$ everywhere. Then we see that $(P - Q) prime = 0 => P - Q$ is a constant and hence $0$. Thus $ (P - Q)(x) = sum_(k = 0)^(n) (a_k - b_k)x^k = 0. $ We know that $(P - Q)(0) = 0 => a_0 - b_0 = 0$. Then keep taking successive derivatives hence $P^((k))(0) = k! (a_k - b_k) = 0 => a_k = b_k$.

]

#problem(num: "3.4")[
  Let $U subset.eq CC$ be open and $z_0 in U$. Suppose $f: U -> CC$ is differentiable at $z_0$ and $f(z_0) != 0$. Prove directly from the definitions that there is a neighborhood $V$ of $z_0$ such that $g(z) = 1 / f(z)$ is defined on $V$, that $g$ is differentiable at $z_0$, and that
  $ g'(z_0) = -(f'(z_0)) / (f(z_0)^2). $
  _Hint:_ do not apply the quotient rule; establish this special case directly.
]
#solution[
  Note that $g$ is continuous at $z_0$. $forall epsilon > 0$, let $delta_1 > 0$ such that $ abs(z - z_0) < delta_1 => abs(1/f(z_0) - 1/f(z)) < (epsilon abs(f(z_0))) / (2 (abs(f prime (z_0)) + 1)). $ Let $delta_2 > 0$ such that $ abs(z - z_0) < delta_2 => abs(f(z) - f(z_0)) < (abs(f(z_0))) / (2) => abs(f(z)) >= (abs(f(z_0))) / (2) $
  Let $delta_3 > 0$ such that $ abs(z - z_0) < delta_3 => abs((f(z) - f(z_0)) / (z - z_0) - f prime (z_0)) < (epsilon abs(f(z_0))^2) / (4). $ Let $delta = min(delta_1, delta_2, delta_3)$. Thus if $abs(z - z_0) < delta$ then all three bounds are correct. Thus $ abs((g(z) - g(z_0)) / (z - z_0) + (f prime (z_0)) / (f(z_0))^2) &= abs((f(z_0) - f(z)) / (f(z) f(z_0) (z - z_0)) + (f prime (z_0)) / (f(z_0))^2) \ &= 1/abs(f(z_0)) abs((f prime (z_0)) / (f(z_0)) - (f(z) - f(z_0)) / (f(z) (z - z_0))) \ &<= abs(f prime (z_0))/abs(f(z_0)) abs(1 / (f (z_0)) - (1) / (f(z))) + 1 / (abs(f(z_0)) abs(f(z))) abs((f(z) - f(z_0)) / (z - z_0) - f prime (z_0)) \ &< abs(f prime (z_0))/abs(f(z_0)) dot (epsilon abs(f(z_0))) / (2 (abs(f prime (z_0)) + 1)) + 2 / abs(f(z_0))^2 dot (epsilon abs(f(z_0))^2) / 4 \ &< epsilon / 2 + epsilon / 2 = epsilon, $ where in the third line we split $(f prime (z_0)) / (f(z_0)) - (f(z) - f(z_0)) / (f(z) (z - z_0)) = f prime (z_0) (1 / f(z_0) - 1 / f(z)) + 1 / f(z) (f prime (z_0) - (f(z) - f(z_0)) / (z - z_0))$, and in the fourth we used $abs(f(z)) >= abs(f(z_0)) / 2$ from $delta_2$. Since $epsilon > 0$ was arbitrary, $g$ is differentiable at $z_0$ with $g prime (z_0) = -(f prime (z_0)) / (f(z_0))^2$. Finally, $delta_2$ does not depend on $epsilon$, so $V := B(z_0, delta_2) inter U$ is a neighborhood of $z_0$ on which $abs(f) >= abs(f(z_0)) / 2 > 0$, hence $g = 1 / f$ is defined on $V$.
]

#problem(num: "3.5")[
  Let $U subset.eq CC$ be a region and $u: U -> RR$ harmonic. Suppose $v$ and $w$ are harmonic conjugates of $u$ on $U$. Show that $v - w$ is constant on $U$.
]
#solution[

]

#problem(num: "3.6")[
  Let $U subset.eq CC$ be a region and $f in cal(H)(U)$. Using the Cauchy–Riemann equations, show:
  #part[if $op("Re")(f)$ or $op("Im")(f)$ is constant on $U$, then $f$ is constant.]
  #part[if $abs(f)$ is constant on $U$, then $f$ is constant.]
]
#solution[]

#problem(num: "3.7")[
  Let $U, V subset.eq CC$ be open, $h: V -> RR$ harmonic, and $f: U -> V$ holomorphic. Show that $g := h compose f: U -> RR$ is harmonic.
  _Hint:_ you may disregard smoothness issues. To show $Delta g = 0$, use Wirtinger derivatives throughout.
]
#solution[]

#problem(num: "3.8")[
  Let $U subset.eq CC$ be open. A $C^2$ function $s: U -> RR$ is _subharmonic_ if $Delta s >= 0$ on $U$. Show that if $f: U -> CC$ is holomorphic, then $s(z) = log(1 + abs(f(z))^2)$ is subharmonic on $U$.
]
#solution[]

#problem(num: "3.9")[
  Let $u$ be a $C^2$ function on an open subset of $RR^2$, viewed as $u(x, y)$ and, via $x = r cos phi$, $y = r sin phi$, as a function of $(r, phi)$. Subscripts denote partial derivatives.
  #part[Show that $u_r = cos(phi) u_x + sin(phi) u_y$ and $u_phi = -r sin(phi) u_x + r cos(phi) u_y$.]
  #part[Find similar expressions for $u_(r r)$ and $u_(phi phi)$.]
  #part[Using (a) and (b), show that $Delta u = u_(x x) + u_(y y) = u_(r r) + 1/r u_r + 1/r^2 u_(phi phi)$.]
]
#solution[]

// ── Section 4: Path integrals ────────────────────────────────────────────────

#problem(num: "4.1")[
  Let $Omega subset.eq CC$ be convex and $f in cal(H)(Omega)$. Show that if $op("Re")(f') > 0$ on $Omega$, then $f$ is injective.
]
#solution[]

#problem(num: "4.2")[
  A simple special case of Fubini's theorem.
  #part[Let $[a, b], [c, d] subset.eq RR$ be compact intervals and $F: [a, b] times [c, d] -> CC$ continuous. Show that $x mapsto integral_c^d F(x, y) d y$ and $y mapsto integral_a^b F(x, y) d x$ are continuous on $[a, b]$ and $[c, d]$ respectively.]
  #part[Show that $ integral_a^b (integral_c^d F(x, y) d y) d x = integral_c^d (integral_a^b F(x, y) d x) d y. $]
  _Hint:_ the integrals exist by (a). The identity holds for constant $F$; derive the general case by subdividing the rectangle into small rectangles and approximating $F$ suitably.
]
#solution[
  *(a)* The argument is symmetric for both $x$ and $y$. It suffices to show one. Note the following bounds,  $ abs(integral_(a)^(b) F(x, y) dif x - integral_(a)^b F(x, y_0) dif x) & = abs(integral_a^b (F(x, y) - F(x, y_0)) dif y) \
                                                                       & <= integral_a^b abs(F(x, y) - F(x, y_0)) dif x. $ This last thing would be an issue but we know that $F$ is a continuous function over a compact set and thus is uniformly continuous. Thus $forall epsilon > 0$ there exists a $delta > 0$ such that if two points are within delta of each other $abs(F(arrow(x)) - F(arrow(y))) < epsilon/(b-a)$. Thus for all $abs(y - y_0) < delta$ we have that $ abs(integral_a^b F(x, y) dif x - integral_(a)^b F(x, y_0) dif x) & < epsilon $ thus we have uniform cont.

]

#problem(num: "4.3")[
  Let $alpha, beta: [0, 1] -> CC$ be piecewise smooth paths and $G: alpha^* times beta^* -> CC$ continuous. Show that
  $ integral_alpha (integral_beta G(z, w) d w) d z = integral_beta (integral_alpha G(z, w) d z) d w. $
  _Hint:_ use Problem 4.2 to show that these integrals exist and are equal.
]
#solution[]
