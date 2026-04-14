# Econometric Substance Review: Anticipation.tex
**Date:** 2026-04-12
**Agent:** domain-reviewer

---

## Overview

This is a 3-content-slide presentation on partial identification of the ATT under violations of the No-Anticipation assumption in Difference-in-Differences. The framework introduces a bounded-sensitivity approach where anticipation effects are constrained to be a fraction $c$ of the ATT, and extends to multiple pre-treatment periods via exponential decay. The substance is reviewed against DiD and partial identification literatures.

---

## Claim-by-Claim Analysis

### Frame 1 (Introduction)

**Claim:** "The Difference-in-Differences (DID) relies on two main assumptions: Parallel Trends (PT) and No Anticipation Effects (No-AE), often imposed implicitly."

- **Assessment: Correct, but incomplete.** This is the standard two-assumption presentation (Callaway & Sant'Anna 2021; Roth et al. 2023 survey). However, there are additional regularity conditions (overlap, SUTVA) that are not mentioned. For a research audience, explicitly noting this is the simplified characterization would be appropriate.

**Claim:** "Healthcare utilization decreases before Medicaid expansion (Alpert, 2016)"

- **Assessment: Check required.** Alpert (2016) finds *decreases* in ER use before Medicaid expansion. This is consistent with anticipatory behavior (people delay costly care). The direction "decreases" is plausible but should be verified against the specific outcome (ER visits vs. other utilization). Presenting this as "utilization decreases" without specifying the outcome is imprecise.

**Claim:** "Physician labor supply increases before tort reform (Malani & Reif, 2015)"

- **Assessment: Correct.** Malani & Reif (2015) document physician supply responses that precede tort reform implementation. This is the primary motivation for their exponential discounting model.

---

### Frame 2 (Identification)

**Claim:** "Under the Parallel Trend, the standard DID estimand identifies the ATT net of the AE: $\tau^{DID} = ATT - AE$"

- **Assessment: Correct decomposition, notation needs precision.** This decomposition is well-known (see Malani & Reif 2015, eq. 1; also implicit in Rambachan & Roth 2023 framework). The equation is correct. However:
  - $AE \equiv \mathbb{E}[Y_0(1) - Y_0(0) \mid D=1]$ — the potential outcome notation $Y_0(1)$ vs $Y_0(0)$ uses period subscripts differently from standard DiD notation. In standard DiD notation (Callaway & Sant'Anna 2021), $Y_t(d)$ means period $t$, dose $d$. Here $Y_0(1)$ appears to mean "period 0 (pre), under dose 1 (treated)" vs "period 0 (pre), under dose 0 (control)." The $D=1$ conditioning refers to the treatment group. This notation is internally consistent but **non-standard** — the more common definition of anticipation effect uses $\mathbb{E}[Y_{i,pre}(1) - Y_{i,pre}(0) \mid D=1]$. Should be defined explicitly to avoid confusion.
  - The sign of $AE$: if anticipation causes pre-treatment outcomes to rise (people change behavior), then $AE > 0$ and $\tau^{DID} = ATT - AE < ATT$, meaning DID *understates* the ATT. The slide does not clarify the sign, which is essential for understanding whether DID over- or under-estimates.

**Claim:** "Propose a bounded-variation assumption: for some $c \in [0,1)$, $|AE| \leq c \cdot |ATT|$"

- **Assessment: Correct but needs clarification on connection to cited papers.** 
  - Manski and Pepper (2018) introduce monotone treatment response and monotone treatment selection bounds — not exactly "bounded variation" in the sense used here. The connection should be made explicit: what specific result from Manski & Pepper motivates this functional form?
  - Rambachan & Roth (2023) bound *violations of parallel trends* (not anticipation effects per se) using a sensitivity parameter $M$ where $|\Delta_{pre}| \leq M$. The analogy is clear but the mapping should be stated: the sensitivity parameter $c$ here is analogous to $\bar{M}$ in Rambachan & Roth, but applied to anticipation rather than trend violations.
  - The constraint $|AE| \leq c \cdot |ATT|$ is a *relative* bound (AE bounded as fraction of ATT), whereas Rambachan & Roth use an *absolute* bound. This distinction is important and non-trivial — the relative bound creates identification challenges because the constraint depends on the very object being bounded.

**Claim:** "exponential c-bounded anticipation: $|AE_{t_0}| \leq c^{|t_0|+1} \cdot |ATT|$ for all $t_0 \in \{-T_0, \ldots, -1, 0\}$"

- **Assessment: Notation issue and potential logical issue.**
  - The exponent $c^{|t_0|+1}$ evaluated at $t_0 = 0$ gives $c^1 = c$, so the bound at $t_0=0$ (the treatment period) is $|AE_0| \leq c \cdot |ATT|$. This matches the single-period assumption on the previous bullet. Consistent.
  - At $t_0 = -1$: $c^2 \cdot |ATT|$ — anticipation effect one period before treatment is bounded by $c^2 |ATT|$. Since $c < 1$, the bound is smaller for earlier pre-treatment periods. This is economically sensible (anticipation decays further from treatment date).
  - **Potential issue:** Including $t_0 = 0$ in the set $\{-T_0, \ldots, -1, 0\}$ is ambiguous. Is $t_0 = 0$ the treatment period or the last pre-treatment period? In standard DiD notation, $t=0$ is pre-treatment and $t=1$ is post-treatment. If $t_0 = 0$ is the last pre-treatment period, then the bound at $t_0 = 0$ gives $|AE_0| \leq c \cdot |ATT|$, matching the single-period case. This needs to be stated explicitly.
  - Motivated by Malani & Reif (2015): correct — their exponential discounting model $AE_t = \delta^t \cdot AE_0$ motivates this form. Citation is appropriate.

---

### Frame 3 (Summary)

**Claim:** "We derive bounds on the ATT that take the form of intersection-union bounds"

- **Assessment: Technically correct but worth unpacking.** Intersection-union (IU) bounds arise when identification requires multiple constraints to hold simultaneously. In this context, the bounds from the single-period and multi-period assumptions, when intersected, tighten the identified set. The use of "intersection-union" terminology is appropriate (Beresteanu & Molinari 2008; Chesher & Rosen 2017). However, for a seminar audience, a brief intuition would help — what is being intersected, and what is being unioned?

**Claim:** "We construct a misspecification robust bound for scenarios where researchers do not know whether the PT or No-AE assumption is the one failing."

- **Assessment: This is the most novel claim but least developed on the slide.** This idea — that both PT and No-AE could be violated and one needs bounds that are robust to which one is failing — is interesting and potentially important. However:
  - No formal statement of what "misspecification robust" means here.
  - No clarification of whether both PT and No-AE can fail simultaneously or only one at a time.
  - The slide does not state what additional structure is needed for this to be possible (point identification vs. partial identification).

**Claim:** "We extend the framework to staggered adoption design"

- **Assessment: Plausible but no details.** Staggered adoption with anticipation is an active area (Callaway & Sant'Anna 2021 handle staggered but assume no-AE; Ban et al. is extending this). The claim is credible but the slide gives no indication of how the framework extends — is the $c$-bound applied to each cohort separately? Are the bounds group-time specific?

---

## Missing Elements for a Research Audience

1. **No identification result stated formally.** The summary says "we derive bounds" but nowhere is the identified set $[\underline{ATT}(c), \overline{ATT}(c)]$ written down.

2. **No discussion of what assumptions are needed for bounds to be informative.** Under what conditions does the identified set shrink to a point? When is the bound uninformative (i.e., trivially satisfied for all $c$)?

3. **No discussion of the sign normalization problem.** The bound $|AE| \leq c \cdot |ATT|$ involves $|ATT|$ which is unknown — this creates a circular constraint. The identification argument must handle this. It is not addressed.

4. **No discussion of estimation or inference.** The Summary slide mentions two empirical examples but nothing about how $c$ is chosen, how bounds are estimated, or how confidence intervals are constructed.

5. **No connection to the "partial identification" literature beyond Manski & Pepper and Rambachan & Roth.** Sharp partial identification results in DiD with violations (e.g., Masten & Poirier 2020 on violations of unconfoundedness; de Chaisemartin 2017 on IV with anticipation) are not cited.

---

## Summary Table

| Category | Critical | Medium | Low |
|----------|----------|--------|-----|
| Identification claims | 0 | 3 | 1 |
| Notation precision | 0 | 2 | 1 |
| Citation fidelity | 0 | 1 | 1 |
| Missing elements | 0 | 3 | 2 |
