# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P02-bridge-discovery`
- Variant: `minor (reason: P02 is normally used to discover a new
  inter-field bridge; here it is repurposed to make a strategic
  commitment between two pre-existing routes ((R1) sheaf-on-ambient
  and (R2) GCT pivot, identified in A006), and to begin the
  technical construction along the chosen route. The output template
  is restricted to §1 (commitment with justification), §2
  (structural shape of the construction), §3 (concrete candidate
  evaluated at the smallest test case), and a new §4 (what remains
  to be done).)`
- Input variables:
  - `${PROBLEM_ID}`: `03-p-vs-np`
  - `${FIELD_A}`: AC⁰ Boolean circuit complexity (B-002 native side).
  - `${FIELD_B}`: coherent-sheaf cohomology on quasi-projective
    schemes (B-002 target side).
  - `${PRE_EXISTING_ROUTES}`: (R1) sheaf-on-ambient interpretation;
    (R2) pivot to arithmetic / GCT moduli. Both identified in A006.

## Prerequisite-reading files

- `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/result.md`
  (L02 v1, L03 eval morphism, L04 sheaf F_{AC^0}).
- `attempts/03-p-vs-np/A005-2026-05-20-claude-opus-4-7/result.md`
  (L02 v2; G009 surface).
- `attempts/03-p-vs-np/A006-2026-05-20-claude-opus-4-7/result.md`
  (explicit Plücker equations at (2,3,2); (R1) vs (R2) split).
- `bridges/B-001-gct-homological-circuit.md` (the (R2) route's
  natural home).
- `bridges/B-002-natural-proofs-sheaf-cohomology.md` (the (R1)
  route's natural home).
- `docs/primer/field-primers/03-p-vs-np.md` §7 (terminology).

## Final prompt copy

```text
A006 made explicit that the H_AC^0 program faces a strategic fork:

  (R1) Sheaf-on-ambient interpretation. Define F_{AC^0} on the full
       (positive-dimensional) Grassmannian-product ambient; the
       Boolean locus is encoded as a support / vanishing condition.
       H^1 is computed on the ambient. Preserves B-002 directly.
  (R2) Pivot to arithmetic / GCT moduli. Drop the Boolean
       restriction; AC^0-membership becomes a closed-subscheme or
       representation-theoretic obstruction. Makes B-001
       load-bearing.

This attempt makes the commitment and begins the work along the
chosen route. Output:

  §1 — Strategic commitment with explicit justification (at least
       three reasons; mark any provisional commitments that can be
       revisited if new evidence emerges).
  §2 — Structural shape of the chosen route's central object
       (F_{AC^0} on ambient for R1; the arithmetic moduli for R2).
  §3 — One concrete candidate construction, evaluated at the
       smallest test case where the construction is non-vacuous.
  §4 — What stays open (gap inventory update; what the next
       attempt along this route must address).

Hold to the verification bar: this attempt is L1 + L2 at best; no
candidate-promotion language; the labels `claimed-solution` and
`peer-reviewable` are forbidden.
```
