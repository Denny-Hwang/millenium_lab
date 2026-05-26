# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

P01 five-domain panel on the hypothesis "a single critical
scale-invariant scalar functional $\Phi(u,t)$ decides 3D NSE
regularity, equivalent across PDE / harmonic-analysis / probability
/ CFD / information-theory" finds that **the candidate $\Phi$'s
across fields are not equivalent norms** (C1), partially refuting
the hypothesis's strict form; a weakened "ordered family of critical
candidates" reformulation survives at robustness **3/5** with two
future bridge candidates (PDE↔harmonic-analysis on critical-norm
equivalences; CFD↔PDE on rigorous-turbulence-closure) flagged for
later P02 attempts.

## Outcome Label

- Label: `partial-insight`
- Reason: P01 produces a panel transcript (a `survey` content
  baseline) but C1 supplies a substantive correction to the
  hypothesis: the candidate critical functionals across fields are
  *not* equivalent norms, contradicting the hypothesis's central
  claim. This is more than a survey — it tightens what a viable
  next attempt's hypothesis must look like. Below `novel-approach`
  (no new technique). Not `flawed-attempt` (the hypothesis was
  testably stated and the test informed; that's the design).
  Robustness 3/5 places the hypothesis in the "promote with
  refinement" zone per P01 follow-ups.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Panel composition and candidates $\Phi$ surfaced

Per `prompts/P01-multi-perspective.md` and the README's *Candidate
Consilient Fields*:

| Field | Candidate $\Phi(u, t)$ |
|-------|-----------------------|
| Nonlinear PDE | $\|u(t)\|_{L^3(\mathbb{R}^3)}$ (Escauriaza–Seregin–Šverák critical norm) |
| Harmonic analysis | $\|u(t)\|_{\mathrm{BMO}^{-1}}$ or $\|u(t)\|_{B^{-1}_{\infty,\infty}}$ (Koch–Tataru / Besov-critical) |
| Probability | long-time-average enstrophy-dissipation rate under invariant measure of SNS (Flandoli–Romito) |
| CFD | Kolmogorov-microscale ratio $\eta/\Delta x$; analytically, the enstrophy $\int |\omega|^2$ |
| Information theory | entropy-production rate of vorticity (Onsager-style; Isett 2018 for Euler) |

Each expert produced a candidate $\Phi$ in their native vocabulary
— the cross-domain *translatability* part of the hypothesis is met.

## 2. Three conflicts (per P01 §2)

- **C1**: PDE $L^3$, harmonic-analyst $\mathrm{BMO}^{-1}$,
  information-theorist entropy-production are **not equivalent
  norms**. The strict hypothesis "same $\Phi$ up to equivalence"
  fails on its face.
- **C2**: Probabilist's stochastic-NSE $\Phi$ vs deterministic
  CMI question — different *objects*, not a factual conflict.
- **C3**: CFD numerical "no observed blowup" vs PDE asymptotic
  question — real but at different epistemic standards;
  numerical evidence doesn't lift to a continuum bound.

## 3. Classification (per P01 §3)

- **C1**: real (different norms, strict-inclusion-ordered, not
  equivalent).
- **C2**: false (different objects of study, no factual
  disagreement).
- **C3**: real (different epistemic standards; CFD evidence does
  not bound the continuum norm).

## 4. Resolution data / theorems (per P01 §4)

- **C1**: need a theorem showing one candidate critical norm
  upper-bounds the others up to constants along smooth NSE flows
  — to my knowledge no such full equivalence is known; partial
  one-sided embeddings exist (Cheskidov–Shvydkoy, etc.). A future
  attempt should enumerate which embeddings are known and which
  are open.
- **C3**: need a rigorous turbulence-closure bridge proving
  sub-Kolmogorov-scale dynamics cannot produce a singularity
  invisible at the resolved scale — itself a research direction;
  no published bridge of this kind exists.

## 5. Multi-domain robustness score (per P01 §5)

- **Score**: **3 / 5**
- **Justification**: Each expert produced a coherent candidate
  $\Phi$ — the translation across fields succeeded. But the C1
  finding (the candidates are *not* equivalent) refutes the
  hypothesis's strict claim. A weakened reformulation —
  "regularity is decided by an *ordered family* of critical
  functionals; the question is which one is bounded along smooth
  flows" — is consistent with what each expert said and could
  organize the next attempt. P01 follow-up rules: $\geq 4$
  promote, $\leq 2$ reject; 3 is "promote with refinement."

## 6. Implications for existing bridges (per P01 §6)

No Navier-Stokes-tagged bridges exist in `bridges/_INDEX.md`; this
is the first attempt on the problem. The panel surfaces **two
candidate bridges** for future P02-driven attempts:

- **B-003 candidate** (harmonic-analysis ↔ nonlinear-PDE): the
  *critical-norm-equivalence ladder*. Resolves C1 if pursued.
- **B-004 candidate** (computational-fluid-dynamics ↔
  nonlinear-PDE): *rigorous turbulence closure* / scale-bridging
  from numerical to analytical evidence. Resolves C3 if pursued.

Neither is registered in this attempt; per P02 (and to keep this
P01 first-attempt focused), they belong to a follow-up attempt.

## Key Insights

- **The panel translates cleanly** across the five fields — each
  produces a candidate $\Phi$ in its native vocabulary. The
  *translatability* part of the hypothesis is confirmed.
- **But the candidates are not equivalent.** $L^3 \neq \mathrm{BMO}^{-1}
  \neq$ entropy-production etc.; the strict hypothesis is at least
  partially false. A weakened "ordered family of critical
  candidates" framing survives.
- **Numerical evidence is overwhelmingly anti-blowup** but does
  not constitute a continuum proof. The CFD↔PDE epistemic-standard
  gap (C3) is a genuine bridge target.
- **The deterministic question is the hard zero-noise limit** of
  the stochastic framework; probabilistic Φ is well-behaved with
  noise, less so without. Not a contradiction, but a real
  framework-translation issue.
- **Two natural bridge candidates surface** (B-003 critical-norm
  equivalence; B-004 turbulence closure) for later P02-driven
  attempts.

## Follow-ups

1. **A002 (P03 lemma extraction or refined P01)**: tighten the
   hypothesis to "regularity is decided by *some* element of an
   ordered family of critical functionals; identify which family
   member is the natural target." Specifically, list the
   strict-inclusion ladder of critical norms with current best
   bounds.
2. **A003 (P02 bridge discovery, B-003 candidate)**: formalize the
   critical-norm-equivalence ladder as a candidate bridge between
   harmonic analysis and nonlinear PDE.
3. **A004 (P02 bridge discovery, B-004 candidate)**: formalize the
   rigorous-turbulence-closure / scale-bridging question as a
   candidate bridge between CFD and nonlinear PDE.
4. **Fill in `docs/problems/05-navier-stokes/{statement,
   equivalent-forms, known-results, failed-approaches,
   verification-bar}.md`** with content drawn from the primer
   field-notes and this panel. The problem's docs are currently
   placeholders.
5. **Update primer §7 (glossary deltas)** for 05-navier-stokes:
   add the panel's candidate-Φ vocabulary (critical norm, ESS,
   Koch-Tataru, Kolmogorov microscale, ζ_p exponents).
