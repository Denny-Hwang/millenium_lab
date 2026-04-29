# Outcome Taxonomy — Attempt Result Labels

Every attempt receives exactly one outcome label at termination. This
document specifies each label's definition, examples, and the cases in
which it cannot be assigned.

---

## Label Index

| Label | When usable | One-line definition |
|-------|-------------|---------------------|
| `no-progress` | always | No meaningful progress |
| `survey` | always | Synthesis of existing results; no new progress |
| `flawed-attempt` | always | The attempt has a clear defect (assumption violation, etc.) |
| `partial-insight` | always | Partial insight worth follow-up work |
| `novel-approach` | always | An approach not present in the prior literature; candidate-promotable |
| `claimed-solution` | **only after L6** | Publication in an authoritative journal |
| `peer-reviewable` | **only after L7** | Two-year settlement achieved after publication |

---

## 1. `no-progress`

**Definition**: the attempt produces no new insight, computational
result, counterexample, or bridge. Time was spent but no valuable
artifact emerged.

**Examples**:
- The model only repeats "this problem is hard."
- The output is a flat list of known theorems.
- The work drifts onto a different problem than intended.

**Action**: in `result.md`, give the reason in 1–3 sentences. Once five
such attempts on the same problem accumulate, invoke R6
(cross-attempt synthesis).

---

## 2. `survey`

**Definition**: existing results are well organized and summarized, but
no new progress was made.

**Examples**:
- Eight of twelve equivalent forms of the Riemann Hypothesis are
  correctly catalogued.
- Existing attempts on the Yang–Mills mass gap are classified.

**Action**: absorb the result into
`docs/problems/<problem>/known-results.md` or `equivalent-forms.md`.

---

## 3. `flawed-attempt`

**Definition**: the attempt is clearly flawed. The flaw is one or more
of the following:

- Solved a different statement than the official CMI one.
- A core step relies on an assumption that is in fact false.
- Circular reasoning.
- Ignored a known counterexample.

**Examples**:
- Uncritically applied a finite-dimensional theorem in infinite
  dimensions.
- "For sufficiently large N" matters decisively, but uniformity in N
  fails.

**Action**: in `result.md`, record the precise location and kind of the
flaw. If the same flaw appears in other attempts, lift it into
`bridges/` or `failed-approaches.md`.

---

## 4. `partial-insight`

**Definition**: a new insight emerged, but it is not sufficient to
stand alone as a candidate.

**Examples**:
- A new lower bound on the blow-up time for Navier–Stokes.
- An observation on a specific family of modular forms in BSD.

**Action**: state follow-ups in the `follow_ups` field of `result.md`.
Cite this attempt directly from any successor attempt.

---

## 5. `novel-approach`

**Definition**: an approach that is not explicitly present in the
existing literature, with enough internal consistency to be considered
for candidate promotion.

**Examples**:
- Re-proving an existing theorem via a new bridge between two fields
  (`bridges/B-###`).
- A new formal system or representation.

**Action**: evaluate candidate-promotion eligibility with
[`prompts/P03-lemma-extraction.md`](../../prompts/P03-lemma-extraction.md).
On promotion, move to `candidates/PC-###/`.

---

## 6. `claimed-solution` ⚠️

**Definition**: usable **only after** L6 (publication in an authoritative
journal).

**Misuse consequence**: PR is blocked by `claim-integrity.yml`.

---

## 7. `peer-reviewable` ✅

**Definition**: usable **only after** L7 (two-year settlement after
publication).

**Meaning**: the academic prerequisites for a CMI prize claim are
satisfied.

---

## Labeling Procedure

1. After the attempt ends, write `result.md`.
2. The author proposes one candidate label.
3. The R2 (result classifier) routine validates the candidate label.
4. The PR check automatically verifies the label matches the metadata
   schema.
