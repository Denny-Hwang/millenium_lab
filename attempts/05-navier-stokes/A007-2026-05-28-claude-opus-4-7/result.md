# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

P03 lemma extraction on T1b produces a clean Duhamel-based
decomposition (L_T1b_1 linear; L_T1b_2 trivial heat-bound; L_T1b_3
bilinear, splitting into L_T1b_3a routine time-integral
+ **L_T1b_3b auxiliary $L^q$ control as the unique technical
bottleneck**); the bottleneck is gap **G_T1b_1**
(lethal-if-unresolved) — derive $u \in L^\infty_t L^q$ for some
$q \in (3, 6]$ from the hypothesis $L^\infty_t \mathrm{BMO}^{-1}$
plus smoothness and energy; the Tao-barrier audit is satisfied
structurally (the Duhamel formulation uses the Leray projector and
$\nabla \cdot u = 0$ explicitly); **A005 trigger criterion (b) is
achieved** — pivot does not fire and the program continues per the
committed (α) route.

## Outcome Label

- Label: `partial-insight`
- Reason: Achieves A005's pivot-trigger criterion (b) — a precise
  lemma-graph for T1b with gap labels consistent with the
  Tao-barrier audit. Identifies G_T1b_1 as the unique technical
  bottleneck of the Duhamel-route proof and shows that the genuine
  difficulty is concentrated in an auxiliary $L^q$-control problem
  rather than diffusely distributed. Not `novel-approach` (no new
  technique); above `survey` (the decomposition isolates the
  difficulty in a single named gap and satisfies an explicit
  trigger criterion). Not `flawed-attempt` (no false claim;
  G_T1b_1 explicitly marked open).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. T1b restated

For initial data $u_0$ smooth, divergence-free, decaying (Fefferman
2000 §A class), let $u$ be the corresponding smooth NSE solution
on $[0, T)$. Suppose
$u \in L^\infty([0, T); \mathrm{BMO}^{-1}(\mathbb{R}^3))$. Then
$u \in L^\infty([0, T); L^3(\mathbb{R}^3))$, with the bound
depending only on $\|u_0\|_{L^3 \cap \mathrm{BMO}^{-1}}$,
$\|u\|_{L^\infty_t \mathrm{BMO}^{-1}}$, and $T$.

## 2. Lemma decomposition (Duhamel backbone)

$$
u(t) = e^{t\Delta} u_0 + B(u, u)(t), \qquad
B(u, u)(t) := -\int_0^t e^{(t-s)\Delta} \mathbb{P}\,
\nabla \cdot (u \otimes u)(s) \, ds.
$$

The Leray projector $\mathbb{P}$ and divergence-free condition
$\nabla \cdot u = 0$ enter here — **the structural ingredients
the Tao-barrier audit will require**.

| ID | Statement | Difficulty |
|----|-----------|------------|
| L_T1b_1 | Duhamel decomposition holds classically for smooth $u$ | low |
| L_T1b_2 | $\|e^{t\Delta} u_0\|_{L^3} \leq \|u_0\|_{L^3}$ | low |
| L_T1b_3 | $\|B(u, u)(t)\|_{L^3} \leq C(T, \ldots)$ under the BMO⁻¹ hypothesis | **high** (the crux) |

## 3. Sub-decomposition of L_T1b_3

By the heat-kernel estimate (with $\mathbb{P}\partial$ at the boundary):

$$
\|e^{(t-s)\Delta} \mathbb{P} \partial f\|_{L^3} \;\leq\; C_p
\, (t-s)^{\alpha(p)} \, \|f\|_{L^p}, \qquad
\alpha(p) := -\tfrac{3}{2}\left(\tfrac{1}{p} - \tfrac{1}{3}\right)
              - \tfrac{1}{2},
$$

valid for $p > 3/2$ (so that the time-integral converges,
$\alpha(p) > -1$).

