# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Fresh P01 five-domain panel testing dormancy re-activation trigger
(1) head-on — hypothesis H1, "semialgebraic relaxation hierarchies
(extension complexity / psd rank / SOS-degree) cross the C-002
wall" — finds H1's strict form **refuted at theorem level, twice
independently** (Rothvoss 2014 + Edmonds 1965 on the LP side;
Grigoriev 2001 / Schoenebeck 2008 + Gaussian elimination on the
SOS side: problems in P carry maximal semialgebraic hardness), and
the o-minimal half of the trigger's wording **inverts** (tameness
axiomatizes the wall rather than crossing it); what survives is a
substantial reformulation — the **model-lift wall** (C-002 refined
with a fourth instance family), the **XOR / characteristic-2
boundary** as a new organizing principle, the **Warren-duality**
(the wall and the tame-model lower-bound engine are the same
theorem), and four named residual cracks as forward paths.
Robustness 2/5 → reformulate per P01 rules; outcome
`partial-insight`; 03-p-vs-np re-activated per explicit user
direction + failure-criteria §4.

## Outcome Label

- Label: `partial-insight`
- Reason: The panel produces corrections and syntheses the
  repository did not previously hold, with direct operational
  consequences: (i) trigger (1)'s semialgebraic / o-minimal
  wording is disposed of head-on with theorem-level witnesses,
  which no prior artifact had done; (ii) the semialgebraic family
  is identified as the first *positive-dimensional AND
  model-hardness-faithful* family on record — strictly better
  than G019's hardness-blindness, genuinely refining C-002's
  landscape; (iii) the bidirectional XOR / characteristic-2
  boundary is proposed as an explicit amendment path for C-002;
  (iv) four residual cracks are named as concrete next-attempt
  targets. Above `survey` (corrective and synthetic content, not
  just organization); below `novel-approach` (no new technique).
  Not `flawed-attempt` — H1 was posed to be tested and was
  honestly refuted.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. First-pass opinions (P01 §1 — summaries; full text in transcript)

| Chair | Position in one line |
|-------|----------------------|
| real-algebraic-geometry | Cell-counting (Warren / Milnor–Thom) does *not* forbid encoding $2^n$ points at poly format; the wall is at *certification* — tame geometry provably reflects only algebraic-decision-tree cost (Ben-Or), and the theorem capping encoding power IS the theorem powering the lower bounds. |
| polyhedral-extension-complexity | xc is one-sidedly useful (small lift ⇒ poly-time LP algorithm) and unconditionally lower-boundable (FMPTW, Rothvoss), but Rothvoss + Edmonds kills P-faithfulness; **GLS separation ≡ optimization names the exact escape hatch** — uniform machines optimize via separation oracles, never materializing any extended formulation. |
| proof-complexity-sos | Spectrahedra + SOS-degree meet the trigger's letter (positive-dimensional, hardness-tracking) but track *model* hardness; the 3-XOR inversion (in P by Gaussian elimination, SOS-degree $\Omega(n)$) is the SOS twin of Rothvoss; **the XOR ghost that killed the dormant arc (G019) reappears in mirror image**. Strongest pro-H1 residue: Raghavendra's UGC-conditional SDP-optimality for Max-CSP *approximation*. |
| model-theory-o-minimality | The trigger's o-minimal hope **inverts**: cell decomposition, uniform finiteness, and Pila–Wilkie are quantitative statements that tame continuous objects host little arithmetic per unit format — o-minimality is the wall, axiomatized. |
| uniform-complexity | The wall relocates to the **model-lift step**, joining monotone→general (Razborov/Tardos), arithmetic→Boolean (G019), decision-tree→uniform (Ben-Or); lifting theorems (Raz–McKenzie, GPW) compose *sideways* between restricted models, never upward to uniform ones; a canonical simulation theorem is provably false for every canonical encoding on the books, and abandoning canonicity destroys the moduli structure — **C-002's dilemma reborn one level up**. |

## 2. Three conflicts (P01 §2)

