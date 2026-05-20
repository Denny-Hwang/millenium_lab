# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

At $(n, s, d) = (2, 3, 2)$, the explicit Plücker equations of the
A005 L02 v2 construction are written out (3 polynomial equations per
fan-in-1 input wire) and the Boolean-evaluation locus is verified
to have **dimension 0** inside its (up to 2-dimensional)
Grassmannian-product ambient across all three DAG topologies T1,
T2, T3 — closing G010 at this scope and supplying the first direct
evidence on G009 (the L02 v2 construction *relocates* the
discrete-reading collapse rather than escaping it).

## Outcome Label

- Label: `partial-insight`
- Reason: This attempt does two substantive things. First, it
  closes G010 at the smallest non-trivial case: the L02 v2 Plücker
  equations are written down explicitly, the DAG topologies and
  Grassmannian factors are enumerated, and the Boolean-restriction
  is computed. Second, it sharpens G009: the dimension verdict
  (Boolean locus is 0-dim inside up to 2-dim ambient) shows that
  the A005 construction does NOT escape the discrete-reading
  collapse — it *relocates* the question to the ambient-vs-
  restriction interface. The H_AC⁰ program must commit to one of
  two explicit strategic responses (sheaf-on-ambient interpretation,
  or pivot to arithmetic / GCT circuits). The attempt does not
  itself make this commitment, so the outcome is short of
  `novel-approach`; it is substantive enough to exceed `survey`.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. DAG topologies enumerated at $(n, s, d) = (2, 3, 2)$

With the convention that every internal gate sits on a path to the
output and single-output is required, the topologies (up to
internal-vertex relabeling) are:

- **T1**: 1 gate at depth 1 (the output).
  - Fan-in 1 (gate reads exactly one input) → ambient $\mathrm{Gr}(1, 2)
    = \mathbb{P}^1$, dim 1.
  - Fan-in 2 (gate reads both inputs) → ambient $\mathrm{Gr}(2, 2) =
    \{\mathrm{pt}\}$, dim 0.
