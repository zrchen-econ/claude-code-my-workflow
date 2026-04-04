---
paths:
  - "Paper/**/*.tex"
  - "Slides/**/*.tex"
  - "Quarto/**/*.qmd"
  - "scripts/**/*.R"
---

# Project Knowledge Base: Changes-in-Changes with Continuous Treatment

<!-- Read this before creating or modifying any paper content, slides, or R code.
     Notation is locked — ask before introducing any new symbol not listed here. -->

---

## Notation Registry

| Rule | Convention | Example | Anti-Pattern |
|------|-----------|---------|-------------|
| Potential outcomes | $Y_{gt}(d)$: group $g$, time $t$, dose $d$ | $Y_{01}(d)$ = control group at $t=1$ | $Y(d,t)$, $Y_{it}(d)$ |
| Observed outcome | $Y_{gt}$ (no dose argument) | $Y_{11}$ | $Y_{it}$, $y_{gt}$ |
| CDF of potential outcome | $F_{Y_{gt}(d)}$ | $F_{Y_{01}(d)}(\cdot)$ | $F_d(\cdot)$, $F^d(\cdot)$ |
| CDF of observed outcome | $F_{Y_{gt}}$ | $F_{Y_{11}}(y)$ | $F_{gt}(y)$ |
| Quantile function | $Q_{Y_{gt}}(\tau) = F_{Y_{gt}}^{-1}(\tau)$ | $Q_{Y_{01}}(0.5)$ | $q(\tau)$, $F^{-1}(\tau)$ without subscript |
| Treatment variable | $D \in \mathcal{D} \subseteq \mathbb{R}$ (continuous) | $D \in [0,1]$ | $T$ for treatment (reserved for time) |
| Treatment support | $\mathcal{D} = [\underline{d}, \bar{d}]$ | $[0, \bar{d}]$ | $[d_{min}, d_{max}]$ |
| Time periods | $t \in \{0, 1\}$: $t=0$ pre, $t=1$ post | — | $t \in \{pre, post\}$ |
| Groups | $g \in \{0, 1\}$: $g=0$ control, $g=1$ treated | — | $g \in \{C, T\}$ |
| Rank of outcome | $U = F_{Y_{g0}(0)}(Y_{g0}(0))$ | $U \sim \text{Uniform}[0,1]$ | $\epsilon$, $u_i$ |
| Rank of treatment | $V = F_{D_{g1}}(D_{g1})$ | $V \sim \text{Uniform}[0,1]$ | $\eta$, $v_i$ |
| Copula | $C(u, v)$: joint distribution of $(U, V)$ | Gaussian copula | $H(u,v)$ |
| ASF | $\text{ASF}(d) = E[Y(d)]$ | $\text{ASF}(d) = \int Q_{Y(d)}(\tau)\,d\tau$ | $\beta(d)$, $m(d)$ |
| QSF | $\text{QSF}(\tau, d) = Q_{Y(d)}(\tau)$ | $\text{QSF}(0.5, d)$ = median PO at dose $d$ | $q(\tau, d)$ |
| Counterfactual CDF | $F_{Y_{11}(d)}$ = CDF we want to identify | — | $F^*_d$ |

---

## Symbol Reference

| Symbol | Meaning | Introduced |
|--------|---------|------------|
| $Y_{gt}(d)$ | Potential outcome for group $g$ at time $t$ under dose $d$ | Setup |
| $Y_{gt}$ | Observed outcome | Setup |
| $F_{Y_{gt}(d)}$ | CDF of potential outcome | Setup |
| $Q_{Y_{gt}}(\tau)$ | $\tau$-quantile of outcome distribution | Setup |
| $D$ | Continuous treatment variable | Setup |
| $\mathcal{D}$ | Support of treatment | Setup |
| $U$ | Rank of baseline potential outcome $Y(0)$ | Core Assumption |
| $V$ | Rank of treatment $D$ | Core Assumption |
| $C(u,v)$ | Copula linking $(U, V)$ | Core Assumption |
| $\text{ASF}(d)$ | Average Structural Function at dose $d$ | Objects of Interest |
| $\text{QSF}(\tau, d)$ | Quantile Structural Function | Objects of Interest |
| $\Delta(d)$ | Treatment effect at dose $d$ (vs. $d=0$) | Objects of Interest |
| $\Pi_{g,t}$ | Probability of group $g$ at time $t$ | Identification |
| $\hat{F}$ | Nonparametric estimator of a CDF | Estimation |
| $h$ | Bandwidth parameter | Estimation |
| $B$ | Number of bootstrap replications | Inference |

