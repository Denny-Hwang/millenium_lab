# Mathematical Writing Style

> The register of working mathematicians: voice, hedging, definitional
> conventions. The goal is that a reader from the field cannot tell
> from the prose whether the author is a working mathematician or a
> trained newcomer.

---

## 1. Voice and person

The default voice in modern mathematical writing is the **mathematical
"we"** — even for a single author. "We show", "we now prove", "we
turn to". First-person singular ("I think", "in my view") is rare in
research papers and reserved for an explicit author opinion or
historical aside.

Pure passive constructions ("It is shown that ...", "It can be proved
that ...") are common in older literature and in formal Bourbaki-style
writing, but tend to obscure the agent of the argument. The "we"
register is now preferred for narrative flow without losing
authorial responsibility.

Avoid the *editorial we* meaning "the author and the reader together";
the "we" of mathematics is the author writing on behalf of the
argument, not a rhetorical alliance with the reader.

## 2. Tense

Statements of mathematical fact use the **present tense**: "$f$ is
continuous", "the lemma states", "the theorem holds". Mathematical
truths are timeless; the present is the default.

Historical or procedural remarks use the past: "Gödel proved
incompleteness in 1931", "we computed this in §3". The construction
of a particular object during the proof is past: "we chose $\epsilon$
so that ...".

Future tense ("we will prove") is acceptable as a brief signpost but
should not pile up; replace with the simple present where possible.

## 3. Definitional sentences

A **definition** introduces a new term; an **invocation** uses an
already-defined term. The two are visually and syntactically
distinct.

Typographic conventions:

- The definiendum is set in *italics* or **bold**, often inside a
  numbered "Definition" block: "**Definition 2.1.** A *scheme* is
  ...".
- The italicized form of "is" carries the definitional weight: "A
  scheme *is* a locally ringed space such that ..." (definitional);
  "$X$ is a scheme" (invocational).

Syntactic conventions:

- "We call $X$ a $T$ if ...".
- "By a $T$ we mean ...".
- "An $X$ is *called* a $T$ when ...".

A reader scanning the paper should be able to find every definition
by visual cue alone. Buried definitions (definitional sentences
inside a paragraph of running prose) are a frequent reader-hostile
mistake.

## 4. Hedging vocabulary

Mathematicians hedge *precisely* — they are not vague, they are
specific about uncertainty. The vocabulary distinguishes:

- **"We conjecture that ..."** — the author believes it, has no
  proof.
- **"We expect ..."** — author's working assumption; weaker than
  *conjecture*.
- **"Heuristically, ..."** — argument with intuition but not rigor.
- **"Numerical evidence suggests ..."** — finite-case data, no proof.
- **"It is plausible that ..."** — author's opinion, no proof.
- **"It is known that ..."** — must be followed by a citation.
- **"It is easy to see that ..."** — use sparingly. Many readers
  will find it not easy; the phrase is a frequent vehicle for hidden
  gaps. Prefer "By [Lemma 2.3], ..." or a one-line argument.
- **"It is well known that ..."** — claim and citation; if no
  citation, the reader is entitled to dispute the well-knownness.
- **"We sketch the proof"** — author signals that not every step
  will be filled in. Acceptable in surveys; in research papers,
  used only for genuinely standard parts.

## 5. Sentence-initial connectives

Each has a slightly different job; using them interchangeably blurs
the argument.

- **"Indeed, ..."** — backs up a claim just made.
- **"In fact, ..."** — strengthens a claim just made.
- **"Note that ..."**, **"Observe that ..."** — flags a small remark
  the reader could miss.
- **"Recall that ..."** — refers to something stated earlier or
  considered common ground.
- **"By construction, ..."** — invokes a property assured by an
  earlier explicit construction.
- **"By hypothesis, ..."** — uses an assumption of the current
  theorem.
- **"Conversely, ..."** — transitions to the reverse implication.

## 6. Numbering and naming

Theorems, lemmas, propositions, corollaries are numbered for cross-
reference. Two conventions are common:

- **Global numbering**: Theorem 1, Theorem 2, ..., Lemma 1, ... Used
  in shorter papers.
- **Section-prefixed**: Theorem 3.2 is the second theorem of §3.
  Used in longer papers; eases re-organization.

Named theorems ("Theorem A", "Main Theorem") are reserved for the
central results of the paper. A paper with five "Main Theorems"
loses the rhetorical force of the name.

## 7. Citations

Two dominant styles in mathematics.

- **Numbered**: `[7]`, `[7, Thm. 3.2]`. Compact; common in shorter
  papers.
- **Author–year**: `[Razborov–Rudich 1997]`, `[RR97]`. Common in
  long papers and surveys; easier to read in-line because the
  reader is reminded who the result is due to without flipping to
  the bibliography.

This repository uses the author–year style in narrative prose; see
`result.md` files for examples.

Within either style: cite the *specific* theorem ("`[Hartshorne
1977, Thm II.5.7]`"), not just the book.

## 8. Equations: numbered, displayed, inline

- **Inline** ($f(x) = x^2$): for short expressions in running text.
- **Displayed** (set off on its own line): for longer expressions or
  any equation referenced later.
- **Numbered**: only if referenced elsewhere. An unreferenced
  numbered equation is clutter; it suggests the author was unsure
  whether the equation mattered.

For long derivations, use `align*` (LaTeX) or its analog — a stacked
sequence of equalities aligned at "$=$".

## 9. Hedging vs over-claiming

A mathematician will rather *under-claim and over-deliver* than the
reverse. Concrete consequences:

- If a result holds only under an extra hypothesis, the hypothesis
  *appears in the theorem statement*, not as a hidden assumption
  recovered from the proof.
- If the result is genuinely conditional ("if conjecture $X$ holds,
  then ..."), the conditional appears in the statement itself,
  prominently.
- "Almost", "essentially", "morally" are not theorem-statement
  vocabulary; they belong to the introduction.

## 10. Negative space — what mathematicians do *not* write

- No **marketing adjectives** ("revolutionary", "groundbreaking",
  "first-of-its-kind"). Results speak for themselves.
- No **appeals to consequences** ("if true, this would be very
  important") inside the body of a proof. Save them for the
  introduction.
- No **reference to who should care**. Mathematics is written for
  an abstract competent reader; the audience is the next generation
  of mathematicians, not a current decision-maker.
- No **direct address to the reader** ("You should now notice that
  ...") except very sparingly in pedagogical writing; replace with
  "We see that ...".
- No **personal narrative** ("after weeks of false starts, the key
  idea came to me ..."). Save for an acknowledgments paragraph or
  a separate memoir.

---

## Open questions / TODO

- Build a side-by-side rewrite gallery: an engineering-style
  sentence and its mathematical rewrite. Most pedagogically useful
  once we have a half-dozen worked examples from this repository's
  attempts.
- Compile a checklist of common voice mistakes detected in attempt
  drafts.
