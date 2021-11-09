---
layout: page
title: course schedule
description: schedule, with links to slides and homeworks
---

The (Rmarkdown) source code for these lectures is available at [the github repository](https://github.com/UO-Biostats/UO_ABS),
or by replacing the `.slides.html` suffix with `.Rmd` in the link below;
the slides are made using [reveal.js](https://github.com/hakimel/reveal.js/).
Here are the slides from
[Fall 2020/Winter 2021](2020_schedule.html),
[Fall 2019/Winter 2020](2019_schedule.html),
and [Fall 2018/Winter 2019](2018_schedule.html).

Below:
- [Fall 2021](#fall-2021)
- [Winter 2022](#winter-2022)


# Fall 2021

Week 1 (*9/29*)

: Overview of data science - description and estimation, uncertainty and simulation,
    with examples for comparing means and linear regression; smoothing.

    - Slides: Reminders of [COVID policies](../CLASS_MATERIALS/Lectures/covid_uo_slides.pdf)
    - Slides: [Introduction](../CLASS_MATERIALS/Lectures/Week_01_Introduction.slides.html)
    - Slides: [Hypothesis testing and p-values](../CLASS_MATERIALS/Lectures/Week_01_p_values.slides.html)
    - Slides: [The t distribution](../CLASS_MATERIALS/Lectures/Week_01_t_distribution.slides.html)
    - Slides: [The central limit theorem](../CLASS_MATERIALS/Lectures/Week_01_central_limit_theorem.slides.html)
    - [In-class coding](../CLASS_MATERIALS/Lectures/Week_01_in_class.Rmd)
    - [Homework 1](../CLASS_MATERIALS/Homeworks/HW01.html) *(due 10/7)*
    - [how to git the slide source](using-git.html)
    - Reading: Quinn & Keough chapters 1-4

Week 2 (*10/6*)

: Analysis of Variance (ANOVA) and experimental design; tidy data; power and false positives

    - Slides: [Confidence intervals](../CLASS_MATERIALS/Lectures/Week_02_Confidence_Intervals.slides.html)
    - Slides: [Experimental design](../CLASS_MATERIALS/Lectures/Week_02_Experimental_design.slides.html)
    - Slides: [Analysis of Variance](../CLASS_MATERIALS/Lectures/Week_02_ANOVA.slides.html)
    - [In-class coding](../CLASS_MATERIALS/Lectures/Week_02_in_class.Rmd)
    - [Homework 2](../CLASS_MATERIALS/Homeworks/HW02.html) *(due 10/14)*
    - Reading: Quinn & Keough chapters 5, 7, 8

Week 3 (*10/13*)

: Plotting/visualization, and permutation/bootstrapping

    - Slides: [Permutation tests](../CLASS_MATERIALS/Lectures/Week_03_Permutation_tests.slides.html)
    - Slides: [Tidy data](../CLASS_MATERIALS/Lectures/Week_03_Tidy_data.slides.html)
    - Slides: [The bootstrap](../CLASS_MATERIALS/Lectures/Week_03_Bootstrap.slides.html)
    - [Homework 3](../CLASS_MATERIALS/Homeworks/HW03.html) *(due 10/21)*
    - Reading: Quinn & Keough chapter 9

Week 4 (*10/20*)

: Multivariate ANOVA, regression, least-squares likelihood

    - Slides: [Visualization](../CLASS_MATERIALS/Lectures/Week_04_Visualization.slides.html)
    - Slides: [Multivariate ANOVA](../CLASS_MATERIALS/Lectures/Week_04_Multivariate_ANOVA.slides.html)
    - Slides: [Formulas](../CLASS_MATERIALS/Lectures/Week_04_Formulas.slides.html)
    - [Homework 4](../CLASS_MATERIALS/Homeworks/HW04.html) *(due 10/28)*
    - Reading: Quinn & Keough chapter 6

Week 5 (*10/27*)

: Model selection; random effects and mixed models - a first look.

    - Slides: [Linear models and least squares](../CLASS_MATERIALS/Lectures/Week_05_Linear_models.slides.html)
    - Slides: [Random effects](../CLASS_MATERIALS/Lectures/Week_05_Random_effects.slides.html)
    - Homework: [peer review](peer_reviews.html) (see Canvas for assignment)
    - Reading: Quinn & Keough chapter 13

Week 6 (*11/3*)

: Multiple testing, error rates, and some history.

    - Slides: [Multiple testing](../CLASS_MATERIALS/Lectures/Week_06_Multiple_testing.slides.html)
    - Slides: [Statistics and eugenics](../CLASS_MATERIALS/Lectures/Week_06_Statistics_and_eugenics.slides.html)
    - Slides: [A note on P-value thresholds](../CLASS_MATERIALS/Lectures/Week_06_P_threshold.slides.html)
    - [Homework 6](../CLASS_MATERIALS/Homeworks/HW06.html) *(due 11/12)*
    - install [Stan](https://mc-stan.org)

Week 7 (*11/10*, no class Thursday)

: Introduction to Bayesian statistics

    - Slides: [Prior distributions](Week_07_Prior_distributions.slides.html)
    - Slides: [Probability rules](Week_07_Probability_rules.slides.html)
    - Slides: [The Beta distribution](Week_07_Beta_distribution.slides.html)
    - Slides: [Posterior sampling with MCMC](Week_07_Posterior_sampling.slides.html)
    - [Homework 7](../CLASS_MATERIALS/Homeworks/HW07.html) *(due 11/18)*
    - Reading: Kruschke, chapters 1, 2, 4, 5, 6, 7

Week 8 (*11/17*)

: Bayesian hierarchical modeling - shrinkage, and sharing power

    - Reading: Kruschke, chapters 9, 10

Week 9 (*11/24*, no class Thursday)

: Logistic models, and sharing power

    - Reading: Kruschke, chapters 13, 21

Week 10 (*12/1*)

: Robust linear models; Generalized Linear Models (GLMs).

    - Reading: Kruschke, chapters 15, 16, 17

# Winter 2022

Week 11 (*1/4*)

: Survival analysis and [introduction to `brms`](https://github.com/paul-buerkner/brms)

    - Reading: 

Week 12 (*1/11*)

: Time series: temporal autocorrelation, autoregressive models; mechanistic models

    - Reading: 

Week 13 (*1/18*)

: Categorical data: chi-square for contingency tables, permutation tests.

    - Reading: Kruschke, chapter 16 (metric data with one or two groups), and
        chapter 24 (Poisson, contingency tables)

Week 14 (*1/25*)

: Crossvalidation for model comparison; sparsifying priors and variable selection

    - Reading: Kruschke, chapters 17 (one-variable linear models), 18 (multivariate linear models)

Week 15 (*2/1*)

: Many response variables

    - Reading: 

Week 16 (*2/8*)

: Data analysis example

    - Group presentations

Week 17 (*2/15*)

: Factor analysis, dimensionality reduction, and visualization; clustering; PCA, PCoA, MDS, t-SNE, UMAP

    - Reading: 

Week 18 (*2/22*)

: Latent factors, deconvolution for mixtures of expression data; nonnegative matrix factorization

    - Reading: 

Week 19 (*3/1*)

: Deconvolution continued; introduction to spatial statistics and spatial autocorrelation.

    - Reading: 

Week 20 (*3/8*)

: Spatial statistics: kernel density estimation and interpolation.

    - Reading: 

