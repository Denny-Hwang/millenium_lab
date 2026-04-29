# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../../prompts/_INDEX.md`](../../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P01-multi-perspective`
- Variant: `none`
- Input variables:
  - `PROBLEM_ID`: `03-p-vs-np`
  - `HYPOTHESIS`: "To bypass the three known barriers to P vs NP
    (relativization, natural proofs, algebrization) simultaneously, the
    representation-theoretic obstruction of GCT (geometric complexity
    theory) must be lifted into homological circuit complexity, with
    sheaf cohomology classes on the circuit variety serving as the
    witness of the separation."
  - `PANEL_DOMAINS`: `["circuit-complexity", "geometric-complexity-theory",
    "communication-complexity", "homological-complexity",
    "quantum-complexity"]`
  - `KNOWN_BRIDGES`: `[]`  <!-- the bridges/ directory was empty when this attempt ran -->

## Prerequisite-reading files

- `charter.md` (§3, §4)
- `AGENTS.md`
- `docs/methodology/proof-pipeline.md`
- `docs/problems/03-p-vs-np/README.md`
- `docs/problems/03-p-vs-np/equivalent-forms.md` (placeholder)
- `docs/problems/03-p-vs-np/known-results.md` (placeholder)
- `bridges/_INDEX.md`

## Final prompt copy

```text
You are moderating a panel of five experts. The target problem is
03-p-vs-np and the hypothesis is:

  "To bypass the three known barriers to P vs NP (relativization,
   natural proofs, algebrization) simultaneously, the representation-
   theoretic obstruction of GCT must be lifted into homological circuit
   complexity, with sheaf cohomology classes on the circuit variety
   serving as the witness of the separation."

Panel composition: ["circuit-complexity", "geometric-complexity-theory",
                    "communication-complexity", "homological-complexity",
                    "quantum-complexity"]

Rules:
1. Personify each field as a single expert and have each give a
   one-paragraph first-pass opinion. Prefer phrasings that "translate"
   insights from other fields.
2. Extract exactly three points of conflict among the panelists.
3. For each conflict, decide whether it is a false conflict (a
   linguistic difference) or a real conflict (a difference in factual
   claims).
4. For each real conflict, give a one-line answer to: which data,
   computation, or theorem would the next attempt need to resolve the
   conflict?
5. At the end, score the hypothesis for multi-domain robustness on a
   1–5 scale and justify the score in a paragraph.
6. State how the hypothesis strengthens or weakens any already-cited
   bridges ([]).

Produce Markdown with the six section headers.
```

## TODO Markers

- `equivalent-forms.md`, `known-results.md`, `failed-approaches.md` for
  03-p-vs-np are all placeholders, so this attempt's panel output relied
  on the model's internal knowledge.
  → Follow-up: refining the target documents for 03-p-vs-np must
  precede before further attempts can stabilize.
