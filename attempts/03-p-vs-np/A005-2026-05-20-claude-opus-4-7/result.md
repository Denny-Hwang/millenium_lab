# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

A003-A1 (L02 quasi-projectivity) is closed at proof-sketch level via
a Grassmannian-product construction with Boolean-evaluation cut-out;
A003-A2 (irreducibility) is reduced to a subordinate
*Boolean-output-uniformity* statement on per-DAG-topology
components; in the process, a new lethal-grade gap **G009** is
surfaced — the naive discrete reading of L02 v1 makes
$H^1(\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}, F_{\mathrm{AC}^0}) = 0$
identically and collapses the H_AC⁰ program.

## Outcome Label

- Label: `partial-insight`
- Reason: This attempt does three substantive things — discharges
  A003-A1 at proof-sketch level (Grassmannian-product
  construction); reduces A003-A2 to a per-component subordinate
  statement (replacing component-uniformity-of-eval, which is
  false, with Boolean-output-uniformity-of-cohomology, which is
  the right patch); and identifies G009 as a new lethal-grade
  bottleneck that A002 and A003 did not flag. This is more than
  `survey` (concrete construction proposed, new gap identified)
  but less than `novel-approach` (the Grassmannian-of-wirings
  construction is standard algebraic geometry; the contribution
  is in selecting and adapting it, not in inventing it).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. L02 v2 — restated (quasi-projective via Grassmannian product)

**Statement (L02 v2).** For every $(n, s, d)$, the moduli of
unbounded-fan-in $\mathrm{AND}/\mathrm{OR}/\mathrm{NOT}$ circuits on
$n$ inputs with size $\leq s$ and depth $\leq d$, modulo gate-relabeling,
is realized as the following quasi-projective scheme over
$\mathbb{Q}$:

$$
  \mathcal{C}^{\mathrm{AC}^0}_{n,s,d}
  \;\;=\;\;
  \bigsqcup_{\text{depth profile } (s_0, s_1, \ldots, s_d)}
  V_{(s_0, \ldots, s_d)},
$$

where each $V_{(s_0, \ldots, s_d)}$ is the closed subscheme of the
ambient product of Grassmannians

$$
  \prod_{\ell = 1}^d \prod_{g \in \text{layer } \ell}
    \mathrm{Gr}(k_g,\, s_{\ell - 1})
$$

cut out by the polynomial equations expressing
"this gate computes $\mathrm{AND}/\mathrm{OR}/\mathrm{NOT}$ of its
inputs as a Boolean function on $\{0,1\}^n$", and quotiented by the
finite group of internal-vertex relabelings.

Here:

- $V_0 = \mathbb{Q}^n$ is the input-layer output space, identified
  with the standard basis $\{x_1, \ldots, x_n\}$.
- $V_\ell = \mathbb{Q}^{s_\ell}$ is the layer-$\ell$ output space.
- The Grassmannian $\mathrm{Gr}(k_g, s_{\ell - 1})$ parameterizes
  fan-in-$k_g$ wirings of gate $g$ into the previous layer.
- The Boolean-evaluation equations are degree-$\leq k_g$ polynomial
  conditions on Plücker coordinates of the gate's input subspace.

**Quasi-projectivity.** The ambient product of Grassmannians is
projective; the closed-subscheme cut-out preserves projectivity;
the depth-profile decomposition is a finite disjoint union of
projective pieces; the finite-group quotient by gate-relabeling
preserves quasi-projectivity (Mumford GIT, *Geometric Invariant
Theory*, 3rd ed. 1994, §1.3). Hence
$\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$ is quasi-projective.

**Dependencies.** L01 (definition of AC⁰); Hartshorne 1977,
Ch. II §7 (projective morphisms); Mumford 1994 §1.3 (GIT for
finite-group quotients). No new external dependencies beyond
A002's L02 v1.

**Difficulty.** **high** (unchanged from L02 v1) — proof-sketch
level only; explicit Plücker equations have not been written.

**Gaps.** G010 (new): explicit polynomial equations for the smallest
non-trivial case, e.g., $(n, s, d) = (2, 3, 2)$. G011 (new):
$\mathrm{GL}_n$-equivariance of the construction at the closed-
subscheme level.