By Hölder, $\|u \otimes u\|_{L^p} \leq \|u\|_{L^{2p}}^2$, so for any
$p \in (3/2, 3]$, setting $q := 2p \in (3, 6]$:

| ID | Statement | Difficulty |
|----|-----------|------------|
| L_T1b_3a | If $\|u(s)\|_{L^q} \leq M$ for all $s \in [0, T)$ and some $q \in (3, 6]$, then $\|B(u, u)(t)\|_{L^3} \leq C_p M^2 T^{1 + \alpha(p)}$ | low (routine time-integral) |
| **L_T1b_3b** | **The auxiliary $L^q$ control**: hypothesis $u \in L^\infty_t \mathrm{BMO}^{-1}$ on $[0, T)$ + smoothness + energy ⇒ $u \in L^\infty_t L^q$ on $[0, T)$ for some $q \in (3, 6]$ | **HIGH — the genuine bottleneck** |

## 4. The genuine gap

### G_T1b_1 (lethal-if-unresolved)

Establish L_T1b_3b. *Heuristic for why this is hard*:

- $\mathrm{BMO}^{-1}$ is the **largest** critical Banach space
  (Koch–Tataru endpoint).
- $L^q$ for $q > 3$ is **strictly smaller** than $\mathrm{BMO}^{-1}$
  as a function space (by embedding).
- So we need to **strengthen** the regularity of $u$ — but the
  $\mathrm{BMO}^{-1}$ hypothesis is at the critical scale and we
  lack a natural mechanism to bootstrap to $L^q$.
- Possible auxiliary inputs (smoothness, energy inequality,
  vorticity equation) are *known* but none has been combined with
  $L^\infty_t \mathrm{BMO}^{-1}$ to produce $L^q$ control in the
  published literature.

### G_T1b_2 (major)

Even granting L_T1b_3b, combining T1b's conclusion with ESS 2003
to close CMI (A) requires a uniform-in-$T$ estimate at the
breakdown time. Iterative extension via ESS works in principle but
the constants may degenerate.

## 5. Tao-barrier audit (verification-bar §7)

The Duhamel decomposition uses the **Leray projector $\mathbb{P}$**
and the **divergence-free condition $\nabla \cdot u = 0$**
explicitly:

- $\mathbb{P}$ annihilates gradients; the pressure
  $\nabla p = -\nabla \Delta^{-1} \nabla \cdot (u \otimes u)$ in
  NSE is absorbed by $\mathbb{P}$ when applied to a
  divergence-free input. **This is the agreement structure that
  averaged NSE lacks.**
- $\nabla \cdot u = 0$ is preserved by the bilinear form.

So at the lemma-statement level, the proof structurally satisfies
the Tao-barrier audit. **Caveat**: G_T1b_1's eventual resolution
must continue to use $\mathbb{P} + \nabla \cdot u = 0$
non-trivially. A008 (P07) will explicitly audit this.

## 6. Delta against A005's T1b

A005 §2 described T1b as "structurally hard." A007 sharpens:

- The difficulty is **concentrated in L_T1b_3b** under the
  Duhamel-route approach. Other routes (vorticity-based,
  multiplier-based) would have a different single bottleneck but
  the analogue of G_T1b_1.
- The bilinear time-integral L_T1b_3a is **routine** once the
  auxiliary $L^q$ control is available.
- The Tao-barrier audit is **structurally satisfied at the lemma
  level**, contingent on G_T1b_1's resolution preserving the
  Leray-projector use.

## 7. Trigger evaluation per A005 §4

A005's three trigger criteria:

- (a) T1a proof: partial from A006 (trivial sub-case proved;
  substantive open).
- **(b)** T1b lemma-graph + gap labels consistent with Tao-barrier
  audit: **ACHIEVED by A007**. Lemma graph
  L_T1b_1 / L_T1b_2 / L_T1b_3 (= L_T1b_3a + L_T1b_3b); gap
  G_T1b_1 (lethal-if-unresolved), G_T1b_2 (major); Tao-barrier
  audit explicit (Step 6).
