# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Registers **B-003** (*Harmonic Analysis ↔ Nonlinear PDE — Critical-Norm
Equivalence Along NSE Flow*) as an `ai-discovered`, `active` bridge
on 05-navier-stokes; the bridge formalizes the framing introduced
by A001 (P01 panel C1) and A002 (ladder catalog) — *spatial
embedding $X \subset Y$ in the critical-norm ladder ↦ along-flow
implication $L^\infty_t X \Rightarrow L^\infty_t Y$* — with five
candidate shared objects, three concrete transformations (BMO$^{-1}
\to L^3$ along-flow closing CMI(A) via ESS; small-large data
interpolation; bilinear-cancellation quantification of the Tao 2016
barrier), and one explicit false-bridge possibility (the
Bourgain–Pavlovic ill-posedness as an upper-edge barrier).

## Outcome Label

- Label: `partial-insight`
- Reason: A new bridge is registered as a repository asset (per
  charter §1, byproducts as assets). The "spatial embedding ↦
  along-flow implication" framing was implicit in the literature
  but not explicit as a bridge object before this session. Below
  `novel-approach` (no new technique); above `survey` (the bridge
  is a formal new repository artifact with charter-mandated
  metadata, references, and stuck-points).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Bridge registered

[**B-003**](../../../bridges/B-003-critical-norm-equivalence-along-flow.md):
*Harmonic Analysis ↔ Nonlinear PDE — Critical-Norm Equivalence
Along NSE Flow.*

- Frontmatter: `maturity: ai-discovered`, `status: active`,
  `domains: [harmonic-analysis, nonlinear-pde]`,
  `problems: [05-navier-stokes]`.
- Six sections populated per `bridges/_TEMPLATE.md`.

## 2. P02 §1 — Five candidate shared objects

| # | Shared object | Maturity |
|---|---------------|----------|
| 1 | The critical-norm ladder ($\dot H^{1/2}$ → $\dot B^{-1}_{\infty,\infty}$) | established |
| 2 | Littlewood–Paley decomposition | established |
| 3 | Bony paraproduct decomposition | established |
| 4 | Bilinear estimates $\|B(u,v)\|_X \lesssim \|u\|_Y \|v\|_Z$ | established (small-data); emerging (large-data along-flow) |
| 5 | Heat semigroup smoothing $e^{t\Delta}$ on critical spaces | established |

The *composite framing* — "spatial-embedding ↦ along-flow
implication" as a single bridge — is **ai-discovered** in this
session.

## 3. P02 §3 — Three transformations from B-003

- **T1 ($\mathrm{BMO}^{-1} \to L^3$ along-flow)**. If $u \in
  L^\infty_t \mathrm{BMO}^{-1}$ globally on a smooth NSE flow,
  then $u \in L^\infty_t L^3$. Combined with ESS 2003 ⇒ closes
  CMI (A). The headline open question of the program.
- **T2 (small-large data interpolation)**. Deform Koch–Tataru's
  small-data global threshold up to large data using HA tools
  (frequency truncation, paraproduct surgery).
- **T3 (Tao-barrier quantification in HA)**. Identify in HA
  language the *minimum* bilinear cancellation that distinguishes
  true NSE from averaged NSE — sharpens the A002 obstruction.

## 4. P02 §4 — False-bridge possibility

The spatial embedding $X \subset Y$ is automatic, but along-flow
preservation **is known to fail at the top of the ladder**
(Bourgain–Pavlovic 2008: $\dot B^{-1}_{\infty,\infty}$ is
ill-posed). The bridge could fail uniformly if, for every $X$
strictly larger than $L^3$, no large-data along-flow bound holds —
collapsing the bridge's content to ESS 2003 alone.

**Escape**: even in this worst case, B-003 supplies a clean
delineation of *where* along-flow preservation works (currently
small-data only above $L^3$). The bridge is not useless; its
content would be the *barrier itself*, analogously to how
relativization is content on the P-vs-NP side.

## Key Insights

- **B-003 makes the program's central question portable.** Any
  attempt formalizing T1–T3 can cite B-003 as the shared
  framework, avoiding the need to re-explain why HA tools target a
  PDE question.
- **The false-bridge possibility is real.** The ill-posedness at
  the top of the ladder limits how high in the ladder one can
  hope for large-data along-flow bounds. The bridge's *content*
  could be the barrier rather than a positive theorem; either way
  it is a defined object.
- **T1 is the highest-leverage open transformation.**
  $\mathrm{BMO}^{-1} \to L^3$ along-flow + ESS = CMI (A). No
  published candidate proof exists; the obstruction sits at the
  bilinear-estimate scale.

## Follow-ups

1. **A004 (P02, B-004)**: register the second bridge surfaced by
   A001 — CFD ↔ PDE on rigorous turbulence closure (resolves
   A001 C3).
2. **A005**: direction-commitment attempt per A001 follow-up #6
   (global-regularity vs blowup; explicit pivot trigger).
3. **A006+**: pick T1 (BMO$^{-1} \to L^3$ along-flow) and run P03
   lemma extraction on a candidate proof scheme. This is the
   first substantive technical attempt on the bridge.
4. **bridges/_INDEX.md update**: add B-003 entry to the index
   listing (PR #18 added B-001/B-002 status revisions; B-003
   should be added to the index similarly).
5. **Primer update**: promote the "spatial-embedding ↦ along-flow"
   framing into
   `docs/primer/field-primers/05-navier-stokes.md` §7 (glossary
   deltas).

## References

- bridge: [`bridges/B-003-critical-norm-equivalence-along-flow.md`](../../../bridges/B-003-critical-norm-equivalence-along-flow.md)
  (the deliverable).
- attempt: `attempts/05-navier-stokes/A001-...`
  (panel that seeded the bridge).
- attempt: `attempts/05-navier-stokes/A002-...`
  (ladder catalog).
- prompt: `prompts/P02-bridge-discovery.md`.
- external (canonical):
  - Fujita & Kato (1964), Cannone (1995), Koch & Tataru (2001),
    Escauriaza–Seregin–Šverák (2003), Bourgain & Pavlovic
    (2008), Tao (2016), Buckmaster & Vicol (2019),
    Lemarié-Rieusset (2018), Bergh & Löfström (1976), Triebel
    (1983), Bony (1981). Full citations in B-003 §6.
