# P01 — Multi-Perspective Panel (five-domain panel)

## When to Use

- Just before promoting an idea into an attempt, or
- Within the first 30 minutes of an attempt.

This prompt forces a five-domain panel to break the trap of a
single-field viewpoint. It is mandatory under charter §4.1 (consilient
approach).

## Input Variables

- `${PROBLEM_ID}` — target problem (e.g., `02-riemann`).
- `${HYPOTHESIS}` — one-line hypothesis.
- `${PANEL_DOMAINS}` — exactly five domain slugs, e.g.,
  `["analytic-number-theory", "random-matrix-theory",
    "operator-algebras", "dynamical-systems", "combinatorics"]`.
- `${KNOWN_BRIDGES}` — list of bridge IDs already cited for this problem
  (empty list if none).

## Prerequisite Reading

- `charter.md`
- `docs/methodology/proof-pipeline.md`
- `docs/problems/${PROBLEM_ID}/README.md`
- `docs/problems/${PROBLEM_ID}/equivalent-forms.md`
- `docs/problems/${PROBLEM_ID}/known-results.md`
- `bridges/_INDEX.md`

## Prompt Body

```
You are moderating a panel of five experts. The target problem is
${PROBLEM_ID} and the hypothesis is:

  "${HYPOTHESIS}"

Panel composition: ${PANEL_DOMAINS}

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
   bridges (${KNOWN_BRIDGES}).

Produce Markdown with the six section headers below.
```

## Output Format

```markdown
## 1. First-pass opinions
### {domain1}
...
### {domain2}
...
(five total)

## 2. Three conflicts
- C1: ...
- C2: ...
- C3: ...

## 3. Conflict classification
- C1: false / real — reason
- C2: ...
- C3: ...

## 4. Resolution data / computations / theorems
- C1: ...
- C2: ...
- C3: ...

## 5. Multi-domain robustness score
- Score: N/5
- Justification: ...

## 6. Implications for existing bridges
- B-###: strengthen / weaken — reason
```

## Follow-ups

- robustness ≥ 4 → recommend promotion to attempt.
- robustness ≤ 2 → discard or re-formulate the hypothesis.
- If new bridge candidates are identified → invoke P02.