- (c) T1 falsification: not produced.

**Trigger does NOT fire.** The program continues per the
committed (α) route, with A008 (P07) running the adversarial
barrier audit on A006 + A007.

This is the **first attempt** in the 05-navier-stokes program
that brings the (α) commitment into satisfactory territory by an
explicit trigger criterion.

## Key Insights

- **The Duhamel route reduces T1b to a single auxiliary $L^q$
  control.** Given $L^q$ on $[0, T)$, the bilinear estimate
  L_T1b_3a is routine. So G_T1b_1 is the unique technical
  bottleneck of this approach.
- **G_T1b_1 captures a known kind of NSE difficulty**:
  bootstrapping from a critical $\mathrm{BMO}^{-1}$ bound to a
  strictly stronger $L^q$ bound, using smoothness + energy.
  Albritton et al. borderline-regularity criteria approach this
  but have not closed it in the form L_T1b_3b needs.
- **Tao-barrier audit is passed at the lemma-statement level.**
  The $\mathbb{P}$ and $\nabla \cdot u = 0$ structure enters
  Duhamel non-trivially; averaged NSE does not satisfy this.
- **A005 pivot trigger criterion (b) is achieved.** The
  committed (α) route is on schedule per the A005 plan.

## Follow-ups

1. **A008** (next per A005 stage plan): P07 adversarial review of
   A006 + A007 against `verification-bar.md` §7. Specifically,
   verify that G_T1b_1's possible resolutions cannot bypass the
   Leray-projector requirement (i.e., the audit at the resolution
   level, not just the statement level).
2. **A009+ (post-audit)**: pick G_T1b_1 and attempt a direct
   technical attack — possibly via a paraproduct decomposition of
   $u \otimes u$ on the BMO⁻¹ scale, or via a Beale–Kato–Majda-
   style vorticity argument bridging $\mathrm{BMO}^{-1}$ and
   $L^q$.
3. **Re-evaluate the program** at A009. If G_T1b_1 turns out to
   require a non-Leray-projector estimate (potentially failing
   the Tao-barrier audit), Pivot 1 may be warranted.
4. **Cross-reference G_T1b_1 with G_T1a_1** (A006). Both ask for
   a bilinear estimate at the BMO⁻¹ scale targeting $L^3$ /
   $L^q$. A unified treatment may emerge in A009.
5. **Primer update**: promote the trivial-vs-substantive split
   (from A006) + the L_T1b_3b bottleneck (from A007) into
   `docs/primer/field-primers/05-navier-stokes.md` §7.

## References

- attempt: `attempts/05-navier-stokes/A005-...` (commitment).
- attempt: `attempts/05-navier-stokes/A006-...` (T1a; G_T1a_3
  leverage concern).
- bridge:
  [`bridges/B-003-critical-norm-equivalence-along-flow.md`](../../../bridges/B-003-critical-norm-equivalence-along-flow.md)
  (paraproduct / bilinear estimate shared objects).
- problem docs:
  [`docs/problems/05-navier-stokes/known-results.md`](../../../docs/problems/05-navier-stokes/known-results.md)
  §4 (Koch–Tataru, ESS, Albritton),
  [`docs/problems/05-navier-stokes/verification-bar.md`](../../../docs/problems/05-navier-stokes/verification-bar.md)
  §7.
- prompt: `prompts/P03-lemma-extraction.md`.
- external (canonical):
  - Escauriaza, Seregin, Šverák (2003) — the keystone bridging
    theorem ($L^\infty_t L^3 \Rightarrow$ regularity).
  - Koch & Tataru (2001) — BMO⁻¹ small-data global; the upper
    endpoint of the critical-norm ladder.
  - Tao (2016) — averaged-NSE blowup; the barrier.
  - Lemarié-Rieusset (2018), Chapters 9–10 — comprehensive HA-NSE
    reference for bilinear estimates and critical-norm bootstrap
    techniques.
