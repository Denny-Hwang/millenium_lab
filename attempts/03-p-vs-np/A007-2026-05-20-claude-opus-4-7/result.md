# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

H_AC⁰ program commits provisionally to **(R1) sheaf-on-ambient**;
Construction A (eval pullback of the ideal sheaf of non-AC⁰ truth
tables) is proposed as the structural shape of $F_{\mathrm{AC}^0}$
on the Grassmannian-product ambient and tested at the smallest
non-vacuous case $(n,s,d)=(2,3,2)$ where XOR and XNOR fail
AC⁰_{(3,2)}; Construction A as stated yields trivially zero
cohomology, surfacing the refinement requirement that the cocycle
assignment $f \mapsto [F]_f$ must introduce $f$-dependence (G012);
two candidate refinements (A' twisted line bundle; A'' relative
Ext) are sketched as next-attempt targets.

## Outcome Label

- Label: `partial-insight`
- Reason: This attempt does three substantive things. (1) Resolves
  the (R1) vs (R2) strategic question with explicit reasoning,
  committing the program *provisionally* to (R1) — the choice that
  preserves the H_AC⁰ identity and supplies novel technical content
  rather than incrementally extending the existing GCT literature.
  (2) Proposes Construction A (eval pullback) as the first concrete
  structural shape of $F_{\mathrm{AC}^0}$ on the ambient. (3) Tests
  Construction A at the smallest non-vacuous case and reports an
  honest negative finding: the construction gives trivial cohomology
  and must be refined with $f$-dependent twisting. Two refinements
  (A', A'') are sketched as targets for the next attempt. Below
  `novel-approach` because no genuinely new technique is introduced
  (eval pullback and Ext / Chern classes are standard); above
  `survey` because the test produced a concrete negative result
  that determines the next step.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Strategic commitment — (R1) sheaf-on-ambient, *provisional*

The H_AC⁰ program commits to (R1) for five reasons:

1. **Identity preservation.** A002's L04 framed the program around
   the *existence of a coherent sheaf* $F_{\mathrm{AC}^0}$. (R1)
   preserves this framing literally; (R2) abandons it for
   representation-theoretic obstructions on orbit closures (a
   different mathematical object).
2. **Bridge alignment.** B-002 (natural proofs ↔ sheaf cohomology)
   is the program's defining bridge. (R1) is its direct technical
   realization; (R2) re-routes the program through B-001 (GCT ↔
   homological), changing which bridge is load-bearing.
3. **Novelty / contribution.** (R2) merges into well-developed GCT
   literature (Mulmuley–Sohoni 2001, 2008; Bürgisser–Ikenmeyer
   2017, 2019). The H_AC⁰ program would lose its distinctness as
   a contribution. (R1) is speculative but offers something the
   existing literature does not.
4. **Razborov–Rudich engagement.** The natural-proofs barrier is
   the most concrete technical motivation. (R1) directly proposes
   a sheaf-cohomology reformulation of "non-natural usefulness";
   (R2) addresses the barrier via the standard GCT escape without
   producing a new mechanism.
5. **Negative-result value.** If (R1) fails, the failure itself is
   valuable evidence on B-002. If we commit to (R2) first, we
   never learn whether (R1) was viable. The asymmetry favors
   trying (R1) first.

**Provisionality.** The commitment is provisional. If (R1) hits a
clear technical obstacle within 3–5 follow-up attempts, the program
will revisit (R2) with the explicit negative evidence in hand.
This trigger is encoded in follow-up §6 below.

## 2. Structural shape of $F_{\mathrm{AC}^0}$ on the ambient

Recall the situation after A005, A006:

- Ambient $\mathrm{AMB} = \bigsqcup_T \mathrm{AMB}_T$ where each
  $\mathrm{AMB}_T = \prod_g \mathrm{Gr}(k_g, m_g)$ is a product of
  Grassmannians indexed by gates of DAG topology $T$.
- Boolean locus $B_T \subset \mathrm{AMB}_T$ is 0-dimensional
  (standard-basis-spanned wirings only); $B = \bigsqcup_T B_T$.
- Eval morphism $\mathrm{eval}_T : \mathrm{AMB}_T \to
  \mathbb{A}^{2^n}$ sends a (general arithmetic) wiring to its
  evaluation on all $2^n$ Boolean inputs, viewed in
  $\mathbb{A}^{2^n}$. This is the natural extension of A002's L03
  to the ambient.

For (R1), $F_{\mathrm{AC}^0}$ must be:

- a coherent sheaf on $\mathrm{AMB}$, and
- equipped with a natural assignment $f \mapsto [F]_f \in
  H^1(\mathrm{AMB}, F_{\mathrm{AC}^0})$ for each Boolean function
  $f : \{0,1\}^n \to \{0,1\}$,
- such that $[F]_f = 0 \iff f \in \mathrm{AC}^0_{(s,d)}$.

The structural challenge: the *sheaf* does not depend on $f$, but
the *cocycle* does. So $F_{\mathrm{AC}^0}$ must be rich enough to
carry distinct cohomology classes for distinct $f$.

## 3. Construction A — eval pullback of the ideal sheaf

Let $T_n = \{0,1\}^{2^n} \subset \mathbb{A}^{2^n}$ be the discrete
set of Boolean truth tables, and

$$
  N_{(s,d)} \;=\; T_n \setminus \mathrm{image}(\mathrm{eval}|_{B})
  \;\subset\; \mathbb{A}^{2^n}
$$

— the set of Boolean functions *not* computable in
$\mathrm{AC}^0_{(s,d)}$. Define

$$
  F_{\mathrm{AC}^0}^{\mathrm{A}}
  \;:=\;
  \mathrm{eval}^* \mathcal{I}_{N_{(s,d)}},
$$

where $\mathcal{I}_{N_{(s,d)}}$ is the ideal sheaf of $N_{(s,d)}$
in $\mathbb{A}^{2^n}$.

The assignment $f \mapsto [F]_f$ is given by: pick a Čech cover of
$\mathrm{AMB}$ adapted to the connected components, take the
1-cocycle whose component-wise data is the *evaluation of
$\mathcal{I}_{N_{(s,d)}}$ at the truth-table point* $\chi_f \in
\mathbb{A}^{2^n}$, and pull back along $\mathrm{eval}$.

The expected behavior:

- $f \in \mathrm{AC}^0_{(s,d)}$: $\chi_f$ is in the image of
  $\mathrm{eval}|_B$, hence $\chi_f \notin N_{(s,d)}$ and
  $\mathcal{I}_{N_{(s,d)}}$ acts trivially near $\chi_f$; the
  pulled-back cocycle vanishes.
- $f \notin \mathrm{AC}^0_{(s,d)}$: $\chi_f \in N_{(s,d)}$; the
  ideal sheaf has non-trivial behavior at $\chi_f$, and (one
  hopes) the pulled-back class is forced non-zero.

This is the *shape* of the construction; the specific cocycle
assignment is rough.

### 3.1 Test at $(n,s,d)=(2,3,2)$

By case enumeration (transcript Step 3), every 2-bit Boolean
function except **XOR** and **XNOR** is in
$\mathrm{AC}^0_{(3,2)}$. So $N_{(3,2)} = \{\chi_{\mathrm{XOR}},
\chi_{\mathrm{XNOR}}\} \subset \mathbb{A}^4$ — two isolated points.

The two excluded functions are non-trivial: XOR requires the
classical $(x_1 \wedge \neg x_2) \vee (\neg x_1 \wedge x_2)$
formula, which needs five gates after counting $\neg$ as a separate
gate, exceeding $s = 3$. So the (2,3,2) test set $N_{(3,2)}$ is
non-empty and the test is non-vacuous.

For each topology / fan-in $T$ in (2,3,2):

- $\mathrm{image}(\mathrm{eval}_T)$ contains *only Boolean truth
  tables achievable in* $T$. None of these is XOR or XNOR.
- So $N_{(3,2)} \cap \mathrm{image}(\mathrm{eval}_T) = \emptyset$.
- $\mathcal{I}_{N_{(3,2)}}$ restricted to
  $\mathrm{image}(\mathrm{eval}_T)$ is the **structure sheaf**
  (an ideal sheaf away from its zero locus is the structure
  sheaf).
- Hence $\mathrm{eval}_T^* \mathcal{I}_{N_{(3,2)}} =
  \mathcal{O}_{\mathrm{AMB}_T}$.

Now $H^1(\mathrm{AMB}_T, \mathcal{O}) = 0$ for every ambient at
this case (Grassmannian products have no first cohomology of the
structure sheaf — they are rational varieties).

**Verdict.** Construction A as stated gives $H^1(\mathrm{AMB},
F_{\mathrm{AC}^0}^{\mathrm{A}}) = 0$ at $(2,3,2)$, so $[F]_f = 0$
for every $f$ — including $f = \mathrm{XOR}$. The construction
**fails to distinguish** XOR from $x_1 \wedge x_2$ at this case.

This is the principal negative finding of the attempt.

### 3.2 Diagnosis

The failure of Construction A is structural: the *sheaf* does not
encode $f$-specific information; the entire $f$-dependence is
supposed to come from the *cocycle assignment*, but the cocycle is
determined by the sheaf cohomology, which is zero.

Two refinements add $f$-dependence at the sheaf level.

## 4. Refinements A', A''

**Construction A' — twisted line bundle.** Replace the structure
sheaf with a line bundle $\mathcal{L}_f$ twisted by data of $f$.
Specifically: encode the truth-table point $\chi_f \in
\mathbb{A}^{2^n}$ as a Cartier divisor $D_f$ on $\mathbb{A}^{2^n}$
(e.g., a hyperplane through $\chi_f$ with a chosen orientation),
and take $\mathcal{L}_f = \mathrm{eval}^* \mathcal{O}(D_f)$. Then
$[F]_f = c_1(\mathcal{L}_f) \in H^2(\mathrm{AMB}, \mathbb{Z})$ (or
$H^1(\mathrm{AMB}, \mathcal{O}^*)$ in multiplicative form). The
cohomological degree shifts from 1 to 2, but the construction is
clean.

**Construction A'' — relative Ext.** Define $F_{\mathrm{AC}^0} =
\mathrm{Ext}^1(\mathcal{O}_B, \mathcal{O}_{\mathrm{AMB}})$, the
sheaf of extensions of the Boolean-locus structure sheaf by the
ambient structure sheaf. This is a coherent sheaf on $\mathrm{AMB}$
whose cohomology detects the relationship between the discrete
Boolean locus and the positive-dimensional ambient. The
$f$-dependence enters by restriction to the $f$-specific component
of $B$ (the subset of $B$ on which the wiring computes $f$).

Both refinements move the construction into Ext / Chern-class
territory, which is where natural-proofs-evading sheaf machinery
typically lives (see B-002 §2 for the broader pattern).

Neither A' nor A'' is worked out in this attempt. They are
explicitly handed off as next-attempt targets.

## 5. Updated gap inventory

| ID | Severity | Status after A007 |
|----|----------|--------------------|
| G002 (L04 rank control) | lethal-if-unresolved | unchanged; subsumed by F_{AC^0} construction question |
| G003 | lethal-if-unresolved | unchanged |
| G007 | major | unchanged |
| G008 (L11') | lethal-if-unresolved | unchanged |
| G009 (discrete-reading collapse) | lethal-if-unresolved | route chosen (R1); refinement deferred to G012 + G013 |
| G010 (Plücker equations) | major | closed at (2,3,2); larger cases pending Macaulay2 |
| G011 (equivariance) | major | $S_n$-equivariant; $\mathrm{GL}_n$ requires construction change |
| **G012** | **major** | **new — Construction A trivializes; need $f$-dependent twist (A' or A'')** |
| **G013** | **lethal-if-unresolved** | **new — naturality of $f \mapsto [F]_f$; ad-hoc twists do not suffice for natural-proofs framework** |
| **G014** | **major** | **new — explicit polynomial coordinates for $\mathrm{eval}$ on ambient** |

## Key Insights

- **(R1) is the right choice for the H_AC⁰ program** by an
  asymmetry argument: (R1) might fail, but failing tells us
  something new; (R2) succeeds modestly without adding to the
  literature. Try (R1) first.
- **Construction A (eval pullback of ideal sheaf of non-AC⁰
  truth tables) has the right *shape* but trivializes at the
  smallest test case.** The cohomology vanishes because the
  *sheaf* itself becomes the structure sheaf when the non-AC⁰
  set is disjoint from the eval image.
- **The $f$-dependence must enter at the sheaf level**, not only
  at the cocycle level. Refinements A' (twisted line bundle) and
  A'' (relative Ext) are the natural candidates.
- **Naturality is a real constraint** (G013, new lethal-grade
  gap). Any *ad hoc* twist that produces non-zero cohomology
  would still need to commute with the symmetries of the problem
  and be derivable from intrinsic data; otherwise the
  Razborov–Rudich framework would not engage with it.
- **The (2,3,2) test set is small but non-vacuous**: XOR and XNOR
  exclude themselves from $\mathrm{AC}^0_{(3,2)}$ by gate-count
  arithmetic, providing the first concrete $f \notin
  \mathrm{AC}^0_{(s,d)}$ to test constructions against.

## Follow-ups

1. **A008**: work out Construction A' (twisted line bundle) at
   $(n,s,d)=(2,3,2)$. Compute $c_1(\mathcal{L}_f) \in H^2$ for
   $f = $ XOR vs $f = x_1 \wedge x_2$; verify non-zero / zero
   discrimination at this case. The (R1) → A' refinement is the
   most direct next step.
2. **A009**: parallel attempt on Construction A'' (relative Ext).
   Compute $\mathrm{Ext}^1$ at (2,3,2) and report whether the
   $f$-dependence at the Boolean locus restriction discriminates
   XOR.
3. **A010**: discharge A003-A4 (L08 base case at $n \in \{0, 1\}$)
   — deferred since A005; independent of (R1) refinement work.
4. **A011**: explicit polynomial coordinates for eval (G014), at
   least for the (2,3,2) ambient.
5. **Larger-case extension** of Construction A / A' / A'' to
   $(n,s,d)=(3,5,3)$ or similar, where the AC⁰-excluded set is
   richer (PARITY on 3 bits remains $\notin \mathrm{AC}^0$ at
   certain bounded sizes). Requires Macaulay2 / SageMath.
6. **(R1) abandonment trigger.** If A008 + A009 + A011 both fail
   to produce a working $F_{\mathrm{AC}^0}$ with the required
   biconditional within 3 follow-up attempts, the program revisits
   (R2). The negative evidence is then encoded as a formal verdict
   on B-002.
7. **L11' attack** (deferred since A004 / A005 / A006): begin once
   the F_{AC^0} construction is settled. L11' is independent of
   G009 / G012 / G013 in formulation but depends on F_{AC^0} for
   the evaluator definition.
8. **Cross-model adversarial pass on the (R1) commitment**
   (charter §4.3 prerequisite for any L4 verdict). The natural
   attack: argue that (R2) was the right choice and that (R1)'s
   provisionality is wishful. The asymmetry argument (reason 5)
   should survive this; if it does not, the commitment must be
   revisited.
9. **R6 cross-attempt synthesis** after A008–A010 land. With seven
   attempts on H_AC⁰ now in the record (A001–A007), patterns are
   becoming visible.
10. **Bridge status updates** after the (R1) work clarifies:
    B-002 should record the Construction A negative finding and
    the A' / A'' refinement plan; B-001 should record that the
    H_AC⁰ program has not committed to (R2) but retains it as a
    fallback.

## References

- attempt: `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/`
  (L02 v1, L03 eval, L04 sheaf).
- attempt: `attempts/03-p-vs-np/A005-2026-05-20-claude-opus-4-7/`
  (L02 v2; G009).
- attempt: `attempts/03-p-vs-np/A006-2026-05-20-claude-opus-4-7/`
  (Plücker equations; (R1) vs (R2) split).
- bridge: `bridges/B-001-gct-homological-circuit.md` (the (R2)
  route, retained as fallback).
- bridge: `bridges/B-002-natural-proofs-sheaf-cohomology.md`
  (the (R1) route's native home; Construction A negative finding
  to be flagged in next status revision).
- primer: `docs/primer/field-primers/03-p-vs-np.md` §7 (the (R1)
  commitment and Construction A / A' / A'' should be promoted in
  the next primer revision).
- prompt: `prompts/P02-bridge-discovery.md` (minor variant; see
  `prompt.md`).
- external:
  - Hartshorne, *Algebraic Geometry*, Springer GTM 52, 1977 —
    Ch. III §6 (Ext functor).
  - Mumford, Fogarty, Kirwan, *Geometric Invariant Theory*, 3rd
    ed., Springer, 1994.
  - Mulmuley & Sohoni, *Geometric Complexity Theory I*, SIAM J.
    Comput. 31 (2001) 496–526 (background for the retained (R2)
    fallback).
  - Razborov & Rudich, *Natural Proofs*, J. Comput. Syst. Sci.
    55(1):24–35, 1997 (the barrier (R1) is attempting to
    reformulate in cohomological language).
