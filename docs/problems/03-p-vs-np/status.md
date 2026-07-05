---
id: 03-p-vs-np
status: active
last_updated: 2026-07-04
---

# Status — 03-p-vs-np

## Change Log

| Date | Status | Reason |
|------|--------|--------|
| 2026-04-27 | not-started | Registered during initial repository scaffolding. |
| 2026-05-25 | dormant | H₀ / H_AC⁰ program (A001–A011) reached a route-independent obstruction (conjecture C-002, discrete-vs-continuous wall): every algebraic-geometric encoding of circuit complexity tried is either 0-dimensional (Boolean-faithful, rigid) or positive-dimensional (hardness-blind). No forward route currently identified. Status was never formally lifted from `not-started` to `active` during the A005–A011 arc; this PR makes both transitions explicit (`not-started → active → dormant`). User-approved per charter §3 / failure-criteria §3. |
| 2026-07-04 | active | Re-activated by explicit user direction to re-attempt the problem, testing dormancy re-activation trigger (1) head-on: A012 runs a P01 five-domain panel on the semialgebraic-relaxation hypothesis (extension complexity / psd rank / SOS-degree as positive-dimensional hardness-tracking invariants; o-minimal tameness as finiteness control). A012 ended `partial-insight`, which per failure-criteria §4 automatically proposes returning to `active`. Honest note: A012's substantive finding is that trigger (1)'s semialgebraic/o-minimal wording does **not** cross the C-002 wall (see A012 result.md — the Rothvoss 2014 and 3-XOR/SOS inversions witness that positive-dimensional semialgebraic invariants track *model-restricted* hardness only; the wall relocates to the model-lift step). The problem is `active` because work is again in progress, with the remaining untested direction (bounded-cancellation arithmetic models) and the refined model-lift question as the forward paths. |

## Re-activation (2026-07-04)

A012 (P01 panel, model claude-fable-5) tested re-activation trigger
(1)'s first candidate direction — semialgebraic / o-minimal — and
found it refines rather than crosses the wall. See
`attempts/03-p-vs-np/A012-2026-07-04-claude-fable-5/result.md` for
the panel verdicts and the "model-lift wall" refinement of C-002.
Remaining forward paths: (i) bounded-cancellation arithmetic models
(the untested half of trigger (1)); (ii) the model-lift question
itself (communication-complexity lifting theorems as the
best-developed machinery — do they compose toward uniform models?).

## Dormancy details

### Why dormant

The 11 merged attempts on 03-p-vs-np (A001–A011) form a single coherent arc — the H₀ / H_AC⁰ sheaf-cohomology program — that:

- proposed an algebraic-geometric reformulation of AC⁰ lower bounds (A001–A004);
- pursued the (R1) sheaf-on-Boolean-circuit route to its honest exhaustion (A005–A009), surfacing conjecture [C-001](../../../conjectures/C-001-boolean-rigidity-sheaf-obstruction/) (Boolean-rigidity obstruction);
- pivoted to the (R2) arithmetic-circuit route (A010), surfacing gap G019 (Boolean-vs-arithmetic gap);
- tested the monotone (R2′) route (A011), finding the dilemma reproduces, and registered the route-independent generalization as [C-002](../../../conjectures/C-002-discrete-continuous-wall/) (discrete-vs-continuous wall).

The R6 cross-attempt synthesis ([`analysis/cross-synthesis/03-p-vs-np-2026-05-21.md`](../../../analysis/cross-synthesis/03-p-vs-np-2026-05-21.md)) earlier captured the recurring blocker as Boolean rigidity; A011 showed the obstruction is route-independent. Both A010 and A011 explicitly recommended dormancy.

### Failure-criteria conformity (honest note)

Per [`docs/methodology/failure-criteria.md`](../../methodology/failure-criteria.md) §3:

- **§3.1 quantitative conditions**: not literally met (the program has 11 attempts in the last six months, with 8 `partial-insight` outcomes — these are *productive* attempts, not stalled ones).
- **§3.2 qualitative conditions**: met (the R6 report identifies repeated patterns; A011 establishes route-independence — "the same pattern repeating" appears at every encoding tried).

The §3.1 letter assumes "stalled = low activity"; this case is **"productive convergence on a structural wall."** The dormancy decision is user-approved on §3.2 substance, charter §2 spirit ("attempts for their own sake is a non-goal"), and explicit recommendations from A010 + A011. The mismatch with §3.1 is recorded for honesty; a future charter / failure-criteria refinement could add a "productive-but-walled" trigger.

### Re-activation triggers

Per failure-criteria §4, a new attempt yielding `partial-insight` or stronger automatically proposes returning to `active`. The substantive re-activation conditions for this specific program are:

1. A moduli construction simultaneously **positive-dimensional** *and* **faithful to Boolean hardness** — i.e., a refutation of C-002 by exhibiting an algebraic-geometric encoding that crosses the discrete-vs-continuous wall. Candidate directions (speculative, currently out of scope): real-algebraic / o-minimal handling of semialgebraic Boolean loci; a bounded-cancellation arithmetic model strictly between monotone and full arithmetic.
2. An external advance giving a non-coherent / non-algebraic invariant that escapes C-001's quantification — e.g., a constructible-sheaf or Hodge-theoretic class with the right vanishing direction.
3. A direct refutation of C-001 by constructing a coherent sheaf with the correct biconditional direction on a Boolean-circuit moduli.

Until any of (1)–(3), no fresh attempts on this program should be opened.

### Preserved assets

- Conjectures: [C-001](../../../conjectures/C-001-boolean-rigidity-sheaf-obstruction/), [C-002](../../../conjectures/C-002-discrete-continuous-wall/).
- Bridges: [B-001](../../../bridges/B-001-gct-homological-circuit.md) (status `active`, *load-bearing-but-subject-to-C-002*), [B-002](../../../bridges/B-002-natural-proofs-sheaf-cohomology.md) (status `dormant`).
- Cross-synthesis: [03-p-vs-np-2026-05-21.md](../../../analysis/cross-synthesis/03-p-vs-np-2026-05-21.md).
- Eleven frozen transcripts (A001–A011) under `attempts/03-p-vs-np/`.
