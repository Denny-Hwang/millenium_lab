/-
  Ledger.Statements.NavierStokes — the logical shape of the 05-navier-stokes
  program (attempts A001–A013).

  What this file is: the *skeleton* of the program's argument, machine
  checked. The analytic objects (ℝ³, Besov and BMO⁻¹ norms, Leray
  solutions) are parameters of a `Setting`, not definitions — mathlib does
  not have the critical-space ladder yet, and writing a fake version of it
  would buy nothing. What is real here is the implication structure: which
  statements, if proved, compose into CMI (A), and which of our recorded
  gaps sit on that path.

  So a theorem below is not a step towards the Millennium problem. It is a
  check that our bookkeeping about the steps is correct — that the program
  A005 committed to actually closes if its named lemmas close, and that no
  attempt has quietly assumed what it set out to prove. Instantiating
  `Setting` with real analysis is the L3 work; it is deliberately still
  open.

  Sources: A001 (critical functional panel), A002 (the ladder), A005
  (direction commitment), A006–A007 (T1a/T1b decomposition), A008–A010
  (adversarial audit and degeneration), A011 (conjecture C-003).
-/

namespace Ledger.Statements.NavierStokes

/-- The steps of the critical-norm ladder recorded by A002 K1, ordered by
    inclusion: `Ḣ^{1/2} ⊂ L³ ⊂ Ḃ⁰_{3,q} ⊂ BMO⁻¹ ⊂ Ḃ^{-1}_{∞,∞}`. -/
inductive CriticalSpace where
  | HdotHalf
  | L3
  | Besov03q
  | BMOInv
  | BesovInfInv
  deriving DecidableEq, Repr

/-- Position in the ladder. Larger means a weaker (larger) space. -/
def CriticalSpace.rank : CriticalSpace → Nat
  | .HdotHalf => 0
  | .L3 => 1
  | .Besov03q => 2
  | .BMOInv => 3
  | .BesovInfInv => 4

/-- `X ⊆ Y` in the ladder. -/
def CriticalSpace.embeds (X Y : CriticalSpace) : Bool :=
  decide (X.rank ≤ Y.rank)

/-- A002 K1: the ladder is strictly inclusion-ordered, which is exactly why
    A001's "single critical functional Φ" hypothesis had to be dropped —
    controlling one step does not control the others. -/
theorem l3_embeds_bmoInv : CriticalSpace.embeds .L3 .BMOInv = true := by decide

/-- Everything the statements below quantify over. A `Setting` is what an
    eventual mathlib instantiation has to supply: initial data, smooth
    solutions, and the predicate "this solution is bounded in this critical
    space, uniformly in time, along the flow". -/
structure Setting where
  /-- Initial data. -/
  Data : Type
  /-- Solutions on `[0, ∞)`. -/
  Solution : Type
  /-- CMI admissible data: smooth, divergence-free, rapidly decaying. -/
  admissible : Data → Prop
  /-- `evolves d u`: `u` solves NSE on `[0, ∞)` with initial data `d`. -/
  evolves : Data → Solution → Prop
  /-- `u` stays smooth for all time. -/
  globallySmooth : Solution → Prop
  /-- `boundedIn X u`: `u ∈ L^∞_t X` along the flow. -/
  boundedIn : CriticalSpace → Solution → Prop

/-- CMI sub-question (A): global existence and smoothness on `ℝ³`. -/
def CMI_A (S : Setting) : Prop :=
  ∀ d : S.Data, S.admissible d →
    ∃ u : S.Solution, S.evolves d u ∧ S.globallySmooth u

/-- Escauriaza–Seregin–Šverák 2003, cited not re-proved (A002 K2): an
    `L^∞_t L³` bound along a smooth flow implies regularity. -/
def ESS (S : Setting) : Prop :=
  ∀ (d : S.Data) (u : S.Solution),
    S.evolves d u → S.boundedIn .L3 u → S.globallySmooth u

/-- Transformation T1 of bridge B-003 (A003, committed to by A005): an
    `L^∞_t BMO⁻¹` bound along a smooth flow upgrades to `L^∞_t L³`. Open. -/
def T1 (S : Setting) : Prop :=
  ∀ (d : S.Data) (u : S.Solution),
    S.evolves d u → S.boundedIn .BMOInv u → S.boundedIn .L3 u

/-- The step the (α) program takes for granted from the Koch–Tataru theory:
    every admissible datum's flow is bounded in `BMO⁻¹`. -/
def BMOBoundAlongFlow (S : Setting) : Prop :=
  ∀ d : S.Data, S.admissible d →
    ∀ u : S.Solution, S.evolves d u → S.boundedIn .BMOInv u

/-- Local existence of a flow for admissible data. -/
def ExistenceOfFlow (S : Setting) : Prop :=
  ∀ d : S.Data, S.admissible d → ∃ u : S.Solution, S.evolves d u

/-- The core composition A005 committed the program to (A005 K1, A007 K1):
    T1 followed by ESS turns a `BMO⁻¹` bound into regularity. -/
theorem smooth_of_T1_ESS (S : Setting) (hT1 : T1 S) (hESS : ESS S)
    (d : S.Data) (u : S.Solution)
    (he : S.evolves d u) (hb : S.boundedIn .BMOInv u) :
    S.globallySmooth u :=
  hESS d u he (hT1 d u he hb)

/-- The (α) program, stated as one implication: these four ingredients are
    jointly sufficient for CMI (A). This is what the 05-navier-stokes plan
    is actually trying to buy, and the only unproved ingredient it still
    owns is `T1` — `ESS` is cited, and the other two are Koch–Tataru-level
    statements. Recording it as a theorem keeps the program honest: if a
    future attempt weakens any of the four, the failure shows up here. -/
