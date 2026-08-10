# prompts/ — Standard Prompt Library

This directory is the **single source of truth** for prompts officially
usable in this repository. Inline variants are forbidden; if a new
variant is needed, first open a PR adding a new `P##`.

## When-to-use Matrix

| Stage \ intent | multi-perspective | bridge | lemma | formal | gap | counterex. | adversarial | conjecture | ledger |
|----------------|:-----------------:|:------:|:-----:|:------:|:---:|:----------:|:-----------:|:----------:|:------:|
| Idea                       | **P01**     | **P02**   |          |        |      |      |        |           |          |
| Attempt entry              | **P01**     | P02       | (P03)    |        |      |      |        |           |          |
| Attempt close-out          |             |           |          |        |      |      |        |           | **P09**  |
| Just before promotion      |             |           | **P03**  |        |      |      |        |           | (P09)    |
| Candidate authoring        |             |           | P03      | **P04**| P05  |      |        |           |          |
| Adversarial verification   |             |           |          |        | **P05** | **P06** | **P07** |       |          |
| Conjecture registration    |             |           |          |        |      |      |        | **P08**   | (P09)    |

Bold = recommended entry; parentheses = supplementary use.

## Prompt Index

| ID | File | Purpose |
|----|------|---------|
| P01 | [P01-multi-perspective.md](P01-multi-perspective.md) | Forced five-domain panel simulation |
| P02 | [P02-bridge-discovery.md](P02-bridge-discovery.md) | Discover a new bridge between two fields |
| P03 | [P03-lemma-extraction.md](P03-lemma-extraction.md) | Extract lemmas from a natural-language proof |
| P04 | [P04-formalization.md](P04-formalization.md) | Translate one lemma into Lean 4 |
| P05 | [P05-gap-finder.md](P05-gap-finder.md) | Automatically locate gaps in a candidate proof |
| P06 | [P06-counterexample.md](P06-counterexample.md) | Computationally search for counterexample candidates |
| P07 | [P07-adversarial-review.md](P07-adversarial-review.md) | Deliberate attacks on a candidate proof |
| P08 | [P08-conjecture-validation.md](P08-conjecture-validation.md) | Numerical verification of a conjecture on small cases |
| P09 | [P09-ledger-entry.md](P09-ledger-entry.md) | Turn a finished result into checkable ledger claims |

## Convention for Adding a New Prompt

- ID is the next available `P##` (currently starting from `P10`).
- Update the matrix in this index in the same PR.
- Prefer merging with an existing prompt of similar intent before adding
  a new one.
