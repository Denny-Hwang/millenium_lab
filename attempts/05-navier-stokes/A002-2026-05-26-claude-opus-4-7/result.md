# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Catalogs the six-step critical-norm ladder for 3D NSE
($\dot H^{1/2} \subset L^3 \subset \dot B^0_{3,q} \subset
\dot B^{-1+3/p}_{p,q} \subset \mathrm{BMO}^{-1} \subset
\dot B^{-1}_{\infty,\infty}$) with the known bridging theorem
attached to each step, refines A001's C1 from "candidates are not
equivalent" to "candidates form a strict-inclusion chain with known
one-sided embeddings; the open question is which step admits a
large-data, all-data $L^\infty_t$ bound along smooth NSE flows."

## Outcome Label

- Label: `survey`
- Reason: Organizes existing knowledge into the "dependency-graph
  backbone" for the program; no new theorem, gap label, or
  candidate. The catalog refines A001's C1 into an explicit list of
  open questions but does not advance any of them. Fits `survey`
  better than `partial-insight`.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. The critical-norm ladder (catalog)

Under NSE scaling $u_\lambda(x, t) = \lambda u(\lambda x, \lambda^2
t)$, the *critical* spaces $X$ are those with $\|u_\lambda\|_X =
\|u\|_X$.

In strict-inclusion order, smallest space (strongest control) to
largest (weakest):

| Step | Space | Critical-norm theorem |
|------|-------|----------------------|
| 1 | $\dot H^{1/2}(\mathbb{R}^3)$ | **Fujita–Kato 1964**: local well-posedness for small data. |
| 2 | $L^3(\mathbb{R}^3)$ | **Escauriaza–Seregin–Šverák 2003**: $u \in L^\infty_t L^3_x$ along smooth flow $\Rightarrow$ regularity. *Most important bridging theorem.* |
| 3 | $\dot B^0_{3,q}(\mathbb{R}^3)$, $q \in [1, \infty]$ | extensions of ESS to limiting Besov scales. |
| 4 | $\dot B^{-1+3/p}_{p,q}(\mathbb{R}^3)$, $p \in (3, \infty]$, $q \in [1, \infty]$ | **Cannone–Meyer 1995**: small-data global well-posedness in critical Besov family. |
| 5 | $\mathrm{BMO}^{-1}(\mathbb{R}^3) = \dot F^{-1}_{\infty, 2}$ | **Koch–Tataru 2001**: global well-posedness for small data; the largest critical Banach space at which small-data global well-posedness is currently known. |
| 6 | $\dot B^{-1}_{\infty,\infty}(\mathbb{R}^3)$ | **Bourgain–Pavlovic 2008**: ILL-POSEDNESS (norm inflation arbitrarily close to zero); marks the top of the ladder. |

Embeddings between consecutive steps are standard
(Sobolev / Bernstein / Triebel–Lizorkin) and *spatial*
(instantaneous, not flow-dependent).

The **Ladyzhenskaya–Prodi–Serrin (LPS) family** lives transversally
in this landscape: $u \in L^q_t L^p_x$ with $2/q + 3/p = 1$, $p \in
[3, \infty]$, implies regularity. ESS 2003 is the endpoint $(q, p)
= (\infty, 3)$; classical Prodi–Serrin gives $(2, \infty)$.

## 2. Scaling derivation reminder

- $L^p$ scaling: $\|u_\lambda\|_{L^p} = \lambda^{1 - 3/p}\|u\|_{L^p}$
  $\Rightarrow$ critical at $p = 3$.
- $\dot H^s$ scaling: $\|u_\lambda\|_{\dot H^s} = \lambda^{s-1/2}
  \|u\|_{\dot H^s}$ $\Rightarrow$ critical at $s = 1/2$.
- $\dot B^s_{p, q}$: critical when $s = -1 + 3/p$.

The energy $\int |u|^2 = \|u\|_{L^2}^2$ has scaling exponent $-1/2$
in $\|u\|^2$, making it **supercritical** in 3D — the root cause of
why the energy-inequality alone cannot close (A).

## 3. Refining A001's C1

A001 panel's C1 finding was: *"candidate $\Phi$ across fields are
not equivalent norms."* A002 sharpens this:

- The candidates form a known **strict-inclusion chain** of
  critical spaces; the chain is well-classified in harmonic
  analysis.
- The strict A001 hypothesis ("same $\Phi$ up to equivalence")
  would require these inclusions to be *reversible on smooth NSE
  flows*. They are not known to be reversible — this is **precisely
  the open question** the program faces.