A003-A1 verdict: **closed at proof-sketch level.**

## 2. L02 v2 — irreducibility / component-uniformity (A003-A2)

The Grassmannian-product construction has irreducible components
indexed by DAG topologies. Specifically:

- Let $\mathfrak{T}(s, d)$ be the finite set of DAG topologies on
  $s$ internal vertices with depth $\leq d$ — *underlying directed
  graphs with depth labels*, abstracting away gate-type assignments
  and the specific Grassmannian subspaces.
- For each $T \in \mathfrak{T}(s, d)$, let $X_T$ be the corresponding
  closed subscheme of $V_{(s_0, \ldots, s_d)}$.
- Each $X_T$ is irreducible (it is an iterated product of
  Grassmannians with closed-subscheme conditions, both of which
  preserve irreducibility for a fixed underlying topology).
- The full moduli decomposes as $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}
  = \bigsqcup_{T} X_T$ at the level of irreducible components.

**$\mathrm{GL}_n$-action.** The input-coordinate permutation action
preserves each DAG topology $T$ (it permutes input edges within a
fixed topology), so each $X_T$ is $\mathrm{GL}_n$-stable. The
action does **not** transitively permute the $X_T$.

**The A003-A2 patch as suggested fails.** A003 suggested two
remedies: (a) component-uniformity of the eval morphism, (b)
direct-sum decomposition of $H^1$ with the Čech 1-cocycle attached
to $f$ supported on a uniform component. Remedy (a) is **false**:
distinct DAG topologies $T, T'$ may compute the same Boolean
function $f$, but they give distinct $\mathbb{Q}$-points of
$\mathcal{C}$; the eval morphism takes different *Grassmannian-
coordinate* values on distinct components even when the Boolean
output coincides.

**The available patch.** Remedy (b) is reformulated as
*Boolean-output-uniformity of the Čech 1-cocycle*:

**Conjectural patch (L02 v2 — Boolean-output-uniformity).** Let
$T \in \mathfrak{T}(s, d)$ and let $f : \{0,1\}^n \to \{0,1\}$ be a
Boolean function. The Čech 1-cocycle
$[F_{\mathrm{AC}^0}]_f|_{X_T}$ is non-zero iff $T$ cannot realize
$f$ as an $\mathrm{AC}^0$ circuit at all (i.e., no
$\mathbb{Q}$-point of $X_T$ lies in the Boolean-evaluation locus
that computes $f$).

If this holds, then

$$
  [F_{\mathrm{AC}^0}]_f \neq 0 \;\;\text{in}\;\;
  H^1(\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}, F_{\mathrm{AC}^0})
$$

iff $f$ is not realizable by *any* AC⁰ circuit of size $\leq s$ and
depth $\leq d$. After taking the limit over $(s, d)$ in the
uniform-witnesses sense of H_AC⁰ v2 (A004), this gives the
biconditional with AC⁰-membership.

**Status.** This is a *conjectural* patch — its truth depends on
the construction of $F_{\mathrm{AC}^0}$ (L04) being compatible
with the component decomposition, which has not been shown.

A003-A2 verdict: **partial — reduced to a subordinate statement.**
The original phrasing of A003-A2 (component-uniformity of eval)
is *refuted* and replaced by Boolean-output-uniformity of the
cohomology class, which is consistent with the L02 v2 structure
but is itself a non-trivial open lemma.

## 3. New gap surfaced — G009 (discrete-reading collapse)

Before this attempt, neither A002 nor A003 distinguished between
the discrete and non-discrete readings of L02. The discrete reading
(closed-point set with its naive reduced scheme structure) gives a
0-dimensional reduced affine scheme over $\mathbb{Q}$. On such a
scheme:

- Hartshorne III.3.5 (affine schemes have no higher quasi-coherent
  cohomology) plus 0-dimensionality (discrete underlying topology)
  forces $H^i(X, \mathcal{F}) = 0$ for every coherent $\mathcal{F}$
  and every $i \geq 1$.
- In particular,
  $H^1(\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}, F_{\mathrm{AC}^0}) = 0$
  identically.
