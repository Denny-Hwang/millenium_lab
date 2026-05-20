# How to Read a Mathematics Paper

> Reading strategies. Mathematics papers do *not* reward linear
> top-to-bottom reading; the conventions of the genre assume a
> top-down, multi-pass approach.

---

## 1. The standard three passes

**Pass 1 — Orientation.** Read the title, abstract, introduction,
and the statement of the main theorem(s). Skim the section
headings. Decide whether the paper is relevant to your goal.

After Pass 1 you should be able to answer:

- What does the paper claim?
- What technique does it use?
- Is this paper relevant to my current question?

If the answer to the third question is no, stop here.

**Pass 2 — Skeleton.** Read every theorem and lemma statement. Read
*no proofs* yet. Trace the dependency graph of lemmas to the main
theorem. Identify the **rate-limiting lemmas** — the ones whose
proofs carry the most weight.

After Pass 2 you should be able to:

- Sketch the dependency graph on paper.
- Point to which 2–4 lemmas do the real work.
- State the main theorem from memory.

**Pass 3 — Proofs.** Read the proofs of the rate-limiting lemmas
*first*, then secondary lemmas. Read the proof of the main theorem
*last*; by this point it should feel like a routine composition of
the lemmas.

After Pass 3 you should be able to:

- Reconstruct each load-bearing proof from the lemma statements
  and a few key ideas.
- Identify any step you accepted without fully checking, and decide
  whether to verify it now or later.

## 2. What to write down while reading

- A list of **definitions in your own words**. If you cannot
  paraphrase a definition without looking at the paper, you have
  not yet understood it.
- A **dependency diagram**: which lemma uses which. Paper or
  digital, whichever you will actually maintain.
- **Where the author hides the work.** Phrases to flag:
  - "It is easy to see that ...".
  - "By standard arguments, ...".
  - "As is well known, ...".
  - "After a routine calculation, ...".
  - "An easy induction shows ...".
  Each of these is a *deferred step*; you should explicitly check
  the step yourself or look it up.
- Any **term or symbol unfamiliar to you**. Queue them for
  [`glossary.md`](glossary.md) or [`notation.md`](notation.md).
- A **margin question for each section** — what is the section
  trying to do, in one sentence?

## 3. Reading vs verifying

Reading a paper is not the same as verifying it.

- **Reading** is forming a mental model of the argument; the result
  is "I see roughly why this is true and how the argument flows".
- **Verification** is checking every step, including the deferred
  ones; the result is "I can confirm this proof is correct".

In this repository, verification is tracked separately at the
levels L1–L7 (see
[`../methodology/verification-protocol.md`](../methodology/verification-protocol.md)).
Casual reading is a *precondition* for verification, not a
substitute.

A common failure mode: a reader who has only Pass-1'd a paper
quotes it as established fact. This is reading, not verification,
and the citation does not transfer verification credit.

## 4. Reading a paper *outside* your field

Useful when this repository's consilient approach requires
borrowing tools from a field you have not trained in.

- **Start with surveys, not original papers.** The original paper
  assumes the field's vocabulary; a survey introduces it.
- **Find one trusted textbook per unfamiliar term.** Resist the
  temptation to chase definitions infinitely deep; a working
  understanding of the *use* of a term often precedes a complete
  understanding of its foundation.
- **Re-state the main theorem in your own field's language.** If
  you cannot, you have not yet understood the statement.
- **Resist dismissive vocabulary.** "Obvious", "trivial",
  "well-known" usually signal a gap in your reading, not a gap in
  the paper.
- **Time-box.** Decide how much time you will spend before declaring
  the paper either understood or out-of-scope; otherwise reading
  outside one's field expands without bound.

## 5. How to read this repository's artifacts

The artifacts have different roles and call for different reading
modes.

- **`attempts/**/result.md`** — closest to an arXiv abstract or
  extended abstract. Read with Pass 1 first; Pass 2 if the attempt
  is relevant; rarely Pass 3 (the proof detail lives in a
  candidate, not an attempt).
- **`attempts/**/transcript.md`** — *frozen* (AGENTS.md §3). Read
  as primary source on the *thought process*, not as a polished
  argument. Useful for understanding *why* an attempt arrived at
  its conclusion.
- **`attempts/**/prompt.md`** — the prompt that drove the attempt;
  reveals what the author asked for and what constraints applied.
- **`candidates/PC-*/main-proof.md`** — the closest analog to a
  refereed paper. Apply the full three-pass reading.
- **`candidates/PC-*/lemmas/L##.md`** — individual lemma statements
  and proofs. Read alongside the dependency graph of the candidate.
- **`bridges/B-###-*.md`** — survey-style; Pass 1 is usually
  sufficient unless the bridge is on your active path.
- **`reviews/**/*.md`** — read second after the artifact reviewed.

## 6. Reading rhythm

A practical schedule that survives the multi-week reading required
by a Millennium-class result:

- Pass 1 fits in one sitting (30–90 minutes) for most papers.
- Pass 2 fits in 1–3 sittings.
- Pass 3 spans days to weeks for a 30+ page paper.
- Verification (separate from reading) can take months to years
  for a major result.

A reader who tries to complete Pass 3 before Pass 1 is finished
usually loses the thread; the three-pass discipline exists to keep
that from happening.

---

## Open questions / TODO

- Develop a short checklist a reviewer can use when reading an
  attempt's `result.md` (different rubric from a candidate review).
- Cross-link the three passes to the L1–L7 levels: which level
  requires which depth of reading by which reviewer.
