/-
  Ledger.Statements.PvsNP — the logical shape of the 03-p-vs-np program
  (attempts A001–A012).

  The H₀ / H_AC⁰ arc did not produce a proof; it produced two *negative
  meta-statements* — C-001 (Boolean rigidity) and C-002 (the
  discrete-vs-continuous wall) — and A012 refined the second into the
  "model-lift wall". Those are statements about whole families of
  encodings, not about a particular mathematical object, so their honest
  formalization is at the shape level: quantifiers over encodings, with
  "positive-dimensional" and "faithful to Boolean hardness" as parameters.

  That is worth doing anyway. The three statements were recorded in prose
  across seven attempts and their relationship (C-002 generalizes C-001;
  the model-lift wall implies C-002 under a translation) was asserted
  rather than checked. Below, the relationship is checked.

  Sources: A005–A009 (route R1, conjecture C-001), A010 (route R2, gap
  G019), A011 (route R2′, conjecture C-002), A012 (the model-lift wall
  refinement and the XOR / characteristic-2 boundary).
-/

namespace Ledger.Statements.PvsNP

/-- What an eventual honest formalization of the CMI statement needs: a
    notion of language and the two classes. mathlib has no complexity
    theory, so this stays a parameter; the point of the file is elsewhere. -/
structure Complexity where
  Language : Type
  inP : Language → Prop
  inNP : Language → Prop
  /-- P ⊆ NP, the one containment that is free. -/
  p_subset_np : ∀ L : Language, inP L → inNP L

/-- The official statement, in shape: some language is in NP but not in P. -/
def PneqNP (C : Complexity) : Prop :=
  ∃ L : C.Language, C.inNP L ∧ ¬ C.inP L

/-! ## The wall (C-001, C-002)

An *encoding* is what the H₀ / H_AC⁰ arc kept building: an
algebraic-geometric parameter space for circuits, together with the two
properties every route needed at once. -/

/-- An algebraic-geometric encoding of circuit complexity: Boolean circuit
    moduli (route R1, A005–A009), arithmetic circuit moduli (route R2,
    A010), monotone moduli (route R2′, A011), semialgebraic relaxations
    (A012). -/
structure Encoding where
  Moduli : Type
  /-- Non-trivial cohomological / representation-theoretic invariants are
      available — the moduli is not a finite set of points. -/
  positiveDimensional : Prop
  /-- Membership of a function in a Boolean complexity class corresponds to
      a Zariski-closed / invariant-detectable condition on the moduli. -/
  booleanFaithful : Prop

/-- Conjecture C-002 (A011): no encoding in the family is simultaneously
    positive-dimensional and faithful to Boolean hardness. -/
def C002 (family : Encoding → Prop) : Prop :=
  ∀ E : Encoding, family E → ¬ (E.positiveDimensional ∧ E.booleanFaithful)

/-- Conjecture C-001 (A005–A009): the same statement restricted to the
    Boolean / coherent-sheaf sub-family — every encoding faithful to Boolean
    hardness is rigid. C-002 is exactly this statement with the family
    widened to all algebraic encodings, which is why it is defined here as
    the same predicate rather than as a separate one: the generalization
    A011 performed was a change of quantification domain, nothing else. -/
def C001 (booleanFamily : Encoding → Prop) : Prop :=
  C002 booleanFamily

/-- The dilemma form the attempts kept meeting (A010 K3, A011 K2): under
    C-002, buying positive-dimensionality costs Boolean faithfulness. -/
theorem hardnessBlind_of_positiveDimensional
    (family : Encoding → Prop) (h : C002 family)
    (E : Encoding) (hE : family E) (hpos : E.positiveDimensional) :
    ¬ E.booleanFaithful :=
  fun hf => h E hE ⟨hpos, hf⟩

/-- The mirror form (C-001, A005–A009 for the Boolean route): buying
    Boolean faithfulness costs positive-dimensionality — the 0-dimensional
    collapse A006 exhibited at `(n, s, d) = (2, 3, 2)`. -/
theorem rigid_of_booleanFaithful
    (family : Encoding → Prop) (h : C002 family)
    (E : Encoding) (hE : family E) (hf : E.booleanFaithful) :
    ¬ E.positiveDimensional :=
  fun hpos => h E hE ⟨hpos, hf⟩