- The H_AC⁰ hypothesis reduces to "$f \notin \mathrm{AC}^0
  \iff 0 \neq 0$", which is false for every $f$; the entire
  program collapses.

**Gap G009 (severity: lethal-if-unresolved).** Any quasi-projective
scheme structure on $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$ that is
compatible with L04, L05, L06 *must be non-discrete*. The
Grassmannian-product construction of §1 supplies non-discreteness
because the wiring data lives in positive-dimensional Grassmannians;
but the existence of a coherent sheaf $F_{\mathrm{AC}^0}$ on this
non-discrete scheme whose $H^1$ tracks AC⁰-membership is **not
shown** in this attempt. G009 supersedes none of the prior gaps;
it is logically *upstream* of G002 (rank control of L04) and
G007 / G008 (A004's gaps on L11').

This is the most important finding of A005.

## 4. Delta against A002 / A003 / A004

### L02 — restated as L02 v2

- A002 v1: existence of a quasi-projective scheme; construction
  deferred to "Hartshorne 1977 Ch. II" and "explicit equations".
- A003-A1: weakening to constructible-set reading; verdict
  needs-patch.
- A005 v2 (this attempt): explicit Grassmannian-product
  construction; quasi-projectivity by ambient-projective embedding;
  finite-group quotient by gate-relabeling.

### Irreducibility

- A002 G001: "the moduli is almost certainly singular and possibly
  reducible; control of the irreducible components is necessary."
- A003-A2: needs-patch:specify-irreducibility-or-component-uniformity.
- A005 (this attempt): components are indexed by DAG topologies;
  $\mathrm{GL}_n$ preserves but does not permute them transitively;
  the originally-suggested A2 patch (component-uniformity of eval)
  is refuted; a Boolean-output-uniformity patch on the cohomology
  class is the correct reformulation but is itself open.

### Carried over unchanged

- All of A002's L01, L03, L04, L05, L06, L07, L08, L09 statements
  carry over by reference, modulo the L02 v2 replacement.
- A004's H_AC⁰ v2 (explicit quantifier order) and L11' are
  unaffected by this attempt.

### Net gap inventory

| ID | Origin | Severity | Status after A005 |
|----|--------|----------|--------------------|
| G001 | A002 (L02 reducibility) | lethal-if-unresolved | superseded; L02 v2 handles it via stratification + Boolean-output-uniformity |
| G002 | A002 (L04 rank control) | lethal-if-unresolved | unchanged |
| G003 | A002 (L05 covering exactness) | lethal-if-unresolved | unchanged |
| G004 | A002 (L06 vanishing) | major | unchanged |
| G005 | A002 (L07 base case) | major | unchanged |
| G006 | A002 (L11 circularity) | lethal-if-unresolved | superseded by G008 (A004) |
| G007 | A004 (L05/L06 uniform witnesses) | major | unchanged |
| G008 | A004 (L11' open) | lethal-if-unresolved | unchanged |
| **G009** | **A005 (discrete-reading collapse)** | **lethal-if-unresolved** | **new — most important** |
| G010 | A005 (explicit Plücker equations) | major | new |
| G011 | A005 (GL_n-equivariance) | major | new |

## 5. Assumptions used

- Standard scheme theory (Hartshorne 1977, Ch. II–III).
- GIT for finite-group quotients (Mumford 1994, §1.3).
- No new axioms beyond A002 / A004.

## Key Insights

- **The discrete reading of L02 v1 is fatal.** If
  $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$ is taken as a 0-dimensional
  reduced affine scheme over $\mathbb{Q}$, every $H^1$ vanishes and
  H_AC⁰ collapses. Any future work on the H_AC⁰ program must
  commit to a *non-discrete* scheme structure, and must show that
  the structure supports a coherent sheaf with non-trivial $H^1$.
- **The Grassmannian-of-wirings construction supplies
  non-discreteness, but only at the level of the ambient scheme.**
  Whether the *intrinsic* sub-moduli of Boolean circuits inherits
  enough positive-dimensional structure for $H^1 \neq 0$ is the
  new bottleneck (G009).
- **The A003-A2 patch as suggested is false.** Component-uniformity
  of the eval morphism does not hold in the natural construction.
  The right replacement is Boolean-output-uniformity of the Čech
  1-cocycle, which is consistent with the structure but is itself
  a non-trivial open lemma.
- **G009 supersedes G001 in importance.** The previously-flagged
  reducibility gap of A002 is now understood structurally (and
  partially resolved by stratification + Boolean-output-uniformity);
  the deeper question is whether the non-discrete scheme structure
  is compatible with the L04 sheaf existence.

## Follow-ups

1. **A006**: make G010 concrete. Compute the explicit Plücker
   equations for the smallest non-trivial case, e.g.,
   $(n, s, d) = (2, 3, 2)$. Tractable by hand or with a small
   computer-algebra computation (Macaulay2 / SageMath); also
   discharges A002's deferred numerical-attempt plan in part.
2. **A007**: address A003-A4 (L08 base case at $n \in \{0, 1\}$),
   independent of A005.
3. **A008+**: attack G009 head-on — does the Grassmannian-product
   construction support a coherent $F_{\mathrm{AC}^0}$ with
   non-vanishing $H^1$ that tracks AC⁰-membership? If yes, this
   simultaneously discharges G002 (L04 rank control) and unblocks
   L05 / L06. If no, the H_AC⁰ program needs a different scheme
   structure (perhaps Hilbert scheme of marked graphs, perhaps
   quiver-representation variety), and L02 v2 must be rewritten
   again.
4. **Begin L11' attack (originally A005 in A004's follow-up, now
   reassigned)**: state and begin to prove L11' (quantitative
   non-evaluation of $F_{\mathrm{AC}^0}$ on succinct inputs). G008
   remains the longest-pole open problem; this work is independent
   of G009 because L11' is a meta-complexity question about
   $F_{\mathrm{AC}^0}$ as an algorithmic object, not a
   cohomological one.
