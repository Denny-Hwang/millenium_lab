# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../../prompts/_INDEX.md`](../../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `none`
- Input variables:
  - `ATTEMPT_PATH`: `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/`
  - `PROBLEM_ID`: `03-p-vs-np`
  - `PROOF_TEXT`: a sketch of the AC⁰ pilot proposition derived from
    bridge B-002's open direction §4.1 — see *Final prompt copy*
    below for the verbatim text fed into P03.

## Prerequisite-reading files

- `attempts/03-p-vs-np/A001-2026-04-29-claude-opus-4-7/result.md`
  (parent attempt; defines hypothesis H₀ and conflict C1)
- `bridges/B-001-gct-homological-circuit.md`
  (companion bridge for the constructiveness arm)
- `bridges/B-002-natural-proofs-sheaf-cohomology.md`
  (the bridge whose §4 AC⁰ pilot is the input to this attempt)
- `docs/problems/03-p-vs-np/statement.md`
- `docs/problems/03-p-vs-np/equivalent-forms.md`
- `docs/problems/03-p-vs-np/known-results.md`
- `docs/problems/03-p-vs-np/failed-approaches.md`
- `docs/problems/03-p-vs-np/verification-bar.md` (three-barrier audit)
- `candidates/_TEMPLATE/`
- `schemas/candidate-meta.schema.yaml`

## Context (departure from A001)

A001 produced hypothesis H₀ at `survey` level and identified two
bridges. This attempt narrows to the **AC⁰ sub-hypothesis** that is
the most concrete and least ambitious portion of H₀:

> **(H_AC⁰)** There exist a $\mathrm{GL}_n$-equivariant variety
> $\mathcal{C}^{\mathrm{AC}^0}_{n,s}$ parameterizing $n$-input
> AC⁰ circuits of size $\le s$, and a coherent equivariant sheaf
> $F_{\mathrm{AC}^0}$ on $\mathcal{C}^{\mathrm{AC}^0}_{n,s}$, such
> that for every $f : \{0,1\}^n \to \{0,1\}$,
>
> $$ f \notin \mathrm{AC}^0 \iff
>    [F_{\mathrm{AC}^0}]_f \in H^1(\mathcal{C}^{\mathrm{AC}^0}_{n,s},
>    F_{\mathrm{AC}^0}) \;\text{is non-zero.} $$

The attempt does **not** prove H_AC⁰. The attempt extracts the
lemmas that a future formal proof of H_AC⁰ would have to discharge,
classifies their formalization difficulty, and produces a closed
dependency graph. This positions the work for promotion to a
candidate `PC-001-...` once the small-case numerical evidence is
collected (deferred — that requires Macaulay2 / SageMath, not
available in this session).

## Final prompt copy

```text
Decompose the following natural-language proof sketch into verifiable
lemmas.

Proof sketch:
"""
We aim to prove (H_AC⁰): for every f : {0,1}^n → {0,1},

  f ∉ AC⁰ ⇔ [F_AC⁰]_f ∈ H¹(C^AC⁰_{n,s}, F_AC⁰) is non-zero,

where C^AC⁰_{n,s} is a GL_n-equivariant variety parameterizing AC⁰
circuits of size ≤ s on n inputs and F_AC⁰ is a coherent equivariant
sheaf on it.

Sketch (target = a candidate-grade natural-language proof):
1. Construct C^AC⁰_{n,s} as a quasi-projective variety, equivariant
   under input-coordinate permutation, equipped with a "circuit
   evaluation" morphism eval : C^AC⁰_{n,s} → A^{2^n} sending a
   circuit to its truth table. Show eval is a regular map and that
   the image of eval is a constructible subset.
2. Define F_AC⁰ as the kernel of a map between two locally free
   sheaves whose ranks encode "size budget remaining" and "depth
   budget remaining". Show F_AC⁰ is coherent and equivariant.
3. Compute H¹(C^AC⁰_{n,s}, F_AC⁰) for small n (n ≤ 4) and observe
   that the Čech 1-cocycle attached to f vanishes precisely when f
   admits an AC⁰ circuit of size ≤ s and depth O(1).
4. Lift the small-n case via standard equivariant cohomology
   stability (Borel construction) to all n.
5. Verify the natural-proofs barrier compatibility: F_AC⁰ does not
   admit a uniform 2^O(n)-time evaluation algorithm.
6. Verify the relativization barrier compatibility: the construction
   in step 1 fails to lift to oracle Turing machines.
7. Verify the algebrization barrier compatibility: F_AC⁰ is not
   determined by low-degree algebraic extensions.
"""

Rules:
1. Each lemma must carry:
   - A one-sentence statement.
   - A list of axioms / external theorems / preceding lemmas it
     depends on.
   - An estimated formalization difficulty (low / medium / high).
   - Known gaps (or "none").
2. Decompose so the dependency graph is closed. Surface implicit
   facts used in the body as explicit lemmas.
3. External theorems are handled as citations (do not turn them into
   lemmas). Citation format: '[Author Year, Theorem N]'.
4. Lemma IDs run from L01 upward. Deeper-dependency lemmas get larger
   numbers.
5. At the end, draw the dependency graph in mermaid or ASCII.

Produce Markdown with the six section headers.
```

## TODO Markers

- The construction of $\mathcal{C}^{\mathrm{AC}^0}_{n,s}$ and
  $F_{\mathrm{AC}^0}$ is **proposed**, not built. Step 1–2 of the
  sketch are themselves substantive open problems. The lemma list
  surfaces this honestly.
- Numerical verification of step 3 ($n \le 4$) is deferred to a
  future attempt that has Macaulay2 / SageMath available; this
  attempt's outcome is `partial-insight`, not a body proof.
