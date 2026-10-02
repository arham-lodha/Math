#import "template.typ": *

#show: homework.with(
  course: "Math 215A",
  assignment: "Homework 1",
  name: "Arham Lodha",
  due: "September 28, 2026",
)

Rings are understood to be commutative, unless stated otherwise.

#problem[
  Let $R$ be an algebra over a field $k$. If $R$ is a domain and $R$ has finite dimension as a $k$-vector space, then $R$ is a field.
]
#proof[$forall a in R \/ {0}$, let $phi_a: R -> R$ where $x -> a x$, note that $phi_a (R) = a R$. Additionally, note the following for all $alpha, beta in k$ we have that $phi_a (alpha x + beta y) = a(alpha x + beta y) = alpha a x + beta a y = alpha phi_a (x) + beta phi_a (y)$. Hence $phi in End_(k)(R).$ $forall k in ker phi_a$, $0 = phi_a (k) = a k$. Since $R$ is a domain and $a != 0$, $k = 0$. Thus $ker phi_a = {0}$ and $phi_a$ is injective. Since $R$ is finite dimensional as a $k$-vector space, any injective linear endomorphism must also be surjective. Thus $R subset phi_a (R) = a R$. Now consider any nonzero ideal $I$, $exists a in I$ nonzero, thus $R subset.eq a R subset.eq I subset.eq R => I = R$. Thus the only ideals of $R$, are $0$ and $R$. Hence $R$ is a field.
]
