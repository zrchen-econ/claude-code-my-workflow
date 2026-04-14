# Research Slide Excellence Review: Anticipation.tex
**Date:** 2026-04-12
**File:** `Slides/dissertation/Anticipation.tex`
**Authors:** Kyunghoon Ban, Zhengrun Chen, Désirée Kédagni

---

## Overall Quality Score: NEEDS WORK

| Dimension             | Critical | Medium | Low |
|-----------------------|----------|--------|-----|
| Visual / Layout       | 0        | 3      | 6   |
| Proofreading          | 0        | 10     | 3   |
| Econometric Substance | 0        | 9      | 5   |
| Research Argument     | 0        | 12     | 3   |
| **TOTALS**            | **0**    | **34** | **17** |

**Interpretation:** 0 critical issues (compilation is clean; no technically false claims). 34 medium issues across all dimensions. This places the talk at the boundary of NEEDS WORK (16–30 medium) / POOR (31+). The medium count is driven by the argument and proofreading dimensions, not fundamental technical errors — the underlying research idea is sound. This is consistent with the slide being a very early draft (outline-level).

---

## Context Note

The current file is 4 slides (title + 3 content). This is not a complete talk — it is a slide outline or abstract. Many of the issues below are structurally unavoidable at this stage. The review is written as if this were being developed into a full 20–45 minute research presentation (job talk, seminar, or conference presentation).

---

## Critical Issues (Fix Before Presenting)

*None.* XeLaTeX compiles cleanly; no undefined citations (citations are hardcoded strings); no overflow.

However, **the following issues make the talk unpresentable in its current state** — they are categorized as "medium" by rubric but are blocking for any real audience:

- No formal result stated anywhere
- No setup/model slide (audience has no framework before seeing bounds)
- No contribution preview slide
- No conclusion that states what was found
- Circular bound ($|AE| \leq c \cdot |ATT|$) not addressed

---

## Medium Issues (Fix Before Next Major Venue)

### Argument Structure (Priority — Fix First)

**M1. Add a contribution preview slide (after Introduction).** State the 2–3 main contributions in 1–3 sentences before showing any technical content. Audiences form their prior about a talk in the first 5 minutes. Example:
> "We show the ATT is partially identified under a relative sensitivity constraint $|AE| \leq c \cdot |ATT|$. The identified set takes a closed form and can be estimated nonparametrically. Our framework nests Rambachan & Roth (2023) as a special case for trend violations."

**M2. Add a Setup/Model slide** before Identification. Define: potential outcomes $Y_t(d)$, the objects $ATT$ and $AE$, the groups and time periods, and what DID estimates. Without this, the bound $\tau^{DID} = ATT - AE$ is unexplained.

**M3. State the formal result.** Add a Proposition or Theorem slide. At minimum: "Under PT and $|AE| \leq c \cdot |ATT|$, the identified set for ATT is $[\ldots, \ldots]$." This is the core deliverable of the paper; a research audience expects to see it.

**M4. Address the circularity of the relative bound.** The bound $|AE| \leq c \cdot |ATT|$ has $|ATT|$ on the right-hand side — the object being identified appears in the constraint. Explain how this is handled: is it reformulated as a constraint on $\tau^{DID}$? Is it solved via fixed-point argument? A seminar audience will notice this immediately.

**M5. Rewrite the Summary slide as a Conclusion.** Replace "we did X / we extend / we illustrate" with "we found X": the form of the identified set, what it implies for the empirical examples, and what the practical takeaway is for applied researchers.

**M6. Add the sign of $AE$ to the Identification slide.** The statement $\tau^{DID} = ATT - AE$ needs clarification: if anticipation is positive ($AE > 0$), standard DID understates ATT. This is the substantive point motivating the whole exercise.

**M7. Differentiate from Rambachan & Roth (2023) explicitly.** They bound PT violations; you bound No-AE violations. State: "Our framework is complementary — researchers can use both." Clarify the connection between the absolute bounds in R&R and the relative bounds here.

**M8. Clarify the Manski & Pepper (2018) connection.** Their bounded-variation assumption is on treatment response, not on anticipation. Explain what specific result or principle from M&P (2018) is being imported.

