# routines/ — Claude Code Standard Routines

This directory holds the standardized routines (R1–R6) for multi-step
work. A Claude Code session checks this index at the start of any
multi-step task and follows the appropriate routine. Other agents may
reference these freely.

| ID | Name | One-line description | Prompts used |
|----|------|----------------------|---------------|
| [R1](R1-attempt-runner.md) | Attempt Runner | Create and run a new attempt | P01 → P02/P03 |
| [R2](R2-result-classifier.md) | Result Classifier | result.md → outcome label candidate | (none) |
| [R3](R3-dashboard-builder.md) | Dashboard Builder | Refresh the README progress table | (none) |
| [R4](R4-formalizer.md) | Formalizer | Lemma → Lean | P04 |
| [R5](R5-weekly-report.md) | Weekly Report | Weekly progress summary | (none) |
| [R6](R6-cross-attempt-synthesis.md) | Cross-attempt Synthesis | Find patterns across attempts | P02 (optional) |

## Calling Convention

A routine is a combination of Bash / Python commands and standard
prompts. Each routine file states:

1. **Invocation**
2. **Input**
3. **Step-by-step work**
4. **Output**
5. **Prompts / IDs used**
