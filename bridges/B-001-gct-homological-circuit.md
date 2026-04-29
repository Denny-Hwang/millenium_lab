---
id: B-001
domains: [geometric-complexity-theory, homological-complexity]
problems: [03-p-vs-np]
maturity: ai-discovered
key_figures: []
status: active
---

# Bridge: Geometric Complexity Theory ↔ Homological Circuit Complexity

> A speculative bridge proposing that the representation-theoretic
> obstructions of GCT (Mulmuley–Sohoni) lift into sheaf-cohomology
> classes on a suitably defined "circuit variety," yielding a
> non-natural and (conjecturally) non-algebrizing route toward
> $\mathbf{P} \ne \mathbf{NP}$. First surfaced explicitly in
> attempt A001 on 03-p-vs-np.

## 1. Why it connects

GCT and homological circuit complexity already share the **algebraic
variety** as their primary object of study. GCT works with
$\overline{\mathrm{GL}_n \cdot v}$, the Zariski closure of orbits of
matrix-tuple representations of computational problems
(determinant, permanent), and uses representation-theoretic invariants
of these orbits as separation witnesses. Homological circuit
complexity proposes to do the same on a different family of varieties
— roughly, varieties parameterizing circuits of bounded depth or
size — and to use cohomological invariants of those varieties.

The proposed correspondence is the diagram:

```
   Mulmuley–Sohoni orbit closure                Circuit variety
   ── representations ──┐                ┌── sheaf F ──
                        │                │
                        v                v
            character / plethysm    sheaf cohomology
                        \               /
                         \             /
                          \           /
                           \         /
                       LIFT (functor F): rep-theoretic
                              data → sheaf class
```

If a functor `F` exists making the diagram commute on at least one
non-trivial example (e.g., the determinant–permanent pair on small
$n$), the bridge is `emerging`; until then it is `ai-discovered`.

The shared objects are:

- An algebraic group $G$ (e.g., $\mathrm{GL}_n$, $\mathrm{SL}_n$, or
  a unitary subgroup) acting on a polynomial space.
- An equivariant sheaf-or-bundle structure parameterizing
  "computations" of bounded resource.
- Numerical invariants (Kronecker / plethysm coefficients on the GCT
  side; Betti numbers / persistent homology / sheaf cohomology
  dimensions on the homological side).

## 2. Known Results

There is **no theorem to date** proving the lift in either direction.
The relevant results are partial / suggestive:

- **GCT side**: the "no occurrence obstructions" theorem of
  Bürgisser–Ikenmeyer
  [BI 2019, *J. AMS* 32(1):163–193] shows that *some* natural
  occurrence-based representation-theoretic obstructions to
  determinant–permanent separation provably do not exist. This
  *constrains* the bridge from above: any sheaf-cohomology lift
  cannot recover those vanishing classes.
- **Homological side**: persistent homology of computation graphs
  has been studied for neural networks (Carlsson et al.) and for
  CSP phase transitions (Kahle, Cohen-Steiner, et al.), with
  partial results that lower-bound expressivity. None reaches
  $\mathbf{P}/\mathrm{poly}$.
- **General algebraic-geometric**: the Borel–Weil–Bott theorem and
  the Beilinson–Bernstein localization equivalence connect
  representations of $G$ to sheaves on flag varieties $G/B$. This is
  a *prototype* of the desired functor, but for representations of
  semisimple groups, not for the orbit-closure varieties used by
  GCT.

## 3. Stuck Points

- **No canonical functor.** No published construction maps GCT
  obstructions to sheaf cohomology classes. Even the target sheaf is
  unspecified — should it be a coherent sheaf on the orbit closure,
  a perverse sheaf on a stratification, or an equivariant constructible
  sheaf?
- **Closure singularities.** $\overline{\mathrm{GL}_n \cdot v}$ is
  highly singular; the cohomology of a desingularization
  (e.g., a Bott–Samelson resolution) need not match the cohomology
  of the closure itself.
- **Plethysm undecidability.** Computing Kronecker coefficients is
  in $\#\mathbf{P}$; lifting them through a cohomology functor does
  not obviously help.
- **Largeness vs information-preservation.** Even if the lift exists,
  it must preserve the *largeness* dimension of GCT obstructions for
  the resulting argument to escape natural proofs.

## 4. Open Directions

1. **Small-case calculation.** For $n \le 4$ in the determinant–
   permanent setting, compute both sides:
   - GCT: enumerate Bürgisser–Ikenmeyer-style polytope obstructions.
   - Homology: compute equivariant sheaf cohomology of the relevant
     orbit closures via standard tools (Macaulay2, SageMath).
   Look for non-trivial coincidences.
2. **Borel–Weil analogy.** Test whether the Borel–Weil functor
   $\lambda \mapsto H^0(G/B, \mathcal{L}_\lambda)$ extends to GCT
   orbits by passing to closures and equivariant resolutions.
3. **Sheaf-on-circuit-variety formalization.** Define a candidate
   "circuit variety" $\mathcal{C}_{n,s}$ parameterizing depth-$d$
   size-$s$ Boolean circuits on $n$ inputs; identify a natural
   $G$-action (e.g., input permutation) and study its equivariant
   cohomology.
4. **Bürgisser–Ikenmeyer obstruction lift.** Take a single small
   polytope obstruction known to *fail*; check that its homological
   image also vanishes. If it does, the bridge is consistent; if it
   does not, a meaningful refinement of one side is forced.

## 5. Connection to This Repository

- Attempts:
  - [A001](../attempts/03-p-vs-np/A001-2026-04-29-claude-opus-4-7/)
    — first identified this bridge during P01 panel simulation
    (conflict C2: "does the GCT obstruction lift to homology with
    information preserved?").
- Candidates: — (none yet)
- Conjectures: — (potential future C-### conjectures from §4
  small-case results)
- Companion bridge:
  [B-002](B-002-natural-proofs-sheaf-cohomology.md) — handles the
  *usefulness* arm of the natural-proofs barrier; the two bridges
  combined are the substance of A001's hypothesis H₀.

## 6. References

- [MS 2001] K. Mulmuley, M. Sohoni, "Geometric complexity theory I,"
  SIAM J. Comput. 31(2):496–526.
- [MS 2008] K. Mulmuley, M. Sohoni, "Geometric complexity theory II,"
  SIAM J. Comput. 38(3):1175–1206.
- [BI 2019] P. Bürgisser, C. Ikenmeyer, "No occurrence obstructions
  in geometric complexity theory," J. AMS 32(1):163–193.
- [BI 2017] P. Bürgisser, C. Ikenmeyer, "Fundamental invariants of
  orbit closures," J. Algebra 477:390–434.
- [Hartshorne 1977] R. Hartshorne, *Algebraic Geometry*, Springer
  GTM 52 — sheaf cohomology background.
- [BB 1981] A. Beilinson, J. Bernstein, "Localisation de
  $\mathfrak{g}$-modules" — prototype representation/sheaf
  equivalence.
