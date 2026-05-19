# Engineering vs Mathematics Writing

> Habits to drop, habits to acquire, when moving from engineering or
> applied-science writing to pure-mathematics writing. Written for a
> contributor who has published in engineering venues before and is
> now engaging mathematics for the first time.

---

## 1. Standards of evidence

TODO:

- Engineering: experimental evidence with statistical confidence
  intervals counts as a result. Tables of measurements, ablation
  studies, plots.
- Mathematics: only a *deductive proof* counts as a result.
  Numerical evidence is a *guide*, not a result; it can refute (by
  counterexample) but not confirm. In this repository, numerical
  consistency lives at L2 of the verification protocol; it is a
  *necessary but not sufficient* condition.

## 2. Habits to drop

TODO:

- **"Results show that ..."** — replace with "We prove that ..."
  or, when stating a theorem, with the theorem statement itself.
- **"Our approach outperforms ..."** — mathematics does not have a
  benchmark culture; comparisons are stated as theorems
  ("[Author, Year] proved $X$; here we improve this to $Y$").
- **Hedging by adverb** ("significantly", "considerably",
  "drastically"). Replace with a quantitative claim.
- **Bulleted lists in the main argument**. Mathematical prose
  uses numbered statements (Lemma, Theorem) and flowing
  paragraphs; bulleted lists are rare in the body and almost
  never in proofs.
- **Section labels like "Methods" / "Results" / "Discussion"**.
  See [`paper-anatomy.md`](paper-anatomy.md) for the correct
  section structure.
- **Treating a numerical experiment as the conclusion**. In
  mathematics it is at best the introduction to a question.

## 3. Habits to acquire

TODO:

- **Stating exact hypotheses**. Every theorem has a precisely
  stated antecedent; assumptions are not in the air.
- **Distinguishing definition from invocation**. A
  newly-introduced term is set apart (typographically and
  syntactically); a reused term carries its previous meaning.
- **Numbering lemmas and theorems** for cross-reference. In
  engineering, a single equation number per section is often
  enough; in mathematics, every load-bearing statement gets a
  number.
- **Stating *why* a result is non-trivial**, briefly, in the
  introduction. (E.g., "the obvious approach fails because
  ...".)
- **Treating proofs as the primary object**, not as
  supplementary material to be relegated to an appendix.

## 4. False friends — terms with different meanings

TODO:

- "Significant": *statistically significant* in engineering;
  *non-trivial* or *load-bearing* in mathematics.
- "Robust": tolerant-to-noise in engineering; *survives under
  weakening of hypotheses* in mathematics, or
  *adversarial-robustness* in this repository's L4 sense.
- "Model": a fitted predictor in engineering; a *mathematical
  structure* (e.g., a model of a theory) in mathematics.
- "Optimization": parameter tuning in engineering; a *variational
  principle* in mathematics.
- "Algorithm": a procedure with empirical runtime in engineering;
  a *formal object* with provable runtime bounds in mathematics.

## 5. The role of intuition

TODO: Intuition is valued in mathematics, but it is reported in a
specific register: as motivation in the introduction, as a remark
between proofs, or as an aside in a paragraph beginning with
"Heuristically" or "Morally". It does not appear inside a proof.

## 6. Reviewing standards

TODO:

- Engineering peer review checks reproducibility, experimental
  design, statistical validity, novelty.
- Mathematics peer review checks *correctness* (line by line) and
  *novelty*. A correct restatement of a known result is not
  publishable; an interesting question without a proof is also
  not publishable.

---

## Open questions / TODO

- Build a small corpus of "before / after" rewrites: an
  engineering-style paragraph and its mathematics rewrite. Most
  pedagogically useful once a contributor has written their first
  draft `result.md`.