- **T2**: 1 gate at depth 1 (intermediate) + 1 gate at depth 2
  (output).
  - g_1 fan-in $\in \{1, 2\}$, g_2 fan-in 1 (only reads g_1's output).
  - Ambient: $\mathrm{Gr}(k_1, 2) \times \mathrm{Gr}(1, 1)$;
    dim 1 or 0.
- **T3**: 2 gates at depth 1 (intermediate) + 1 gate at depth 2
  (output, fan-in 2 on $\{g_1, g_2\}$).
  - Ambient: $\mathrm{Gr}(k_1, 2) \times \mathrm{Gr}(k_2, 2) \times
    \mathrm{Gr}(2, 2)$; dim up to 2 (both intermediates fan-in 1).

Configurations excluded:

- 2 depth-1 gates with no depth-2 gate: requires multiple outputs.
- 1 depth-1 + 2 depth-2 gates: the second depth-2 gate is not on the
  output path.
- 3 depth-1 gates: only one is the output; the others are unused.

Maximum ambient dimension over all topology / fan-in profile
combinations: **2** (T3 with both intermediates fan-in 1).

## 2. Boolean-evaluation locus — dimension verdict

A Grassmannian point $\mathrm{Gr}(k, m)$ is a $k$-dimensional
subspace of $\mathbb{Q}^m$. A "Boolean wiring" of a gate corresponds
to choosing *which* of the previous-layer outputs feed in — i.e., a
$k$-element subset of $\{1, \ldots, m\}$ — which is the span of $k$
standard basis vectors.

In Plücker coordinates, a standard-basis-spanned subspace has
exactly one Plücker coordinate equal to $1$ (the one indexed by the
chosen subset) and all others equal to $0$. So the Boolean
restriction inside $\mathrm{Gr}(k, m)$ is a **finite set of
$\binom{m}{k}$ isolated points**, hence 0-dimensional.

Applied to each topology / fan-in combination:

| Topology | Ambient dim | Boolean locus | Boolean locus dim |
|----------|-------------|----------------|--------------------|
| T1, fan-in 2 | 0 | 1 point | 0 |
| T1, fan-in 1 | 1 ($\mathbb{P}^1$) | 2 points | 0 |
| T2, $g_1$ fan-in 2 | 0 | 1 point | 0 |
| T2, $g_1$ fan-in 1 | 1 ($\mathbb{P}^1$) | 2 points | 0 |
| T3, both $g_1, g_2$ fan-in 1 | 2 ($\mathbb{P}^1 \times \mathbb{P}^1$) | 4 points | 0 |
| T3, mixed | 0 or 1 | finite | 0 |

**Verdict.** The Boolean-evaluation locus has dimension 0 in every
sub-component, even when the ambient is up to 2-dimensional.

## 3. Explicit Plücker equations — representative case

Take T1, fan-in 1, output gate of type AND (which on fan-in 1 is the
identity — chosen for clarity; gate-type choices for OR / NOT give
the same dimension verdict but different equation systems).

Ambient: $\mathbb{P}^1$ with coordinates $(p_1 : p_2)$.

A wiring $(p_1 : p_2)$ selects the line $\mathrm{span}(p_1 e_1 +
p_2 e_2) \subset \mathbb{Q}^2$ as the gate's input subspace. On a
Boolean input $(a, b) \in \{0, 1\}^2$, the gate output is the
projection scalar $p_1 a + p_2 b$.

**Boolean-evaluation equations.** Demanding output $\in \{0, 1\}$
for all $(a, b) \in \{0, 1\}^2$:

| Boolean input $(a, b)$ | Output | Equation |
|------------------------|--------|----------|
| $(0, 0)$ | $0$ | automatically $\in \{0,1\}$ |
| $(0, 1)$ | $p_2$ | $p_2 (p_2 - 1) = 0$ |
| $(1, 0)$ | $p_1$ | $p_1 (p_1 - 1) = 0$ |
| $(1, 1)$ | $p_1 + p_2$ | $(p_1 + p_2)(p_1 + p_2 - 1) = 0$ |

**Solutions** (over $\mathbb{Q}$ or $\overline{\mathbb{Q}}$): $p_1, p_2
\in \{0, 1\}$ and $p_1 + p_2 \in \{0, 1\}$. The affine solution set is

$$
  \{(0, 0),\; (0, 1),\; (1, 0)\}.
$$

After projectivizing (removing the origin), the projective Boolean
locus on $\mathbb{P}^1$ is

$$
  \{(0 : 1),\; (1 : 0)\}.
$$

— exactly the two standard-basis-spanned wirings predicted by §2.
The equations cut out a 0-dimensional reduced subscheme of
$\mathbb{P}^1$.

**Pattern.** For other topology classes and fan-in profiles, the
same construction yields: one "square = self" equation per Boolean
input combination; the resulting variety is a finite product /
intersection of standard-basis-spanned points; dimension 0.

## 4. Implication for G009

By Hartshorne III.3.5 (affine schemes carry no higher quasi-coherent
cohomology; combined with 0-dimensional reduced structure forcing
discrete topology), a 0-dimensional reduced affine scheme $X$ over
$\mathbb{Q}$ satisfies $H^i(X, \mathcal{F}) = 0$ for every coherent
$\mathcal{F}$ and every $i \geq 1$.

Therefore the H_AC⁰ candidate

$$
  [F_{\mathrm{AC}^0}]_f \neq 0 \;\;\text{in}\;\;
  H^1(\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}, F_{\mathrm{AC}^0}),
$$

interpreted on the *Boolean-restriction locus*, is identically false
(the right side is always $0$). The L02 v2 Grassmannian-product
construction does **not** escape G009; it *relocates* the issue to
the question of where $H^1$ is computed.

## 5. The two structural responses

A006 makes the strategic landscape explicit. To preserve the H_AC⁰
program, the next attempt must commit to one of two routes:

