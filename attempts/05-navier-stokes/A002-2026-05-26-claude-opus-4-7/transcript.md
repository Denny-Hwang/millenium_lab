# Transcript — full AI conversation (frozen after merge)

> ⚠️ This file is **immutable** after the PR is merged — no edits, no
> deletions, not even typo or line-break fixes. Corrections are
> recorded in this folder's `result.md`.

---

## Meta

- Attempt ID: A002
- Model: claude-opus-4-7
- Start: 2026-05-26 (same session as A001 + problem-doc filling)
- End: 2026-05-26
- Environment: Claude Code on the Web, ephemeral container at HEAD
  of `main` after PR #23 (problem-doc filling) merge.

---

## Body

```text
[Session task framing]

Follow-up #1 from A001: tighten the hypothesis. A001's panel
established that the candidate critical functionals are not
equivalent. This attempt catalogs the strict-inclusion ladder
of critical norms for 3D NSE, the known bridging theorems, and
the open one-sided embeddings along NSE flows.

[Reading order]

- A001 result.md (panel, C1 finding).
- equivalent-forms.md §3 (ladder).
- known-results.md §4 (Koch-Tataru, ESS).
- primer field-notes (vocabulary).

[Scaling reminder]

NSE scaling: u_λ(x, t) = λ u(λ x, λ^2 t). A norm ||·||_X is
*critical* iff ||u_λ||_X = ||u||_X for all λ > 0. Smaller spaces
(stronger norms) require more regularity; larger spaces are
easier to lie in but give less control. Embedding is small -> large.

For Lebesgue: ||u_λ||_{L^p} = λ^{1 - 3/p} ||u||_{L^p}; critical
at p = 3.

For homogeneous Sobolev: ||u_λ||_{Ḣ^s} = λ^{s - 1/2} ||u||_{Ḣ^s};
critical at s = 1/2.

For homogeneous Besov Ḃ^s_{p,q}: critical when s = -1 + 3/p.

[Step 1 — Catalog]

Six critical spaces, ordered small (most regularity) to large
(least), all subspaces of Schwartz distributions:

  Ḣ^{1/2}(R^3)
    ⊂ L^3(R^3)
    ⊂ Ḃ^0_{3, q}(R^3)         (q in [1, ∞], critical Besov at p=3)
    ⊂ Ḃ^{-1+3/p}_{p, q}(R^3)  (general critical Besov, p in (3, ∞], q in [1, ∞])
    ⊂ BMO^{-1}(R^3) = Ḟ^{-1}_{∞, 2}
    ⊂ Ḃ^{-1}_{∞, ∞}(R^3)

Each strict inclusion: Sobolev embedding (Ḣ^{1/2} -> L^3 by H^s
-> L^{2n/(n-2s)} in R^n with n=3, s=1/2); Bernstein inequalities
on Littlewood-Paley blocks for the Besov steps; BMO -> Ḃ^{-1}_{∞,∞}
by Triebel-Lizorkin embedding.

Known critical theorems attached to each:

  - Ḣ^{1/2}: Fujita-Kato 1964 local well-posedness for small data.
  - L^3: Escauriaza-Seregin-Šverák (ESS) 2003. L^∞_t L^3_x bound
    along smooth flow implies regularity. **Most important
    bridging theorem.**
  - Ḃ^{-1+3/p}_{p, q}: Cannone, Meyer 1995 well-posedness for
    small data.
  - BMO^{-1}: Koch-Tataru 2001 global well-posedness for small
    data; the largest critical space at which any small-data
    well-posedness holds.
  - Ḃ^{-1}_{∞, ∞}: Bourgain-Pavlovic 2008 ILL-POSEDNESS (norm
    inflation arbitrarily close to zero); marks the top of the
    ladder.

The Ladyzhenskaya-Prodi-Serrin (LPS) family also lives in this
landscape: u in L^q_t L^p_x with 2/q + 3/p = 1, 3 <= p <= ∞,
implies regularity. For (q, p) = (∞, 3): ESS 2003. For (q, p) =
(2, ∞): classical Prodi-Serrin. Each LPS pair gives a different
critical-norm criterion.

[Step 2 — Refining A001 C1]

A001 panel finding C1: "the candidate Φ across fields are not
equivalent." A002 sharpens:

  - The candidates form a STRICT INCLUSION CHAIN of critical
    spaces (Ḣ^{1/2} ⊂ L^3 ⊂ ... ⊂ Ḃ^{-1}_{∞, ∞}).
  - Each successive inclusion is a known fact (Sobolev / Besov
    embedding theory).
  - The 'equivalence' the strict A001 hypothesis demanded would
    require these inclusions to be REVERSIBLE on smooth NSE
    flows. They are not known to be reversible, and this is
    precisely the open question.

So C1 is reframed: it is not 'the candidates are unrelated' but
'the candidates form a known partial order, and the open question
is which member of the chain has a bounded a-priori norm along
smooth NSE evolution.'

[Step 3 — Open one-sided embedding questions along NSE flow]

The critical question for CMI sub-case (A): does there exist a
critical norm X such that every smooth, decaying initial datum
u_0 yields a smooth solution with u in L^∞_t X for all t > 0?

Status of candidate X (large-data, all smooth decaying u_0):

  X = Ḣ^{1/2}: OPEN.
  X = L^3:    OPEN (ESS would then close (A)).
  X = BMO^{-1}: OPEN for large data; Koch-Tataru gives small-data
                global solutions.
  X = Ḃ^{-1}_{∞, ∞}: meaningless (ill-posed).

Pairwise: does L^∞_t X bound imply L^∞_t Y bound for X strictly
smaller than Y? In general yes by embedding (instantaneously,
small space -> large space). So bounded in the smallest X is the
strongest claim.

The converse (Y bounded along flow -> X bounded along flow, X
strictly smaller) is open for almost all pairs. Specifically:

  - BMO^{-1} along flow -> L^3 along flow: OPEN. Would imply (A).
  - L^3 along flow -> Ḣ^{1/2} along flow: OPEN.
  - Ḃ^{-1+3/p}_{p, q} along flow -> L^3 along flow: OPEN.

The 'ordered family' weakened hypothesis from A001 § C1 is
exactly: SOME X in the chain has the global-bound property. The
ladder makes this a list of explicit open questions.

[Step 4 — Outcome label deliberation]

  - no-progress: false; produces a structured catalog.
  - survey: matches well — a catalog of known critical norms and
    embeddings, organized to support the program's next steps.
    No new theorem, no new gap.
  - partial-insight: borderline. The catalog refines A001's C1 by
    making the chain explicit, but this is *organization* of
    existing knowledge, not a new insight.
  - flawed-attempt: false.
  - novel-approach, claimed-solution, peer-reviewable: not
    applicable.

  Selected: survey.

[Charter §3 audit]

  L1: dependency-graph closure. The catalog cites the standard
      embedding theorems (Sobolev, Bernstein, Triebel-Lizorkin)
      and the critical-NSE theorems (Fujita-Kato, ESS, Koch-Tataru,
      Bourgain-Pavlovic). Closed.
  L2-L7: n/a.
```
