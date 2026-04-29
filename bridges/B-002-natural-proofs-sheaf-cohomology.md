---
id: B-002
domains: [circuit-complexity, homological-complexity]
problems: [03-p-vs-np]
maturity: ai-discovered
key_figures: []
status: active
---

# Bridge: Natural Proofs (Razborov–Rudich) ↔ Sheaf Cohomology

> A speculative bridge proposing to redefine the **usefulness** arm
> of the Razborov–Rudich natural-proofs barrier as the *non-vanishing
> of a sheaf cohomology class* on a circuit-parameterizing variety.
> The hope is that a non-natural property witnessed by H¹ vanishing
> escapes the cryptographic obstruction of the natural-proofs theorem.
> First surfaced explicitly in attempt A001 on 03-p-vs-np.

## 1. Why it connects

The Razborov–Rudich theorem [RR 1997] forbids combinatorial properties
$\mathcal{C}_n$ that are simultaneously:

- **constructive** ($\mathcal{C}_n$ decidable in time $2^{O(n)}$),
- **large** ($|\mathcal{C}_n| \ge 2^{-O(n)} \cdot 2^{2^n}$), and
- **useful** (every $f \in \mathcal{C}_n$ is hard for the target
  circuit class).

To prove $\mathbf{NP} \not\subseteq \mathbf{P}/\mathrm{poly}$ one
must violate at least one of these.

The bridge proposes:

```
  Natural-proofs predicate P(f)             Sheaf F over circuit variety C_{n,s}
  ── on truth tables ──┐                ┌── over polynomial schemes ──
                       │                │
                       v                v
       constructive / large / useful   H^k(C_{n,s}, F) ≠ 0
                       \              /
                        \            /
                         \          /
                  REDEFINITION (functor G):
                  P(f) ↔ "the cohomology class
                          [F]_f ∈ H^1 is non-zero"
```

If usefulness can be re-expressed as "H¹ of a sheaf attached to $f$
is non-zero," then a *non-constructive* sheaf — one whose H¹ cannot
be evaluated in $2^{O(n)}$ time — would automatically violate
constructiveness, and so escape RR's conclusion without sacrificing
correctness. The bridge does not by itself separate the classes; it
shifts the cost into a cohomological computation.

The shared objects are:

- **Computational object**: a truth table $f \in \{0,1\}^{2^n}$ on
  one side, an algebraic point of the circuit variety on the other.
- **Predicate / class**: a Boolean predicate $P(f)$ on one side, a
  sheaf cohomology class $[F]_f$ on the other.
- **Hard-to-distinguish witness**: pseudorandom function families on
  one side; sheaves whose cohomology requires $\omega(2^{O(n)})$
  time to evaluate on the other.

## 2. Known Results

- **RR 1997**: the theorem itself. Establishes the three-property
  obstruction.
- **Williams 2014**: the ACC⁰ lower bound is non-natural (it succeeds
  precisely by violating *constructiveness* — the algorithmic
  improvement is uniform but the lower-bound predicate is not).
- **Hirahara, Pich, et al. (2020s, meta-complexity)**: clarifying
  exactly when natural-proofs-style barriers apply to MCSP and
  related meta-complexity problems. Some negative results refine
  *what* "constructiveness" means.
- **No published cohomology lift exists.** The bridge is, as of
  April 2026, a *proposal* with no prototype theorem.

## 3. Stuck Points

- **Defining the right sheaf.** What sheaf $F$ on what variety
  $\mathcal{C}_{n,s}$ has the property that $H^1(\mathcal{C}_{n,s},
  F) \ne 0$ exactly when $f$ is hard for the target class?
- **Constructiveness violation = computational hardness.** The bridge
  shifts difficulty from "decide $\mathcal{C}_n$ in $2^{O(n)}$" to
  "compute $H^1$ in some bounded time." Why is the latter not
  reducible to the former via Čech / Grothendieck procedures?
- **Largeness preservation.** RR's *large* condition becomes
  "the locus where $H^k = 0$ has positive codimension." Establishing
  positive codimension is itself an algebraic-geometric assertion.
- **Cryptographic content.** RR's full strength comes from
  pseudorandom functions in $\mathbf{P}/\mathrm{poly}$. The
  cohomological reformulation must explain how it avoids generating
  a corresponding pseudorandom-sheaf-evaluation algorithm.

## 4. Open Directions

1. **AC⁰ pilot** (compatible with A001 follow-up #4):
   - Define a candidate sheaf $F_{\mathrm{AC}^0}$ on a circuit-variety
     $\mathcal{C}^{\mathrm{AC}^0}_{n,s}$.
   - Verify on small $n$ (say $n \le 8$) that
     $H^1(\mathcal{C}^{\mathrm{AC}^0}_{n,s}, F_{\mathrm{AC}^0})_f \ne 0$
     iff $f \notin \mathrm{AC}^0$.
   - Such a verified small-case correspondence would lift this
     bridge to `emerging`.
2. **RR-respect check**. Show that the candidate sheaf admits no
   uniform $2^{O(n)}$ evaluation algorithm — i.e., that the
   *constructiveness* arm is broken by the cohomology computation.
3. **Connection to B-001**. If the GCT lift in B-001 produces a
   sheaf class, check whether the *same* sheaf can witness the
   usefulness condition here. A positive answer collapses the two
   bridges into a single cohomological framework.
4. **Cryptographic reduction**. Construct, or rule out, an analogue
   of the RR theorem for the cohomological reformulation: does
   "if H¹ is constructively computable, then pseudorandom sheaves
   in $\mathbf{P}/\mathrm{poly}$ do not exist" hold?

## 5. Connection to This Repository

- Attempts:
  - [A001](../attempts/03-p-vs-np/A001-2026-04-29-claude-opus-4-7/)
    — first identified this bridge during P01 panel simulation
    (conflict C1: "is a 'cohomology invariant' sufficient as a
    redefinition of usefulness?").
- Candidates: — (none yet)
- Conjectures: — (a future C-### could state the AC⁰ small-case
  correspondence after numerical verification)
- Companion bridge:
  [B-001](B-001-gct-homological-circuit.md) — handles the
  *constructiveness* arm via GCT obstruction lift; together with
  B-002, the two bridges are the substance of A001's hypothesis
  H₀.

## 6. References

- [RR 1997] A. Razborov, S. Rudich, "Natural Proofs," J. Comput.
  Syst. Sci. 55(1):24–35.
- [Williams 2014] R. Williams, "Non-uniform ACC circuit lower
  bounds," J. ACM 61(1):1–32.
- [Hirahara 2018] S. Hirahara, "Non-black-box worst-case to
  average-case reductions within $\mathbf{NP}$," FOCS.
- [Pich et al. 2020s] meta-complexity literature on the natural
  proofs barrier.
- [Hartshorne 1977] R. Hartshorne, *Algebraic Geometry*, Springer
  GTM 52.
- [Voisin 2002] C. Voisin, *Hodge Theory and Complex Algebraic
  Geometry I*, Cambridge — sheaf cohomology in the algebraic
  setting.
