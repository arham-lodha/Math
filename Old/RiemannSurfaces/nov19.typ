#import "@preview/lemmify:0.1.8": *

// 1. Setup Theorems (Aliased for Speed)
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
#show math.equation: set text(font: "New Computer Modern Math")
#set heading(numbering: "1.")
#set par(justify: true)

// --- SPEED ALIASES ---
#let thm = theorem
#let prop = proposition
#let def = definition
#let pf = proof
#let rem = remark

// --- RIEMANN SURFACE SHORTCUTS ---

// Operators
#let del = $partial$
#let dbar = $overline(partial)$
#let Lap = $Delta$
#let to = $-> #h(0.5em)$ // Better spacing for maps

// Forms & Spaces
#let Om(n) = $Omega^(#n)$
#let Oc(n) = $Omega_c^(#n)$ // Compact support
#let Coo = $C^infinity$

// Text shortcuts (Use sparingly, can break formatting flow)
#let sconn = "simply connected"
#let conn = "connected"
#let cpt = "compact"
#let st = "such that"


= Nov 19, 2025

The Laplacian is defined as $Lap = 2 i del dbar: Om(0)(S) -> Om(2)(S)$.

If we take local coords $z = x + i y$, then:
$ Lap = -((del^2)/(del x^2) + (del^2)/(del y^2)) $

Note that $Lap$ is *intrinsic* to the surface $S$.

Consider Poisson's equation: $Lap u = rho$.
For $S$ #cpt, we need $integral_S rho = 0$ to have a solution (by Stokes' Theorem). Solutions are unique up to a constant.

> *Note:* We need this for the Hodge Theorem. All of Chapter 3 rests on Hodge.

#thm(name: "Poisson 1")[
  If $S$ is #cpt, #conn, and $integral_S rho = 0$, then there exists $u$ #st $Lap u = rho$.
]<Poisson1>

#thm(name: "Poisson 2")[
  If $S$ is #sconn and non-#cpt:
  $forall rho in Oc(2)(S)$ with $integral_S rho = 0$, $exists$ solution $u$ to $Lap u = rho$ #st $u -> 0$ at infinity.

  Formally: $forall epsilon > 0, exists$ #cpt $K_epsilon subset S$ #st
  $ x in S without K_epsilon => abs(u(x)) <= epsilon $
]<Poisson2>

#thm(name: "Uniformization")[
  If $S$ is #sconn, then $S$ is isomorphic ($tilde.equiv$) to $SS^2$, $CC$, or $DD$.

  Consequently, any #conn $S$ is a quotient of $SS^2, CC, DD$ by a group of Automorphisms acting freely.
]<uniformization>

@Poisson1 and @Poisson2 imply @uniformization.

= Explicit methods

Classical setup - $gradient^(2) u = rho$ where $rho$ is a function in $RR^(2)$. It describes:

- Electrostatics: $rho$ is a charge distribution and $u$ would be the electric potential and $E = gradient rho$ . Gauss's law $gradient dot E = rho => gradient^(2) u = rho$ which is Poisson's Equation.
- In gravitation: $rho$ - mass distribution and $u$ - gravitational potential

#theorem(name: "Green's Identities")[
  On Riemann surface $S$, $Delta = 2 i del overline(del)= d compose d^(c)$ where $ d^(c) f & = J(dif f) = J(del_(x) f dif x + del_(y) f dif y) \
          & = (del_(x) f) J dif x + (del_(y) f)J dif y \
          & = (-del_(x) f) dif y + (del_(y) f) dif x $ where $J$ is the complex structure.

  Let $Omega subset S$ domain with #sconn boundary (closure of a open in $S$ where boundary is a 1 manifold). Let $f, g in Coo$ on a neighborhood of $Omega$. If one has compact support then $     integral_(Omega) f Delta g & = integral_(del Omega) f dif g - integral_(Omega) dif f and dif^(c) g " (G1)" \
  integral f Delta g - g Delta f & = integral_(Delta Omega) f dif^(c) g - g dif^(c) f                            & "(G2)" $
]<greenidenties>
#proof[
  G1 apply stokes to $dif(f dif^(c) g) = dif f and dif^(c) g + f dif dif^(c) g g$. G2 apply G1 twice and subtract.
]

== Explicit solutions

