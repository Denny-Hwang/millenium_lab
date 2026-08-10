---
id: C-002         # e.g., C-001
parent_problem: 03-p-vs-np
parent_attempt: A011
last_updated: "2026-08-10"
---

# Status — C-002

## Change Log

| Date | Numerical evidence | Lean | Note |
|------|--------------------|------|------|
| 2026-05-25 | none | none | registered |
| 2026-08-10 | partial (strengthened) | partial | External witness added by A013's literature trace: de Rezende–Vinyals (CCC 2025, *Lifting with Colourful Sunflowers*) prove an exp(Ω(n^(1/3−ε))) **monotone** circuit lower bound **for a function in P** via DAG-like lifting over non-binary alphabets, surpassing the approximation method. This sharpens the monotone instance family's witness (previously Razborov–Tardos-grade): a model-restricted invariant assigns near-maximal hardness to a uniformly-easy function, and the bound is produced by the lifting machinery itself — which still composes only between restricted models (also ECCC TR25-073, one-way NOF lifting). Fold into the pending statement-revision PR alongside A012's two amendments. Lean column reflects the ledger shape statement registered since 2026-08 (`Ledger.Statements.PvsNP.C002`), not new progress in this row. |
| 2026-07-04 | partial (strengthened) | none | A012's P01 panel adds a fourth instance family — semialgebraic relaxation hierarchies (LP extension complexity, SDP psd rank, SOS degree) — with theorem-level witnesses (Rothvoss 2014 + Edmonds 1965: matching is in P yet xc is exponential; Grigoriev 2001 / Schoenebeck 2008: parity / 3-XOR are in P yet SOS degree is Ω(n)). This family is the first that is positive-dimensional AND model-hardness-faithful, refining the wall's location to the *model-lift step*. Two amendment candidates recorded for a dedicated statement-revision PR: (i) restate the wall as the model-lift wall ("no positive-dimensional invariant on record is simultaneously model-faithful and uniform-faithful"); (ii) add the XOR / characteristic-2 boundary as an explicit organizing principle (mod-2 structure defeats every real/complex continuous encoding tried, in one direction or the other). See `attempts/03-p-vs-np/A012-2026-07-04-claude-fable-5/result.md`. |
