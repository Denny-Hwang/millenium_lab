# Attacks — Adversarial Verification Records

This file logs adversarial attempts against the candidate and their
outcomes. Detailed attack records live under
`../adversarial/proof-attacks/PC-###/`; this file is the summary.

---

## Attack Rounds

| Round | Date | Attacker (model / person) | Attack kind | Outcome |
|-------|------|---------------------------|-------------|---------|
| 1 | TODO | TODO | TODO | TODO |

## Attack Kinds

- **Assumption weakening** — does the conclusion survive when an
  assumption is weakened?
- **Counterexample search** —
  [`../../prompts/P06-counterexample.md`](../../prompts/P06-counterexample.md)
- **Gap finder** —
  [`../../prompts/P05-gap-finder.md`](../../prompts/P05-gap-finder.md)
- **Adversarial review** —
  [`../../prompts/P07-adversarial-review.md`](../../prompts/P07-adversarial-review.md)

## L4 Pass Criteria

- ≥3 planned attack kinds either fail or are closed by gap returns.
- The final round is performed by an agent in a different
  model / different session from the candidate's author.
