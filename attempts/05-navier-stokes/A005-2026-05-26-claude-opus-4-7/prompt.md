# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: not extracting lemmas from an existing
  natural-language proof. Repurposed for STRATEGIC sub-goal
  decomposition: enumerate the lemma-shaped sub-goals of a
  program-level direction commitment, in the spirit of P03's lemma
  graph. Output template restricted to §1 (statement of the program
  target as 'lemmas'), §5 (gaps = pivot triggers).)`
- Input variables:
  - `${ATTEMPT_PATH}`: `attempts/05-navier-stokes/A001-...` +
    A002 (ladder) + A003 (B-003) + A004 (B-004).
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${PROOF_TEXT}`: the user-approved direction (α) global
    regularity, with B-003's T1 ($\mathrm{BMO}^{-1} \to L^3$
    along-flow) as the next attack vector — the user's explicit
    choice after A004.

## Prerequisite-reading files

- `attempts/05-navier-stokes/A001-...result.md`
- `attempts/05-navier-stokes/A002-...result.md`
- `attempts/05-navier-stokes/A003-...result.md`
- `attempts/05-navier-stokes/A004-...result.md`
- `bridges/B-003-critical-norm-equivalence-along-flow.md`
- `bridges/B-004-cfd-pde-rigorous-turbulence-closure.md`
- `docs/problems/05-navier-stokes/verification-bar.md`
- `analysis/cross-synthesis/03-p-vs-np-2026-05-21.md` (lesson on
  late direction-commitment in the dormant 03-p-vs-np program).

## Final prompt copy

```text
The user has explicitly chosen direction (α) — global regularity
for CMI (A)/(C) — with B-003's T1 (BMO^{-1} → L^3 along-flow) as
the highest-leverage open transformation.

Output a direction-commitment document with:

  §1 — Explicit commitment (direction α, target L^3, route T1).
  §2 — Sub-goal decomposition of T1 (T1a small-data; T1b
       large-data; T1c Tao-barrier audit).
  §3 — Stage plan A006-A008 with concrete first attempt for each.
  §4 — Pivot trigger conditions (when to revisit α vs β; when to
       switch route within α).
  §5 — Verification-bar pre-audit (which barriers in
       verification-bar.md §7 the route must address).

Apply the 03-p-vs-np dormancy lesson: set the trigger EARLY and
make it precise. The committed route should be falsifiable in 3
attempts.

Hold to the verification bar: this is L1-only (strategic document,
not a proof).
```