#example[
  $ T^(2) = RR^(2) / ZZ^(2) = (CC^(2))/(ZZ + ZZ i) $

  We will use Fourier series, let $e(m, n) = exp(2 pi i (m theta_(1) + n theta_(2)))$

  $ rho = sum_((m, n) in ZZ^(2)) rho_(m, n) e(m, n) dif x and dif y $ since $rho in Coo => hat(rho) -> 0$ faster than polynomial. Set $ u = sum_((m , n) in ZZ^(2))^() u_(m, n) e(m, n). $ Apply Laplacian and you get $4 pi (m^(2) + n^(2)) u_(m, n) = rho_(m, n).$ You need $rho_(0, 0) = 0$ so $integral rho = 0$.

  Thus $ u = sum_((m, n) in ZZ^(2))^() (rho_(m, n))/(4 pi (m^(2) + n^(2))) e(m, n) $ is a solution.
]

#example(name: [The case of $CC$.])[
  Introduce the Coulomb potential $ V(z) = (1)/(4 pi) log abs(z)^(2) $ is the potential for the point charge. It is singular at the origin, and away from the origin

  $ overline(del) log abs(z)^(2) = overline(del) log(z overline(z)) = (z)/(z overline(z)) dif overline(z) = (1)/(overline(z)) dif overline(z) $ then $ del del V(z) = del (1)/(overline(z)) dif overline(z) = 0 => Delta V = 0 $

  Then for $f in Coo$ $   integral_(CC) V Delta f & = lim_(epsilon -> 0) integral_(R_(epsilon)) V Delta f \
                            & =_("G2") lim_(epsilon -> 0) - integral_(R_(epsilon)) f dif^(c) V - V dif^(c) f \
                            & = lim_(epsilon -> 0)(1)/(2 pi) integral_(0)^(2pi) f(epsilon e^(i theta)) dif theta \
                 => Delta V & = delta_(0) dif x and dif y \
  => integral Delta f dot V & = f(0) $.


  Since $Delta$ is linear, you can take linear combinations of solutions.

  Thus if $rho = sum_(j = 1)^(N) rho_(j) delta_(a_(j)) dif x and dif y$ then you can get a solution $u = sum_()^() rho_(j) V(z - a_(j))$. But $rho$ is still singular. For general $rho in Oc(2)(CC)$ put $ U(z) = integral_(y_(1), y_(2) in CC) rho(y) V(z - y) dif y_(1) and dif y_(2) = rho ast V = V ast rho. $ Thus you have a linear map $Oc(2)(CC) ->^(P) Coo(CC)$ where you take $rho -> V ast rho$ where $Delta compose P = id$

  There is some subtlety. We have to deal with decay at $oo$. $V(z)$ does not decay at $oo$. Take $a != b$, $rho = (delta_(a) - delta_(b)) dif x and dif y$ you get a solution $ P_(rho)(z) = V(z - a) - V(z - b) & = (1)/(2 pi) log abs((z - a)/(z - b)) \
                                   & = (1)/(2 pi) log abs((1 - (a)/(z))/(1 - (b)/(z))) -> 0 $ as $abs(z) -> oo$. If $ integral_(CC) rho = 0 $ then $P_(rho) ->_(abs(z) -> oo ) 0$.

  $
    (P_(rho))(w) & = integral_(z) v(z) rho(z - w) - v(w) rho(z) \
                 & = integral_(zeta) [V(w + zeta) - V(w)] rho(zeta) ->_(abs(w) -> oo) 0
  $
]

You can also write down a solution on $DD$ (hyperbolic).

$
     nu & = dif x and dif y = (1)/(2 i) dif z and dif overline(z) \
  omega & = (nu)/(1 - abs(z)^(2) ) "hyperbolic volume"
$

#example(name: [Solutions on $DD$])[
  On $CC$ we took fundamental solution $V$ replaced by $T_(a)^(ast) V$ where $T_(a)(z) = z + a$ and integrate over $a$. Let $ mu_(a)(z) = (z - a)/(1 - overline(a) z ) in "Aut"(DD) $ and $mu_(a)(a) = 0$ for $a in DD$. Let $G_(a) = mu_(a)^(ast) V$. $ Delta G_(a) & = mu_(a)^(ast) Delta V \
              & = mu_(a)^(ast)(delta_(0) dot omega_(0)) \
              & = delta_(a) omega $

  Thus given $rho$, we can find $u$ in the same way as $CC$. $ u = P_(rho) = integral_(a in DD) G_(a) rho(a) $

  You can check that $integral_(DD) rho = 0$, then $P_(rho) -> 0$ as $abs(z) -> 1$.
]

