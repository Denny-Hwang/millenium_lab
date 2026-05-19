# Mathematical Primer for Non-Specialists

> A living reference space for contributors who come from outside pure
> mathematics (e.g., engineering, applied sciences) and want to engage
> with this repository's artifacts in the **native voice** of working
> mathematicians.

---

## Purpose

This primer is **pedagogical**, not prescriptive. It is distinct from
[`../methodology/`](../methodology/), which defines the project's L1–L7
verification pipeline. Where `docs/methodology/` answers *"what does
this repository require?"*, `docs/primer/` answers *"what background do
I need to read, write, or evaluate a piece of mathematical work?"*

Concretely the primer is here so that a contributor can:

- read an existing attempt (e.g.,
  [`attempts/03-p-vs-np/A004-.../result.md`](../../attempts/03-p-vs-np/))
  without losing the thread on standard vocabulary;
- write a new `result.md`, `main-proof.md`, or `bridges/B-###.md` in
  the register expected of a refereed mathematics paper;
- distinguish the rhetorical moves of mathematics from those of
  engineering or applied-science writing.

## How to use this folder

These files are **living documents**. Each attempt or candidate that
runs through the pipeline is expected to surface at least one new term,
notation, or rhetorical pattern. Accumulate them here as they come up;
do not try to seed the primer exhaustively before starting work.

A typical update cycle:

1. While reading or writing in an attempt, note a term or move you had
   to look up.
2. Add it to the appropriate file (or open a new file if a category is
   missing).
3. Cite the attempt or external source where the term first appeared,
   so future readers can see the term in situ.

## Layout

| File / folder | Scope |
|---|---|
| [`glossary.md`](glossary.md) | Theorem-type vocabulary, common Latin phrases, hedging language (WLOG, modulo, up to, generic, mutatis mutandis, ...). |
| [`notation.md`](notation.md) | Symbol dictionary (∀, ∃, ⇒, ⊢, ⊨, ≅, ↪, ⊕, ⊗, ...). |
| [`proof-techniques.md`](proof-techniques.md) | Direct, contrapositive, contradiction, induction, construction, exhaustion, probabilistic method, pigeonhole, diagonalization, compactness. |
| [`writing-style.md`](writing-style.md) | Mathematician's voice (the "we" register, hedging, definitional vs. invocational sentences). |
| [`paper-anatomy.md`](paper-anatomy.md) | Section-by-section structure of a refereed math paper. |
| [`reading-guide.md`](reading-guide.md) | How to read a math paper top-down, including the role of preliminaries and notation indexes. |
| [`engineering-vs-math.md`](engineering-vs-math.md) | Habits to drop when moving from engineering writing to mathematics. |
| [`field-primers/`](field-primers/) | Per-problem minimum-background notes for the seven Millennium problems. |
| [`references.md`](references.md) | Recommended textbooks, courses, blog posts, MathOverflow threads. |

## Language

Per [`AGENTS.md`](../../AGENTS.md) §10, all content in this folder is in
English. This aligns with the primer's purpose: the target voice is
itself an English-native mathematical register, and exposure to that
register is part of the training value of the primer.

Chat between an agent and a contributor may use any language; what
lands in this folder is English.

## Status

Initial scaffold. Most files are stubs with section outlines and TODO
markers. Filling them in is a steady accumulation task, not a one-time
authoring task.
