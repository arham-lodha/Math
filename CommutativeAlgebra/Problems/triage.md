# Atiyah–Macdonald exercise triage

Numbering matches `main.typ` (= the book's chapter/exercise numbers). Written 2026-10-11.

**Goals:** (1) UCLA algebra qual soon; (2) Totaro's Math 215A; (3) long term rep theory / AG.

**Tags**
- **Q**: do now. Qual syllabus (rings/modules, localization, Nakayama, tensor, chain conditions, radicals, Zariski topology, Nullstellensatz, integral extensions, Dedekind/DVR) and/or a result later chapters use.
- **C**: do after the qual, or when Totaro's class gets there. Worth doing, not urgent.
- **S**: skip or skim. Counterexamples, special topics, or off the syllabus. Revisit only if a later proof needs it.

Judgments are from the statements alone (I haven't solved these), so re-tag freely. Anything marked "needed for" is a real dependency.

**Qual cross-references (added 2026-10-11).** Notes marked "Qual:" list past UCLA quals (from `../../Algebra/qual/ucla_algebra_quals.tex`, "Term Year #N") that use the same ideas. Matched on statement and technique only; some quals need extra steps beyond the exercise. Spring 2021+ exams are hidden in the compilation and not covered. Tags promoted C→Q because of a qual hit: 2.20–2.21, 3.23–3.24, 5.14–5.15, 5.20–5.21, 7.18–7.19.

## Suggested order
1. Finish Ch 1–3 Q's (nearly there).
2. Ch 6 → 8 → 7 → 5 → 9 (Q's only).
3. Alternate with qual material outside AM: PIDs/UFDs, Gauss/Eisenstein, PID module structure, canonical forms, exterior powers, duality, noncommutative (Artin–Wedderburn, semisimple, Jacobson radical, group rings, CSAs). See `../../Algebra/`.
4. After the qual: C's by chapter as the class reaches them, then Ch 10, then S's if curious.

---

## Ch 1: Rings and Ideals
| Ex | Tag | Note |
|---|---|---|
| 1.1–1.5 | Q | units/nilpotents/Jacobson in `A[x]`, `A[[x]]`. 1.3 is quick once 1.2 is done. Qual: Spring 2001 B1, Spring 2013 #5, Spring 2002 #2, Fall 2001 R3, Fall 2002 #3. |
| 1.6 | C | Jacobson = nilradical under idempotent hypothesis; niche. |
| 1.7–1.10 | Q | prime = max when `x^n = x`; minimal primes (Zorn); radical = ∩ primes; one-prime rings. Qual: Spring 2012 #8 (1.10), Fall 2000 B2, Fall 2001 R2. |
| 1.11 | Q | Boolean rings: qual favorite. |
| 1.12 | Q | 30 seconds. |
| 1.13 | C | Artin's algebraic closure construction. |
| 1.14 | Q | zero-divisors = ∪ primes. Needed for 3.9. Qual: Fall 2002 #1. |
| 1.15–1.17 | Q | `V(E)`, pictures of Spec, basic opens `X_f`. Core. Qual: Fall 2007 R2, Fall 2019 #3, Fall 2020 #8. |
| 1.18 | C | notation. |
| 1.19 | Q | Spec irreducible ⇔ nilradical prime. |
| 1.20 | C | irreducible components. Needed for 6.7. |
| 1.21–1.22 | Q | `φ*` continuity; idempotents ⇔ disconnectedness. |
| 1.23–1.25 | S | Boolean spectra, Stone duality. |
| 1.26 | C | Max-spec, `C(X)`. |
| 1.27 | Q | varieties and `I(X)`; sets up the Nullstellensatz. Qual: Fall 2019 #3, Spring 2007 #3. |
| 1.28 | C | polynomial maps/coordinate ring (AG groundwork). |

## Ch 2: Modules
| Ex | Tag | Note |
|---|---|---|
| 2.1–2.5 | Q | tensor basics, Nakayama over local rings, flat direct sums, `A[x]` flat. |
| 2.6 | C | `M[x] = M ⊗ A[x]`. Needed for 7.10 (itself Q), so do it then. |
| 2.7–2.12 | Q | `p[x]` prime, flat tensor/base change, f.g. extensions, Nakayama-type surjectivity, `A^m ≅ A^n`, kernel of a surjection onto `A^n`. |
| 2.13 | C | `N → B ⊗ N` injective when `B` is faithfully flat. |
| 2.14–2.16 | C | direct limits: do only if you want the foundations. |
| 2.17–2.19 | S | direct systems; mechanical. |
| 2.20–2.21 | Q | tensor commutes with direct limits. Qual: Fall 2019 #5 asks exactly this. |
| 2.22–2.23 | S | |
| 2.24–2.26 | C | Tor/flat criteria; useful for AG, not on the qual. |
| 2.27–2.28 | S | absolutely flat (von Neumann regular) rings. |

## Ch 3: Fractions
| Ex | Tag | Note |
|---|---|---|
| 3.1–3.5 | Q | core localization. Qual: Spring 2016 #4, Spring 2017 #5, Fall 2010 #7, Winter 2005 C1. |
| 3.6–3.7 | Q | minimal primes via Zorn; saturated sets. Qual: Fall 2018 #5(a) (3.7). |
| 3.8 | C | |
| 3.9 | Q | minimal primes ⊆ zero-divisors. |
| 3.10–3.11 | S | absolutely flat. |
| 3.12–3.15 | Q | torsion, local-to-global freeness checks, "n generators of `A^n` form a basis". Qual: Fall 2017 #6, Spring 2012 #3, Spring 2019 #4. |
| 3.16–3.18 | C | faithfully flat, going-down machinery. Needed for 5.11, 7.12. |
| 3.19–3.21 | Q | support, contracted/extended primes, `Spec(S⁻¹A)` embedding. |
| 3.22 | C | |
| 3.23–3.24 | Q | structure presheaf/sheaf on `Spec`. Revisit before AG. Qual: Spring 2019 #9 (`R = R[1/a] ∩ R[1/b]`). |
| 3.25–3.30 | S | fibre products of spectra, constructible topology. |

## Ch 4: Primary decomposition
Mostly C: the qual syllabus says "radicals", not primary decomposition.

| Ex | Tag | Note |
|---|---|---|
| 4.1–4.2 | C | components; radical ideals have no embedded primes. |
| 4.3 | S | |
| 4.4–4.5 | C | standard examples (`(4,t)` in `Z[t]`; `(x,y)(x,z)`). |
| 4.6 | S | |
| 4.7–4.8 | Q | primes/primaries in `A[x]` (polynomial rings); light. |
| 4.9–4.14 | C | zero-divisors, `S_p(0)`, saturation, symbolic powers, associated primes. |
| 4.15–4.19 | S | |
| 4.20–4.23 | S | primary decomposition of modules. |

## Ch 5: Integral dependence and valuations
| Ex | Tag | Note |
|---|---|---|
| 5.1–5.2 | Q | integral ⇒ closed map on Spec; extend homs to `Ω`. |
| 5.3–5.4 | C | base change, localization counterexample. |
| 5.5 | Q | units and Jacobson radical under integral extensions. |
| 5.6–5.7 | C | |
| 5.8–5.9 | Q | monic factors; `C[x]` is the integral closure of `A[x]`. |
| 5.10–5.11 | C | going-up/down properties; flat ⇒ going-down. |
| 5.12–5.13 | Q | invariants `A^G`: integrality and transitivity (rep theory link). |
| 5.14–5.15 | Q | Galois action on integral closure. Qual: Fall 2018 #6, Fall 2019 #9 (both also need a trace-form / explicit argument not in AM). |
| 5.16–5.19 | Q | Noether normalization, weak Nullstellensatz. Qual: Fall 2010 #8, Fall 2019 #3, Spring 2007 #3. |
| 5.20–5.21 | Q | generic-freeness-type results. Qual: Fall 2019 #8 (`M[1/u]` free). |
| 5.22–5.25 | C | Jacobson rings. Totaro covers Nullstellensatz at this level. |
| 5.26 | S | |
| 5.27–5.28 | C | valuation rings exist; characterization by ideal chains. |
| 5.29–5.35 | S | value groups, isolated subgroups, valuative criterion. |

## Ch 6: Chain conditions
| Ex | Tag | Note |
|---|---|---|
| 6.1–6.4 | Q | Noetherian/Artinian modules (Fitting-type: surjective ⇒ iso). Qual: Spring 2020 #10 (with Cayley–Hamilton), Fall 2014 #8, Fall 2013 #6 (via Prop 6.3), Spring 2018 #7. |
| 6.5–6.9 | Q | Noetherian spaces, finiteness of components, minimal primes. |
| 6.10 | C | |
| 6.11 | S | |
| 6.12 | C | |

## Ch 7: Noetherian rings
| Ex | Tag | Note |
|---|---|---|
| 7.1–7.2 | Q | non-f.g. ideals maximal ⇒ prime; `A[[x]]` nilpotents. |
| 7.3 | C | irreducible ideals. |
| 7.4 | Q | which rings are Noetherian (good qual-style question). |
| 7.5 | C | `B^G` finitely generated (invariant theory). |
| 7.6–7.8 | Q | finitely generated field is finite; `I_0` finite for varieties; `A[x]` Noetherian ⇒ `A`? Also read Prop 7.8 (Artin–Tate). Qual: Fall 2017 #4, Spring 2018 #7, Winter 2005 C3, Fall 2006 R3. |
| 7.9 | C | |
| 7.10–7.11 | Q | `M[x]`; locally Noetherian ⇏ Noetherian. |
| 7.12–7.13 | C | |
| 7.14 | Q | strong Nullstellensatz. Qual: Fall 2010 #8, Fall 2019 #3. |
| 7.15–7.16 | C | flat ⇔ free for f.g. modules over Noetherian local rings. Key for AG. Related: Spring 2012 #3 (Nakayama proves it without this). |
| 7.17 | S | |
| 7.18–7.19 | Q | associated primes, uniqueness of irreducible decomposition. Qual: Spring 2008 R3, Fall 2000 B3 (also see Thm 7.13 and Ch 4 Ex 4.1–4.2). |
| 7.20–7.22 | S | constructible sets in Noetherian spaces. |
| 7.23 | C | Chevalley's theorem. Re-read before AG. |
| 7.24–7.25 | S | |
| 7.26–7.27 | S | Grothendieck groups. |

## Ch 8: Artin rings
| Ex | Tag | Note |
|---|---|---|
| 8.1 | C | |
| 8.2–8.3 | Q | Artinian ⇔ Noetherian + discrete Spec; finite algebras over a field. Qual: Winter 2005 C2, Winter 2002 B1, Spring 2020 #3, Spring 2016 #3. |
| 8.4 | C | |
| 8.5 | S | |
| 8.6 | C | |

## Ch 9: DVRs and Dedekind domains
| Ex | Tag | Note |
|---|---|---|
| 9.1–9.9 | Q | all of it. Short, on the syllabus, and the class covers it. Qual: Spring 2018 #10 (9.1), Fall 2020 #7 (9.7 and CRT 9.9), Spring 2017 #4. |

## Ch 10: Completions
Not on the qual, not in Totaro's outline. Park the whole chapter.

| Ex | Tag | Note |
|---|---|---|
| 10.1–10.8 | S | |
| 10.9–10.10 | C | Hensel's lemma (do before number theory/AG). |
| 10.11 | S | |
| 10.12 | C | `A[[x]]` faithfully flat. |

## Ch 11: Dimension theory
In Totaro's outline, but the qual doesn't need it, so do these when the class gets there.

| Ex | Tag | Note |
|---|---|---|
| 11.1–11.3 | C | smoothness, extension to non-closed `k`. |
| 11.4–11.5 | S | Nagata's example; K-theory reformulation. |
| 11.6–11.7 | C | `dim A[x] = 1 + dim A`. |

---

## Tally
Counted from the tables: 87 Q, 72 C, 58 S (217 exercises tagged) before the qual-driven promotions; after moving 10 exercises C→Q the count is 97 Q, 62 C, 58 S.

Qual problems with no AM counterpart (don't look here): non-commutative rings (Fall 2009 R1/R2, Spring 2010 #9–10, Fall 2010 #9–10), PID/UFD arguments (Fall 2009 C2, Fall 2018 #5(b)), representable functors and adjoints (Fall 2014 #2, Fall 2016 #9, Spring 2016 #2, Fall 2018 #8), plus Fall 2011 #3 (needs Ch 11 material). The Q's are the next couple of months of AM; the rest can wait for the class and for AG.