= Functional Analysis
== Dirichlet Norm on $C^(oo)(S) slash RR$ (smooth mod constant)

Starts life as a hermitian inner product on $Omega^(1, 0)(S)$ ($S$ #cpt #conn). Where $ lr(angle.l alpha, beta angle.r) = i integral_(S) alpha and overline(beta) --> abs(alpha)^(2) = lr(angle.l alpha, alpha angle.r) $

$
  Om(1)(S, CC) & tilde.equiv Omega^(1, 0)(S) \
         alpha & -> alpha^(1, 0) = (1)/(2)(alpha - i alpha compose J)
$

So the hermitian inner product transfers to $Om(1)(S, CC)$. Now for real 1 forms, $Om(1)(S) subset Om(1)(S, CC)$, these acquire a real inner product by restriction. This is the Dirichlet inner product on 1 forms.

#def(name: [Dirichlet Inner Product on $Om(1)$])[
  $
    (alpha, beta)_(D) = i integral_(S) alpha^(1, 0) and overline(beta^(1, 0)) = i integral_(S) alpha^(1, 0) and beta^(0, 1)
  $
]

#def(name: [Dirichlet Inner Product on $Coo(S) slash RR$])[
  $
    (f, g)_(D) = (dif f, dif g)_(D) = i integral_(S) del f and overline(del)g = integral_(S) dif f and dif^(c) g
  $

  Thus $ (f, f)_(D) = i integral_(S) del f and overline(del)f = integral_(S) dif f and dif^(c) f $

  where the integral is locally, $((f_(x))^(2) + (f_(y))^(2)) dif x and dif y$
]

Thus $norm(f)_D$ is a coordinate free way to define the $L^(2)$-norm of the derivative of $f$. Note $C^(oo)(S) slash RR tilde.equiv Coo(S)_(0)$ the mean 0 smooth functions.


== Hilbert Space of Functions on $L^(2)$ derivative

#def(name: "Hilbert Space Completion")[
  Hilbert Space $H_(V)$ where $V subset H_(V)$ dense and inner product extends $V$.

  Standard Construction $ H_(V) = ({"Cauchy Sequences in" V})/({"null sequences" x_(n) -> 0}) $
]

Let $ H = "completion of" Coo(S)_0 "with" lr(angle.l angle.r)_(D) $

== Formal (Weak) solution of Poisson, $S$ #cpt
Green Identity for $u, v in Coo(S)$ $ integral_(S) v Delta u = integral_(S) dif v and dif^(c) u $

The boundary term vanishes because S is compact connected.

$ integral_(S) v Delta u = - i integral_(S) del v and overline(del) u = lr(angle.l u, v angle.r)_(D) $

Thus we have a functional $f_(v): C^(oo)(S)_(0) -> RR$ where $ u -> integral_(S) v Delta u = lr(angle.l v, u angle.r)_(D) $ so then we can extend $f_(v): H -> RR$. We want to find a weak solution $Delta u = rho$ i.e solve "$integral_(S) v delta u = integral v rho$" that is find $u$ s.t $ lr(angle.l u, v angle.r)_(D) = integral_(S) v rho "for all" v in Coo(S)_(0) $

To find the weak solution, use Riesz Lemma (Riesz Representation Theorem).

#lemma(name: "Riesz Lemma")[
  $cal(H)$ is a Hilbert space and $lambda: cal(H) -> RR$ bounded linear map then there exists unique $u in cal(H)$ such that $ lambda(dot) = lr(angle.l u, dot angle.r) $
]<RieszLemma>

We have a functional $hat(rho): Coo(S)_(0) -> RR$ where $ v -> integral_(S) v rho. $ We need to show that $hat(rho)$ is bounded to show that extends continously to $hat(rho): H -> RR$. Then by @RieszLemma we can get $hat(rho) = (u, dot)_(D)$. But we don't know that $u$ is smooth so we need to prove that after because then we would get Poisson's equation. Thus we need:

