# Slide Research Excellence Review: Slides/dissertation/Proposal.tex
**Date:** 2026-04-13
**Type:** Dissertation Proposal (3 chapters)
**Agents run:** Visual/Layout, Proofreading, Substance (domain), Pedagogical

---

## Overall Quality Score: NEEDS WORK

| Dimension | Critical | Medium | Low |
|-----------|----------|--------|-----|
| Visual/Layout | 1 | 5 | 4 |
| Proofreading | 0 | 4 | 5 |
| Substance (Econometrics) | 2 | 5 | 3 |
| Pedagogical / Research Argument | 0 | 3 | 4 |
| **TOTAL** | **3** | **17** | **16** |

**Scoring:** 3 critical issues + 17 medium issues = "Needs Work" tier (6-10 critical threshold / 16-30 medium threshold).

---

## Critical Issues (Immediate Action Required)

### [CRIT-1] `\pause` / `\only<>` overlay commands throughout the deck
**Rule:** `no-pause-beamer.md` prohibits these commands entirely.
**Locations:** Lines 695/713 (Total Effects), 740/752/754 (Direct Effects), 799 (Direct Effects #2), 1091/1108 (Appendix RC frame)
**Fix:** Split each `\only<1>` / `\only<2>` pair into two separate consecutive frames. The `\only<2>` frames showing simulation figures (lines 714-728, 754-765) should become standalone figure frames.
**Note:** The `\pause` on line 752 between `\only<1>` and `\only<2>` blocks is redundant and also violates the rule.

### [CRIT-2] Missing "This Paper" / contribution frame for all three chapters
**Context:** Every chapter in the dissertation proposal opens with Motivation and Literature but then jumps directly to Setup and Assumptions. There is no single-slide statement of contribution for any chapter.
**Impact:** Committee members who are not in your exact subfield need a 3-bullet anchor (Setting / New Assumption / Main Result) before absorbing the technical slides. Without this, the proposal risks appearing as a series of assumptions rather than a coherent research agenda.
**Fix:** Add one "This Chapter" frame after the Literature/Related Literature slide for each of the three sections. The commented-out `% \begin{frame}{This Paper}` at lines 137-152 should be restored and completed for Chapter 1. Add similar frames for Chapters 2 and 3.

### [CRIT-3] Chapter 3 (Anticipation) is critically underdeveloped for a proposal
**Detail:** The entire third chapter is two frames: Introduction (bullets) and Identification (bullets), plus a 4-bullet Summary. No formal assumptions, no propositions, no examples, no figures. The identification content (bounded variation, exponential decay) is presented only as bullet items without formal statements.
**Impact:** A dissertation committee will not approve a chapter without formal econometric content. The contrast with Chapter 1 (which has 5 formal Assumption blocks, a Lemma, and a Proposition) and Chapter 2 (which has 2 Propositions + empirical results table) makes Chapter 3 look like a placeholder.
**Fix:** Add at minimum: (1) a Setup frame defining ATT, AE, and c formally; (2) a Proposition frame with the partial identification result (bounds); (3) one applied example or preliminary figure.

---

## Medium Issues (Next Revision)

### [MED-1] Caption mismatch on simulation figure (Proofreading + Visual)
**Location:** Line 720: `\captionof{figure}{TWFE estimator for the direct effect}` — but the figure is `theta_total_sim_new.pdf` (total effects)
**Fix:** Change to "TWFE estimator for the total effect"

### [MED-2] D'Haultfoeuille vs D'Haultfœuille (spelling inconsistency)
**Location:** Line 109 (no ligature) vs Line 161 (oe ligature)
**Fix:** Use the ligature form `D'Haultfœuille` consistently

### [MED-3] "Unit are drawn" (grammar error)
**Location:** Line 193
**Fix:** "Units are drawn from an infinite superpopulation"

### [MED-4] "TWFE regression again not works" (ungrammatical)
**Location:** Line 628
**Fix:** "TWFE regression also fails in the presence of `bad controls'"

### [MED-5] "stritly" typo
**Location:** Line 297, Assumption 4
**Fix:** "strictly"

### [MED-6] "Assumption 1 and 2" (missing plural)
**Location:** Lines 704, 742, 828
**Fix:** "Assumptions 1 and 2" (three occurrences)

### [MED-7] Three consecutive frames titled "Model and Assumptions"
**Location:** Lines 254, 270, 291
**Fix:** Rename descriptively: "Assumption 1: Rank Invariance", "Assumption 2: Time Homogeneity", "Assumptions 3-4: Quasi-Stayers + Regularity"

### [MED-8] Estimation algorithm should have a main-deck frame (currently appendix-only)
**Location:** Appendix lines 1211-1236
**Fix:** Add an abbreviated 1-frame estimation summary to the main Chapter 1 deck (before the "To Do List" frame)

### [MED-9] Overfull \vbox warnings (~22pt overflow)
**Location:** Visual audit finding M1 — dense frames exceeding slide height
**Fix:** Reduce `\vspace{}` spacing, or split overflowing frames

### [MED-10] QSF argument order inconsistency with project notation registry
**Location:** Lines 231, 234 use `QSF_t(d, \tau)`
**Knowledge base convention:** `QSF(\tau, d)` (tau first)
**Fix:** Standardize across paper and slides; if slides and paper use different orders, pick one

### [MED-11] Assumption 5 plausibility — "Why Gaussian?" not addressed in main deck
**Location:** Discussion frame lines 350-357
**Fix:** Add one bullet: "Gaussian copula nests independence (rho=0) and is the maximal-entropy copula with given rank correlation — a natural benchmark"

### [MED-12] Example 1 uses undeclared variable (eta_it vs nu_it mismatch)
**Location:** Lines 363-365: equation uses `\nu_{it}` but description says `\eta_{it}`
**Fix:** Standardize to one symbol throughout

### [MED-13] c-bounded anticipation direction not clarified (Chapter 3)
**Location:** Line 1021
**Fix:** Add: "We assume AE and ATT have the same sign" or clarify the directional bound

### [MED-14] Untitled appendix separator frame
**Location:** Line 1068
**Fix:** Change to `\begin{frame}[plain]{}` or `\begin{frame}{Appendix}`

### [MED-15] Proposition (Ch.1) should highlight joint identification of F and rho
**Location:** Lines 412-415
**Fix:** Add annotation: "Notably, both F_{Y_1(d)}(y) and rho_d are jointly identified from observables — rho_d is not assumed known"

### [MED-16] Setup frame for Chapter 2 should acknowledge model linearity as a sufficient condition
**Location:** Lines 635-665
**Fix:** Add one sentence: "The linear additive structure is sufficient; extensions to nonlinear settings are discussed in Section X"

### [MED-17] Two consecutive frames titled "Direct Effects" (Ch.2)
**Location:** Lines 733 and 782
**Fix:** "Direct Effects: Does TWFE Work?" and "Direct Effects: Conditional DiD Approach"

---

## Low Issues (Polish Before Final Defense)

- **[LOW-1]** Orphaned `\bibliographystyle{apalike}` with no `\bibliography{}` — remove line 29 or add a references frame
- **[LOW-2]** "To Do List" frame should be renamed "Future Work" and include brief descriptions of the estimation approach
- **[LOW-3]** "sober worker" (line 860) — fix to "more sober workers"
- **[LOW-4]** "Bad controls" double-marked (italics + quotation marks) — choose one convention
- **[LOW-5]** Pearl (1995) citation for "bad controls" — verify year (may be Pearl 2000 or Angrist-Pischke 2009)
- **[LOW-6]** Chapter 2 Introduction frame: add verbal anchor before TikZ DAG
- **[LOW-7]** Three consecutive outline slides at section boundaries feel redundant — can reduce to 2
- **[LOW-8]** Chapter 3 exponential discounting motivation: add one sentence on why decay is natural
- **[LOW-9]** Asymmetric margins (left 0.8cm, right 5mm) — review for intentionality
- **[LOW-10]** Subfigure widths at 0.42\textwidth could be increased to 0.45\textwidth
- **[LOW-11]** Inconsistent bullet spacing (0.02cm in Ch.1 vs 0.1-0.3cm elsewhere)
- **[LOW-12]** "We derive bounds on the ATT that take the form of intersection-union bounds" — redundant wording; fix to "We derive intersection-union bounds on the ATT"

---

## Recommended Next Steps (Priority Order)

1. **[CRIT-1] Fix overlays** — Split all `\only<>`/`\pause` frames into separate frames. This is a hard rule violation and ~30 min of mechanical work.

2. **[CRIT-2] Add "This Chapter" frames** — One frame per section. Start with Chapter 1 (restore the commented-out block). ~45 min.

3. **[CRIT-3] Develop Chapter 3** — Add Setup frame, formal Proposition, and one example. This is substantive research work, not just slide editing. Requires ~1-2 hours of writing.

4. **[MED-3 through MED-6] Fix grammar/typos** — "Units are drawn", "also fails", "strictly", "Assumptions 1 and 2" — ~10 min total.

5. **[MED-1] Fix caption** — Change "TWFE estimator for the direct effect" to "TWFE estimator for the total effect" on line 720. ~2 min.

6. **[MED-7, MED-17] Rename duplicate frame titles** — Better navigation for the committee. ~15 min.

7. **[MED-8] Bring estimation into main deck** — Extract a 1-frame summary from appendix estimation slides. ~20 min.

8. **[MED-2] Fix D'Haultfœuille spelling** — Replace all instances with the ligature form. ~5 min.

---

## Detailed Reports

- Visual/Layout: `quality_reports/Proposal_visual_audit.md`
- Proofreading: `quality_reports/Proposal_report.md`
- Substance: `quality_reports/Proposal_substance_review.md`
- Pedagogical: `quality_reports/Proposal_pedagogy_report.md`