- **(R1) Sheaf-on-ambient interpretation.** Define $F_{\mathrm{AC}^0}$
  on the full Grassmannian-product ambient (positive-dimensional;
  up to dim 2 at this case). The Boolean-restriction locus is
  encoded as a *support* or *vanishing* condition on the sheaf or
  the cohomology class. $H^1$ is computed on the ambient (where it
  can be non-zero). The biconditional with AC⁰-membership lives at
  the ambient level, with the Boolean locus controlling a
  restriction property of the class. This is closer to what A005's
  "Boolean-output-uniformity" patch implicitly proposed.

- **(R2) Pivot to arithmetic circuits / GCT.** Drop the Boolean
  restriction. Study the moduli of arithmetic circuits over
  $\mathbb{Q}$ (or $\overline{\mathbb{Q}}$), which is honestly
  positive-dimensional. AC⁰-membership becomes a closed-subscheme
  condition or a representation-theoretic obstruction. This is the
  Mulmuley–Sohoni GCT setting (B-001). Cost: the program is no
  longer "Boolean" in the literal sense; the link to
  Razborov–Rudich is via a non-trivial translation.

A third option — **non-reduced thickening of the Boolean locus** —
is technically possible (e.g., formal completion of the
Grassmannian along the Boolean locus) but lacks a canonical
motivation. It is mentioned for completeness but not recommended.

(R1) preserves the B-002 bridge (natural proofs ↔ sheaf
cohomology) most directly. (R2) makes the B-001 bridge (GCT ↔
homological) the load-bearing route.

## 6. Net status

### G010 — explicit Plücker equations

Closed at $(n, s, d) = (2, 3, 2)$. The pattern is clear: one
"$x^2 - x = 0$" equation per Boolean input combination per fan-in
wire; finite-dimensional polynomial system; 0-dimensional reduced
solution set. Larger cases (e.g., $(3, 5, 2)$) would benefit from
Macaulay2 / SageMath; not done here (environment lacks
computer-algebra access).

### G009 — discrete-reading collapse

**Sharpened, not resolved.** The collapse is intrinsic to any moduli
that imposes a Boolean restriction on a Grassmannian-based wiring
space. Escape requires explicit strategic commitment (R1 or R2).

### G011 — $\mathrm{GL}_n$-equivariance

Not directly addressed. For $n = 2$ the $\mathrm{GL}_2$ action on
the input layer $\mathrm{Gr}(1, 2) = \mathbb{P}^1$ is the natural
action on lines through the origin; one can check that the
Boolean-evaluation polynomials are *not* $\mathrm{GL}_2$-invariant
(the equation $p_1(p_1 - 1) = 0$ uses the standard basis, which is
$\mathrm{GL}_2$-non-canonical). So the construction is
$S_2$-equivariant (permutation of inputs) but not
$\mathrm{GL}_2$-equivariant in the linear sense. This raises a
sub-question about whether the H_AC⁰ program requires
$\mathrm{GL}_n$- or only $S_n$-equivariance. A002 / A005 used
$\mathrm{GL}_n$; reconsideration may be appropriate.

## 7. Updated gap inventory

| ID | Severity | Status after A006 |
|----|----------|--------------------|
| G001 | superseded by G009 | unchanged |
| G002 | lethal-if-unresolved | unchanged |
| G003 | lethal-if-unresolved | unchanged |
| G004 | major | unchanged |
| G005 | major | unchanged |
| G006 | superseded by G008 | unchanged |
| G007 | major | unchanged |
| G008 | lethal-if-unresolved | unchanged |
| **G009** | **lethal-if-unresolved** | **sharpened** — concrete evidence at smallest case; routes (R1) and (R2) made explicit |
| **G010** | **major** | **closed at $(2,3,2)$**; larger cases pending |
| G011 | major | partially addressed — $\mathrm{GL}_n$ vs $S_n$ tension noted; reconsider equivariance hypothesis |

## Key Insights

- **The Boolean-evaluation locus is always 0-dimensional inside a
  Grassmannian-based wiring moduli**, by elementary linear algebra
  (subspaces spanned by subsets of standard basis vectors form an
  isolated point set within the Grassmannian). This is robust
  across topology and fan-in profiles.