### Notation and Precision

**M9. Standardize $ATT$, $AE$ notation.** Use $\mathrm{ATT}$ and $\mathrm{AE}$ (roman, not italic) throughout. Define as `\newcommand{\ATT}{\mathrm{ATT}}` in the preamble.

**M10. Fix "Under the Parallel Trend" → "Under Parallel Trends"** (line 88). This is the established literature term.

**M11. Clarify $t_0 \in \{-T_0, \ldots, -1, 0\}$.** Is $t_0 = 0$ the treatment period or the last pre-treatment period? With standard DiD notation ($t=0$ pre, $t=1$ post), $t_0 = 0$ is pre-treatment. State this explicitly.

**M12. Fix missing subject in "Propose a bounded-variation assumption"** → "We propose..."

**M13. Fix contraction "don't" → "do not"** (line 79, academic register).

**M14. Fix "misspecification robust" → "misspecification-robust"** (line 112, missing hyphen).

### Visual / Layout

**M15. Symmetric margins.** Change `text margin right = 5mm` to match `text margin left = 0.8cm`.

**M16. Add frame numbers.** Uncomment `\setbeamertemplate{footline}[frame number]` (line 46). Essential for Q&A navigation.

**M17. Add date and institutional affiliation to title slide.** Add `\date{}` and `\institute{}` for formal presentation contexts.

---

## Low Issues (Polish When Time Allows)

**L1.** Split the Identification slide into two: (a) single-period bound, (b) multi-period exponential extension.

**L2.** Remove duplicate `\usepackage{booktabs}` (lines 22 and 30).

**L3.** Replace hardcoded citation strings with `\cite{}` commands linked to a `.bib` file. Add `\bibliography{../../Bibliography_base}` before `\end{document}`.

**L4.** The sub-bullet "Interpretation" block (lines 97–102) is weak — these three bullets restate what the assumption does rather than explaining the economic intuition. Replace with: "The bound $c = 0$ recovers standard DID; $c \to 1$ makes the bound uninformative. The choice of $c$ is a sensitivity analysis."

**L5.** Remove unused imports: `\ulem`, `\appendixnumberbeamer`, `\subcaption`, `\caption`, `\array`, `\setspace`, `\threeparttable`, `\multirow`, `\tikz` (or keep tikz if diagrams are planned).

**L6.** The double parentheses on line 95 — "(Motivated by... (2015))" — should be reformatted as inline text: "following Malani & Reif (2015)."

**L7.** Consider a more specific title: "Partial Identification of Treatment Effects Under Anticipation in Difference-in-Differences" signals the contribution more clearly than the current generic title.

**L8.** The "Interpretation" sub-bullets say "provides a flexible, nonparametric alternative to fully parametric models" — but this describes the sensitivity analysis interpretation of $c$, not the bound itself. The bound $|AE| \leq c \cdot |ATT|$ is a *parametric* assumption on the magnitude ratio. "Nonparametric" here is misleading; clarify.

---

## Recommended Next Steps

**Immediate (before any formal presentation):**

1. Add Setup/Model slide (define $Y_t(d)$, $ATT$, $AE$, DID estimand)
2. Add Contribution preview slide (3 bullets, before technical content)
3. Add formal result (Proposition box stating the identified set)
4. Address the circular bound: explain identification strategy for $|AE| \leq c \cdot |ATT|$
5. Rewrite Summary as Conclusion (what was found, not what was done)
6. Add frame numbers

**Before major seminar/job talk:**

7. Full 20-slide structure: Introduction (3) → Setup (3) → Identification (4) → Estimation & Inference (3) → Simulation (2) → Application (3) → Conclusion (2)
8. Link all citations to Bibliography_base.bib
9. Add at least one figure (bounds as function of $c$; simulation coverage table; empirical ATT interval)
10. Add misspecification-robust bounds slide with formal statement

---

## Sub-Reports

- Visual audit: `quality_reports/Anticipation_visual_audit.md`
- Proofreading: `quality_reports/Anticipation_report.md`
- Econometric substance: `quality_reports/Anticipation_substance_review.md`
- Research argument: `quality_reports/Anticipation_argument_review.md`