1. $hat(rho)$ is bounded ie $exists C_(rho) > 0$ such that $ abs(integral_(S) v rho) <= C_(rho) norm(v)_(D)^(2) $
2. Weyl's lemma: A weak solution to Poisson's equation is actually $Coo$ and therefore satisfies $Delta u = rho$

Proof of 1 uses the idea that the value of a function is the integral of the derivative.

#lemma[
  $
    abs(v(x) - overline(v)_(Omega)) <= ("diam"(Omega))/(2 "Area"(Omega)) integral_(Omega) (abs((gradient v) (y)) )/(abs(x - y)) dif y_1 dif y_2
  $
]
#proof[
  Preliminary reductions are:

  1. WLOG $x = 0$.
  2. Add constant functions to $v$ so WLOG $v(0) = 0$

  So what we want to show

  $
    abs(integral_(S) v(y) dif y_1 dif y_2) <= (1)/(2) "diam"(Omega)^(2) integral (abs((gradient v)(y)) )/(abs(y) ) dif y_1 dif y_2 = (1)/(2) "diam"(Omega)^(2) (K ast g)
  $

  where $ K(x) = cases((1)/(abs(x)) "where" 0 < abs(x) < "diam"(Omega), 0 "else") $

  and $ g(y) = cases(abs(gradient v(y)) "where" y in Omega, 0, "otherwise") $

  We estimate $overline(v)_Omega$ this calculating in polar coordinates.
]

#theorem[
  Let $Omega$ be a bounded convex domain in $RR^(2)$. $rho$ is a $2$-form on $Omega$ #cpt support and integral 0. $v in Coo(Omega)$ has mean value $ overline(v)_(Omega) = (1)/("area" Omega) integral_(Omega) dif x dif y. $ Then

  $ abs(integral_S (v - overline(v)) rho) <= C_(rho) norm(gradient v)_(2) $

]<localanalgoueof1>
#proof[
  $
    abs(integral_(Omega) (v - overline(v)_(Omega)) rho) &<= integral_(Omega) abs(v - overline(v)_Omega) abs(tilde(rho)) dif dif y \
    &<=_("C.S") norm(tilde(rho))_(L^(2)) norm(v - overline(v)_Omega)_(L^(2)) \
    &<= norm(tilde(rho))_(L^(2)) norm(k)_(L^(1)(Omega)) norm(g)_(L^(2)(Omega)) = norm(tilde(rho))_(L^(2)) norm(k)_(L^(1)(Omega))
  $
]

#proof(name: [Boundedness of $hat(rho)$])[
  @localanalgoueof1 is a local analogue. You work over charts.

  If $rho$ is supported in a single chart $Omega$, apply the argument above. If $rho$ is supported in multiple charts, use partitions of unity to go from local to general.
]

#definition[
  A function $phi: S -> RR$ is locally $L^(2)$ if $exists$ cover of $S$ by opens $Omega_(j) -> S$ $i_(j)$ holomorphic such that $forall j$, $i_(j)^(ast) phi in L^(2)(Omega_(j))$.
]

#lemma[
  $forall [(phi_(k))] subset H$, $exists$ a sequence of constants $(c_(k))$ and a locally $L^(2)$ function $phi$ such that $forall j$

  $ norm(i_(j)^(*)(phi_(k) + c_(k)) - i_(j)^(*) phi)_(L^(2)(Omega)) ->_(k -> 0) 0 $
]
#proof[
  The subtle point is seeing that $c_(k)$ are the same for all $Omega_(j)$ simultaneously.
]

Take a weak solution $u in H$. By definition, $u = [(phi_(k))]$ where $(phi_(k))$ is a Cauchy sequence $Coo(S) slash RR$ in Dirichlet norm. But we want to represent $u$ as an actual function $phi$ on $S$ (take limit of the sequence). Thus if $u$ locally $L^(2)$.


#lemma(name: "Weyl's Lemma")[
  $Omega subset CC$ bold open, $rho$ a 2 form on $Omega$ and $u in L^(2)(Omega)$ such that $ integral_(Omega) u Delta v = integral_(Omega) v rho $ for all $v in Coo_(c)(S)$.
]

#prop[
  Let $cal(W)(Omega, rho)$ be the statement of Weyls lemma for $(Omega, rho).$ $forall Omega prime$, $cal(W)(Omega prime, 0) => cal(W)(Omega, rho)$
]

#proof(name: "Weyl's Lemma")[

]
