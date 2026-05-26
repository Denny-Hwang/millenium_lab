---
id: B-003
domains: [harmonic-analysis, nonlinear-pde]
problems: [05-navier-stokes]
maturity: ai-discovered
key_figures: []
status: active
---

# Bridge: Harmonic Analysis ↔ Nonlinear PDE — Critical-Norm Equivalence Along NSE Flow

> A bridge connecting the *spatial* function-space embedding theory
> of harmonic analysis (Sobolev / Besov / BMO inclusions among
> critical scaling-invariant spaces for 3D NSE) to the *dynamical*
> regularity question of nonlinear PDE (does NSE evolution preserve
> a given critical-norm bound for all decaying smooth data?). First
> framed explicitly in attempts A001 (P01 panel) and A002 (P03
> ladder catalog) on 05-navier-stokes.

## 1. Why it connects

The two fields already share their primary object: the family of
*critical scaling-invariant function spaces* for 3D Navier–Stokes,

$$
  \dot H^{1/2} \subset L^3 \subset \dot B^0_{3,q}
  \subset \dot B^{-1+3/p}_{p,q}
  \subset \mathrm{BMO}^{-1} \subset \dot B^{-1}_{\infty,\infty}.
$$

Harmonic analysis defines these spaces, classifies the strict
inclusions (Sobolev, Bernstein on Littlewood–Paley blocks,
Triebel–Lizorkin embedding), and analyses the bilinear form
$B(u, v) = \mathbb{P}(u \cdot \nabla v)$ on them. Nonlinear PDE
takes this space as the "natural" function class for NSE and asks
whether the flow $t \mapsto u(t)$ preserves a given critical
embedding.

```
   Harmonic analysis (spatial)         Nonlinear PDE (dynamical)
   ── critical spaces & embeddings ──┐  ┌── NSE flow t ↦ u(t) ──
                                      │  │
                                      v  v
        ladder Ḣ^{1/2} ⊂ ... ⊂ Ḃ^{-1}_{∞,∞}
                                      ↑
                              LIFT (functor):
                              spatial embedding X ⊂ Y
                              ↦ along-flow implication
                              "u(t) ∈ X uniformly" ⇒ "u(t) ∈ Y uniformly"
```

The bridge asserts that the **spatial embeddings extend to
along-flow implications** in a controlled way. Five candidate
shared objects:

1. The critical-norm ladder itself (§3 of `equivalent-forms.md`).
2. **Littlewood–Paley decomposition** $u = \sum_j \Delta_j u$ — HA
   tool used to *define* Besov norms; PDE uses it for paraproduct
   decomposition of $u \cdot \nabla u$.
3. **Bony paraproduct** $T_u v + T_v u + R(u, v) = uv$ — HA
   structural tool; PDE deploys it to estimate the nonlinearity
   in critical spaces.
4. **Bilinear estimate** $\|B(u, v)\|_X \lesssim \|u\|_Y \|v\|_Z$
   in critical spaces — boundedness is a HA question, used by PDE
   to close fixed-point arguments (Fujita–Kato, Cannone–Meyer,
   Koch–Tataru).
5. **Heat semigroup** $e^{t\Delta}$ on critical spaces — HA studies
   smoothing properties; PDE uses Duhamel
   $u(t) = e^{t\Delta} u_0 - \int_0^t e^{(t-s)\Delta}
   \mathbb{P}(u \cdot \nabla u) \, ds$ as the mild-solution
   foundation.

## 2. Known Results

- **Sobolev / Besov / BMO embeddings** are classical (Bergh–Löfström
  1976; Triebel 1983; Stein 1993). The *spatial* part of the
  bridge is fully understood.
- **Fujita–Kato 1964**, **Cannone–Meyer 1995**, **Koch–Tataru 2001**
  — bilinear estimates in critical Banach / Triebel–Lizorkin spaces
  yield small-data global mild solutions. Establishes the
  along-flow direction *for small data* in successively larger
  critical spaces.
- **Escauriaza–Seregin–Šverák 2003** — $u \in L^\infty_t L^3_x$
  along smooth flow $\Rightarrow$ regularity. The most important
  along-flow theorem on this bridge: it lifts a *spatial*
  $L^3$-bound to a *dynamical* regularity conclusion.
- **Bourgain–Pavlovic 2008** — ill-posedness in $\dot B^{-1}_{\infty,\infty}$;
  norm inflation is the *anti-along-flow* obstruction at the top
  of the ladder.

## 3. Stuck Points

- **Large-data along-flow preservation is open** for every critical
  norm except (trivially) $L^2$ (energy, which is supercritical and
  bounded but does not control regularity). For each $X \in
  \{\dot H^{1/2}, L^3, \dot B^{-1+3/p}_{p,q}, \mathrm{BMO}^{-1}\}$,
  whether $\|u(t)\|_X$ stays bounded along the smooth NSE flow from
  every decaying $u_0$ is the open question.
