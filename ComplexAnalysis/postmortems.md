# Post-Mortem Log

## 2026-10-01 — HW1
**Struggled with:** 1.7(b) — first attempt built a polynomial with roots 1/(ζ_k − 1) directly; got a clean closed form for the a_(n-1) coefficient but couldn't get a nice closed form for a_(n-2), so pivoted to the log-derivative approach (P''(1)P(1) − P'(1)² over P(1)²) that's in the writeup. 2.4(a) — doing ε-δ continuity directly for (z²+3)/(z+1) was painful, so instead proved the general lemma that a product of continuous functions is continuous on the intersection of their domains, then applied it.
**Skipped:**
- 1.1(a) — tedious algebra (done on paper): polar form of −15 − 8i, not transcribed
- 1.1(b) — tedious algebra (done on paper): completing the square
- 1.2(a)/(b)/(c) — tedious (region sketches), done but not transcribed
- 1.9 — understood but didn't want to grind through: the a,b,c,d ↔ α,β bash in (a), the ℂ-linearity condition in (b), det/norm in terms of α,β in (c)
**Notes:** Arham singled out 1.6 (bounding via projection onto the real line, then a naive geometric-series bound to close the contradiction) as a technique he particularly liked — manipulating complex numbers through real-part/magnitude bounds. Worth noticing if more problems in this style come up.

## 2026-10-12 — HW3 #5.3 (single-problem debrief)
**Struggled with:** Treated convergence of an infinite product like convergence of a series: first draft showed $p_k$ monotone decreasing and bounded below by 0, which only gives a limit $\ge 0$. The definition requires a nonzero limit. Also had a false harmonic-sum bound ($H_n \le \log n$) that wasn't needed.
**Resolved:** Rewrote the proof, dropped the bad bound, and bounded $\log p_k$ below via $\int_n^{n+1} dt/t - 1/n = -\int_0^1 t/(n(n+t))\,dt \ge -1/(2n^2)$. Remaining nit: the constant is $\pi^2/12$, not $\pi/12$.
**Skipped:** none for this problem.
**Notes:** Check the textbook's definition of product convergence before 5.4 ($\prod(1-b_n)$ vs $\sum b_n$). The log-integral comparison is worth remembering for $\sum$-vs-$\prod$ problems.
