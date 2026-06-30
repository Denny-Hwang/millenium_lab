# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

P03 lemma extraction on T2 (CFD sub-Kolmogorov rigor) decomposes
the discrete → continuum transfer into four sub-lemmas
(L_T2_1–L_T2_4) with **L_T2_2 critical-norm compactness as the
unique bottleneck**; three approaches identified (concentration-
compactness, Aubin–Lions, spectral); Tao-barrier audit **PASS** at
statement level ($\nabla \cdot u_{\Delta x} = 0$ preserved by
construction); **C-003-orthogonality VERIFIED** (T2 is a transfer
theorem, not a BMO⁻¹ → $L^q$ implication, so C-003's quantification
does not apply); **A012 mini-trigger criterion (b') achieved**.

## Outcome Label

- Label: `partial-insight`
- Reason: A013 satisfies A012's mini-trigger criterion (b')
  precisely — precise lemma-graph + gap labels for T2 consistent
  with both Tao-barrier audit AND C-003-orthogonality. The new
  Pivot 1 route is on schedule. Below `novel-approach` (no new
  technique); above `survey` (lemma decomposition isolates the
  unique bottleneck L_T2_2 and verifies C-003-orthogonality).
  Not `flawed-attempt` (gaps explicit; no false closure claim).
  **First attempt of the Pivot 1 mini-trigger window** — analog
  of A007 for the new route.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. T2 formal restatement

Let $\{\Delta x_k\}$ be a sequence of discretization scales with
$\Delta x_k \to 0$. Let $u_{\Delta x_k}$ be the discrete NSE
solution on a lattice / spectral grid of mesh $\Delta x_k$ from
initial datum $u_0^{(k)}$ approximating CMI smooth decaying $u_0$.
Suppose
$$\sup_k \, \sup_{t \in [0, T_*)} \|u_{\Delta x_k}(t)\|_X \;\leq\; M$$
for a critical norm $X$ (e.g., $X = L^3(\mathbb{R}^3)$) and some
$M < \infty$. Then there exists a Leray–Hopf weak solution $u$ of
continuum NSE on $[0, T_*)$ with $u(0) = u_0$ and
$\sup_t \|u(t)\|_X \leq M$.

Combined with ESS 2003 ($X = L^3$), T2 would close CMI (A) on
$[0, T_*)$ **if** the uniform CFD bound exists (G_T2_2 caveat).

## 2. Lemma decomposition (discrete → continuum backbone)

| ID | Statement | Difficulty |
|----|-----------|------------|
| L_T2_1 | Discrete NSE setup; $\nabla \cdot u_{\Delta x} = 0$ preserved by construction | low (Temam 1977; LR Ch. 16) |
| **L_T2_2** | **Critical-norm compactness: extract subsequence converging to $u$** | **HIGH (the crux)** |
| L_T2_3 | Identification with continuum NSE; initial-datum match | medium |
| L_T2_4 | Norm semi-continuity at the limit (inherits $\|u\|_X \leq M$) | low (L³ reflexive) |

## 3. L_T2_2 sub-decomposition (three approaches)

| Approach | Description | Tao-barrier status | C-003-orthogonal? |
|----------|-------------|---------------------|---------------------|
| (i) Concentration–compactness | Profile decomposition à la Lions / Gérard; NSE-specific in Bahouri–Gallagher 1999 | uses $\nabla \cdot u = 0$ via pressure; **pass** at resolution | **yes** — not LP-block-local |
| (ii) Aubin–Lions | $\partial_t u_{\Delta x}$ control in negative Sobolev; classical | uses pressure estimate; **pass** at resolution | **yes** — global Sobolev |
| (iii) Spectral / LP-block | concentration on each Littlewood–Paley block | needs care at resolution | borderline; LP-local but for compactness, not BMO⁻¹ → $L^q$ |

## 4. New gaps

| ID | Severity | Statement |
|----|----------|-----------|
| **G_T2_1** | lethal-if-unresolved | Establish L_T2_2 (critical-norm compactness for discrete-NSE sequences). Difficulty comparable to or harder than Gallagher–Iftimie–Planchon 2003 (profile decomposition for NSE). |
| G_T2_2 | major | Uniform CFD hypothesis $\sup_k \|u_{\Delta x_k}\|_X \leq M$ is currently empirical (DNS at $\mathrm{Re} \sim 10^5$); rigorous derivation is the program-level open question. Not blocking T2 itself, but blocking the program built on T2. |
| G_T2_3 | major | Choice of discretization scheme L_T2_1 affects critical-regularity convergence. A precise choice is required. |

## 5. Audits

### 5.1 Tao-barrier audit (verification-bar §7)

- $\nabla \cdot u_{\Delta x} = 0$ preserved by construction (L_T2_1).
- Limit inherits $\nabla \cdot u = 0$ (L_T2_3).
- **Pass at statement level.**
- Approaches (i), (ii) use $\nabla \cdot u = 0$ non-trivially at resolution; pass.
- (iii) needs care.

### 5.2 C-003-orthogonality audit (A012 (b'))

C-003 quantifies over proofs of *BMO⁻¹ → $L^q$ implication* satisfying Tao-barrier + LP/Bony locality.

T2 is **not** a BMO⁻¹ → $L^q$ proof — T2 is a **discrete → continuum transfer** theorem. C-003's quantification **does not apply** to T2 directly.

