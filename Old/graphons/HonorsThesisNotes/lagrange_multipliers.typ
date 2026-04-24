= Lagrange Multipliers

Let $h: [0, 1]^(2) -> RR$ be a bounded symmetric function. We will consider the family of graphons $ g_(s)(x, y) = g(x, y) + s h(x, y) $ where $g$ is a graphon and $s$ is chosen so $0 <= g_(s) <= 1$ for all sufficiently small s. For this change to be reversible, $0 <= g_(s) <= 1$ for all sufficiently small negative $s$.

$
  Delta T := T(g_(s)) - T(g) = 6 integral_([0, 1]^(4)) h(x, y) g(x, z) g(x, z) g(y, z) g(y, w) g(z, w) dif x dif y dif z dif w
$