theorem cmiA_of_program (S : Setting)
    (hex : ExistenceOfFlow S) (hbmo : BMOBoundAlongFlow S)
    (hT1 : T1 S) (hESS : ESS S) :
    CMI_A S :=
  fun d hd =>
    (hex d hd).elim fun u he =>
      ⟨u, he, hESS d u he (hT1 d u he (hbmo d hd u he))⟩

/-! ## The T1a / T1b split (A006, A007) -/

/-- The smallness dichotomy A006 used to split T1: data small in `BMO⁻¹`
    versus the rest. -/
structure Dichotomy (S : Setting) where
  small : S.Data → Prop
  decides : ∀ d : S.Data, small d ∨ ¬ small d

/-- T1a — the small-data half. A006 proved the trivial sub-case and left
    `L_T1a_5` (small in `BMO⁻¹`, large in `L³`) open. -/
def T1a (S : Setting) (D : Dichotomy S) : Prop :=
  ∀ (d : S.Data), D.small d → ∀ (u : S.Solution),
    S.evolves d u → S.boundedIn .BMOInv u → S.boundedIn .L3 u

/-- T1b — the large-data half. A007 gave the Duhamel lemma graph; the crux
    `L_T1b_3b` is gap `G_T1b_1`, still open. -/
def T1b (S : Setting) (D : Dichotomy S) : Prop :=
  ∀ (d : S.Data), ¬ D.small d → ∀ (u : S.Solution),
    S.evolves d u → S.boundedIn .BMOInv u → S.boundedIn .L3 u

/-- A006 K1 + A007 K1: the split is exhaustive, so the two halves really do
    reassemble into T1. -/
theorem T1_of_parts (S : Setting) (D : Dichotomy S)
    (ha : T1a S D) (hb : T1b S D) : T1 S :=
  fun d u he hbmo =>
    (D.decides d).elim
      (fun h => ha d h u he hbmo)
      (fun h => hb d h u he hbmo)

/-! ## Conjecture C-003 (A011) -/

/-- A proof attempt in the surveyed direct-PDE family (A007 energy methods,
    A009 vorticity, A010 paraproduct hybrids), described by the two
    properties the adversarial track scores it on. -/
structure DirectProof (S : Setting) where
  /-- The attempt would establish `T1b`. -/
  provesT1b : Prop
  /-- It survives the Tao 2016 averaged-NSE barrier audit (A008 A6). -/
  passesTaoBarrier : Prop
  /-- It only relocates the bottleneck to a regularity-equivalent gap
      (A009 K4: `G_T1b_3` / `G_T1b_4`). -/
  reducesToRegularityEquivalentGap : Prop

/-- Conjecture C-003, as registered by A011: within the surveyed family, no
    proof of the `BMO⁻¹ → L^q` implication both passes the Tao-barrier audit
    and avoids degenerating into a regularity-equivalent gap. -/
def C003 (S : Setting) (family : DirectProof S → Prop) : Prop :=
  ∀ p : DirectProof S, family p → p.provesT1b →
    ¬ p.passesTaoBarrier ∨ p.reducesToRegularityEquivalentGap

/-- What C-003 costs the program if it is true (A011 K3): a family member
    that passes the barrier and does not degenerate cannot prove T1b — which
    is why A012 pivoted the route rather than pushing harder on it. -/
theorem no_clean_direct_proof (S : Setting) (family : DirectProof S → Prop)
    (hC : C003 S family) (p : DirectProof S) (hp : family p)
    (htao : p.passesTaoBarrier)
    (hclean : ¬ p.reducesToRegularityEquivalentGap) :
    ¬ p.provesT1b :=
  fun hproof =>
    (hC p hp hproof).elim (fun hn => hn htao) (fun hr => hclean hr)

/-! ## Pivot 1: the B-004 / T2 route (A012, A013) -/

/-- The discrete-to-continuum transfer A013 decomposed: a sequence of
    discrete (CFD) solutions with uniform critical-norm control has a limit
    solving the continuum equation with the same control. `L_T2_2`
    (compactness) is the crux, gap `G_T2_1`. -/
structure Transfer (S : Setting) where
  /-- A sequence of discrete solutions approximating `u`. -/
  approximates : (Nat → S.Solution) → S.Solution → Prop
  /-- Uniform-in-resolution bound in the given critical space. -/
  uniformlyBounded : CriticalSpace → (Nat → S.Solution) → Prop

/-- T2: uniform discrete control transfers to the continuum limit. Open;
    this is what the current plan's milestones are aimed at. -/
def T2 (S : Setting) (Tr : Transfer S) (X : CriticalSpace) : Prop :=
  ∀ (seq : Nat → S.Solution) (u : S.Solution),
    Tr.approximates seq u → Tr.uniformlyBounded X seq → S.boundedIn X u

/-- A013 K4's C-003-orthogonality claim, made precise: T2 is a transfer
    statement, so it reaches `L³` control without passing through the
    direct-PDE family C-003 quantifies over. Composed with ESS it yields
    regularity for any solution the CFD side can approximate under uniform
    `L³` control. -/
theorem smooth_of_T2_ESS (S : Setting) (Tr : Transfer S)
    (hT2 : T2 S Tr .L3) (hESS : ESS S)
    (seq : Nat → S.Solution) (d : S.Data) (u : S.Solution)
    (he : S.evolves d u)
    (happrox : Tr.approximates seq u)
    (hunif : Tr.uniformlyBounded .L3 seq) :
    S.globallySmooth u :=
  hESS d u he (hT2 seq u happrox hunif)

end Ledger.Statements.NavierStokes
