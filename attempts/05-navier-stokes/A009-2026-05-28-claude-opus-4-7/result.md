# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Executes A008 Patch 2 on G_T1b_1: commits to the **direct $L^p$
energy method** (approach (i), passes statement-level Tao-barrier
audit via the $\nabla \cdot u = 0$ convection cancellation),
sketches the calculation, and finds that the pressure-term
obstruction reduces G_T1b_1 to a new gap **G_T1b_3** (uniform
$L^\infty_t L^\infty_x$ control from $L^\infty_t \mathrm{BMO}^{-1}$
+ smoothness + energy) of equivalent structural difficulty;
cross-checks approach (ii) vorticity, which reduces to a
symmetric **G_T1b_4** (vorticity-direction Lipschitz, equivalent
to Constantin–Fefferman 1993's hypothesis). **Both
non-barrier-blocked direct approaches degenerate** —
substantive negative finding; A005 trigger still does not fire
(criterion (b) achieved); 4 attempts remain in budget.

## Outcome Label

- Label: `partial-insight`
- Reason: Discharges A008's Patch 2 by committing to a specific
  approach and running the proof sketch. The resulting **negative
  finding** (both direct approaches relocate G_T1b_1 rather than
  closing it) is a structural insight that narrows the program's
  remaining options. Identifies two new gap labels (G_T1b_3,
  G_T1b_4) marking the relocation targets. Below
  `novel-approach`; above `survey` (the calculation produces a
  real conclusion, not just a literature review). Not
  `flawed-attempt` — honest about its own limits.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Approach selection (A008 Patch 2)

Three candidates considered:

- **(i) Direct $L^p$ energy method** on $u$ — cleanest expression
  of $\nabla \cdot u = 0$; selected.
- (ii) Vorticity $L^p$ energy method on $\omega$ — also viable;
  cross-checked.
- (iii) Constantin–Fefferman geometric — requires
  vorticity-direction Lipschitz as a *hypothesis*, not available
  from $L^\infty_t \mathrm{BMO}^{-1}$. Does not directly apply.

**Selected: approach (i).**

## 2. Statement-level Tao-barrier audit on approach (i)

The $L^p$ identity gives, after integration-by-parts:

$$
\int |u|^{p-2} u \cdot (u \cdot \nabla u) \, dx
\;=\; \tfrac{1}{p} \int u \cdot \nabla |u|^p \, dx
\;=\; -\tfrac{1}{p} \int (\nabla \cdot u) |u|^p \, dx
\;=\; 0 \quad \text{by } \nabla \cdot u = 0.
$$

This is the **NSE-specific cancellation** that **averaged NSE
does not have**. Approach (i) uses $\nabla \cdot u = 0$
essentially.

**Statement-level audit: PASS.**

## 3. Proof sketch (approach (i))

After convection cancellation:

$$
\frac{d}{dt} \|u\|_{L^p}^p
= -p \int |u|^{p-2} u \cdot \nabla P \, dx
+ p \nu \int |u|^{p-2} u \cdot \Delta u \, dx.
$$

- **Viscous term** ($p \geq 2$): integration by parts gives
  $\leq -p\nu \int |\nabla u|^2 |u|^{p-2} \, dx$ — coercive.
- **Pressure term**: by Calderón–Zygmund on the pressure formula
  $P = -\Delta^{-1} \nabla \cdot \nabla \cdot (u \otimes u)$,
  $\|P\|_{L^p} \lesssim \|u\|_{L^{2p}}^2$. Heuristic Hölder:
  $|\text{pressure}| \lesssim \|u\|_{L^p}^{p-1} \|u\|_{L^{2p}}^2$.

Using interpolation $\|u\|_{L^{2p}} \lesssim \|u\|_{L^p}^{1/2}
\|u\|_{L^\infty}^{1/2}$:

$$
|\text{pressure}| \lesssim \|u\|_{L^p}^p \cdot F(\|u\|_{L^\infty}),
$$

for a suitable $F$. So the $L^p$ Grönwall closure needs
$\|u\|_{L^\infty_t L^\infty_x}$ control.

## 4. The reduction — new gap G_T1b_3

The approach (i) calculation reduces G_T1b_1 to:

| ID | Severity | Statement |
|----|----------|-----------|
| **G_T1b_3** | major-but-not-lethal | Derive uniform $L^\infty_t L^\infty_x$ bound on $u$ from $L^\infty_t \mathrm{BMO}^{-1}$ + smoothness + energy. |

**Difficulty analysis**:

- $\mathrm{BMO}^{-1}(\mathbb{R}^3)$ does NOT control $L^\infty$ by
  embedding (BMO contains log-functions, not $L^\infty$).
- Brezis–Gallouet–Wainger needs $H^s$ for $s > 3/2$ — sub-critical
  for the BMO⁻¹-hypothesis scale.
- Energy inequality gives $L^2_t H^1_x$ — sub-critical.
- **No published mechanism** couples $L^\infty_t \mathrm{BMO}^{-1}$
  + energy → $L^\infty_t L^\infty_x$.

G_T1b_3 is roughly equivalent in difficulty to closing CMI (A)
directly.

## 5. Cross-check — approach (ii) vorticity reduces to G_T1b_4

The vorticity $L^p$ identity, after cancelling vorticity convection
(also by $\nabla \cdot u = 0$), reduces to controlling the
**vortex stretching** term $p \int |\omega|^{p-2} \omega \cdot
(\omega \cdot \nabla) u \, dx$.

By Constantin–Fefferman 1993, this is controlled under
*vorticity-direction Lipschitz on the high-vorticity region*. The
hypothesis $L^\infty_t \mathrm{BMO}^{-1}$ does **not** give this.
So:

| ID | Severity | Statement |
|----|----------|-----------|
| **G_T1b_4** | major-but-not-lethal | Establish vorticity-direction Lipschitz control on the high-vorticity region of $u$, from $L^\infty_t \mathrm{BMO}^{-1}$ + smoothness + energy. |

G_T1b_4 is also equivalent in difficulty to the original (A)
question.

## 6. Cross-approach finding (substantive)

**Both** approaches (i) and (ii) — the two non-barrier-blocked
direct techniques — reduce G_T1b_1 to a new regularity-equivalent
gap (G_T1b_3 / G_T1b_4). Neither closes G_T1b_1.

This is structurally similar to the route-independent
discrete-vs-continuous wall A011 identified for 03-p-vs-np
(conjecture C-002), though here the test is on **two** approaches,
not all approaches.

**Whether T1b is genuinely structurally walled or whether a
third approach exists** (e.g., a paraproduct-with-cancellation
hybrid that satisfies the barrier audit) is **open**.

## 7. A005 pivot trigger re-evaluation

| Criterion | After A006–A009 |
|-----------|------------------|
| (a) T1a proof | partial (trivial sub-case only) |
| (b) T1b lemma-graph + Tao-barrier consistent | **ACHIEVED** (A007; A008; reaffirmed) |
| (c) T1 falsification | not produced |

Trigger does **NOT** fire. (b) suffices.

But A009 motivates A010 to either find a third approach or
extract the relocation as a permanent asset.

## 8. Budget

- A005 set max 7 attempts (A006–A012); A009 is the 4th.
- **4 attempts remain** (A010–A012).

## Key Insights

- **Approach (i) (direct $L^p$ energy method) passes the
  statement-level Tao-barrier audit** via the $\nabla \cdot u = 0$
  convection cancellation.
- **But its resolution degenerates**: the pressure term forces
  $L^\infty_t L^\infty_x$ control which $L^\infty_t \mathrm{BMO}^{-1}$
  does not give. Reduces G_T1b_1 to G_T1b_3.
- **Approach (ii) (vorticity) also passes statement-level audit
  but its resolution degenerates** symmetrically: vortex
  stretching reduces G_T1b_1 to G_T1b_4 (Constantin–Fefferman-style
  hypothesis).
- **Both direct approaches relocate the difficulty rather than
  closing it.** This is a substantive negative finding,
  structurally similar in spirit to 03-p-vs-np's route-independent
  wall (C-002).
- **The (α) program remains formally on track** (trigger does
  not fire) but the realistic outlook tightens — direct techniques
  alone are insufficient.

## Follow-ups

1. **A010**: identify a candidate third approach. Possible
   directions:
   - Paraproduct-WITH-cancellation hybrid: use Bony decomposition
     but insert $\nabla \cdot u = 0$ at a specific step to escape
     A008-A6. Requires carefully audited construction.
   - Galerkin / spectral-projection ladder: combine energy at
     each frequency scale.
   - Apply A006 Patch 1 (literature audit for L_T1a_5
     counterexample) here — Albritton 2018+ might illuminate
     G_T1b_3 directly.
2. **A011 (if A010 fails)**: extract G_T1b_3 + G_T1b_4 as a
   formal **conjecture C-003** (regularity-equivalence
   obstruction) — analog of C-001 for the dormant 03-p-vs-np
   program. Preserves the negative-knowledge asset.
3. **A012 (if A010+A011 inconclusive)**: prepare Pivot 1 (route
   change within (α)) or Pivot 2 (switch to (β) blowup).
4. **Mid-arc R6 (now strongly motivated)**: 9 attempts on
   05-navier-stokes (A001–A009); the methodological-contrast R6
   with 03-p-vs-np becomes informative.
5. **Update verification-bar §7** to add a fifth barrier:
   "regularity-equivalent reduction" — a proof technique that
   reduces (A) to an equivalent regularity question is not
   making progress.

## References

- attempt: A005 (commitment); A006 (T1a); A007 (T1b
  decomposition); A008 (P07 audit, Patch 2).
- bridge:
  [`bridges/B-003-critical-norm-equivalence-along-flow.md`](../../../bridges/B-003-critical-norm-equivalence-along-flow.md).
- problem doc:
  [`docs/problems/05-navier-stokes/verification-bar.md`](../../../docs/problems/05-navier-stokes/verification-bar.md)
  §7.
- analysis:
  [`analysis/cross-synthesis/03-p-vs-np-2026-05-21.md`](../../../analysis/cross-synthesis/03-p-vs-np-2026-05-21.md)
  (precedent of route-independent obstruction).
- prompt: `prompts/P03-lemma-extraction.md`.
- external (canonical):
  - Stein, *Singular Integrals and Differentiability Properties
    of Functions*, Princeton 1970 (Calderón–Zygmund pressure
    estimate).
  - Brezis & Gallouet, *Nonlinear Schrödinger evolution
    equations*, Nonlinear Anal. 4 (1980) 677–681
    (logarithmic Sobolev embedding).
  - Constantin & Fefferman, *Direction of vorticity and the
    problem of global regularity for the Navier–Stokes equations*,
    Indiana Univ. Math. J. 42 (1993) 775–789.
  - Beale, Kato, Majda (1984) — vorticity blowup criterion.
  - Koch & Tataru (2001), ESS (2003), Tao (2016) — same canonical
    set used in A005–A008.
