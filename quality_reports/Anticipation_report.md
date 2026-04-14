# Proofreading Report: Anticipation.tex
**Date:** 2026-04-12
**Agent:** proofreader

---

## Grammar and Phrasing

### Medium

1. **Frame 1, line 66** — "The Difference-in-Differences (DID) relies on two main assumptions" — article usage is correct, but by convention the acronym is most commonly "DiD" (lowercase 'i') in the literature (Callaway & Sant'Anna 2021; de Chaisemartin & D'Haultfœuille 2020). "DID" is also used (Roth et al. 2023 survey), so this is a style choice, but should be consistent throughout: it appears as "DID" in line 66 and "DID" in line 88. If the authors prefer "DID," keep it; just ensure it's defined on first use and consistent.

2. **Frame 1, line 69** — "No Anticipation Effects (No-AE), often imposed implicitly" — this parenthetical fragment is missing a verb. Suggest: "No Anticipation Effects (No-AE) — often imposed implicitly." Or restructure: "No Anticipation (NA) — typically imposed without explicit justification."

3. **Frame 1, line 77** — "Common practice: drop a few pre-treatment periods potentially affected by anticipation." — This is a sentence fragment presented as a bullet without a verb. Fine for a slide, but note it differs grammatically from the surrounding full-sentence bullets. Consider consistency: either make all bullets fragments or all full sentences.

4. **Frame 1, line 79** — "We don't always know when people start to change behavior in anticipation of a policy." — Informal contraction ("don't") in an academic presentation for expert audiences. Suggest "We do not always know..."

5. **Frame 2, line 88** — "Under the Parallel Trend" — should be "Under Parallel Trends" (plural) to match the established literature term (e.g., "parallel trends assumption").

6. **Frame 2, line 90** — "Propose a bounded-variation assumption" — missing subject. Suggest "We propose a bounded-variation assumption..." or rephrase as "We adopt a bounded sensitivity approach..."

7. **Frame 2, line 93** — "we further assume exponential c-bounded anticipation: \\for some $c \in [0,1)$" — the colon and line break create an awkward read. The phrase "exponential c-bounded anticipation" is non-standard; suggest "exponentially decaying bounded anticipation" or define the term explicitly.

8. **Frame 2, line 94** — "$|AE_{t_0}|\leq c^{|t_0|+1}\cdot |ATT|$ for all $t_0\in \{-T_0,...,-1,0\}$" — the notation $t_0 \in \{-T_0, \ldots, -1, 0\}$ is unusual. If $t_0 = 0$ is the treatment date, the notation should clarify whether $t_0 = 0$ means the treatment period (when AE should be zero by definition) or a pre-treatment period. The inclusion of 0 in this set is potentially confusing.

9. **Frame 3, line 112** — "We construct a misspecification robust bound" — missing hyphen: "misspecification-robust bound."

### Low

10. **Frame 1, line 95** — "(Motivated by the exponential discounting model in Malani and Reif (2015))" — double parentheses: the outer is from the bullet formatting and the inner is the citation. Use `\citep{malani2015}` with natbib or rephrase inline: "...following the exponential discounting model of Malani and Reif (2015)."

11. **Frame 1, line 90** — "(Manski and Pepper, 2018; Roth and Rambachan, 2023)" — citations are in-text without `\cite{}` command. These are hardcoded strings, not bibliography references. The file uses `natbib` but has no `\bibliography{}` call and no `.bib` file referenced. If this is intentional (short conference slide), fine; but if a bibliography is expected, the citations must be linked.

12. **Frame 2, line 97–102** — The "Interpretation" sub-bullet block (lines 97–102) uses `\item[-]` style while the parent bullets use default `\item`. Consistent sub-bullet style throughout would be cleaner.

---

## Notation Consistency

13. **"AE" vs "$AE$"** — the paper mixes roman "AE" (in surrounding text, line 69) with math-mode $AE$ in equations (line 89). Should be consistently $\mathrm{AE}$ in math mode, not italic $AE$.

14. **"ATT" formatting** — "$ATT$" (line 89) is in italic math mode, which is convention for vectors/variables but non-standard for acronyms. Consider $\mathrm{ATT}$ or define as a `\newcommand`.

15. **$c \in [0,1)$ appears twice** — once in line 90 and again in line 93. The second definition in line 93 is for the multi-period extension and should use a different or explicitly re-introduced parameter (e.g., clarify that $c$ is the same sensitivity parameter in both cases, or distinguish them).

---

## Citation Format

16. **No `\bibliography{}` command** — the file declares `\bibliographystyle{apalike}` and `\usepackage{natbib}` but never calls `\bibliography{}`. All citations are hardcoded strings ("Alpert, 2016"; "Malani \& Reif, 2015"; "Manski and Pepper, 2018"; "Roth and Rambachan, 2023"). This is acceptable for a very early draft slide but must be corrected before any formal presentation.

---

## Summary Table

| Category | Critical | Medium | Low |
|----------|----------|--------|-----|
| Grammar / Phrasing | 0 | 7 | 1 |
| Notation Consistency | 0 | 3 | 0 |
| Citation Format | 0 | 0 | 1 |