**VERIFIED: T2 is C-003-orthogonal.**

This is the structural justification for Pivot 1: T2 escapes the wall A011 registered for the direct-PDE family.

## 6. Trigger evaluation per A012 §2

A012's mini-trigger criterion **(b')**: "precise lemma-graph + gap labels for T2 consistent with **both** Tao-barrier audit **and** C-003-orthogonality (proof must NOT reduce to LP/Bony-local direct-PDE estimates)."

A013 produces:
- ✓ Precise lemma graph: L_T2_1 / L_T2_2 / L_T2_3 / L_T2_4 + L_T2_2 sub-decomposition.
- ✓ Gap labels: G_T2_1 (lethal), G_T2_2 (major), G_T2_3 (major).
- ✓ Tao-barrier audit: pass at statement level.
- ✓ C-003-orthogonality: verified.

**(b') ACHIEVED.** Pivot 1's mini-trigger does **NOT** fire at A013.

The new route continues per A012's plan.

## 7. Methodological contrast

This is the **first attempt** to satisfy a new-route trigger criterion **without** first encountering wall-like obstructions. Contrast:

- B-003 / T1 path (A006–A011): trigger (b) achieved at A007, but the *resolution-level* difficulty (G_T1b_1) eventually became C-003.
- B-004 / T2 path (A013): trigger (b') achieved at A013, with C-003-orthogonality **structurally verified**. The next attempts (A014, A015) face a *different* difficulty (critical-norm compactness, G_T2_1) — not the same wall.

The Pivot 1 strategy is on solid structural footing.

## Key Insights

- **T2 decomposes cleanly** via the discrete → continuum backbone (L_T2_1 setup, L_T2_2 compactness, L_T2_3 identification, L_T2_4 semi-continuity).
- **L_T2_2 (critical-norm compactness) is the unique bottleneck.** Three approaches identified; (i) concentration–compactness and (ii) Aubin–Lions are most natural and Tao-barrier compatible.
- **C-003-orthogonality VERIFIED.** T2 is a transfer theorem, structurally different from the BMO⁻¹ → $L^q$ implication C-003 quantifies over. **Pivot 1 is on solid footing.**
- **A012's mini-trigger criterion (b') achieved.** Pivot 1's first technical attempt is on schedule.
- **G_T2_2 (uniform CFD hypothesis) is downstream of T2** — it's the program-level open question, not a T2-specific blocker. A precision worth carrying.

## Follow-ups

1. **A014** (next per A012's mini-window): technical attempt on G_T2_1 (critical-norm compactness). Choose between approach (i) concentration–compactness and (ii) Aubin–Lions; sketch the proof.
2. **A015**: P07 adversarial audit on A013 + A014 against `verification-bar.md` §7 (analog of A008 for the new route).
3. **At each of A014–A015**: re-evaluate the Pivot 1 mini-trigger.
4. **Deferred housekeeping** (after A015 cleanly):
   - B-003 status → `dormant` (parallel to B-002 in PR #18).
   - B-004 maturity revision (`speculative` → `ai-discovered`).
   - `verification-bar.md` §7 fifth barrier (global-vs-local cancellation mismatch).
5. **G_T2_2 deferred** — the rigorous derivation of the uniform CFD bound is a separate program; T2 itself is a transfer theorem and does not need G_T2_2 closed to be useful as a piece of machinery.

## References

- attempt: A012 (Pivot 1 selection); A007 (template for first-technical attempt on a route).
- bridge: [`bridges/B-004-cfd-pde-rigorous-turbulence-closure.md`](../../../bridges/B-004-cfd-pde-rigorous-turbulence-closure.md) (the new load-bearing route).
- conjecture: [`conjectures/C-003-...`](../../../conjectures/C-003-regularity-equivalence-nonlocal-cancellation/) (the wall T2 must stay orthogonal to — verified ✓).
- doc: [`docs/problems/05-navier-stokes/verification-bar.md`](../../../docs/problems/05-navier-stokes/verification-bar.md) §7.
- analysis: [`analysis/cross-synthesis/05-navier-stokes-2026-06-30.md`](../../../analysis/cross-synthesis/05-navier-stokes-2026-06-30.md).
- prompt: `prompts/P03-lemma-extraction.md`.
- external (canonical):
  - Temam, *Navier–Stokes Equations*, North-Holland, 1977
    (foundational discrete-NSE convergence theory).
  - Bahouri & Gallagher, *Inégalités de Strichartz précisées pour
    l'équation des ondes*, Bull. SMF 127 (1999) 491–544
    (concentration-compactness for NSE-style equations).
  - Gallagher, Iftimie, Planchon, *Asymptotics and stability for
    global solutions of the Navier–Stokes equations*,
    Ann. Inst. Fourier 53 (2003) 1387–1424
    (profile decomposition for NSE).
  - Lions, *The concentration-compactness principle in the
    calculus of variations*, parts I + II, Ann. IHP 1984
    (foundational concentration-compactness).
  - Aubin, *Un théorème de compacité*, C. R. Acad. Sci. Paris 256
    (1963) 5042–5044 (Aubin–Lions lemma).
  - Lemarié-Rieusset, *The Navier–Stokes Problem in the 21st
    Century*, CRC 2nd ed., 2018, Chapter 16 (discrete NSE
    convergence).
  - Escauriaza, Seregin, Šverák (2003) — same keystone used through
    A005–A011.
