# Substance Review: Slides/dissertation/Proposal.tex
**Date:** 2026-04-13
**Agent:** domain-reviewer (econometrics / causal inference)
**Context:** Dissertation proposal — three chapters reviewed for research argument, committee readiness, identification logic, and feasibility signaling.

---

## Summary

| Dimension | Critical | Medium | Low |
|-----------|----------|--------|-----|
| Research argument | 1 | 3 | 2 |
| Identification logic | 0 | 2 | 2 |
| Notation/econometrics | 0 | 2 | 1 |
| Feasibility / proposal framing | 1 | 2 | 1 |

---

## Chapter 1: CiC with Time-Varying Continuous Treatment

### CRITICAL: No "This Paper" slide — gap between motivation and setup
**Issue:** After two Motivation frames and one Related Literature frame, the deck jumps directly into Setup. There is no "This Paper" or "Contribution" slide that states in one place: (1) what setting is studied, (2) what the main assumption is, and (3) what is identified. The commented-out `% \begin{frame}{This Paper}` block on lines 137–152 reveals this was planned but removed. For a dissertation proposal, the committee needs a clear upfront statement of contribution before technical details.
**Severity:** Critical — committee members who are not in your subfield will be lost by the Assumptions slides without this anchor.
**Fix:** Restore or rewrite the "This Paper" frame. Minimum content: setting (panel, 2 periods, continuous D), main new assumption (copula stability), and main result (point identification of F_{Y_1(d)}).

### MEDIUM: Section 1 ends with only two "To Do" items
**Issue:** The "To Do List" frame (lines 497–503) lists only "Estimation and Inference" and "Empirical Application" — two of the three main chapters of any empirical econometrics paper. This signals that less than half the project is done. For a proposal, this is acceptable, but the frame should present a timeline or describe the approach/progress on estimation.
**Fix:** Add 1-2 sentences on the proposed estimation strategy (kernel-based, as shown in the Appendix estimation slides) and note the empirical application context (MPC? EITC?). The Appendix already has two detailed estimation frames — move abbreviated versions to the main deck.

### MEDIUM: Assumption 5 (Gaussian copula) — limited discussion of plausibility
**Issue:** The Discussion frame (lines 350–357) has three bullets but the most important question — "Why Gaussian?" — is answered only by reference to Local Gaussian Representation (in appendix). For a committee audience that includes skeptics of copula modeling, the main deck should include a brief intuition or empirical test, not just an appendix button.
**Fix:** Add one bullet explaining: "Gaussian copula is the simplest parametric choice that allows dependence; it nests independence (rho=0). Testable with 3+ periods." Currently the testability claim is in the frame but the nesting of independence is implicit.

### MEDIUM: Identification Proposition missing "up to rho" nuance
**Issue:** Lines 412–415 state the Proposition as: "Under Assumptions 1-5, F_{Y_1(d)}(y) and rho_d are identified." The identification is joint — rho_d is recovered as part of the identification argument, not separately assumed known. This is a strength of the approach and should be highlighted explicitly ("both the counterfactual distribution AND the correlation parameter are jointly identified from observables"). Currently it reads as if rho is a nuisance parameter.
**Fix:** Add a brief annotation or remark after the Proposition noting the joint identification as a feature.

### LOW: Example 1 uses undeclared variable eta_it vs nu_it
**Issue:** Line 365: `$\varepsilon_{it},\eta_{it}$ are independent idiosyncratic shocks` but the equation on line 363 uses `\nu_{it}` (not `\eta_{it}`) for D_it's shock. There is a mismatch between the equation and the description. The equation uses `\nu_{it}` but the description says `\eta_{it}`.
**Fix:** Standardize — either use `\nu_{it}` in both equation and description, or `\eta_{it}` in both. Check against Paper/main.tex convention.

### LOW: Example 2 — no explicit verification that Assumptions 1-5 hold
**Issue:** Example 2 (linear random coefficient model, lines 370–378) states the model but does not verify which assumptions are satisfied. The audience cannot assess whether the Gaussian copula assumption (A5) holds in this linear model. For completeness, add "(Assumptions 1-4 hold; A5 holds when (epsilon, nu) are jointly normal)".

---

## Chapter 2: DiD with Mediators