- **C1**: "the invariants track hardness" (SOS/xc chairs) vs "they don't" (uniform chair).
- **C2**: "tameness is the enabling resource" (H1's wording) vs "tameness is the wall itself" (o-minimality + real-AG chairs).
- **C3**: "no lift to uniform models along known lines" (uniform chair) vs "faithfulness is real in at least one regime" (SOS chair: UGC-approximation; two residual cracks).

## 3. Conflict classification (P01 §3)

- **C1: false** (linguistic) — "hardness" used at two types: model-restricted vs uniform. Both claims true; the dissolution *is* the refined wall statement.
- **C2: real, resolved** — the resolution is the **Warren-duality**: the same theorems cap tame encoding power (the wall) and power every tame-model lower bound (the engine). Tameness cannot be recruited for crossing; it can be recruited for restricted lower bounds.
- **C3: real, open** — the UGC-approximation regime and the two residual cracks are exactly where theorems run out.

## 4. Resolution data / theorems (P01 §4)

- **C1**: settled by Rothvoss 2014 + Edmonds 1965 (LP) and Grigoriev 2001 / Schoenebeck 2008 + Gaussian elimination (SOS). Nothing further needed.
- **C2**: settled by the duality reading of Warren 1968 / Milnor–Thom / Ben-Or 1983. Record as organizing principle.
- **C3**: would be resolved by — (i) the psd rank of the perfect matching polytope (open; either answer informative); (ii) lower-bound technology for Cook–Levin tableau-based spectrahedral encodings (unexplored; plausibly non-relativizing); (iii) an unconditional exact-decision analog of Raghavendra's UGC-optimality (believed false; Gaussian elimination is the standing counterexample).

## 5. Multi-domain robustness score (P01 §5)

- **Score: 2 / 5.**
- H1's strict claim is refuted at theorem level, twice independently; the o-minimal wording inverts. What survives is a *reformulation* (below). Per P01 follow-up rules, ≤ 2 → discard or reformulate: **reformulate**.

## 6. Implications for existing bridges (P01 §6)

- **B-001** (GCT ↔ homological, active-but-walled): neutral-confirming — GCT's own VP/VNP→P/NP lift problem is another instance of the model-lift wall. No status change.
- **B-002** (natural proofs ↔ sheaf cohomology, dormant): unaffected — the panel's observation that xc-style properties fail *usefulness* (Rothvoss) before Razborov–Rudich even applies is consistent with B-002's record.

## Knowledge products (the reformulation)

- **K1 — Model-lift wall (refines C-002).** No positive-dimensional
  invariant on record is simultaneously model-faithful and
  uniform-faithful. The semialgebraic family (LP/SDP/SOS) is the
  **fourth instance family**, and the first that is
  positive-dimensional AND model-hardness-faithful — a genuine
  refinement of C-002's landscape (strictly better than G019's
  hardness-blindness).
- **K2 — XOR / characteristic-2 boundary (new organizing
  principle).** XOR sits on the wrong side of every algebraic
  encoding tried, in *both* directions: char-0 arithmetic
  encodings make it too easy (G019); ordered-real static
  certificate systems make it too hard (Grigoriev/Schoenebeck)
  while adaptive char-2 computation (Gaussian elimination) keeps
  it uniformly easy. Proposed as an explicit amendment to C-002:
  any continuous encoding must survive the mod-2 test in both
  directions.
- **K3 — Warren-duality.** The wall and the tame-model lower-bound
  engine are the same theorem (Warren / Milnor–Thom / cell
  decomposition). Sharpening tameness bounds moves both sides of
  the ledger at once.
- **K4 — Residual cracks (the honest forward paths).**
  (i) psd rank of the perfect matching polytope — open;
  (ii) Cook–Levin tableau-based spectrahedral encodings —
  unexplored, plausibly non-relativizing, no lower-bound
  technology exists;
  (iii) bounded-cancellation arithmetic models — the *untested*
  half of dormancy trigger (1), untouched by this panel;
  (iv) GLS separation ≡ optimization names the escape hatch any
  polytope-based moduli is blind to — a
  separation-complexity-based invariant is an unexamined variant.

## Status consequences

- **Trigger (1), semialgebraic / o-minimal half: tested, NOT
  satisfied.** The route refines the wall; it does not cross it.
