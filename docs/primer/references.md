# Recommended Reading

> Textbooks, surveys, blog posts, and discussion threads useful for a
> non-specialist building toward research-level engagement with the
> Millennium problems. Living document — extend as we use specific
> references in attempts and reviews. Listed conservatively; items
> with known editions and authors only.

---

## 1. Writing mathematics

- Halmos, *How to Write Mathematics* (essay, *L'Enseignement
  Mathématique* 16, 1970). Foundational; short.
- Knuth, Larrabee, Roberts, *Mathematical Writing* (MAA, 1989).
  Lecture-notes from a Stanford course; freely available online.
- Krantz, *A Primer of Mathematical Writing* (AMS, 1997; 2nd ed.
  2017). Book-length treatment of paper structure and style.
- Higham, *Handbook of Writing for the Mathematical Sciences*
  (SIAM, 2nd ed. 1998; 3rd ed. 2020). Practical and broad.

## 2. Reading and understanding proofs

- Velleman, *How to Prove It: A Structured Approach* (Cambridge,
  3rd ed. 2019). Standard textbook for the proof-writing transition.
- Solow, *How to Read and Do Proofs* (Wiley, 6th ed. 2014).
- Hammack, *Book of Proof* (free online, 3rd ed. 2018).
  https://www.people.vcu.edu/~rhammack/BookOfProof/

## 3. General mathematical foundations

- Rudin, *Principles of Mathematical Analysis* (3rd ed. McGraw-Hill,
  1976). Analysis baseline; "Baby Rudin".
- Munkres, *Topology* (2nd ed. Prentice Hall, 2000). Point-set and
  algebraic topology.
- Dummit & Foote, *Abstract Algebra* (3rd ed. Wiley, 2003).
  Comprehensive algebra reference.
- Hatcher, *Algebraic Topology* (Cambridge, 2002; free online).
  https://pi.math.cornell.edu/~hatcher/AT/ATpage.html

## 4. Per-problem starting points

See the per-problem files in [`field-primers/`](field-primers/) for
problem-specific bibliographies. The list above is intentionally
*cross-cutting*; the field primers list the specific monographs.

## 5. Online communities and resources

- **MathOverflow** (https://mathoverflow.net) — research-level Q&A.
  The standard channel for asking and reading expert-level math
  questions.
- **Mathematics Stack Exchange** (https://math.stackexchange.com) —
  general-audience Q&A; useful for basic background.
- **nLab** (https://ncatlab.org) — category-theoretic and structural
  mathematics wiki; technical, opinionated.
- **Terence Tao's blog** (https://terrytao.wordpress.com) — a model
  of clear research-level mathematical writing; covers many of the
  techniques and conventions discussed in
  [`writing-style.md`](writing-style.md).
- **Quanta Magazine** (https://www.quantamagazine.org) — accessible
  surveys of recent research; useful for motivation and context,
  not for technical content.

## 6. LaTeX and typesetting

- Mittelbach & Goossens, *The LaTeX Companion* (Addison-Wesley,
  2nd ed. 2004). Definitive reference.
- `amsmath` package documentation
  (https://ctan.org/pkg/amsmath). Mathematical typesetting.
- `amsthm` package documentation
  (https://ctan.org/pkg/amsthm). Theorem environments.
- TeX Stack Exchange (https://tex.stackexchange.com) — Q&A.

For local conventions in this repository, see the LaTeX source of
any `result.md` for working examples once an attempt is finalized
in LaTeX form (currently most artifacts are in Markdown with inline
math).

## 7. Verification and formalization

These references are forward-looking — they become relevant when
candidates approach the L3 (formal verification) gate.

- *Theorem Proving in Lean 4* (Avigad, de Moura, et al.).
  https://leanprover.github.io/theorem_proving_in_lean4/ — free,
  current.
- *Mathematics in Lean* (Avigad, Massot).
  https://leanprover-community.github.io/mathematics_in_lean/ —
  bridging textbook for mathematicians moving into Lean 4.
- *mathlib* documentation
  (https://leanprover-community.github.io/mathlib4_docs/) — the
  standard library.

---

## Open questions / TODO

- Build a "minimum viable bibliography" per Millennium problem,
  ordered by accessibility; this lives in the corresponding
  `field-primers/<problem>.md` and is referenced from here.
- Add a section on *historical surveys* of the field once we have
  identified the best ones (a researcher's first survey choice
  often determines the speed of orientation).
