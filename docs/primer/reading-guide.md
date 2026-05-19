# How to Read a Mathematics Paper

> Reading strategies. Mathematics papers do *not* reward linear
> top-to-bottom reading; the conventions of the genre assume a
> top-down, multi-pass approach.

---

## 1. The standard three passes

TODO:

- **Pass 1 — Orientation.** Read title, abstract, introduction,
  and the statement of the main theorem(s). Skim the section
  headings. Decide whether the paper is relevant to your goal.
- **Pass 2 — Skeleton.** Read every theorem and lemma statement;
  read no proofs. Trace the dependency graph of lemmas to the main
  theorem. Identify the rate-limiting lemmas (those whose proofs
  carry the most weight).
- **Pass 3 — Proofs.** Read proofs of the rate-limiting lemmas
  first, then secondary lemmas. Read the proof of the main
  theorem last; by this point it should feel like a routine
  composition of the lemmas.

## 2. What to write down while reading

TODO:

- A list of definitions, in your own words.
- A dependency diagram: which lemma uses which.
- Where the author hides the work — phrases like "it is easy to
  see", "by standard arguments", "as is well known", "after a
  routine calculation" each signal a deferred step you should
  *explicitly check or look up*.
- Any term or symbol unfamiliar to you (queue for
  [`glossary.md`](glossary.md) or [`notation.md`](notation.md)).

## 3. Reading vs verifying

TODO: Reading a paper is not the same as verifying it. Verification
requires checking every step, including the deferred ones. In this
repository, verification is tracked separately at levels L1–L7 (see
[`../methodology/verification-protocol.md`](../methodology/verification-protocol.md)).
Casual reading is a precondition for verification, not a substitute.

## 4. Reading a paper *outside* your field

TODO: Useful when consilient approaches require borrowing tools.

- Start with surveys, not original papers.
- Find one trusted textbook reference per unfamiliar term;
  resist the temptation to chase definitions indefinitely.
- Re-state the main theorem in your own field's language; if you
  cannot, you have not yet understood the statement.
- Resist the temptation to dismiss a result as "obvious" or
  "trivial" — those words usually signal a gap in your reading,
  not a gap in the paper.

## 5. How to read this repository's artifacts

TODO:

- An `attempts/**/result.md` is the closest to a pre-print
  abstract; read it the way you would read an arXiv abstract.
- An `attempts/**/transcript.md` is *frozen* (AGENTS.md §3); read
  it as a primary source on the *thought process*, not as a
  polished argument.
- A `candidates/PC-*/main-proof.md` is the closest to a refereed
  paper; apply the three-pass reading above.

---

## Open questions / TODO

- Develop a short checklist a reviewer can use when reading an
  attempt's `result.md` (different rubric from a candidate review).
