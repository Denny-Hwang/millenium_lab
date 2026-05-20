# Engineering vs Mathematics Writing

> Habits to drop, habits to acquire, when moving from engineering or
> applied-science writing to pure-mathematics writing. Written for a
> contributor who has published in engineering venues before and is
> now engaging mathematics for the first time.

---

## 1. Standards of evidence

The most fundamental difference is what *counts* as a result.

- **Engineering.** Experimental evidence with statistical confidence
  intervals counts as a result. Tables of measurements, ablation
  studies, plots over benchmarks, p-values. A result is "this
  method works in practice on the conditions we tested".
- **Mathematics.** Only a *deductive proof* counts as a result.
  Numerical evidence is a *guide*, not a result; it can refute (by
  exhibiting a counterexample) but never confirm a quantified
  statement.

In this repository the asymmetry is encoded in the verification
protocol: numerical consistency lives at L2 (a necessary condition);
the deductive proof must reach L3 (formal) and L5 (external review)
before any external claim can be considered. See
[`../methodology/verification-protocol.md`](../methodology/verification-protocol.md).

## 2. Habits to drop

- **"Results show that ..."** — engineering boilerplate. Replace
  with "We prove that ..." or, when stating a theorem, with the
  theorem statement itself.
- **"Our approach outperforms ..."** — mathematics has no benchmark
  culture. Comparisons are stated as theorems: "[Author, Year]
  proved $X$; we improve this to $Y$".
- **Hedging by adverb** ("significantly", "considerably",
  "drastically", "substantially"). Replace with a quantitative
  claim: "improves the bound from $n^3$ to $n^2 \log n$".
- **Bulleted lists inside the main argument.** Mathematical prose
  uses numbered statements (Lemma, Theorem) and flowing paragraphs.
  Bulleted lists are rare in the body and almost never inside a
  proof. They are fine in the introduction's overview.
- **Section labels like "Methods" / "Results" / "Discussion".** Use
  the mathematical structure: introduction, preliminaries, lemmas,
  main theorem, applications, open questions. See
  [`paper-anatomy.md`](paper-anatomy.md).
- **Treating a numerical experiment as the conclusion.** In
  mathematics it is at best the *opening* to a question — evidence
  that something might be true, justifying the search for a proof.
- **IMRaD structure** (Introduction, Methods, Results, Discussion).
  This is a science convention, not a mathematics one.
- **Funding-flavored abstracts** that promise practical impact.
  Mathematics abstracts state what was proved.

## 3. Habits to acquire

- **Stating exact hypotheses.** Every theorem has a precisely
  stated antecedent. Assumptions never reside "in the air".
- **Distinguishing definition from invocation.** A newly-introduced
  term is set apart (typographically and syntactically); a reused
  term carries its previous meaning. See
  [`writing-style.md`](writing-style.md) §3.
- **Numbering lemmas and theorems** for cross-reference. In
  engineering, one equation number per section often suffices; in
  mathematics, every load-bearing statement gets a number so the
  rest of the paper can refer back.
- **Briefly explaining *why* a result is non-trivial.** One sentence
  in the introduction: "the obvious approach fails because ...".
- **Treating proofs as the primary object**, not as supplementary
  material to be relegated to an appendix.
- **Carrying out a "barrier audit"**. For Millennium-class
  problems, a candidate is expected to explicitly state why it
  evades known barriers (relativization, natural proofs,
  algebrization, etc. — see the per-problem
  `verification-bar.md`).

## 4. False friends — terms with different meanings

| Word | Engineering meaning | Mathematics meaning |
|------|--------------------|---------------------|
| "Significant" | Statistically significant ($p < 0.05$). | *Non-trivial* or *load-bearing*. |
| "Robust" | Tolerant to noise / parameter perturbation. | *Survives under weakening of hypotheses* (or in this repo: *adversarially robust* in the L4 sense). |
| "Model" | A fitted predictor (regression, neural net, ...). | A *mathematical structure* (e.g., a model of a theory in logic; a Riemannian model in geometry). |
| "Optimization" | Parameter tuning by gradient descent. | A *variational principle*; finding extrema of a functional. |
| "Algorithm" | A procedure with empirical runtime. | A *formal object* with provable runtime bounds in a chosen cost model. |
| "Complexity" | Often: number of parameters or runtime in practice. | A *worst-case asymptotic resource bound* (time, space, circuit size, ...). |
| "Convergence" | Numerical convergence of an iteration to a tolerance. | A limit of a sequence in a precisely defined topology. |
| "Generalization" | Performance on held-out test data. | A theorem holding under weakened hypotheses; or a derivation in higher abstraction. |
| "Sample complexity" | How many data points are needed empirically. | A formal bound (PAC, query complexity, ...). |
| "Noise" | Stochastic measurement error. | Often a stochastic *adversary* whose distribution is precisely specified. |

## 5. The role of intuition

Intuition is *valued* in mathematics, but it is reported in a
specific register, not embedded in proofs.

- **In the introduction**, intuition appears as *motivation*: "the
  intuition is that ..." or "morally, the result says ...".
- **Between proofs**, intuition appears as *remarks*: "Remark 2.3.
  Heuristically, ...".
- **Inside a proof**, intuition does *not* appear. A proof is a
  deductive object; pictures and intuitions can guide the reader's
  understanding of why the proof works, but they do not constitute
  proof steps.

A common engineering habit is to merge intuition with argument
("intuitively, this must be true, because in our experiments ..."). In
mathematics, that move is invalid. Intuition motivates a *conjecture*;
proof comes from elsewhere.

## 6. Reviewing standards

Engineering peer review checks reproducibility, experimental design,
statistical validity, novelty, and significance for the field.

Mathematics peer review checks two things primarily:

- **Correctness** — line-by-line. A reviewer is expected to verify
  every step of the proof. This is slow; mathematics reviews
  routinely take 6–24 months for a major paper.
- **Novelty** — is the result new? A correct restatement of a known
  result is not publishable.

There is no separate "significance" or "impact" criterion at the
correctness-checking stage; significance is judged later by
citations and follow-up work.

A paper can fail in either dimension and be rejected. A correct
but not-new paper is rejected; a novel but incorrect paper is
rejected.

This is why this repository's verification protocol distinguishes
L3 (formal verification, building Lean proofs), L5 (informal
external review by experts), and L6 (refereed journal publication)
as separate gates.

## 7. Publication norms

- **Preprints (arXiv)** are the default in mathematics; a paper is
  often posted there before submission to a journal. Citation of
  preprints is acceptable.
- **No required code release** — mathematical results don't have a
  "code repository" analog. (This repository's Lean formalization is
  an exception by choice, not by community norm.)
- **Slow timeline.** A 12–24 month review cycle is normal in top
  journals.
- **No conference / journal hierarchy.** Unlike engineering, where
  top conferences (NeurIPS, ICML, SIGGRAPH) can outrank journals,
  mathematics is journal-first. Conference proceedings exist but
  are secondary.

---

## Open questions / TODO

- Build a small corpus of "before / after" rewrites: an engineering-
  style paragraph and its mathematics rewrite. Most pedagogically
  useful once a contributor has written their first draft
  `result.md`.
- Document the specific journal-submission norms for the Millennium
  problems (which journals are realistic targets per problem) once
  candidates approach submission.