So C1 is reframed: it is not "the candidates are unrelated" but
**"the candidates form a known partial order, and the open
question is which member of the chain has a bounded a-priori norm
along all smooth NSE evolution."**

## 4. Open one-sided embedding-along-flow questions

For CMI sub-case (A), the operational question is: does there
exist a critical norm $X$ such that for every smooth, decaying
$u_0$, the smooth solution stays in $L^\infty_t X_x$?

| Candidate $X$ | Status (large data, all decaying $u_0$) | Implication if bounded |
|---------------|------------------------------------------|------------------------|
| $\dot H^{1/2}$ | open | Fujita–Kato-style global regularity |
| $L^3$ | open | (A) by ESS 2003 |
| $\dot B^{-1+3/p}_{p,q}$ | open | global mild solution by Cannone–Meyer-style |
| $\mathrm{BMO}^{-1}$ | open for large data; small-data global by Koch–Tataru | global mild solution |
| $\dot B^{-1}_{\infty,\infty}$ | meaningless (ill-posed) | — |

**Pairwise embedding-along-flow questions** (each open in general,
each would significantly tighten the program if resolved):

- $L^\infty_t \mathrm{BMO}^{-1}$-bound $\overset{?}{\Rightarrow}$
  $L^\infty_t L^3$-bound along smooth flow.
- $L^\infty_t L^3$ $\overset{?}{\Rightarrow}$ $L^\infty_t \dot H^{1/2}$
  along smooth flow.
- $L^\infty_t \dot B^{-1+3/p}_{p,q}$ $\overset{?}{\Rightarrow}$
  $L^\infty_t L^3$ along smooth flow.

These are the **dependency-graph backbone** the program will use.

## Key Insights

- **The ladder is six steps** (with the LPS family transverse).
  All six are classical objects; bounding any of them along smooth
  NSE evolution is the substantive question.
- **ESS 2003 is the keystone bridging theorem.** If $L^\infty_t
  L^3$ is bounded for smooth flows from all decaying data, (A) is
  resolved. The "single $\Phi$" hypothesis from A001 collapses
  into "$\Phi = L^3$" as the natural target.
- **Koch–Tataru sits at the largest currently-tractable level.**
  Above it ($\dot B^{-1}_{\infty,\infty}$) the equation is
  ill-posed. So the *bottom* of the ladder gives strongest claims
  while the *top* (excluding the meaningless final step) gives
  widest applicability.
- **The C1 panel finding now decomposes into a list of explicit
  open questions** — pairwise embedding-along-flow questions for
  consecutive ladder steps. A002's catalog is the program's
  punch-list.

## Follow-ups

1. **A003** (P02 bridge discovery, B-003 candidate): formalize the
   critical-norm-embedding-along-flow questions as a bridge
   between harmonic analysis and nonlinear PDE.
2. **A004** (P02 bridge discovery, B-004 candidate): CFD ↔ PDE,
   rigorous turbulence closure (per A001 C3).
3. **Direction-commitment attempt** (A005 per A001 follow-up #6):
   commit by A005 to either global-regularity (target: bound some
   critical norm) or blowup (target: Type-II singularity). Set
   explicit pivot trigger.
4. **Primer update**: promote the six-step ladder + LPS family
   into `docs/primer/field-primers/05-navier-stokes.md` §3
   ("Minimum vocabulary") as a unified table.
5. **Lemma-extraction (deferred to A006 or later)**: pick one open
   embedding-along-flow question (e.g., $\mathrm{BMO}^{-1} \to L^3$)
   and attempt a P03 decomposition.

## References

- attempt: `attempts/05-navier-stokes/A001-...`
- problem doc: `docs/problems/05-navier-stokes/equivalent-forms.md`
- problem doc: `docs/problems/05-navier-stokes/known-results.md`
- primer: `docs/primer/field-primers/05-navier-stokes.md`
- external (canonical):
  - Fujita & Kato, *On the Navier–Stokes initial value problem I*,
    Arch. Rat. Mech. Anal. 16 (1964) 269–315.
  - Cannone, *Ondelettes, paraproduits et Navier-Stokes*,
    Diderot, 1995.
  - Escauriaza, Seregin, Šverák, Russian Math. Surveys 58 (2003)
    211–250.
  - Koch & Tataru, Adv. Math. 157 (2001) 22–35.
  - Bourgain & Pavlovic, J. Funct. Anal. 255 (2008) 2233–2247.
  - Lemarié-Rieusset, *The Navier–Stokes Problem in the 21st
    Century*, CRC 2nd ed. 2018.
