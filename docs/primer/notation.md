# Notation Dictionary

> Standard symbols used in mathematical writing, organized by area.
> Living document — extend as new symbols appear in attempts or in
> external references. Each entry: symbol, reading aloud, formal
> meaning, typical context.

---

## 1. Logic and set theory

| Symbol | Read aloud | Meaning |
|--------|------------|---------|
| $\forall$ | "for all" | universal quantifier |
| $\exists$ | "there exists" | existential quantifier |
| $\exists!$ | "there exists a unique" | unique existence |
| $\neg$ | "not" | negation |
| $\wedge, \vee$ | "and / or" | conjunction / disjunction |
| $\Rightarrow$ | "implies" | implication |
| $\Leftrightarrow$ | "iff" | biconditional |
| $\vdash, \models$ | "proves / models" | syntactic / semantic consequence |
| $\in, \notin$ | "in / not in" | set membership |
| $\subseteq, \subsetneq$ | "subset / proper subset" | containment |
| $\cup, \cap, \setminus$ | "union / intersection / difference" | set operations |
| $\emptyset$ | "empty set" | the empty set |
| $\mathcal{P}(X)$ | "power set of $X$" | set of subsets |
| $|X|$ | "cardinality of $X$" | size of a set |
| $X \times Y$ | "$X$ cross $Y$" | Cartesian product |
| $\sqcup$ | "disjoint union" | disjoint sum |

## 2. Functions and maps

| Symbol | Read aloud | Meaning |
|--------|------------|---------|
| $f : X \to Y$ | "$f$ from $X$ to $Y$" | a map |
| $x \mapsto y$ | "$x$ maps to $y$" | rule defining the map |
| $f|_S$ | "$f$ restricted to $S$" | restriction |
| $f \circ g$ | "$f$ after $g$" | composition |
| $\mathrm{id}_X$ | "identity on $X$" | identity map |
| $f^{-1}$ | "$f$ inverse" or "preimage" | inverse (when bijective) or preimage |
| $\hookrightarrow$ | "injects into" | inclusion / injection |
| $\twoheadrightarrow$ | "surjects onto" | surjection |
| $\xrightarrow{\sim}$ | "isomorphism" | bijective structure-preserving map |
| $\cong$ | "is isomorphic to" | isomorphism |
| $\simeq$ | "homotopy equivalence" or "equivalence" | context-dependent |

## 3. Numbers and structures

- $\mathbb{N}$ — natural numbers. **Convention varies**: in number
  theory $\mathbb{N}$ often excludes 0; in combinatorics and logic it
  often includes 0. Authors should specify; if they do not, infer
  from context.
- $\mathbb{Z}, \mathbb{Q}, \mathbb{R}, \mathbb{C}$ — integers,
  rationals, reals, complexes.
- $\overline{\mathbb{Q}}$ — algebraic closure of $\mathbb{Q}$.
- $\mathbb{F}_q$ — finite field of order $q$ (a prime power).
- $\mathbb{Z}/n\mathbb{Z}$ — integers modulo $n$.
- $\mathbb{R}^n, \mathbb{C}^n$ — $n$-dimensional real / complex vector
  space.
- $\mathrm{GL}_n, \mathrm{SL}_n$ — general / special linear groups
  ($n \times n$ invertible matrices, determinant unconstrained / $=
  1$).
- $\mathrm{SO}_n, \mathrm{U}_n$ — special orthogonal / unitary groups.
- $\mathbb{G}_m$ — the multiplicative group $\mathrm{GL}_1$.
- $\{0,1\}^n$ — $n$-bit Boolean strings.
- $\Sigma^*$ — strings of any length over the alphabet $\Sigma$.

## 4. Order, growth, asymptotics

| Symbol | Read aloud | Meaning |
|--------|------------|---------|
| $\leq, \ll$ | "Vinogradov $\ll$" | $\ll$ means "much less than", often "$\leq C \cdot$" |
| $\lesssim, \gtrsim$ | "approximately less / greater" | up to constants / logarithmic factors |
| $O(f)$ | "big-O of $f$" | upper bound up to constant |
| $\Omega(f)$ | "big-Omega of $f$" | lower bound up to constant |
| $\Theta(f)$ | "Theta of $f$" | tight asymptotic |
| $o(f)$ | "little-o of $f$" | strictly slower than $f$ |
| $\omega(f)$ | "little-omega of $f$" | strictly faster than $f$ |
| $\sim$ | "tilde" | asymptotic equivalence $f \sim g$ iff $f/g \to 1$ |
| $\asymp$ | "asymp" | tight up to constants |
| $n^{O(1)}$ | "$n$ to the poly" | polynomial in $n$ |
| $\mathrm{poly}(n)$ | "poly of $n$" | same as $n^{O(1)}$ |
| $2^{O(n)}$ | "two to the order $n$" | simple exponential |

## 5. Algebra

| Symbol | Read aloud | Meaning |
|--------|------------|---------|
| $\oplus$ | "direct sum" | external / internal direct sum |
| $\otimes$ | "tensor product" | over a base ring (inferred from context) |
| $\wedge$ | "wedge / exterior product" | exterior algebra |
| $\mathrm{Hom}(A, B)$ | "Hom of $A$ to $B$" | morphisms |
| $\mathrm{End}(A)$ | "End of $A$" | endomorphisms = $\mathrm{Hom}(A, A)$ |
| $\mathrm{Aut}(A)$ | "Aut of $A$" | automorphisms |
| $\ker, \mathrm{coker}, \mathrm{im}$ | "kernel / cokernel / image" | exact-sequence ingredients |
| $\mathrm{rk}, \mathrm{tr}, \det$ | "rank / trace / determinant" | linear-algebra functions |