6. **Lessons-from-03-p-vs-np to apply here**: the H_0 program
   accumulated 8 partial-insights converging on a route-independent
   wall (C-002). For 05-navier-stokes, before opening many
   attempts, decide a *stopping criterion* / *direction-commitment
   protocol* analogous to what A007 should have done earlier. The
   R6 from 03-p-vs-np makes this concrete: commit to either
   (a) global-regularity or (b) blowup direction by A005, with an
   explicit pivot trigger if the chosen direction stalls.

## References

- prompt: `prompts/P01-multi-perspective.md`
- problem docs: `docs/problems/05-navier-stokes/README.md` (active);
  `statement.md` etc. (placeholders to fill in per follow-up #4).
- primer: `docs/primer/field-primers/05-navier-stokes.md` (filled
  in earlier; supplied the canonical references used by the panel).
- lessons: `analysis/cross-synthesis/03-p-vs-np-2026-05-21.md`
  (R6 of the dormant 03-p-vs-np program; methodology lessons).
- external (canonical, drawn from the primer):
  - Leray, *Sur le mouvement d'un liquide visqueux emplissant
    l'espace*, Acta Math. 63 (1934) 193–248.
  - Caffarelli, Kohn, Nirenberg, *Partial regularity of suitable
    weak solutions of the Navier-Stokes equations*, Comm. Pure
    Appl. Math. 35 (1982) 771–831.
  - Escauriaza, Seregin, Šverák, *$L^{3,\infty}$-solutions of the
    Navier-Stokes equations and backward uniqueness*, Russian Math.
    Surveys 58 (2003) 211–250.
  - Koch & Tataru, *Well-posedness for the Navier-Stokes
    equations*, Adv. Math. 157 (2001) 22–35.
  - Bourgain & Pavlovic, *Ill-posedness of the Navier-Stokes
    equations in a critical space in 3D*, J. Funct. Anal. 255
    (2008) 2233–2247.
  - Tao, *Finite time blowup for an averaged three-dimensional
    Navier-Stokes equation*, J. AMS 29 (2016) 601–674.
  - Buckmaster & Vicol, *Nonuniqueness of weak solutions to the
    Navier-Stokes equation*, Ann. of Math. 189 (2019) 101–144.
  - Hou & Luo, *Toward the finite-time blowup of the 3D
    axisymmetric Euler equations*, Multiscale Model. Simul. 12
    (2014) 1722–1776.
  - Isett, *A proof of Onsager's conjecture*, Ann. of Math. 188
    (2018) 871–963.
  - Flandoli & Romito, *Markov selections for the 3D stochastic
    Navier-Stokes equations*, Probab. Theory Related Fields 140
    (2008) 407–458.
