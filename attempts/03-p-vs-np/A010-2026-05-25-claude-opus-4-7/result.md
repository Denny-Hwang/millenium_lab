# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

GCT-L02 (the (R2) arithmetic-circuit moduli) is stated and confirmed
to escape Boolean rigidity (it is honestly positive-dimensional), but
a small-case test reveals it does **not** track AC⁰-membership —
XOR's representing polynomial $p_{\mathrm{XOR}} = x_1 + x_2 - 2x_1x_2$
is arithmetic-realizable in size 2 / depth 2 while XOR is
Boolean-AC⁰-hard at $(3,2)$ — surfacing **G019** (the
Boolean-vs-arithmetic gap) as the dual obstruction to (R1)'s
Boolean-rigidity C-001, and prompting a recommendation that the
H₀ / H_AC⁰ program be considered for **dormant** status.

## Outcome Label

- Label: `partial-insight`
- Reason: States GCT-L02 (the central object of the (R2) route);
  verifies it escapes Boolean rigidity; then produces an honest
  negative finding (the arithmetic moduli does not track AC⁰
  hardness) backed by an explicit small-case computation; and
  identifies the resulting **dual-obstruction** structure of the
  whole program. Substantial structural progress (above `survey`)
  but no new technique and no candidate (below `novel-approach`).
  Not `flawed-attempt`: the (R2) route is correctly diagnosed, not
  erroneously claimed to work.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. GCT-L02 (draft statement)

**Definition (GCT-L02).** Fix $(n, s, d)$. An *arithmetic circuit*
on $n$ inputs is a DAG whose internal gates are labelled $+$ or
$\times$, with edges optionally carrying $\mathbb{Q}$-scalar weights,
computing a polynomial in $\mathbb{Q}[x_1, \ldots, x_n]$. The moduli

$$
  \mathcal{M}^{\mathrm{arith}}_{n,s,d}
$$

parameterizes such circuits of size $\leq s$ and depth $\leq d$,
modulo gate-relabeling. The eval morphism

$$
  \mathrm{eval}^{\mathrm{arith}} :
  \mathcal{M}^{\mathrm{arith}}_{n,s,d} \to \mathcal{P}_n
$$

sends a circuit to the polynomial it computes, where $\mathcal{P}_n
= \mathbb{Q}^{2^n}$ is the space of multilinear polynomials on $n$
variables (coefficients indexed by subsets of $\{1, \ldots, n\}$).

A Boolean function $f$ embeds via its unique multilinear representing
polynomial $p_f \in \mathbb{Q}[x]/(x_i^2 - x_i)$, and is
"arithmetic-realizable at $(s,d)$" iff $p_f \in
\mathrm{image}(\mathrm{eval}^{\mathrm{arith}})$.

**Escapes Boolean rigidity.** Unlike the Boolean L02 v2,
$\mathcal{M}^{\mathrm{arith}}$ is honestly positive-dimensional: the
edge scalar weights are continuous parameters, so each fixed DAG
topology contributes a positive-dimensional component. There is no
0-dimensional collapse. This is the intended escape from C-001.

## 2. Small-case test at $(n,s,d)=(2,3,2)$ — XOR

Does arithmetic realizability of $p_f$ track Boolean AC⁰-membership
of $f$? Test with XOR (Boolean-AC⁰-hard at $(3,2)$ per A007 — needs
5 Boolean gates).

XOR's representing polynomial:
$$
  p_{\mathrm{XOR}}(x_1, x_2) = x_1 + x_2 - 2 x_1 x_2.
$$
(Check: $0,1,1,0$ on the four Boolean inputs. Correct.)

Arithmetic circuit computing it:
- $g_1 = x_1 \times x_2$ (one $\times$-gate, depth 1)
- $g_2 = x_1 + x_2 - 2 g_1$ (one $+$-gate with $\mathbb{Q}$-weights
  $1, 1, -2$, depth 2)

**Size 2, depth 2.** So $p_{\mathrm{XOR}}$ is arithmetic-realizable
at $(2,2) \subseteq (2,3,2)$.

**Result.** XOR is arithmetic-*easy* (size 2) but Boolean-AC⁰-*hard*
(size $>3$ at depth 2). Arithmetic-circuit realizability **does not
track** Boolean AC⁰-membership.

## 3. Diagnosis — the Boolean-vs-arithmetic gap (G019)

This is not a defect of the GCT-L02 statement; it is the well-known
gap between Boolean and algebraic complexity:

- GCT (Mulmuley–Sohoni) addresses $\mathrm{VP}$ vs $\mathrm{VNP}$ —
  *algebraic* classes.
- P vs NP and AC⁰ lower bounds are *Boolean* questions.
- Arithmetic circuits enjoy cancellation and $\mathbb{Q}$-scalars,
  which trivialize many Boolean-hard functions. Every Boolean
  function's multilinear representing polynomial is arithmetic-cheap
  relative to its Boolean complexity.

So the (R2) route escapes Boolean rigidity only to land on the
Boolean-vs-arithmetic gap. The two routes face **dual** obstacles:

| Route | Moduli | Obstruction |
|-------|--------|-------------|
| (R1) | Boolean circuits | 0-dimensional rigidity — C-001 |
| (R2) | arithmetic circuits | hardness-blindness — **G019** |

## 4. Can the dilemma be escaped?

Two ideas, both hard:

- **(i) Boolean-restricted arithmetic moduli.** Impose $x_i^2 = x_i$
  and Boolean output inside $\mathcal{M}^{\mathrm{arith}}$. This cuts
  back to the Boolean locus — rigidity (C-001) returns. No escape.
