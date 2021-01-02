---
layout: page
title: course schedule
description: schedule, with links to slides and homeworks
---

The (Rmarkdown) source code for these lectures is available at [the github repository](https://github.com/UO-Biostats/UO_ABS),
or by replacing the `.slides.html` suffix to `.Rmd` in the link below;
the slides are made using [reveal.js](https://github.com/hakimel/reveal.js/).
Here are the slides from [Fall 2018/Winter 2019](2018_schedule.html) and from [Fall 2019/Winter 2020](2019_schedule.html).

# Winter 2021

Week 11 (*1/4*)

: Survival analysis and [introductiom to `brms`](https://github.com/paul-buerkner/brms)

    <!-- - [Homework 11](../CLASS_MATERIALS/Homeworks/HW11_W21.html) *(due 1/16)* -->

Week 12 (*1/11*)

: Time series: temporal autocorrelation, autoregressive models; mechanistic models



Week 13 (*1/18*)

: Categorical data: chi-square for contingency tables, permutation tests.

    - Reading: Kruschke, chapter 16 (metric data with one or two groups), and
        chapter 24 (Poisson, contingency tables)

Week 14 (*1/25*)

: Categorical prediction; crossvalidation for model comparison.

    - Reading: Kruschke, chapter 22 (softmax regression)

Week 15 (*2/1*)

: Many dimensions: Sparsifying priors and variable selection.

    - Reading: Kruschke, chapters 17 (one-variable linear regression), 18 (multivariate linear regression)

Week 16 (*2/8*)

: Many response variables; data analysis example (cream cheese)

    - [Primer on linear algebra](../CLASS_MATERIALS/Lectures/2019/LA_primer_slides.html)
    - [Rmd file for the primer](../CLASS_MATERIALS/Lectures/2019/LA_primer_slides.Rmd)

Week 17 (*2/15*)

: Factor analysis, dimensionality reduction, and visualization; clustering; PCA, PCoA, MDS, t-SNE, UMAP


Week 18 (*2/22*)

: Latent factors, deconvolution for mixtures of expression data; nonnegative matrix factorization


Week 19 (*3/1*)

: Deconvolution continued; introduction to spatial statistics and kernel density estimation.


Week 20 (*3/8*)

: Spatial statistics: spatial autocorrelation and Kriging.


# Fall 2020

Week 1 (*9/29*)

: Overview of data science - description and estimation, uncertainty and simulation,
    with examples for comparing means and linear regression; smoothing.

    - [Slides](../CLASS_MATERIALS/Lectures/Week_01_Lecture.slides.html) and [pdf version](../CLASS_MATERIALS/Lectures/Week_01_Lecture.handout.pdf)
    - topic slides: [the t distribution](../CLASS_MATERIALS/Lectures/t-distribution.slides.html) and [pdf version](../CLASS_MATERIALS/Lectures/t-distribution.handout.pdf)
    - topic slides: [the central limit theorem and the Normal distribution](../CLASS_MATERIALS/Lectures/central-limit-theorem.slides.html) and [pdf version](../CLASS_MATERIALS/Lectures/central-limit-theorem.handout.pdf)
    - [Homework 1](../CLASS_MATERIALS/Homeworks/HW01_F20.html) *(due 10/8)*
    - [how to git the slide source](using-git.html)
    - Reading: Quinn & Keough chapters 1-4

Week 2 (*10/6*)

: Analysis of Variance (ANOVA) and experimental design; tidy data; power and false positives

    - slides: [confidence intervals](../CLASS_MATERIALS/Lectures/Week_02_Confidence_Intervals.slides.html) and [pdf version](../CLASS_MATERIALS/Lectures/Week_02_Confidence_Intervals.handout.pdf)
    - slides: [ANOVA](../CLASS_MATERIALS/Lectures/Week_02_ANOVA.slides.html) and [pdf version](../CLASS_MATERIALS/Lectures/Week_02_ANOVA.handout.pdf)
    - slides: [experimental design](../CLASS_MATERIALS/Lectures/Week_02_Experimental_design.slides.html)
        and [pdf version](../CLASS_MATERIALS/Lectures/Week_02_Experimental_design.handout.pdf)
    - [Homework 2](../CLASS_MATERIALS/Homeworks/HW02_F20.html) *(due 10/15)*
    - Reading: Quinn & Keough chapters 5, 7, 8

Week 3 (*10/13*)

: Plotting/visualization, and permutation/bootstrapping

    - slides: [permutation tests](../CLASS_MATERIALS/Lectures/Week_03_Permutation_tests.slides.html)
        and [pdf version](../CLASS_MATERIALS/Lectures/Week_03_Permutation_tests.handout.pdf)
    - slides: [tidy data](../CLASS_MATERIALS/Lectures/Week_03_Tidy_data.slides.html)
        and [pdf version](../CLASS_MATERIALS/Lectures/Week_03_Tidy_data.handout.pdf)
    - slides: [visualizing data](../CLASS_MATERIALS/Lectures/Week_03_Visualization.slides.html)
        and [pdf version](../CLASS_MATERIALS/Lectures/Week_03_Visualization.handout.pdf)
    - slides: [the bootstrap](../CLASS_MATERIALS/Lectures/Week_03_Bootstrap.slides.html)
        and [pdf version](../CLASS_MATERIALS/Lectures/Week_03_Bootstrap.handout.pdf)
    - [Homework 3](../CLASS_MATERIALS/Homeworks/HW03_F20.html) *(due 10/22)*
    - Reading: Quinn & Keough chapter 9

Week 4 (*10/20*)

: Multivariate ANOVA, regression, least-squares likelihood

    - slides: [multivariate ANOVA](../CLASS_MATERIALS/Lectures/Week_04_Multivariate_ANOVA.slides.html)
        and [pdf version](../CLASS_MATERIALS/Lectures/Week_04_Multivariate_ANOVA.handout.pdf)
    - slides: [formulas](../CLASS_MATERIALS/Lectures/Week_04_Formulas.slides.html)
        and [pdf version](../CLASS_MATERIALS/Lectures/Week_04_Formulas.handout.pdf)
    - [Homework 4](../CLASS_MATERIALS/Homeworks/HW04_F20.html) *(due 10/30)*
    - Reading: Quinn & Keough chapter 6

Week 5 (*10/27*)

: Model selection; random effects and mixed models - a first look.

    - slides: [Linear models](../CLASS_MATERIALS/Lectures/Week_05_Linear_models.slides.html)
    - slides: [Model comparison](../CLASS_MATERIALS/Lectures/Week_05_Model_comparison.slides.html)
    - slides: [Random effects](../CLASS_MATERIALS/Lectures/Week_05_Random_effects.slides.html)
    - Homework: [peer review](peer_reviews.html)
    - Reading: Quinn & Keough chapter 13

Week 6 (*11/3*)

: Multiple testing, error rates, and some history.

    - slides: [Multiple testing](../CLASS_MATERIALS/Lectures/Week_06_Multiple_testing.slides.html)
    - slides: [Statistics and Eugenics](../CLASS_MATERIALS/Lectures/Week_06_Statistics_and_eugenics.slides.html)
    - install [Stan](https://mc-stan.org)
    - [Homework 6](../CLASS_MATERIALS/Homeworks/HW06_F20.html) *(due 11/12)*

Week 7 (*11/10*)

: Introduction to Bayesian statistics

    - slides: [Prior distributions and uncertainty](../CLASS_MATERIALS/Lectures/Week_07_Prior_distributions.slides.html)
    - slides: [Probability rules](../CLASS_MATERIALS/Lectures/Week_07_Probability_rules.slides.html)
    - slides: [the Beta distribution](../CLASS_MATERIALS/Lectures/Week_07_Beta_distribution.slides.html)
    - slides: [Sampling from the posterior with Markov chain Monte Carlo](../CLASS_MATERIALS/Lectures/Week_07_Posterior_sampling.slides.html)
    - Reading: Kruschke, chapters 1, 2, 4, 5, 6, 7
    - [Homework 7](../CLASS_MATERIALS/Homeworks/HW07_F20.html) *(due 11/19)*

Week 8 (*11/17*)

: Bayesian hierarchical modeling - shrinkage, and sharing power

    - slides: [Hierarchical models: adding levels of randomness](../CLASS_MATERIALS/Lectures/Week_08_Levels_of_randomness.slides.html)
    - slides: [Hierarchical models: Baseball data](../CLASS_MATERIALS/Lectures/Week_08_Baseball.slides.html)
    - Reading: Kruschke, chapters 9, 10
    - [Homework 8](../CLASS_MATERIALS/Homeworks/HW08_F20.html) *(due 12/03)*

Week 9 (*11/24*)

: Logistic models, and sharing power

    - slides: [The logistic model](../CLASS_MATERIALS/Lectures/Week_09_Logistic_model.slides.html)
    - slides: [Sharing power and shrinkage](../CLASS_MATERIALS/Lectures/Week_09_Sharing_power.slides.html)
    - slides: [The Gamma and Exponential distributions](../CLASS_MATERIALS/Lectures/Week_09_Gamma_distribution.slides.html)
    - Reading: Kruschke, chapters 13, 21
    - no new homework this week (catch up on reading?)

Week 10 (*12/1*)

: Robust linear models; Generalized Linear Models (GLMs).

    - slides: [Fitting linear models, robustly](../CLASS_MATERIALS/Lectures/Week_10_Robust_fitting.slides.html)
    - slides: [Generalized Linear Models](../CLASS_MATERIALS/Lectures/Week_10_GLMs.slides.html)
    - slides: [Summary and wrap-up](../CLASS_MATERIALS/Lectures/Week_10_Summary.slides.html)
    - slides: [Poisson linear models](../CLASS_MATERIALS/Lectures/Week_10_Poisson_linear_models.slides.html)
    - slides: [The Cauchy distribution](../CLASS_MATERIALS/Lectures/Week_10_Cauchy_distribution.slides.html)
    - slides: [The Poisson distribution](../CLASS_MATERIALS/Lectures/Week_10_Poisson_distribution.slides.html)
    - slides: [Matrix multiplication](../CLASS_MATERIALS/Lectures/Week_10_Matrix_multiplication.slides.html)
    - [Homework 9](../CLASS_MATERIALS/Homeworks/HW09_F20.html) *(due 12/10)*
    - Reading: Kruschke, chapters 15, 16, 17
