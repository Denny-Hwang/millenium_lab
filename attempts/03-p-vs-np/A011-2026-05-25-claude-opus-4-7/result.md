# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

The monotone-arithmetic moduli — the only identified candidate to
escape *both* C-001 (rigidity) and G019 (Boolean-vs-arithmetic gap) —
**reproduces** the dilemma rather than escaping it: faithful encoding
of monotone Boolean complexity requires the discrete Boolean semiring
(rigid, 0-dimensional), while a positive-dimensional continuous
semiring is hardness-blind; combined with A005–A010 this shows the
discrete-vs-continuous obstruction is **route-independent**, strongly
reinforcing the recommendation to move the H₀ / H_AC⁰ program to
`dormant`.

## Outcome Label

- Label: `partial-insight`
- Reason: Tests A010's idea (ii) (the most promising identified
  escape) and finds — with explicit small-case witnesses — that it
  reproduces the dual obstruction. Establishes route-independence of
  the discrete-vs-continuous dilemma across three encodings (Boolean,
  arithmetic, monotone). Substantial structural progress (above
  `survey`); no new technique or candidate (below `novel-approach`);
  a correct diagnosis, not a false claim (not `flawed-attempt`).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. The monotone-arithmetic moduli

A *monotone* arithmetic circuit has gates $+, \times$ with
**non-negative** scalar weights only (no subtraction, no
cancellation). Over $\mathbb{Q}_{\geq 0}$ it computes a polynomial
with non-negative coefficients. Let $\mathcal{M}^{\mathrm{mon}}_{n,s,d}$
be the moduli of such circuits.

Over $\mathbb{Q}_{\geq 0}$ the scalar weights are continuous, so
$\mathcal{M}^{\mathrm{mon}}$ is positive-dimensional — it *appears*
to escape Boolean rigidity. The test in §2 checks whether it also
tracks hardness.

## 2. Small-case test at $(n,s,d)=(2,3,2)$

A Boolean $f$ is monotone-arithmetic-realizable over $\mathbb{Q}$ iff
its multilinear representing polynomial $p_f$ has all non-negative
coefficients:

| $f$ | $p_f$ | sign | monotone-arith over $\mathbb{Q}$? | AC⁰ / monotone-Boolean |
|-----|-------|------|-----------------------------------|------------------------|
| AND | $x_1 x_2$ | $+$ | **yes** | easy, monotone |
| OR | $x_1 + x_2 - x_1 x_2$ | has $-1$ | **no** | easy, monotone |
| XOR | $x_1 + x_2 - 2x_1 x_2$ | has $-2$ | **no** | hard, non-monotone |
| NAND | $1 - x_1 x_2$ | has $-1$ | **no** | easy, non-monotone |

**Headline mismatch.** OR is the simplest monotone Boolean function
(one gate), yet its multilinear-over-$\mathbb{Q}$ polynomial has a
negative coefficient, so it is **not** monotone-arithmetic-realizable
over $\mathbb{Q}$. The multilinear-over-$\mathbb{Q}$ encoding does
**not** track monotone Boolean complexity.

## 3. Diagnosis — wrong representation, then the dilemma returns

The mismatch is representational: Boolean OR "secretly" uses
cancellation over $\mathbb{Q}$ (the $-x_1x_2$ is inclusion–exclusion).
The faithful encoding of monotone Boolean complexity is over the
**Boolean semiring** $\mathbb{B} = (\{0,1\}, \text{OR}, \text{AND})$,
where OR and AND are each one cheap gate and the Jerrum–Snir / Valiant
correspondence makes monotone-circuit complexity track monotone
Boolean complexity.

But over $\mathbb{B}$ the scalar weights live in the **discrete** set
$\{0,1\}$, so $\mathcal{M}^{\mathrm{mon}}_{/\mathbb{B}}$ is again
**0-dimensional** — rigidity (C-001) returns. To regain
positive-dimensionality one moves to a **continuous** semiring
(non-negative reals; tropical), but then the circuit no longer
computes Boolean functions; restricting to $\{0,1\}$-points returns to
the discrete case.

**The dilemma reproduces exactly:**

$$
\begin{array}{lll}
\text{Boolean semiring} & \to \text{discrete} & \to \text{rigid (C-001)}\\
\text{continuous semiring} & \to \text{positive-dim} & \to \text{hardness-blind (G019)}
\end{array}
$$

## 4. Route-independence of the discrete-vs-continuous wall

Across A005–A011 the same dilemma has appeared in three encodings:

| Route | Encoding | Obstruction |
|-------|----------|-------------|
| (R1) | Boolean circuits | rigid — C-001 |
| (R2) | arithmetic / $\mathbb{Q}$ | hardness-blind — G019 |
| (R2′) | monotone | $\mathbb{B}$ rigid; continuous hardness-blind |

The obstruction is **route-independent**. Structural source:

