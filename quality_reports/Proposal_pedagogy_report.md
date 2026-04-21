# Pedagogical Review: Slides/dissertation/Proposal.tex
**Date:** 2026-04-13
**Agent:** pedagogy-reviewer
**Context:** Research presentation (dissertation proposal) — not a lecture. Audience: dissertation committee + attending faculty. Goal: demonstrate research viability, establish the gap, show results, and convince committee of feasibility.

---

## Summary

| Dimension | Score (0-10) | Notes |
|-----------|-------------|-------|
| Narrative arc | 6/10 | Good in Ch.1-2, weak in Ch.3 |
| Audience orientation | 5/10 | Missing "This Paper" frames throughout |
| Result revelation | 6/10 | Results buried in appendix; main deck too thin |
| Visual density | 7/10 | Generally good; some frames too dense |
| Pacing | 6/10 | Ch.1 over-specified in assumptions, under-specified in results |
| Notation clarity | 7/10 | Generally good; QSF argument order inconsistency |

---

## Issue 1 (Medium): No "This Paper" / contribution summary slide for any chapter
**Pattern violated:** Every research talk needs a "contribution in 30 seconds" slide immediately after motivation.
**Detail:** Each of the three sections jumps from motivation/literature directly into Setup and Assumptions. A committee member evaluating your overall research agenda needs to know, for each chapter: (1) what is the economic question, (2) what is the new identification strategy, (3) what is the main result. None of the three sections has a dedicated contribution slide.
**Recommendation:** Add a 1-slide "This Chapter" frame after the literature slide for each chapter. Use a consistent 3-bullet template: Setting / New Assumption / Main Result.

## Issue 2 (Medium): Assumptions presented before intuition
**Pattern violated:** Formal assumptions should follow, not precede, intuition.
**Detail:** Chapter 1 presents Assumptions 1-5 across four consecutive frames (lines 254-346) with minimal motivation for each. The intuition comes as brief bullets below each block, but it is not sufficient. A reader encounters "Rank Invariance on the Time Trend" (Assumption 1) before understanding what problem it solves.
**Recommendation:** For each assumption, lead with one sentence of motivation: "We need this because..." before presenting the formal statement. The existing bullet explanations are good but come after the block.

## Issue 3 (Medium): Estimation is appendix-only
**Detail:** The main deck ends the CiC section with a "To Do List" frame, but the actual estimation algorithm (3-step procedure) is in the appendix (lines 1211-1236). For a dissertation proposal, showing the estimation approach in the main deck — even in abbreviated form — is essential to demonstrate feasibility. The committee will ask "how do you estimate this?"
**Recommendation:** Move the estimation 3-step summary (Step 1: crossing point, Step 2: time trend, Step 3: solve linear system) to the main deck as a single frame, after the Identification frame. Keep full details in appendix.

## Issue 4 (Low): Three "Model and Assumptions" frames with same title
**Detail:** Lines 254, 270, and 291 all use `\begin{frame}{Model and Assumptions}`. This means three consecutive slides have identical titles, making it hard for an audience member to know where they are or what has changed.
**Recommendation:** Title each frame descriptively: "Assumption 1: Rank Invariance", "Assumption 2: Time Homogeneity", "Assumptions 3-4: Quasi-Stayers + Regularity". This aids navigation and committee follow-up ("go back to the rank invariance slide").

## Issue 5 (Low): Two consecutive "Direct Effects" frames
**Detail:** Lines 733 and 782 both title their frames "Direct Effects." Lines 1241 and 1256 (appendix) also both use "Direct Effects." Four frames with the same title across the deck creates navigation confusion.
**Recommendation:** Distinguish: "Direct Effects: Does TWFE Work?" (line 733), "Direct Effects: Conditional DiD" (line 782).

## Issue 6 (Low): Chapter 3 has no Notation/Setup slide
**Detail:** The Anticipation chapter (Section 3) begins directly with "Introduction" (motivation bullets) and then "Identification" (technical slides). There is no Setup frame defining the formal objects (ATT, AE, the bounding constant c). An audience member who cannot follow the math is left with no formal anchor.
**Recommendation:** Add a 1-slide Setup frame for Chapter 3 defining: the two-period DID setup, ATT, anticipation effect AE, and the c-bounded assumption formally.

## Issue 7 (Low): TikZ diagram in "Introduction" frame (Ch.2) has no verbal explanation
**Detail:** Lines 516–588: the Introduction frame for Chapter 2 opens with a large TikZ DAG (D → M_t → Y_t with U_t confounders) but the verbal explanation ("Causal mediation in DiD setting") comes below. The flow is: see diagram → then read description. For an audience seeing this cold, the diagram labels (D, Y_t, M_t, U_t) need a verbal anchor first.
**Recommendation:** Reorder: lead with a 1-2 sentence verbal setup ("We study a DiD setting where treatment affects outcomes partially through a mediator"), then show the DAG. Alternatively, add a brief title line above the TikZ: "The Causal Graph."

## Issue 8 (Low): Notation registry alignment — QSF argument order
**Detail:** Project knowledge base (knowledge-base-template.md) specifies `QSF(\tau, d)` as canonical. Slides use `QSF_t(d, \tau)`. Inconsistency between slides and paper will confuse committee members reading both.
**Recommendation:** Standardize to project convention. If the paper uses one order, slides should match.

---

## Positive Features

- **Literature positioning is strong**: Each chapter has a focused Related Literature/Literature frame that clearly states "This paper" contributions relative to cited work. This is excellent for a committee audience.
- **Empirical examples anchor the theory**: Example 1 and 2 in Chapter 1, and the Howard-Ornaghi application in Chapter 2, give concrete grounding to abstract identification results.
- **Copula stability testability**: The note that Assumption 5 is testable with 3+ periods (line 354) proactively addresses a committee concern. This is well-placed.
- **Table of results for Chapter 2**: The empirical results table (lines 903–966) is well-structured with DR vs TWFE comparison — exactly the format a committee wants to see.
- **Section outline slides**: The repeated `\tableofcontents[sectionstyle=show/shaded]` transition slides efficiently orient the audience across the three-chapter structure.