- **G009 is intrinsic, not constructional.** The discrete-reading
  collapse is a feature of *any* moduli that imposes literal
  Boolean restrictions, not specifically of L02 v2. The
  Grassmannian-product construction supplies non-discrete *ambient*
  structure, but the restriction is still discrete.
- **Two explicit escape routes exist** (R1: sheaf-on-ambient; R2:
  pivot to arithmetic / GCT). The H_AC⁰ program must commit to one
  or the other; the choice is a strategic decision with downstream
  implications for which bridge (B-001 or B-002) becomes
  load-bearing.
- **Equivariance discipline tightens.** The Boolean-evaluation
  equations use the standard basis explicitly, so they are
  $S_n$-equivariant (input-coordinate permutation) but not
  $\mathrm{GL}_n$-equivariant (linear change of basis). A002 / A005
  may need to relax the equivariance hypothesis or argue that
  $S_n$ suffices.

## Follow-ups

1. **A007**: discharge A003-A4 (L08 base case at $n \in \{0, 1\}$),
   independent of A006.
2. **A008**: strategic-decision attempt on (R1) vs (R2). Should be
   short (1-2 hours), produce a *commitment* — which route the
   H_AC⁰ program will pursue — with explicit justification. Both
   B-001 and B-002 statuses need updating after this decision.
3. **A009+ along (R1)**: define $F_{\mathrm{AC}^0}$ on the
   Grassmannian-product ambient; prove that the cohomology class
   $[F]_f$ has the predicted vanishing / non-vanishing behavior
   when restricted to the Boolean locus. This is essentially
   re-doing A002's L04 in the new setting.
4. **A009+ along (R2)**: rewrite L02 as a moduli of arithmetic
   circuits; show that AC⁰-membership cuts out a (closed,
   positive-dimensional) sub-moduli; recover an analog of L05 / L06
   in the GCT setting.
5. **Larger-case computation**: extend A006 to $(n, s, d) = (3, 5,
   2)$ or $(2, 5, 3)$ with Macaulay2 / SageMath. The pattern is
   expected to be robust, but verification would lend additional
   confidence.
6. **Equivariance reconsidered**: explicitly choose between
   $\mathrm{GL}_n$ (lose Boolean structure) and $S_n$ (keep
   Boolean structure, weaker equivariance) at the L02 v2 statement
   level.
7. **L11' attack** (deferred from A005's deferred-from-A004):
   begin once the strategic decision (R1 vs R2) is made; L11' is
   meta-complexity-level and is independent of G009 *but* depends
   on the construction of $F_{\mathrm{AC}^0}$, which itself
   depends on the strategic choice.
8. **R6 cross-attempt synthesis** after A007–A009 land.

## References

- attempt: `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/`
  (L02 v1).
- attempt: `attempts/03-p-vs-np/A005-2026-05-20-claude-opus-4-7/`
  (L02 v2 Grassmannian-product; G009 / G010 / G011).
- bridge: `bridges/B-001-gct-homological-circuit.md` (referenced
  for the GCT (R2) route).
- bridge: `bridges/B-002-natural-proofs-sheaf-cohomology.md`
  (referenced for the sheaf-on-ambient (R1) route).
- primer: `docs/primer/notation.md` §9 (Grassmannian / Plücker
  notation).
- primer: `docs/primer/field-primers/03-p-vs-np.md` (vocabulary;
  the (R1) vs (R2) split should be promoted to this primer in the
  next revision).
- external:
  - Hartshorne, *Algebraic Geometry*, Springer GTM 52, 1977,
    Ch. III §3 (cohomology of affine schemes).
  - Mulmuley & Sohoni, *Geometric Complexity Theory I*, SIAM J.
    Comput. 31 (2001) 496–526 (background for the (R2) route).
- prompt: `prompts/P08-conjecture-validation.md` (minor variant; see
  `prompt.md` for rationale).
