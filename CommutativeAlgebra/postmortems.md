# Postmortems

Covers both `Homework/` and `Problems/` — the heading names the scope (a pset like "HW1", or a chapter/section/exercise range for `Problems/main.typ`).

## 2026-09-26 — HW1
**Struggled with:** None — came together cleanly, no real snags.
**Skipped:**
- None — single-problem set, fully written up.
**Alternative approaches:**
- Problem 1 (finite-dim domain algebra over a field is a field) — went with the linear-algebra route ($\phi_a$ injective $\Rightarrow$ surjective on the finite-dim space). Didn't consider the minimal-polynomial route ($k[a]$ finite-dim, domain forces the min poly irreducible, so $k[a]$ is a field). Both lean on finite-dimensionality "running out of room," but the min-poly argument generalizes more directly to finite domain extensions of a field — worth having in the back pocket for later problems of that shape.
**Notes:** No hints needed this set, so nothing in `struggles.md` — first homework, clean start.

## 2026-09-26 — Ex. 1 (Rings and Ideals: nilpotent ⟹ 1+x unit)
**Struggled with:** Nothing conceptually blocking. Approached it by computing Jordan block inverses (2x2, 3x3, 4x4) via matrix calculator to spot the alternating-sign pattern, then wrote the explicit finite geometric series computation for a generic ring — a "small cases → guessed closed form → general proof" strategy. Ring/module theory background is still light, but that was the right constraint here, not a gap: Ex. 1 is meant to be reachable with nothing but the definitions.
**Left unproved:**
- none — both parts (1+x unit; unit + nilpotent = unit) are proved.
**Alternative approaches:**
- Ex. 1 — didn't reach for a Jacobson-radical framing, and correctly so at this point in the book (no such machinery yet). Conceptually, though: this exercise is the base case of a general phenomenon — nilradical ⊆ Jacobson radical, and adding any Jacobson-radical element to a unit gives back a unit ("units are stable under perturbation by radical noise"). Worth keeping as thematic context, not yet as a technique.
**Notes:** Matrix-calculator-assisted pattern spotting on small explicit cases, then generalizing, is a good go-to move for problems that are secretly "invert/bound this finite computation." Discussion note: keep future debriefs conceptual-only when connecting to later material — Arham is treating the exercise sequence like a story and doesn't want specific upcoming exercises or hints named, though thematic/conceptual framing (e.g. Jacobson radical above) is welcome.

## 2026-09-27 — Ex. 2–3 (units/nilpotents/zero-divisors/primitivity in A[x]; several indeterminates)
**Struggled with:** Only the logged hint on 2(i)'s forward direction (double induction on cross-terms of fg); nothing else surfaced on 2(ii)-(iv) or Ex. 3.
**Left unproved:** None — all parts written up.
**Alternative approaches:**
- Ex. 2(i)/(ii) — computational double-induction proof works, but there's a shorter route once you have nilradical = intersection of all primes (A-M Prop 1.8, not yet covered): image of f in (A/𝔭)[x] over the domain A/𝔭 forces top coefficients into every prime. Not a miss — that tool wasn't available yet. Keeping the direct proof as intended for now; worth a note once the nilradical section is read.
- Ex. 3 — induction via A[x_1,...,x_r] ≅ A[x_1,...,x_{r-1}][x_r] is already the clean standard approach.
**Notes:** Retracted an initial "trend" claim (computation-over-structure, echoing HW1 Problem 1) — doesn't hold up since the structural tool wasn't yet available here, unlike HW1. One instance isn't a pattern.

**Addendum:** Tried $\mathbb{Z}[x]$ as a test case for 2(i) before writing the induction, expecting it to illustrate the unit characterization — got only $\pm 1$ and didn't find it illuminating. Diagnosis: $\mathbb{Z}$ is reduced (no nontrivial nilpotents), so it's a degenerate test case for a theorem that's precisely about nilpotent coefficients — the interesting content can't show up. A ring with visible nilpotents ($\mathbb{Z}/4\mathbb{Z}$, or $k[t]/(t^2)$) would have surfaced the shape of the answer directly (e.g. $1+2x$ a unit in $(\mathbb{Z}/4)[x]$ since $(1+2x)(1-2x)=1-4x^2=1$). Generalizable habit: when testing a conjecture about a specific kind of element (nilpotents, zero-divisors, idempotents), pick a ring where that kind of element actually shows up nontrivially — not just the first familiar ring on hand.