### MEDIUM: Setup frame relies heavily on linearity — limits shown
**Issue:** The structural equations (lines 637–642) are linear: Y_it = theta_i * t * D_i + beta_it * M_it + lambda_i + eta_t + U_it. This is a semi-linear model, and the identification results (Propositions 1 and 2) exploit this structure. The slides present this as a general DiD-with-mediators framework, but it is specific to the additive separable linear model. A committee member specializing in nonparametric identification may push back.
**Fix:** Add one sentence acknowledging linearity as sufficient but not necessary, and note where results extend to nonlinear settings (if they do). If they don't, be explicit that the framework is linear.

### MEDIUM: Proposition 2 identification of E[beta_i1] — requires further explanation
**Issue:** Lines 834–837: Proposition 2 recovers E[beta_i1] as the ratio (tau^DiD - ADTT) / E[alpha_i]. The denominator is E[Delta M_i | D=1] - E[Delta M_i | D=0], assumed nonzero. The numerator is tau^DiD - E[tau^DiD(M_i1,M_i0)|D_i=1]. The slide presents the formula but does not explain the economic interpretation: E[beta_i1] is the average effect of the mediator on the outcome (conditional on period t=1), recovered from the "unexplained" portion of the total ATT. This is the key economic content of the chapter.
**Fix:** Add one sentence interpretation after the formula.

### LOW: "Bad controls" citation — Pearl (1995) year may be wrong
**Issue:** Line 583 cites "Pearl, 1995" for bad controls. The bad controls discussion in Pearl's work is from "Causality" (2000/2009) and the specific bad controls language was popularized by Angrist and Pischke (2009). Pearl (1995) refers to d-separation results. The year 1995 may be incorrect.
**Fix:** Verify citation. Consider citing Pearl (2000) or Angrist and Pischke (2009) directly for the "bad controls" terminology.

---

## Chapter 3: Anticipation Effects in DiD

### CRITICAL: Chapter 3 is significantly underdeveloped for a proposal
**Issue:** The entire third chapter is presented in two frames: "Introduction" (11 bullet items) and "Identification" (5 bullet items), followed by a 4-bullet "Summary." There are no formal assumptions, no propositions, no examples, no simulations shown. For a dissertation proposal, all three chapters need roughly equal rigor. Chapter 3 reads as an abstract sketch, not a chapter.
**Fix:** Add at minimum: (1) a formal Setup/Notation frame defining the key objects (ATT, AE, bounding assumption), (2) a Proposition frame stating the partial identification result (the bounds), and (3) one applied example frame. The identification frame (lines 1017–1036) contains multiple ideas but presents them as bullets without formal statements.

### MEDIUM: c-bounded anticipation assumption — clarify the direction
**Issue:** Line 1021: `|AE| \leq c * |ATT|` — the bound is in terms of the absolute values. The identification direction matters: does this assume AE and ATT have the same sign? If AE > 0 and ATT > 0, the bound implies tau^DID = ATT - AE >= ATT(1-c). But if they have opposite signs, the bound may be vacuous. This subtlety is important and is not addressed.
**Fix:** Add one sentence: "We further assume AE and ATT have the same sign (anticipation drives outcomes in the same direction as treatment)."

### LOW: Exponential discounting model reference not fully explained
**Issue:** Line 1026: "Motivated by the exponential discounting model in Malani and Reif (2015)" — the motivation is stated but not explained in the slides. An audience member unfamiliar with Malani and Reif cannot follow why exponential decay of AE is reasonable.
**Fix:** Add one sentence: "Agents discount future policy benefits at rate (1-c) per period, so further-in-advance anticipation effects are smaller."

---

## Overall Research Argument Assessment

**Chapter 1 (CiC continuous treatment):** The identification logic is sound. The copula stability assumption is a natural extension of the CiC framework, and the joint identification of F_{Y_1(d)} and rho_d from two-period panel data is a genuine contribution. The main weakness in the slides is the missing "This Paper" frame and the thin coverage of estimation/application in the main deck.

**Chapter 2 (Mediators in DiD):** The framework is technically clear and the conditional DiD strategy for direct effects identification is elegant. The empirical application (Howard and Ornaghi 2021) grounds the theory well. The main limitation is the linearity of the model and the need to be upfront about this.

**Chapter 3 (Anticipation):** Significantly underspecified for a proposal. The core idea (bounded-variation + exponential decay) is promising, but without formal propositions the committee cannot evaluate whether this is a paper or a remark.

**Feasibility verdict:** Chapter 1 is closest to completion (theory done, estimation in appendix). Chapter 2 has an empirical application, strengthening feasibility. Chapter 3 needs substantial development before the committee will approve it as a standalone chapter.