- **(ii) Hardness-tracking arithmetic invariant.** Restrict to
  *monotone* or *bounded-cancellation* arithmetic circuits, which
  are more closely tied to Boolean complexity (Jerrum–Snir 1982;
  Valiant). This narrows the gap but does not obviously close it,
  and changes the moduli again. Most promising but speculative.

Neither is a clean escape.

## 5. New gap

| ID | Severity | Statement |
|----|----------|-----------|
| **G019** | **lethal-if-unresolved** | The Boolean-vs-arithmetic gap: the (R2) arithmetic-circuit moduli does not track AC⁰-membership, because arithmetic circuits trivialize Boolean-hard functions (XOR: arithmetic size 2, Boolean AC⁰ size $>3$). Any (R2) route must restrict to a Boolean-hardness-tracking sub-class (e.g., monotone arithmetic) and then re-verify both positive-dimensionality (escaping C-001) and hardness-tracking (escaping G019). |

## 6. Program-level assessment

After A005–A010, the H₀ / H_AC⁰ program faces **dual** fundamental
obstacles — C-001 on the Boolean side, G019 on the arithmetic side.
This is recognizable as a known meta-phenomenon: connecting algebraic
geometry to Boolean lower bounds is hard precisely because Boolean
structure is rigid (discrete) while algebraic structure is continuous
but hardness-blind. The program rediscovered the dilemma from the
inside, with explicit small-case witnesses for both horns.

**Recommendation (decision is the user's, per charter §3 / R6
step 5).** Consider moving 03-p-vs-np's H₀ / H_AC⁰ program to
**dormant**. Not abandoned — C-001 and G019 are genuine negative-
knowledge assets — but paused, with an explicit reactivation
condition: *a monotone- or bounded-cancellation-arithmetic moduli
that provably escapes both C-001 (positive-dimensional) and G019
(tracks AC⁰ hardness).* The status label `not-started` in the
dashboard would change to `dormant` only by an explicit
user-approved dashboard/status PR.

## Key Insights

- **GCT-L02 escapes Boolean rigidity** — the arithmetic moduli is
  honestly positive-dimensional. (R2) does what it was designed to
  do on the rigidity front.
- **But it loses Boolean hardness.** XOR is the smallest witness:
  arithmetic size 2, Boolean-AC⁰ size $>3$ at depth 2. The
  arithmetic complexity of $p_f$ does not track $f$'s AC⁰
  complexity.
- **The program faces a dual obstruction.** (R1) → rigidity
  (C-001); (R2) → Boolean-vs-arithmetic gap (G019). Any
  algebraic-geometric moduli either keeps Boolean structure (rigid)
  or relaxes to arithmetic (hardness-blind).
- **This is a known meta-phenomenon** (the algebraic-vs-Boolean
  complexity gap), rediscovered internally with concrete witnesses.
  Honest conclusion: the program should pause unless a
  hardness-tracking yet positive-dimensional moduli (e.g., monotone
  arithmetic) can be found.

## Follow-ups

1. **User decision on dormancy.** Per R6 step 5 and charter §3, the
   decision to move the H₀ / H_AC⁰ program to `dormant` rests with
   the user. This attempt recommends it; it does not enact it.
2. **If continuing: A011 — monotone-arithmetic moduli.** Explore
   idea (ii): does restricting $\mathcal{M}^{\mathrm{arith}}$ to
   monotone circuits (no negative scalars / no cancellation) yield
   a moduli that is positive-dimensional *and* tracks AC⁰ hardness?
   Jerrum–Snir 1982 and Valiant's monotone lower bounds are the
   entry points. This is the only identified route that addresses
   both C-001 and G019.
3. **If pausing: register G019 as a second conjecture.** Analogous
   to C-001, a C-002 could state the Boolean-vs-arithmetic gap as a
   formal obstruction to the (R2) route, preserving the
   negative-knowledge asset.
4. **Update C-001 references** to cross-link the dual obstruction
   (C-001 ↔ G019).
5. **R6 refresh** once A011 (or the dormancy decision) lands; the
   dual-obstruction finding is the headline lesson of the whole
   A001–A010 arc.
6. **Deferred items** (L08 base case A003-A4; explicit eval
   coordinates G014; L11' attack) remain deferred and become moot
   if the program goes dormant.

## References

- attempt: `attempts/03-p-vs-np/A006-2026-05-20-claude-opus-4-7/`
  (Boolean rigidity; XOR not in AC⁰_{(3,2)}).
- attempt: `attempts/03-p-vs-np/A009-2026-05-21-claude-opus-4-7/`
  ((R2) pivot scope; G018).
- conjecture:
  `conjectures/C-001-boolean-rigidity-sheaf-obstruction/`
  (the (R1) obstruction; G019 is its (R2) dual).
- bridge: `bridges/B-001-gct-homological-circuit.md` (the (R2)
  route's load-bearing bridge).
- external:
  - Mulmuley & Sohoni, *Geometric Complexity Theory I*, SIAM J.
    Comput. 31 (2001) 496–526 (the VP/VNP framework (R2) borrows).
  - Jerrum & Snir, *Some exact complexity results for
    straight-line computations over semirings*, J. ACM 29 (1982)
    874–897 (monotone arithmetic lower bounds; entry point for
    idea (ii)).
  - Valiant, *Completeness classes in algebra*, STOC 1979 (VP/VNP
    origins; arithmetic vs Boolean complexity).