---

## Paper Section Progression

| # | Section | Core Question | Key Assumption | Key Result |
|---|---------|--------------|----------------|------------|
| 1 | Introduction | Why extend CiC to continuous $D$? | — | Gap + contribution |
| 2 | Setup | What are the objects of interest ($\text{ASF}$, $\text{QSF}$)? | Panel, continuity | Formal definitions |
| 3 | Identification | When is $F_{Y_{11}(d)}$ point-identified? | CiC + copula stability | Main identification theorem |
| 4 | Estimation | How do we estimate $\text{ASF}$ and $\text{QSF}$? | Smoothness, bandwidth | Estimator and consistency |
| 5 | Inference | Valid confidence intervals? | Bootstrap validity | CI coverage theorem |
| 6 | Simulations | Does the estimator work in finite samples? | DGP matching assumptions | Coverage, bias, RMSE tables |
| 7 | Application | Real-world illustration | Data-dependent | Empirical ASF/QSF estimates |

---

## Key Papers

| Paper | Key Contribution | How We Use It |
|-------|-----------------|---------------|
| Athey & Imbens (2006) | CiC with binary treatment; rank invariance | Foundation — we extend to continuous $D$ |
| Callaway & Sant'Anna (2021) | Staggered DiD with heterogeneous effects | Comparison / related framework |
| de Chaisemartin & D'Haultfœuille (2020) | Staggered/continuous treatment DiD | Comparison — different assumptions |
| Melly & Santangelo (2015) | Changes-in-changes with covariates | Extension direction |
| Firpo, Fortin & Lemieux (2009) | RIF regression, distributional effects | Distributional methods comparison |
| Chernozhukov & Hansen (2005) | IV quantile regression | Related identification approach |
| Vuong & Xu (2017) | Nonparametric identification via copulas | Methodological precedent |
| Sklar (1959) | Copula representation theorem | Mathematical foundation |

---

## Identification Anti-Patterns (Do Not Do This)

| Anti-Pattern | What Goes Wrong | Correct Approach |
|-------------|----------------|-----------------|
| Conflating rank invariance with rank similarity | Rank invariance is exact ($U_{t=0} = U_{t=1}$); rank similarity is approximate — they imply different identification results | State precisely which holds and at which time period |
| Applying binary CiC monotonicity to continuous $D$ | Binary CiC assumes $Y(1) \geq Y(0)$ a.s. — with continuous $D$ this becomes a functional monotonicity condition | Specify: monotone in $d$ pointwise a.s., or a.s. in $d$? |
| Confusing copula stability with copula ignorability | Copula stability: $C_{t=0} = C_{t=1}$. Copula ignorability: $U \perp D$. These are very different assumptions | Use the correct term and verify which suffices for ID |
| Using $F^{-1}$ for non-strictly-monotone CDFs without comment | Quantile inversion can be set-valued; standard notation assumes continuous $Y$ | State continuity assumption on $Y$ explicitly if using $Q = F^{-1}$ |
| Calling $\text{ASF}(d)$ a causal effect without qualification | $\text{ASF}(d) = E[Y(d)]$ is a structural object — it's a causal effect only after identification holds | Use "structural function" and state identification assumptions explicitly |

---

## R Code Pitfalls

| Bug | Impact | Fix |
|-----|--------|-----|
| `quantile()` default `type=7` gives interpolated quantile | Mismatch with theoretical $F^{-1}$ for empirical CDF | Use `type=1` (empirical inverse) or `type=2` for consistency with theory |
| `ecdf(x)(y)` is left-continuous | Inconsistency with right-continuous CDF convention | Document convention; use `Vectorize(ecdf(x))(y)` carefully or implement manually |
| Bandwidth $h \to 0$ too fast in finite samples | Quantile estimator has high variance | Always plot density estimate alongside MC results; check $h$ sensitivity |
| Missing `monotone.fn` enforcement on estimated CDFs | Estimated $\hat{F}$ can be non-monotone due to smoothing | Apply isotonic regression (`isoreg()`) or rearrangement after estimation |
| `parallel::mclapply` ignores `set.seed()` | Non-reproducible MC results across runs | Use `set.seed()` inside each worker via `RNGkind("L'Ecuyer-CMRG")`; document |
| Storing full simulation output in RAM | Memory exhaustion for large $B$ | Save each MC rep result incrementally to `.rds`; aggregate at end |