## 6. Topology and geometry

- $\partial X$ — boundary of $X$.
- $\overline{X}$ — closure.
- $X^\circ$ — interior.
- $\pi_n(X)$ — $n$-th homotopy group of $X$ (with implicit
  basepoint).
- $H_n(X), H^n(X)$ — $n$-th homology / cohomology group.
- $H^k(X, \mathcal{F})$ — $k$-th sheaf cohomology of $X$ with
  coefficients in a sheaf $\mathcal{F}$.
- $\check{H}^k$ — Čech cohomology of degree $k$.
- *Smooth* vs *continuous* vs *holomorphic* — the regularity class of
  a map; authors should specify category.

## 7. Complexity (for 03-p-vs-np)

| Symbol | Read aloud | Meaning |
|--------|------------|---------|
| $\mathrm{P}, \mathrm{NP}, \mathrm{coNP}$ | "P, NP, coNP" | deterministic poly, non-det poly, complement of NP |
| $\mathrm{BPP}, \mathrm{BQP}$ | "BPP, BQP" | bounded-error probabilistic / quantum poly |
| $\mathrm{PSPACE}, \mathrm{EXP}, \mathrm{NEXP}$ | "PSPACE, EXP, NEXP" | polynomial space, exponential time, non-det exp time |
| $\mathrm{PH}$ | "PH" | polynomial hierarchy |
| $\mathrm{AC}^0$ | "AC zero" | constant-depth poly-size unbounded-fan-in AND/OR/NOT |
| $\mathrm{AC}^0[p]$ | "AC zero bracket $p$" | $\mathrm{AC}^0$ with $\mathrm{MOD}_p$ gates |
| $\mathrm{ACC}^0$ | "ACC zero" | $\mathrm{AC}^0$ with $\mathrm{MOD}_m$ gates for all $m$ |
| $\mathrm{NC}^k$ | "NC $k$" | depth $O(\log^k n)$, fan-in 2, poly size |
| $\mathrm{TC}^0$ | "TC zero" | constant-depth, threshold (majority) gates |
| $\mathrm{P}/\mathrm{poly}$ | "P slash poly" | poly-size circuit families (non-uniform) |
| $\#\mathrm{P}$ | "sharp P" | counting class |
| $\mathrm{P}^A, \mathrm{NP}^A$ | "P relative to $A$" | classes with oracle $A$ |
| $\mathrm{VP}, \mathrm{VNP}, \mathrm{VBP}$ | "V P, V NP, V BP" | Valiant's algebraic-circuit classes |
| $\leq_p, \leq_m^p$ | "poly-time reduction" | polynomial-time many-one reduction |

## 8. Repository-local notation

Notation introduced inside attempts; not standard externally. Cite
the attempt of origin.

- $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$ — the scheme (moduli space)
  of $\mathrm{AC}^0$ circuits with $n$ inputs, size $\leq s$, depth
  $\leq d$, modulo gate-relabeling. Introduced in
  `attempts/03-p-vs-np/A002-.../result.md` L02.
- $F_{\mathrm{AC}^0}$ — the coherent $\mathrm{GL}_n$-equivariant
  sheaf on $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$ encoding "remaining
  size/depth budget". A002 L04.
- $[F_{\mathrm{AC}^0}]_f$ or $[F]_f$ — the Čech 1-cocycle attached
  to a Boolean function $f$, an element of
  $H^1(\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}, F_{\mathrm{AC}^0})$.
  A002 L05.
- $[F_{\mathrm{AC}^0}]_f^{(n,s,d)}$ — same with explicit parameters;
  A004 uses this form to make the dependence on $(s, d)$ visible
  for the v2 quantifier discipline.
- $L_{\#\#}, L_{\#\#}'$ — lemma labels in the H_AC⁰ dependency graph
  (e.g., L02, L11'). A002, A003, A004.
- $G_{\#\#\#}$ — gap labels (e.g., G007, G008). A002, A004.
- $A_{\#\#\#}, A_{\#\#\#}^*$ — adversarial-patch labels from A003
  (A1–A6).
- $\mathrm{eval}_n : \mathcal{C}^{\mathrm{AC}^0}_{n,s,d} \to
  \mathbb{A}^{2^n}$ — the evaluation morphism sending a circuit
  point to its truth table. A002 L03.

## 9. GCT-specific notation (B-001)

- $\overline{\mathrm{GL}_n \cdot v}$ — Zariski closure of the
  $\mathrm{GL}_n$-orbit of $v$.
- $\mathrm{GL}_n \cdot v$ — the orbit itself (not closed in general).
- $\mathcal{L}_\lambda$ — an ample line bundle associated to a
  dominant weight $\lambda$.
- **Kronecker coefficient** — multiplicity in the tensor product of
  two irreducible $S_n$ representations; no single standard symbol.
- **Plethysm** — composition of representations; no single standard
  symbol.

---

## Open questions / TODO

- Decide a convention for distinguishing local vs global symbols
  (e.g., $f$ as a generic function vs $f$ as a specific Boolean
  function). Currently relying on context.
- Add LaTeX source pointer (file path) for each repository-local
  symbol so that future readers can see the symbol in its native
  setting.
- Resolve $\sim$ overload: asymptotic equivalence vs homotopy vs
  equivalence relation — context disambiguates but a section flag
  would help newcomers.