- **Re-activation**: this attempt ends `partial-insight`, which
  per failure-criteria §4 automatically proposes returning to
  `active`; combined with the explicit user direction to
  re-attempt, 03-p-vs-np is re-activated in this PR with the
  honest annotation in `status.md` that the substantive trigger
  remains unmet and K4's cracks are the forward paths.
- **C-002**: evidence strengthened (fourth instance family); the
  K2 amendment is recorded in C-002's status change log (this PR)
  and left for a dedicated statement-revision PR.

## Key Insights

- **H1's strict form is dead on arrival, by theorems, not by
  attempts** — this is the cheapest kind of negative knowledge
  (Rothvoss/Edmonds; Grigoriev/Schoenebeck vs Gaussian
  elimination), and the dormant program's five technical attempts
  on (R1) make an instructive contrast: the semialgebraic route
  was disposable in one panel because its inversions were already
  in the literature.
- **The semialgebraic family genuinely refines the wall's
  landscape**: it is the first positive-dimensional,
  model-hardness-faithful family on record. The wall's precise
  location is now the *model-lift step*, shared with
  monotone→general, arithmetic→Boolean, and decision-tree→uniform.
- **XOR is the universal witness** — too easy for char-0
  arithmetic, too hard for ordered-real certificates, uniformly
  easy for adaptive char-2 computation. Mod-2 structure defeats
  every continuous encoding tried, in one direction or the other.
- **The trigger's o-minimal hope inverts**: tameness is the wall
  axiomatized, and simultaneously the engine of every tame-model
  lower bound (Warren-duality).
- **Four residual cracks** are named with concrete first steps;
  they are what a next attempt should choose among, rather than
  re-running any surveyed route.

## Follow-ups

1. **A013 candidate (highest information-per-effort)**: literature
   trace on the **psd rank of the perfect matching polytope**
   (K4-i) — a survey-grade attempt establishing current status and
   what either resolution would imply for the model-lift wall.
2. **A013/A014 candidate (highest novelty)**: construct the
   **Cook–Levin tableau spectrahedral encoding** (K4-ii) at the
   smallest non-trivial scale and run the C-003-style locality
   audit on it — the one direction the uniform chair flags as
   plausibly non-relativizing.
3. **A014+ candidate**: **bounded-cancellation arithmetic models**
   (K4-iii) — the untested half of trigger (1); entry points
   Jerrum–Snir 1982 and the monotone-vs-general literature
   already cited in the dormant arc's A011.
4. **C-002 statement revision PR** (separate, dedicated):
   incorporate K1 (fourth instance family) and K2 (XOR/char-2
   boundary) into the conjecture statement per the
   schema-and-erratum discipline; this attempt only logs the
   evidence row in C-002's `status.md`.
5. **Primer update**: promote `extension complexity`, `psd rank`,
   `SOS degree`, `Warren's theorem`, `model-lift wall`,
   `XOR/characteristic-2 boundary` into
   `docs/primer/field-primers/03-p-vs-np.md` §7 and
   `docs/primer/glossary.md` §7.
6. **Cross-model adversarial pass** on this panel's verdicts
   (charter §4.3) — natural attack: is the "model-lift wall"
   framing itself falsifiable, or is it an unfalsifiable
   catch-all? The K4 cracks are the falsifiability handles; the
   attack should test whether they are genuine.

## References

- attempt: `attempts/03-p-vs-np/A010-2026-05-25-claude-opus-4-7/`
  (G019 — the arithmetic-side XOR witness this panel mirrors).
- attempt: `attempts/03-p-vs-np/A011-2026-05-25-claude-opus-4-7/`
  (C-002 registration; monotone route).
- conjecture:
  `conjectures/C-002-discrete-continuous-wall/` (the wall under
  test; evidence strengthened by this attempt).
- conjecture:
  `conjectures/C-001-boolean-rigidity-sheaf-obstruction/`
  (the (R1)-side special case; unaffected).
- bridge: `bridges/B-001-gct-homological-circuit.md` (neutral-
  confirming); `bridges/B-002-natural-proofs-sheaf-cohomology.md`
  (unaffected).
