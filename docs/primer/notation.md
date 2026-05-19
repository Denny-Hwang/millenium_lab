# Notation Dictionary

> Standard symbols used in mathematical writing, organized by area.
> Living document — extend as new symbols appear in attempts or in
> external references. Each entry: symbol, reading aloud, formal
> meaning, typical context.

---

## 1. Logic and set theory

TODO: $\forall, \exists, \exists!, \neg, \wedge, \vee, \Rightarrow,
\Leftrightarrow, \vdash, \models, \in, \notin, \subseteq, \subsetneq,
\cup, \cap, \setminus, \emptyset, \mathcal{P}(X), |X|, \times,
\sqcup$.

## 2. Functions and maps

TODO: $f : X \to Y$, $x \mapsto y$, $f|_S$ (restriction),
$f \circ g$, $\mathrm{id}_X$, $f^{-1}$ (preimage vs inverse),
$\hookrightarrow$ (injection / inclusion), $\twoheadrightarrow$
(surjection), $\xrightarrow{\sim}$ (isomorphism), $\cong$
(isomorphic), $\simeq$ (homotopy / equivalence — context-dependent).

## 3. Numbers and structures

TODO: $\mathbb{N}, \mathbb{Z}, \mathbb{Q}, \mathbb{R}, \mathbb{C},
\mathbb{F}_q, \mathbb{Z}/n\mathbb{Z}$; conventions on whether
$\mathbb{N}$ includes 0; $\mathbb{R}^n, \mathbb{C}^n$;
$\mathrm{GL}_n, \mathrm{SL}_n, \mathrm{SO}_n, \mathrm{U}_n$.

## 4. Order, growth, asymptotics

TODO: $\leq, \ll$ (Vinogradov), $\lesssim$ (up to constant),
$O(\cdot), \Omega(\cdot), \Theta(\cdot), o(\cdot), \omega(\cdot),
\sim$ (asymptotic equivalence), $\asymp$.

## 5. Algebra

TODO: $\oplus, \otimes, \wedge, \mathrm{Hom}, \mathrm{End},
\mathrm{Aut}, \ker, \mathrm{coker}, \mathrm{im}, \mathrm{rk},
\mathrm{tr}, \det$. Module / ring / field notations as they come up.

## 6. Topology and geometry

TODO: $\partial$ (boundary), $\overline{X}$ (closure), $X^\circ$
(interior), $\pi_n(X)$, $H_n(X), H^n(X)$, smooth vs continuous vs
holomorphic conventions.

## 7. Complexity (for 03-p-vs-np)

TODO: $\mathrm{P}, \mathrm{NP}, \mathrm{coNP}, \mathrm{BPP},
\mathrm{PSPACE}, \mathrm{EXP}, \mathrm{AC}^0, \mathrm{NC}^k,
\mathrm{TC}^0, \mathrm{P}/\mathrm{poly}$; reductions
$\leq_p, \leq_m^p$.

## 8. Repository-local notation

TODO: any notation introduced in attempts or candidates that does
not appear in standard textbooks. Cite the artifact of origin.

Examples to fill in:

- $[F_{\mathrm{AC}^0}]_f^{(n,s,d)}$ — cohomology class assigned to
  $f$, introduced in `attempts/03-p-vs-np/A002-.../`, refined in
  A004.
- $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$ — moduli space of L02
  (A002).

---

## Open questions / TODO

- Decide a convention for distinguishing local vs global symbols
  (e.g., $f$ as a generic function vs $f$ as a specific Boolean
  function — context window matters).
- Add a "see also" link to LaTeX source in attempts where the
  symbol was first compiled.
