#import "template.typ": *

#show: homework.with(
  course: "Math 215A",
  assignment: "Homework 9",
  name: "Arham Lodha",
  due: "November 25, 2026",
)

Rings are understood to be commutative, unless stated otherwise.

#problem()[
  Let $k$ be a field. Define $f: AA^2_k -> AA^2_k$ by $f(x, y) = (x, x y)$. (Explain what this means in terms of rings.) Show that the morphism $f$ of affine varieties over $k$ is birational but that there is a non-closed point of $AA^2_k$ which $f$ maps to a closed point. Also, give an example of a morphism of affine schemes which maps a closed point to a non-closed point.
]
#proof[
  Let be a ring map $phi : k[u, v] -> k[s, t]$ where $u -> s$ and $u -> s t$, it induces $f$. Consider $psi: k[s, t] -> k[u, v][1/u] = k[x, y, t]/(t u - 1)$ where $s -> u$ and $y -> v/u$. Thus $psi compose phi$ takes $u -> s -> u$ and $v -> s t -> u v/u = v$. Hence $psi compose phi = id$. Let $theta: k[u, v] -> k[s, t][1/x]$
]

#problem()[
  Let $R$ be an algebra of finite type over a field $k$. Show that $R$ is artinian if and only if $R$ has finite dimension as a $k$-vector space. (Hint: consider the filtration of $R$ constructed in the proof that "artinian" is equivalent to "noetherian of dimension zero (or the zero ring)".)
]