5. **Cross-model adversarial pass on A005**, per charter §4.3. The
   natural attacks: (i) is the Grassmannian-of-wirings construction
   actually closed under depth-bounded composition (could the
   Boolean-evaluation equations push some gates above depth $d$)?
   (ii) does the finite-group quotient by gate-relabeling preserve
   the non-discrete structure (small finite-group quotients can
   collapse positive-dimensional fixed-locus components to
   isolated points)?
6. **R6 cross-attempt synthesis** (after A006, A007, A008 land):
   re-evaluate the H_AC⁰ program against
   `docs/problems/03-p-vs-np/verification-bar.md` §2 with G009
   on the table.

## References

- attempt: `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/`
  (L02 v1 statement; G001).
- attempt: `attempts/03-p-vs-np/A003-2026-04-29-claude-opus-4-7/`
  (A1, A2 patch verdicts).
- attempt: `attempts/03-p-vs-np/A004-2026-04-30-claude-opus-4-7/`
  (H_AC⁰ v2; the follow-up §1 entry labelled "A006: L02 patches"
  is the content of this attempt; sequential ID assignment placed
  it at A005).
- bridge: `bridges/B-001-gct-homological-circuit.md` (downstream
  consumer; maturity unchanged).
- bridge: `bridges/B-002-natural-proofs-sheaf-cohomology.md`
  (downstream consumer; maturity unchanged; the G009 finding
  affects the bridge's viability and should be flagged in its next
  status revision).
- prompt: `prompts/P03-lemma-extraction.md` (minor variant noted in
  `prompt.md`).
- primer: `docs/primer/field-primers/03-p-vs-np.md`, §7 (glossary
  deltas; this attempt's findings should be promoted in the next
  primer revision).
- external:
  - Hartshorne, *Algebraic Geometry*, Springer GTM 52, 1977,
    Ch. II §7 (projective morphisms) and Ch. III §3 (cohomology of
    affine schemes).
  - Mumford, Fogarty, Kirwan, *Geometric Invariant Theory*, 3rd ed.,
    Springer, 1994, §1.3 (finite-group quotients).
  - Mulmuley & Sohoni, *Geometric Complexity Theory I*, SIAM J.
    Comput. 31 (2001) 496–526 (Grassmannian-of-wirings background
    in a parallel circuit-complexity context).