- **Pairwise embedding-along-flow questions** (A002 §4):
  - $L^\infty_t \mathrm{BMO}^{-1}$-bound $\overset{?}{\Rightarrow}$
    $L^\infty_t L^3$.
  - $L^\infty_t L^3 \overset{?}{\Rightarrow} L^\infty_t \dot H^{1/2}$.
  Each is open.
- **The Tao 2016 averaged-NSE barrier** sits on this bridge: any
  proof of along-flow preservation must use a cancellation in the
  bilinear $B(u, v)$ that fails for averaged NSE. The bilinear
  estimate itself is HA, but the cancellation structure is
  PDE-specific.
- **Non-uniqueness (Buckmaster–Vicol 2019)** introduces an
  ambiguity: along-flow questions for *Leray–Hopf weak* solutions
  are not the same as for *smooth* solutions, and the convex-
  integration constructions use HA techniques (paraproducts) to
  break up the question.

## 4. Open Directions

1. **Resolve the BMO$^{-1}$ ↔ L³ along-flow gap.** The bridging
   theorem would have the form: if $u \in L^\infty_t
   \mathrm{BMO}^{-1}$ globally on a smooth NSE solution, then
   $u \in L^\infty_t L^3$. Combined with ESS 2003 this would close
   CMI (A). No published candidate proof exists; the obstruction
   is at the level of bilinear estimates near the
   $\mathrm{BMO}^{-1}$ scale.
2. **Construct a small-large-data interpolation.** Koch–Tataru
   gives global regularity for small $\mathrm{BMO}^{-1}$ data; the
   open question is whether the smallness threshold can be
   continuously deformed up to large data, using HA tools
   (frequency truncation, paraproduct decomposition).
3. **Quantify the Tao barrier.** Identify, in HA language, the
   *minimum* cancellation a bilinear estimate in $X$ must use to
   succeed on true NSE but fail on averaged NSE. This would
   sharpen the obstruction A002 catalogued.
4. **Critical Lebesgue-norm preservation under flow.**
   Specifically: does $\|u(t)\|_{L^3}$ satisfy a monotonicity or
   bounded-oscillation property along smooth flows? Direct
   approach (energy-method extension) has not closed.

## 5. Connection to This Repository

- Attempts:
  - [A001](../attempts/05-navier-stokes/A001-2026-05-26-claude-opus-4-7/)
    — P01 panel surfaced the C1 finding that motivates this
    bridge.
  - [A002](../attempts/05-navier-stokes/A002-2026-05-26-claude-opus-4-7/)
    — critical-norm ladder catalog; the formal listing of the
    bridge's central object.
  - [A003](../attempts/05-navier-stokes/A003-2026-05-26-claude-opus-4-7/)
    — this bridge's discovery attempt (P02).
- Candidates: — (none yet)
- Conjectures: — (a future C-### could state a specific
  along-flow implication, e.g., "BMO$^{-1}$-bound $\Rightarrow$
  $L^3$-bound on smooth NSE flows from decaying data")
- Companion bridge: [B-004](B-004-cfd-pde-turbulence-closure.md)
  *(to be registered next; resolves A001 C3)*.

## 6. References

- **[Fujita–Kato 1964]** *On the Navier–Stokes initial value
  problem I*, Arch. Rat. Mech. Anal. 16 (1964) 269–315.
- **[Cannone 1995]** *Ondelettes, paraproduits et Navier-Stokes*,
  Diderot, 1995.
- **[Koch–Tataru 2001]** *Well-posedness for the Navier–Stokes
  equations*, Adv. Math. 157 (2001) 22–35.
- **[Escauriaza–Seregin–Šverák 2003]** *$L^{3,\infty}$-solutions
  of the Navier–Stokes equations and backward uniqueness*,
  Russian Math. Surveys 58 (2003) 211–250.
- **[Bourgain–Pavlovic 2008]** *Ill-posedness of the
  Navier–Stokes equations in a critical space in 3D*, J. Funct.
  Anal. 255 (2008) 2233–2247.
- **[Buckmaster–Vicol 2019]** *Nonuniqueness of weak solutions
  to the Navier–Stokes equation*, Ann. of Math. 189 (2019)
  101–144.
- **[Tao 2016]** *Finite time blowup for an averaged 3D
  Navier–Stokes equation*, J. AMS 29 (2016) 601–674.
- **[Lemarié-Rieusset 2018]** *The Navier–Stokes Problem in the
  21st Century*, CRC 2nd ed. (comprehensive HA-NSE reference).
- **[Bergh–Löfström 1976]** *Interpolation spaces*, Springer.
- **[Triebel 1983]** *Theory of Function Spaces*, Birkhäuser.
- **[Bony 1981]** *Calcul symbolique et propagation des
  singularités*, Ann. ENS 14 (1981) 209–246 (paraproduct origin).
