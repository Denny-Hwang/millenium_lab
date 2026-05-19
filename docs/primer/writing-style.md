# Mathematical Writing Style

> The register of working mathematicians: voice, hedging, definitional
> conventions. The goal is that a reader from the field cannot tell
> from the prose whether the author is a working mathematician or a
> trained newcomer.

---

## 1. Voice and person

TODO: Default to the *mathematical "we"* even for a single author
("we show", "we now prove"). First-person singular ("I") is rare in
research papers. Pure passive ("It is shown that ...") is common in
older literature; the mathematical "we" is now preferred for
narrative flow.

## 2. Tense

TODO: Statements of mathematical fact use the *present tense*
("$f$ is continuous", "the lemma states ..."). Historical or
procedural remarks use the past ("Gödel proved ..." but "Gödel's
theorem states ..."). The present tense is the default; deviations
should be deliberate.

## 3. Definitional sentences

TODO: A definition introduces a new term; an invocation uses an
already-defined term. Distinguish them typographically (definiendum
in *italics* or **bold**, set in a `Definition.` block) and
syntactically ("We call $X$ ...", "By an $X$ we mean ...", "An $X$
*is* ..." — the *italicized "is"* signals the definitional reading).

## 4. Hedging vocabulary

TODO: Mathematicians hedge precisely — they are not vague, they
are specific about uncertainty.

- "We conjecture that ..." vs "We expect ..." vs "Heuristically,
  ..." vs "Numerical evidence suggests ..."
- "It is plausible that" — author's own opinion, no proof.
- "It is known that ..." — cite immediately.
- "It is easy to see that ..." — use sparingly; many readers will
  find it not easy. Better: "By [Lemma 2.3] ...".
- "We sketch the proof" — author is signaling that not every step
  will be filled in.

## 5. Sentence-initial connectives

TODO: "Indeed, ...", "In fact, ...", "Note that ...", "Observe
that ...", "Recall that ..." each have a slightly different job.

- *Indeed*: backs up a claim just made.
- *In fact*: strengthens a claim just made.
- *Note* / *Observe*: flags a small remark the reader could miss.
- *Recall*: refers to something stated earlier or assumed common
  ground.

## 6. Numbering and naming

TODO: Theorems, lemmas, propositions, corollaries are usually
numbered globally or per-section ("Theorem 3.2"). Named theorems
("Theorem A", "Main Theorem") are reserved for the central results
of the paper.

## 7. Citations

TODO: Two dominant styles in mathematics.

- *Numbered*: `[7]`, `[7, Thm. 3.2]`. Compact; common in shorter
  papers.
- *Author–year*: `[Razborov–Rudich 1997]`, `[RR97]`. Common in
  long papers and surveys; easier to read in-line.

This repository uses the author–year style in narrative prose; see
`result.md` files for examples.

## 8. Equations: numbered, displayed, inline

TODO:

- Inline ($f(x) = x^2$) for short expressions in running text.
- Displayed (set off on its own line) for longer expressions or
  any equation referred to later.
- Numbered only if referenced elsewhere; unreferenced numbered
  equations are clutter.

## 9. Hedging vs over-claiming

TODO: A mathematician will rather *under-claim and over-deliver*
than the reverse. If a result holds only under an extra hypothesis,
state the hypothesis in the theorem statement, not as a hidden
assumption.

## 10. Negative space — what mathematicians do not write

TODO:

- No marketing adjectives ("revolutionary", "groundbreaking").
- No appeals to consequences ("if true, this would be very
  important") in the body of a proof — keep them to the
  introduction.
- No reference to *who* should care; mathematics is written for an
  abstract competent reader.

---

## Open questions / TODO

- Build a side-by-side rewrite gallery: an engineering-style
  sentence and its mathematical rewrite. Most pedagogically useful
  once we have a half-dozen worked examples.
