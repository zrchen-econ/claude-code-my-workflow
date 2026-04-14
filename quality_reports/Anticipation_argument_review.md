# Research Argument Review: Anticipation.tex
**Date:** 2026-04-12
**Reviewer:** inline (research argument agent)

---

## 3.1 Motivation and Problem Statement

**Score: Partial**

**Strengths:**
- The research question is clearly stated: "Identify the ATT while allowing for violations of the No-AE assumption" (Frame 1, line 82). This is a well-scoped problem.
- Two concrete empirical examples of anticipation effects are given (Alpert 2016; Malani & Reif 2015), which provide real-world grounding.

**Weaknesses:**
- The literature gap is stated only implicitly. The slide says anticipation "often imposed implicitly" but does not say: *what does the current literature offer for this problem, and why is it insufficient?* A seminar audience would ask: "What's wrong with just dropping pre-treatment periods?" The slide gives one sentence (lines 78–80) but it is buried in sub-bullets, not foregrounded as the gap.
- No discussion of *why* identifying the ATT is important when anticipation is present — is the ATT useful under anticipation, or does the presence of anticipation change the policy-relevant object?
- The motivation does not connect to any economist's standard welfare or policy concern. The talk would be strengthened by one sentence like: "Failing to account for anticipation leads us to attribute behavioral responses to treatment when they occur before treatment — biasing program evaluations."

---

## 3.2 Contribution Clarity

**Score: Weak**

**Issues:**
- The contributions appear only in the Summary slide (Frame 3), which is placed *after* the Identification slide. For a research talk, the main contributions should be stated early (slides 2–4), before technical content, with a preview of results.
- The Summary slide lists 4 contributions in bullet form, but they are not ranked or distinguished. Which is the main result? Which is an extension? Audiences remember 1–2 key contributions; 4 undifferentiated bullets dilutes impact.
- No comparison to prior work. The slide says "we derive bounds" but does not say: "Rambachan & Roth bound violations of PT; we bound violations of No-AE — these are complementary" or "Unlike approaches that drop pre-treatment periods, our bounds are informative for all periods." Differentiation from prior work is absent.
- Potential overclaiming: "misspecification robust bound for scenarios where researchers do not know whether the PT or No-AE assumption is the one failing" — this is a strong claim (it implies bounds are valid even when the researcher does not know which assumption fails). The conditions under which this holds are not stated.

---

## 3.3 Argument Flow and Narrative Arc

**Score: Poor**

**Issues:**
- The current structure is: **Introduction → Identification → Summary.** This is unusual. The standard arc for a research talk is: Motivation → Contribution preview → Setup → Main result → Evidence/simulation → Implications/conclusion. This talk is missing the contribution preview, setup/model, and evidence sections entirely.
- There is no road map slide. With only 3 content slides the talk is too short to need a full road map, but there is also not enough signal to tell the audience where the talk is going.
- The Identification slide appears before the Setup/Model slide — the audience sees bounds without knowing the formal objects being bounded ($ATT$, $AE$, the potential outcome framework).
- The Summary slide is placed at the end, which is correct, but it announces contributions that were never developed — the staggered adoption extension and two empirical examples are mentioned in the Summary but not in the body of the talk.
- **Diagnosis:** This is a talk outline or abstract rendered as slides, not a developed presentation. Key slides are missing:
  - A contribution/preview slide (after Introduction)
  - A Setup/Model slide (before Identification)
  - At least one slide with a formal result (theorem or proposition)
  - A simulation or application slide
  - A conclusion/takeaway slide

---

## 3.4 Claim Precision and Caveats

**Score: Weak**

**Issues:**
- The main result — bounds on ATT — is never formally stated. The audience is told bounds exist but not given their form. A single line like "$ATT \in [\tau^{DID}/(1+c),\, \tau^{DID}/(1-c)]$" (or the correct formula) would communicate the result precisely.
- The boundary between "what is proved" and "what is assumed" is blurry on the Identification slide. The $c$-bound is described as both an assumption and a "flexible, nonparametric alternative." It is an assumption — calling it an alternative could be misleading.
- No statement of the assumptions under which the bounds are sharp (attainable).
- The sign of $AE$ matters for whether DID over- or under-estimates ATT, but the slide does not address this.
- No robustness discussion: what happens when $c = 0$? (Should reduce to standard DID.) What happens when $c \to 1$? (Bounds should become uninformative.) Neither limiting case is stated.

---

## 3.5 Seminar Audience Navigation

**Score: Poor**

**Issues:**
- No road map slide.
- No "punchline" slide. A distracted audience member who looks up at slide 3 (Identification) sees a technical equation with sensitivity bounds but has no way to understand the key takeaway.
- The Conclusion (Summary) slide does not state *what was found* — it states *what was done* ("We derive bounds," "We extend," "We illustrate"). A conclusion slide should say: "Allowing for anticipation, the ATT is partially identified. For reasonable values of $c$, the Medicaid expansion ATT estimate remains economically significant even under moderate anticipation."
- No appendix slides are referenced or offered for the Q&A.
- The title slide has no date or institutional affiliation. For a job talk or conference, this is a presentation identity gap.
- The talk title "Anticipation Effects in Difference-in-Differences Design" is accurate but generic. A more specific title would signal contribution: "Partial Identification of Treatment Effects Under Anticipation in Difference-in-Differences."

---

## Overall Argument Assessment

This is clearly an early-stage draft or outline — the technical framework is interesting and the identification approach (relative bounded anticipation) is novel, but the presentation is not yet structured as a research talk. It reads more like a 10-minute conference abstract presented as slides. The key missing elements are:

1. Contribution preview slide (before technical content)
2. Setup/model slide (before identification)
3. Formal result statement (at least one numbered proposition or theorem)
4. Evidence/simulation slide
5. Structured conclusion (what was found, not what was done)
6. Road map

The identification idea itself — bounding $|AE|$ as a fraction of $|ATT|$ and using exponential decay for multiple periods — is economically motivated and methodologically interesting. The challenge is that the circular nature of the bound ($|ATT|$ appears on both sides of the constraint) needs to be addressed explicitly for a research audience.

---

## Saved to
`quality_reports/Anticipation_argument_review.md`