- To **faithfully** encode Boolean (or monotone-Boolean) hardness,
  the moduli must be over a **discrete** structure → 0-dimensional
  → rigid.
- To get a **positive-dimensional** moduli (which the cohomological /
  GCT machinery requires), the structure must be **continuous** →
  decoupled from Boolean hardness.

This is the discrete-vs-continuous wall: Boolean complexity is
intrinsically discrete; algebraic-geometric tools are intrinsically
continuous; faithfully bridging them *is* the open problem. The H₀ /
H_AC⁰ program rediscovered the wall from three angles with explicit
small-case witnesses.

## 5. New gap / consolidation

| ID | Severity | Statement |
|----|----------|-----------|
| **G020** | **lethal-if-unresolved** | Route-independence of the discrete-vs-continuous wall: every algebraic-geometric encoding of circuit complexity tried (Boolean, arithmetic, monotone) is either 0-dimensional (rigid, faithful to Boolean hardness) or positive-dimensional (hardness-blind). No encoding is simultaneously positive-dimensional and Boolean-hardness-faithful. |

G020 is the generalization of C-001 (and the dual G019) to a
route-independent statement; it is the natural content of a proposed
conjecture **C-002**.

## 6. Program-level assessment

The monotone route — the last identified candidate escape — does not
escape; it reproduces the dilemma. With (R1), (R2), and (R2′) all
blocked by the same route-independent wall, **no forward route is
currently identified**.

**Recommendation (decision is the user's, per charter §3 / R6
step 5).** Move 03-p-vs-np's H₀ / H_AC⁰ program to **dormant**, and
register G020 as conjecture **C-002**. Dormancy is not abandonment:
C-001, G019, G020 are genuine negative-knowledge assets (charter
§4.4). The reactivation condition is sharp: *a moduli construction
that is simultaneously positive-dimensional and faithful to Boolean
hardness — a genuine bridge across the discrete-vs-continuous wall.*

Enacting dormancy (the dashboard status change) requires a separate
user-approved status PR; this attempt records the recommendation.

## Key Insights

- **The monotone route reproduces the dilemma.** Over the faithful
  Boolean semiring it is discrete (rigid, C-001); over a continuous
  semiring it is hardness-blind (G019). No escape.
- **OR is the witness for the representation mismatch**: monotone-
  Boolean-trivial but with a negative multilinear-over-$\mathbb{Q}$
  coefficient.
- **The discrete-vs-continuous wall is route-independent** (G020):
  faithful Boolean encodings are 0-dimensional; positive-dimensional
  encodings are hardness-blind. This holds across Boolean,
  arithmetic, and monotone encodings.
- **The H₀ / H_AC⁰ program has no identified forward route** and
  should be considered dormant, with the wall registered as C-002.

## Follow-ups

1. **User decision on dormancy** (charter §3 / R6 step 5). A010 and
   A011 both recommend it; A011 makes the case route-independent.
2. **Register C-002** (G020, the discrete-vs-continuous wall) as a
   conjecture, generalizing C-001. Recommended regardless of the
   dormancy decision, to preserve the asset.
3. **Cross-link C-001 ↔ C-002 ↔ G019** as the rigidity / gap / wall
   family.
4. **If a future attempt revisits the program**: the only target
   worth pursuing is a positive-dimensional *and* hardness-faithful
   moduli (e.g., via real algebraic geometry / o-minimal structures
   that handle semialgebraic Boolean loci, or via a
   bounded-cancellation model strictly between monotone and full
   arithmetic). This is speculative and out of current scope.
5. **R6 refresh** incorporating A010, A011 and the G020 headline.
6. **Consider other problems.** With 03-p-vs-np's main program
   dormant, the six other Millennium problems (all `not-started`,
   all with primer field-notes ready) are available for a fresh
   start under the same pipeline.

## References

- attempt: `attempts/03-p-vs-np/A006-2026-05-20-claude-opus-4-7/`
  (Boolean rigidity; XOR not in AC⁰_{(3,2)}).
- attempt: `attempts/03-p-vs-np/A010-2026-05-25-claude-opus-4-7/`
  (GCT-L02; G019; idea (ii)).
- conjecture:
  `conjectures/C-001-boolean-rigidity-sheaf-obstruction/` (C-001;
  G020 generalizes it).
- external:
  - Jerrum & Snir, *Some exact complexity results for straight-line
    computations over semirings*, J. ACM 29 (1982) 874–897 (monotone
    arithmetic = monotone Boolean over the right semiring).
  - Valiant, *Negation can be exponentially powerful*, Theoret.
    Comput. Sci. 12 (1980) 303–314 (monotone vs general gap).
  - Razborov, *Lower bounds on the monotone complexity of some
    Boolean functions*, Dokl. Akad. Nauk SSSR 281 (1985) (monotone
    lower bounds; the monotone-to-general barrier).
