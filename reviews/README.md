# reviews/ — Review Track

This directory holds **all review activity** for the repository.

## Sub-structure

```
reviews/
  internal/             # internal reviews (repository maintainers or other agents)
    <candidate-id>/
      review-001.md
      ...
  external/             # external-expert informal reviews (L5)
    <candidate-id>/
      <reviewer-slug>/
        request.md
        review.md       ← frozen after merge
  publication-track/    # journal submissions (L6)
    <candidate-id>/
      <journal-slug>/
        submission.pdf
        round-001/
          referee-A.md
          referee-B.md
          response.md
        decision.md     ← acceptance decision copy
```

## Entry Rules

- `external/` and `publication-track/` cannot be added to by any agent
  without a human-maintainer signature.
- Merged external reviews must not be modified or deleted without the
  reviewer's consent (charter §3, AGENTS.md §3).
- Submission materials in this directory (journal submissions, etc.)
  must include in the PR body:
  - Proof of L1–L5 passes.
  - Explicit list of un-formalized parts.
  - A snapshot of the candidate's metadata at submission time.

## Metadata

This directory does not define its own metadata schema (its main
purpose is preserving external documents). Necessary information is
captured in the candidate metadata's `publication` field.

> TODO: write a precise version later. Add a concrete procedural
> example to this README when the first external review request
> happens.