- doc: `docs/problems/03-p-vs-np/status.md` (dormancy record;
  re-activation trigger (1) — the target of this attempt).
- prompt: `prompts/P01-multi-perspective.md` (no variant).
- external (all cited by the panel; canonical):
  - Yannakakis, *Expressing combinatorial optimization problems
    by linear programs*, STOC 1988 / JCSS 43 (1991) 441–466.
  - Fiorini, Massar, Pokutta, Tiwary, de Wolf, *Exponential lower
    bounds for polytopes in combinatorial optimization*, STOC
    2012 / J. ACM 62 (2015).
  - Rothvoss, *The matching polytope has exponential extension
    complexity*, STOC 2014 / J. ACM 64 (2017).
  - Lee, Raghavendra, Steurer, *Lower bounds on the size of
    semidefinite programming relaxations*, STOC 2015.
  - Grigoriev, *Linear lower bound on degrees of Positivstellensatz
    calculus proofs for the parity*, Theor. Comput. Sci. 259
    (2001) 613–622; and *Complexity of Positivstellensatz proofs
    for the knapsack*, Comput. Complexity 10 (2001) 139–154.
  - Schoenebeck, *Linear level Lasserre lower bounds for certain
    k-CSPs*, FOCS 2008.
  - Raghavendra, *Optimal algorithms and inapproximability results
    for every CSP?*, STOC 2008.
  - Chan, Lee, Raghavendra, Steurer, *Approximate constraint
    satisfaction requires large LP relaxations*, FOCS 2013 /
    J. ACM 63 (2016).
  - O'Donnell, *SOS is not obviously automatizable, even
    approximately*, ITCS 2017; Raghavendra, Weitz, *On the
    bit complexity of sum-of-squares proofs*, ICALP 2017.
  - Atserias, Müller, *Automating resolution is NP-hard*, FOCS
    2019 / J. ACM 67 (2020).
  - Edmonds, *Paths, trees, and flowers*, Canad. J. Math. 17
    (1965) 449–467.
  - Grötschel, Lovász, Schrijver, *The ellipsoid method and its
    consequences in combinatorial optimization*, Combinatorica 1
    (1981) 169–197.
  - Padberg, Rao, *Odd minimum cut-sets and b-matchings*, Math.
    Oper. Res. 7 (1982) 67–80.
  - Warren, *Lower bounds for approximation by nonlinear
    manifolds*, Trans. AMS 133 (1968) 167–178.
  - Milnor, *On the Betti numbers of real varieties*, Proc. AMS
    15 (1964) 275–280.
  - Ben-Or, *Lower bounds for algebraic computation trees*, STOC
    1983.
  - Steele, Yao, *Lower bounds for algebraic decision trees*,
    J. Algorithms 3 (1982) 1–8.
  - Razborov, Dokl. Akad. Nauk SSSR 281 (1985) (monotone CLIQUE);
    Tardos, Combinatorica 8 (1988) (monotone-vs-general gap).
  - Raz, McKenzie, *Separation of the monotone NC hierarchy*,
    FOCS 1997 / Combinatorica 19 (1999).
  - Göös, Pitassi, Watson, deterministic and BPP lifting, FOCS
    2015 / FOCS 2017; Göös, Lovett, Meka, Watson, Zuckerman,
    *Rectangles are nonnegative juntas*, STOC 2015; Kothari,
    Meka, Raghavendra, STOC 2017.
  - Karchmer, Wigderson, SIAM J. Disc. Math. 3 (1990); Karchmer,
    Raz, Wigderson, Comput. Complexity 5 (1995) (KRW conjecture).
  - Cook, Reckhow, *The relative efficiency of propositional
    proof systems*, J. Symb. Logic 44 (1979).
  - Knight, Pillay, Steinhorn, Trans. AMS 295 (1986) (o-minimal
    cell decomposition); van den Dries, *Tame Topology and
    O-minimal Structures*, Cambridge 1998; Pila, Wilkie, *The
    rational points of a definable set*, Duke Math. J. 133 (2006)
    591–616.
  - Baker–Gill–Solovay 1975; Razborov–Rudich 1997;
    Aaronson–Wigderson 2008/2009; Williams, J. ACM 61 (2014).