/-- If C-002 holds of a family, it holds of every sub-family. This is the
    step A011 took when it generalized C-001 (the Boolean sub-family) to
    all algebraic encodings — recorded here so the direction of the
    generalization cannot be misremembered later. -/
theorem C002_mono (family sub : Encoding → Prop)
    (hsub : ∀ E : Encoding, sub E → family E) (h : C002 family) :
    C002 sub :=
  fun E hE => h E (hsub E hE)

/-- C-002 implies C-001, not the other way round: the wider conjecture is
    the stronger one. -/
theorem C001_of_C002 (family booleanFamily : Encoding → Prop)
    (hsub : ∀ E : Encoding, booleanFamily E → family E) (h : C002 family) :
    C001 booleanFamily :=
  C002_mono family booleanFamily hsub h

/-! ## The model-lift wall (A012) -/

/-- An invariant on record, described by the three properties A012's panel
    scored: extension complexity, psd rank, SOS degree, and the earlier
    monotone / arithmetic / decision-tree invariants all instantiate this. -/
structure Invariant where
  positiveDimensional : Prop
  /-- Tracks hardness inside a restricted model (monotone, arithmetic,
      decision-tree, LP/SDP). -/
  modelFaithful : Prop
  /-- Tracks hardness for uniform machines — what a P vs NP separation
      actually needs. -/
  uniformFaithful : Prop

/-- A012 K2: no positive-dimensional invariant on record is simultaneously
    model-faithful and uniform-faithful. Rothvoss 2014 + Edmonds 1965 and
    Grigoriev/Schoenebeck + Gaussian elimination are the two witnesses that
    forced this refinement. -/
def ModelLiftWall (onRecord : Invariant → Prop) : Prop :=
  ∀ I : Invariant, onRecord I → I.positiveDimensional →
    ¬ (I.modelFaithful ∧ I.uniformFaithful)

/-- A012 claimed the model-lift wall *refines* C-002 rather than replacing
    it. Made precise: given a translation from encodings to invariants that
    preserves positive-dimensionality and splits Boolean faithfulness into
    model plus uniform faithfulness, the wall implies C-002 for the family.

    This is the one non-trivial inference of the 03-p-vs-np arc that is now
    machine-checked; everything else in the arc is prose plus citations. -/
theorem C002_of_modelLiftWall
    (onRecord : Invariant → Prop) (hWall : ModelLiftWall onRecord)
    (family : Encoding → Prop) (tr : Encoding → Invariant)
    (hmem : ∀ E : Encoding, family E → onRecord (tr E))
    (hpos : ∀ E : Encoding, E.positiveDimensional → (tr E).positiveDimensional)
    (hsplit : ∀ E : Encoding, E.booleanFaithful →
      (tr E).modelFaithful ∧ (tr E).uniformFaithful) :
    C002 family :=
  fun E hE hcon =>
    hWall (tr E) (hmem E hE) (hpos E hcon.1) (hsplit E hcon.2)

/-! ## The XOR / characteristic-2 boundary (A012 K3)

A012 proposed a test any future encoding must pass: XOR must land on the
right side in *both* directions — char-0 arithmetic encodings make it too
easy, ordered-real certificate systems make it too hard, while adaptive
char-2 computation keeps it uniformly easy. The test is a necessary
condition, so failing it is a cheap refutation; that is its whole value. -/

/-- How an encoding places a specific witness function. -/
structure WitnessPlacement where
  /-- The encoding makes the witness look easy. -/
  easyInEncoding : Prop
  /-- The witness is genuinely easy for uniform machines. -/
  easyUniformly : Prop

/-- The mod-2 test: the encoding's verdict on the witness agrees with the
    uniform verdict, in both directions. -/
def PassesModTwoTest (w : WitnessPlacement) : Prop :=
  (w.easyInEncoding ↔ w.easyUniformly)

/-- G019 (A010) as an instance: the arithmetic encoding calls XOR easy and
    uniform machines agree it is easy, yet the encoding was supposed to
    report AC⁰-hardness — the disagreement is what makes it hardness-blind.
    Stated as the contrapositive of the test, so a future encoding can be
    discarded by exhibiting one witness. -/
theorem fails_test_of_disagreement (w : WitnessPlacement)
    (hEnc : w.easyInEncoding) (hUnif : ¬ w.easyUniformly) :
    ¬ PassesModTwoTest w :=
  fun hiff => hUnif (hiff.mp hEnc)

end Ledger.Statements.PvsNP
