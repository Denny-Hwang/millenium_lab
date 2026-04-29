# adversarial/ — Self-refutation Track

This directory holds the repository's **attempts to break itself**. Per
charter §4.3, no candidate may leave for external review without
adversarial verification.

## Sub-structure

```
adversarial/
  counterexample-search/      # counterexample search against conjecture / candidate conclusions
    <target-id>/              # e.g., C-001-modular-equidistribution/, PC-002-...
      attempt-001/
        meta.yaml
        method.md
        results.md
        artifacts/
  proof-attacks/              # deliberate attacks on a candidate proof
    <candidate-id>/           # e.g., PC-002-rh-via-rmt/
      round-001/
        meta.yaml
        attack.md
        verdict.md
        artifacts/
```

## Procedure

### Counterexample search

1. Generate pseudocode with prompt P06.
2. Save the pseudocode in `method.md`; preserve runs in `artifacts/`.
3. Record the round verdict in `results.md`:
   - Verdict: counterexample-found / strong-evidence-no-counterexample
     / inconclusive.
   - What label change is recommended on the target conjecture's or
     candidate's metadata.

### Proof attack

1. Run an attack round via prompt P07 (or a human reviewer).
2. Record the verdict in `verdict.md` (survives / needs-patch /
   lethal).
3. At the end of the round, append a summary row to the candidate's
   `candidates/PC-###/attacks.md`.

## Who Performs

- A **different model / different session** agent or a human, *not*
  the candidate's author.
- If the same person/session has already done a round on a candidate,
  the next round is mandatorily delegated to a different actor.

## Metadata

The metadata schemas for this directory will be added incrementally.

> TODO: write a precise version later. Once the first candidate
> appears, consider adding `attack-meta.schema.yaml`.
