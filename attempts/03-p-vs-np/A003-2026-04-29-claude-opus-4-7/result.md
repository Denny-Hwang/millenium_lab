# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Adversarial review of A002's 14-lemma scaffold finds 1 lethal-risk
(L11 circularity), 4 needs-patch verdicts, and 1 survival, naming
five concrete repairs and identifying L11' (quantitative
non-evaluation) as the new rate-limiting open lemma.

## Outcome Label

- Label: `partial-insight`
- Reason: A003 generates five **new, concrete patches** that A002 did
  not produce, and identifies one lethal-risk (L11 circular reasoning)
  that A002 noted only abstractly (under G006). The substantive
  result is the proposal of a new lemma L11' (quantitative
  non-evaluation of $F_{\mathrm{AC}^0}$), which becomes the
  rate-limiting open problem for the entire H_0 program. This is
  more than a `survey` (genuinely new technical content surfaced) but
  not a `novel-approach` (no new theorem proved; only the obstruction
  is sharpened).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../../docs/methodology/outcome-taxonomy.md`](../../../docs/methodology/outcome-taxonomy.md).

---

## Adversarial Review Output

### A1. weaken_assumption on L02 (moduli = quasi-projective?)

- **Scenario.** Suppose
  $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$ is only a *constructible*
  subset of an ambient affine space (e.g., a finite union of locally
  closed subvarieties), not a quasi-projective scheme. This is a
  weakened version of L02.
- **Breakage.** L03 (eval morphism regularity) and L04 (sheaf
  $F_{\mathrm{AC}^0}$ existence) both implicitly require an honest
  scheme structure. Sheaf cohomology on a constructible set is not
  defined in the standard $H^i(X, \mathcal{F})$ formalism; one must
  pass to constructible sheaves, perverse sheaves, or motivic
  cohomology. Each of these enlarges the proof scope dramatically.
- **Survival argument.** None — L03/L04 fail under the weakening as
  literally stated.
- **Verdict.** `needs-patch:state-and-prove-quasi-projectivity`.

### A2. chain_lethal_lemma_failure (L02 → L03 → L04)

- **Scenario.** Suppose L02 succeeds but only as a *reducible*
  scheme: $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d} = \bigcup_i X_i$
  with multiple irreducible components.
- **Breakage.** The eval morphism $\mathrm{eval}_n$ may have
  inconsistent behavior across components (e.g., constant on one,
  surjective on another). $H^1$ then decomposes
  $H^1(\mathcal{C}, F) = \bigoplus_i H^1(X_i, F|_{X_i})$ and the
  Čech 1-cocycle attached to $f$ may live entirely on a "spurious"
  component, decoupling it from AC⁰ membership.
- **Survival argument.** If L02 is irreducible (or each component is
  preserved by $\mathrm{GL}_n$-action and the eval map is uniform
  across components), the breakage is averted. The current statement
  of L02 does not specify this.
- **Verdict.**
  `needs-patch:specify-irreducibility-or-component-uniformity`.

### A3. domain_swap to $\mathrm{AC}^0[2]$

- **Scenario.** Replace $\mathrm{AC}^0$ with $\mathrm{AC}^0[2]$
  (parity gates added). For this class Razborov–Smolensky 1987 prove
  superpolynomial lower bounds: parity over a different prime $q
  \neq p$ is not in $\mathrm{AC}^0[p]$. If the H_AC⁰ scaffold is
  *gate-set-blind*, it would over-prove (claim a separation that is
  already known *and* extend the technique automatically).
- **Breakage check.** L02's moduli construction is gate-set-specific:
  the number of gate types and the depth bound enter the moduli
  equations explicitly. Swapping in $\mathrm{AC}^0[p]$ requires a
  *different* moduli, not the same one with different parameters.
  L04's sheaf $F_{\mathrm{AC}^0}$ encodes "remaining size /depth
  budget" but says nothing about gate types; under the swap, $F$
  needs to be redefined, not just relabeled.
- **Survival argument.** The scaffold is *not* gate-set-blind; the
  domain swap forces a fresh L02 / L04. So the scaffold does not
  accidentally prove $\mathrm{AC}^0[p]$ separations for free.
- **Verdict.** `survives` — the scaffold's gate-set specificity is
  a feature, not a bug.

### A4. boundary_case at $n \in \{0, 1\}$

- **Scenario.** Examine $n = 0$ (no inputs; only constant functions)
  and $n = 1$ (one input; four functions $\{0, 1, x, \neg x\}$).
- **Breakage.** $\mathrm{GL}_0$ is trivial, so equivariant stability
  (L08) has no content at $n = 0$. At $n = 1$, $\mathrm{GL}_1 =
  \mathbb{G}_m$ acts; the moduli is one-dimensional (or zero-
  dimensional) and the cohomology computation is degenerate. L08's
  "stability under $n \to n+1$" statement does not specify a base
  case, so the inductive structure is ill-founded.
- **Survival argument.** Adding an explicit base case at $n = 1$
  (or $n = $ smallest non-trivial) closes the gap; the boundary
  cases do not contradict H_AC⁰.
- **Verdict.** `needs-patch:add-explicit-base-case-for-L08`.

### A5. circular_reasoning_check on L11 ⚠️ LETHAL RISK

- **Scenario.** L11 must show that $F_{\mathrm{AC}^0}$ does not admit
  a uniform $2^{O(n)}$-time evaluation algorithm. But "evaluating
  $F_{\mathrm{AC}^0}$ at a function $f \in \{0,1\}^{2^n}$" — what
  does this mean concretely?
- **Breakage.** The natural reading is: given a Boolean function
  $f$ as a truth table (a string of $2^n$ bits), produce some
  representation of the cohomology class $[F_{\mathrm{AC}^0}]_f$.
  But by L05/L06, $[F_{\mathrm{AC}^0}]_f \neq 0$ iff $f \notin
  \mathrm{AC}^0$. Thus *any* algorithm that decides
  $[F_{\mathrm{AC}^0}]_f \neq 0$ in time $T(n)$ also decides
  $f \notin \mathrm{AC}^0$ in time $T(n)$. The truth-table is of
  length $2^n$, so a brute-force AC⁰-checker runs in time
  $2^{O(n)}$ trivially (enumerate all AC⁰ circuits of size $\le s$,
  check each — there are $2^{O(s \log s)}$ candidates, polynomial
  in $2^n$ for $s = \mathrm{poly}(n)$). **This means a uniform
  $2^{O(n)}$ evaluator for $F_{\mathrm{AC}^0}$ exists trivially, so
  L11 as stated is FALSE.**
- **Survival argument.** Only by changing what "evaluator" means.
  The Razborov–Rudich definition of *constructive* asks for a
  predicate on truth tables decidable in $2^{O(n)} = $ poly in
  truth-table length. This is naïvely satisfied. The escape route
  must be: redefine the input. Instead of taking $f$ as a truth
  table, take $f$ as a *short program* (description length
  $\mathrm{poly}(n)$). Then "evaluating $F_{\mathrm{AC}^0}$ at $f$"
  cannot be done in $\mathrm{poly}(n)$ time (because deciding
  AC⁰-membership from a program description is at least
  $\mathrm{coNP}$-hard). This is a substantively different lemma,
  L11', and is itself an open problem.
- **Verdict.**
  `lethal:L11-as-stated-is-false-truthtable-evaluation-trivially-poly`.

### A6. quantifier_alternation_check on H_AC⁰

- **Scenario.** H_AC⁰ as written reads "for every
  $f : \{0,1\}^n \to \{0,1\}$, $f \notin \mathrm{AC}^0$ iff
  $[F_{\mathrm{AC}^0}]_f \neq 0$ in
  $H^1(\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}, F_{\mathrm{AC}^0})$". The
  quantifier on $s, d$ is *implicit*. Two readings are possible:

  - $\forall f \exists (s, d): \cdots$ — for each $f$, there exist
    parameters $s, d$ that witness the equivalence;
  - $\exists (s, d) \forall f: \cdots$ — there are uniform $s, d$
    that work for every $f$.

  These differ substantively.
- **Breakage.** Under reading (i) (existential $s, d$ per $f$), the
  $f \in \mathrm{AC}^0$ direction is trivial: take $s, d$ to be the
  size and depth of any AC⁰ circuit for $f$. The cohomology
  encodes nothing useful. Reading (i) makes H_AC⁰ a tautology.
  Under reading (ii), the choice of $s, d$ must be uniform; the
  natural choice $s = n^{O(1)}, d = O(1)$ is the right one for the
  intended P-vs-NP application but must be stated.
- **Survival argument.** Reading (ii) is what is intended, but is
  not stated in A002.
- **Verdict.**
  `needs-patch:make-quantifier-explicit-uniform-s-poly-n-d-O-1`.

### Round verdict

- **PARTIAL** — 1 lethal-risk (A5), 4 needs-patch (A1, A2, A4, A6),
  1 survives (A3).

### Suggested patches (sorted by impact)

| Patch | Location | Difficulty | Notes |
|-------|----------|------------|-------|
| **L11'** quantitative non-evaluation | new lemma replacing L11 | **high** (open problem) | Rate-limiting; without it the natural-proofs audit fails. |
| **H_AC⁰** quantifier upgrade | hypothesis statement | low | Make $\exists s = n^{O(1)}, d = O(1) \forall f$ explicit. |
| **L02-quasi-projective** | sub-lemma of L02 | medium | Establish quasi-projectivity, not just constructibility. |
| **L02-irreducibility** | sub-lemma of L02 | medium | Either irreducibility or component uniformity. |
| **L08-base-case** | sub-lemma of L08 | low–medium | Explicit $n = 0, 1$ base case for the equivariant induction. |

### Implications for A001's H₀

- The natural-proofs audit, which A001 implicitly assumed was a
  cheap byproduct of the GCT × homology combination, is now the
  rate-limiting open problem (L11').
- Re-rating: A001's robustness should be **3/5 with locked-in new
  difficulty** (L11' is now an explicit open lemma, not a hidden
  risk).
- B-002's claim that "a non-constructive sheaf escapes RR" requires
  L11' to be true. The bridge stays at maturity `ai-discovered`
  until L11' has progress.

---

## Key Insights

- **A5 / L11' is the new bottleneck.** A002 listed G006 as an
  abstract circularity risk; A003 demonstrates the exact mechanism:
  truth-table evaluation makes naïve constructiveness trivial. The
  fix requires changing the input representation to short programs,
  and the resulting lemma is a non-trivial open problem.
- **Quantifier discipline matters.** A6 surfaces a real ambiguity
  in H_AC⁰: the existential-uniform vs existential-pointwise
  distinction was hidden in informal English and would have led
  to a *trivially true* mis-formalization.
- **The scaffold is repairable but more expensive than A002 estimated.**
  Five patches (one HIGH, two medium, two low) are needed before
  candidate promotion; A002's HOLD verdict is reaffirmed and the
  bar for promotion is now sharper.
- **Single-model adversarial review still has value.** Even without
  a different model/session, simulating the adversarial role
  surfaces patches the original author missed. A genuine
  cross-model round is still required before any L4 verdict.

## Follow-ups

1. **A004**: rewrite H_AC⁰'s statement with explicit quantifier
   structure (closes A6 patch). Smallest, highest-priority repair;
   should propagate to all references to H_AC⁰ in B-002 and A002.
2. **A005**: state and begin to prove L11' (quantitative
   non-evaluation of $F_{\mathrm{AC}^0}$). Likely spawns its own
   sub-attempts and may itself need adversarial review.
3. **A006**: discharge the L02 quasi-projectivity and irreducibility
   patches via concrete moduli construction.
4. **A007**: discharge the L08 base-case patch.
5. **R6 cross-attempt synthesis** (after A007): re-evaluate the
   H_0 program against verification-bar §2 (three-barrier audit)
   given the new L11' obstruction.
6. **Genuine cross-model P07 round**: charter §4.3 requires this
   for any L4 pass. The current A003 is round 1 (simulated); round
   2 must be a different actor.

## References

- [`prompts/P07-adversarial-review.md`](../../../prompts/P07-adversarial-review.md)
- [`attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/result.md`](../A002-2026-04-29-claude-opus-4-7/result.md)
  (the target of this review)
- [`attempts/03-p-vs-np/A001-2026-04-29-claude-opus-4-7/result.md`](../A001-2026-04-29-claude-opus-4-7/result.md)
- [`bridges/B-002-natural-proofs-sheaf-cohomology.md`](../../../bridges/B-002-natural-proofs-sheaf-cohomology.md)
- [`docs/problems/03-p-vs-np/verification-bar.md`](../../../docs/problems/03-p-vs-np/verification-bar.md) §2
- External:
  - [Razborov–Rudich 1997] *Natural Proofs*, J. Comput. Syst. Sci.
    55(1):24–35.
  - [Razborov 1987], [Smolensky 1987] AC⁰[p] lower bounds (relevant
    for the A3 domain-swap analysis).
