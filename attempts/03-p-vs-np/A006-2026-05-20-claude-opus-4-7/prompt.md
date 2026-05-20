# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P08-conjecture-validation`
- Variant: `minor (reason: P08 is a numerical / small-case validation
  prompt for a conjecture; here it is applied to a *structural*
  claim — that L02 v2's Boolean-evaluation locus is positive-
  dimensional — rather than to a numerical equality. The output
  template is restricted to §1 (parameter scope), §2 (computational
  step), and §3 (concise verdict + dimension count). The verdict is
  the dimension of the Boolean-evaluation closed subscheme inside
  its Grassmannian-product ambient at (n, s, d) = (2, 3, 2).)`
- Input variables:
  - `${PROBLEM_ID}`: `03-p-vs-np`
  - `${CONJECTURE_TEXT}`: A005's L02 v2 Grassmannian-product
    construction asserts an explicit Plücker-coordinate description
    of $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$. The implicit claim
    that the construction supplies non-discrete structure (relevant
    to G009) is to be tested at the smallest non-trivial case.
  - `${PARAMETER_SCOPE}`: $(n, s, d) = (2, 3, 2)$.

## Prerequisite-reading files

- `attempts/03-p-vs-np/A005-2026-05-20-claude-opus-4-7/result.md`
  (L02 v2 Grassmannian-product construction; G009 / G010 / G011).
- `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/result.md`
  (L02 v1 original statement and dependent lemmas L03, L04).
- `docs/primer/field-primers/03-p-vs-np.md` (vocabulary).
- `docs/primer/notation.md` §9 (GCT / Grassmannian notation).

## Final prompt copy

```text
You are validating a structural claim from A005. Specifically: the
A005 L02 v2 construction realizes the AC^0 circuit moduli as a
closed subscheme of a product of Grassmannians, with the
Boolean-evaluation polynomial equations cutting out the "honest"
circuit locus. A005 explicitly flagged (gap G010) that this has
not been written out at the smallest non-trivial case.

Carry out the computation for (n, s, d) = (2, 3, 2):

  1. Enumerate the DAG topologies and Grassmannian factors.
  2. Identify the Boolean-evaluation locus in each component.
  3. Compute its dimension.

State the resulting verdict on the relationship between
ambient-dimension and Boolean-locus-dimension, and the
implications for G009 (the lethal-grade gap A005 surfaced about
the H_AC^0 program collapsing in the discrete reading).

Be honest about what can be computed by hand at this scope (the
case is small enough) and what would require computer algebra
(Macaulay2 / SageMath — not available in this environment).
```
