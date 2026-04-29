# Proof Pipeline

This document defines, stage by stage, how a one-line hypothesis is
gradually promoted into a peer-review-ready formal proof. Each stage maps
1:1 to a directory, a metadata schema, and a verification level in this
repository.

```
idea
  → attempt              attempts/<problem>/A###-...
  → candidate            candidates/PC-###-...
  → formalization        formalization/projects/<problem>/...
  → adversarial          adversarial/proof-attacks/<candidate>/
  → external review      reviews/external/<candidate>/
  → publication track    reviews/publication-track/<candidate>/
  → publication
  → two-year settlement
```

Every stage has a pass criterion (a verification level) and a deliverable
(metadata + prose).

---

## Stage 1 — Idea

- Form: free notes, personal scratchpad, or an issue.
- Required deliverable: none. But to promote an idea to an attempt, the
  following must be stated:
  - Target problem ID.
  - Which insight from which five-domain panel motivated it.
  - How it differs from existing attempts.

After the idea is compressed into one line, it must pass through
[`prompts/P01-multi-perspective.md`](../../prompts/P01-multi-perspective.md)
before promotion.

---

## Stage 2 — Attempt

- Form: `attempts/<problem>/A###-<date>-<model>/`
- Deliverables:
  - `meta.yaml` (schema: `schemas/attempt-meta.schema.yaml`)
  - `prompt.md` (the standard prompt ID and input variables used)
  - `transcript.md` (full AI conversation; **frozen after merge**)
  - `result.md` (summary + outcome label + insights + follow-ups)
  - `artifacts/` (graphs, computation outputs, etc.)
- Termination: assign an outcome label.
- Allowed outcomes: `no-progress`, `survey`, `flawed-attempt`,
  `partial-insight`, `novel-approach`.
  `claimed-solution` and `peer-reviewable` are forbidden at this stage.

When five attempts on the same problem accumulate, R6
(cross-attempt synthesis) is automatically recommended.

---

## Stage 3 — Candidate

- Form: `candidates/PC-###-<slug>/`
- Entry conditions:
  - At least one source attempt with outcome `partial-insight` or
    `novel-approach`.
  - The promotion PR includes the result of running
    [`prompts/P03-lemma-extraction.md`](../../prompts/P03-lemma-extraction.md).
- Deliverables:
  - `meta.yaml` (schema: `schemas/candidate-meta.schema.yaml`)
  - `claim.md`, `strategy.md`, `main-proof.md`, `gaps.md`, `attacks.md`
  - `lemmas/L##.md`, `lemmas/L##.lean`
  - `reviews/` (received reviews preserved; frozen after merge)

Verification level **L1** (self-consistency) must pass before
registration as a candidate.

---

## Stage 4 — Formalization

- Location: `formalization/projects/<problem>/PC-###/`
- Deliverables: per-lemma `.lean` files and a `lakefile.lean` capturing
  dependencies.
- Pass criterion:
  - Each lemma builds.
  - The candidate's `formalization_progress` is updated.
  - L3 = "core lemmas build, and they correspond to the natural-language
    proof of the main theorem."

---

## Stage 5 — Adversarial Verification

- Location: `adversarial/proof-attacks/PC-###/`
- Activities:
  - Assumption-weakening trials.
  - Counterexample search
    ([`prompts/P06-counterexample.md`](../../prompts/P06-counterexample.md)).
  - Intentional gap discovery
    ([`prompts/P05-gap-finder.md`](../../prompts/P05-gap-finder.md)).
  - Adversarial review
    ([`prompts/P07-adversarial-review.md`](../../prompts/P07-adversarial-review.md)).
- Pass criterion (L4): every planned attack fails, or every gap found is
  closed by a PR amending the candidate.

Whenever possible, the agent attacking is a different model or session
from the candidate's author.

---

## Stage 6 — External Review (L5)

- Location: `reviews/external/PC-###/`
- Procedure:
  - The maintainer recruits at least three external experts.
  - The review-request letter and material package are frozen and sent.
  - Original reviews must not be modified or deleted without consent.
- Pass criterion: zero lethal-flaw reports. Small gaps are returned to
  the candidate to be closed.

---

## Stage 7 — Publication Track (L6)

- Location: `reviews/publication-track/PC-###/`
- Deliverables:
  - Submission PDF.
  - Per-round responses to peer review.
  - Acceptance decision copy.
- Pass criterion: **published** in an authoritative journal recognized
  by CMI.

Every submission in this stage requires a human-maintainer-signed PR.

---

## Stage 8 — Two-Year Settlement (L7)

- Activities: monitor, for 24 months after publication:
  - Essential refutations.
  - Reports of gaps in core lemmas surfacing in the citing literature.
  - Whether errata have been issued.
- Pass criterion: 24 months without an essential refutation. The
  metadata label `peer-reviewable` is finalized.

Only after L7 may a CMI prize claim be initiated (charter §6).

---

## Appendix — Inter-stage Return Rules

- Lethal flaw discovered at the candidate stage → return to the attempt
  stage (`status: abandoned`).
- Lemma defect discovered during formalization → return to the candidate
  stage; record in the candidate's `gaps_known`.
- Gap reported during external review → reroute through adversarial
  verification, then update the candidate.

Returns are not failures — they are the pipeline working as intended.
