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


# Winter 2022

Week 11 (*1/4*)

: Survival analysis

    - slides: [Survival curves](../CLASS_MATERIALS/Lectures/Week_11_Survival_curves.slides.html)
    - slides: [Cox's Proportional Hazards](../CLASS_MATERIALS/Lectures/Week_11_Cox_proportional_hazards.slides.html)
    - slides: [the Weibull distribution](../CLASS_MATERIALS/Lectures/Week_11_Weibull_distribution.slides.html)
    - slides: [Parametric survival analysis](../CLASS_MATERIALS/Lectures/Week_11_Parametric_survival_analysis.slides.html)
    - [Homework 11](../CLASS_MATERIALS/Homeworks/HW11.html) *(due 1/13)*
    - Reading: [Survival Analysis in R](https://www.emilyzabor.com/tutorials/survival_analysis_in_r_tutorial.html) by Emily Zabor

Week 12 (*1/11*)

: Categorical data: chi-square for contingency tables, permutation tests.

    - slides: [The chi-squared test for categorical data](../CLASS_MATERIALS/Lectures/Week_12_Categorical_chisquared.slides.html)
    - slides: [Permutation testing for categorical data](../CLASS_MATERIALS/Lectures/Week_12_Categorical_permutation.slides.html)
    - slides: [Poisson models for categorical data (using brms)](../CLASS_MATERIALS/Lectures/Week_12_Categorical_brms.slides.html)
    - slides: [The chi-squared distribution](../CLASS_MATERIALS/Lectures/Week_12_Chi_squared.slides.html)
    - [Homework 12](../CLASS_MATERIALS/Homeworks/HW12.html) *(group homework, due 1/19)*
    - Reading: Kruschke, chapter 16 (metric data with one or two groups), and
        chapter 24 (Poisson, contingency tables)
    - Code from in-class [demo on permutation testing](../CLASS_MATERIALS/Demos/permutation_in_class.Rmd)
    - Code from in-class [demo on posterior summaries from brms](../CLASS_MATERIALS/Demos/post_summary_in_class.Rmd)

Week 13 (*1/18*)

: Time series models with Stan: mechanistic models

    - slides: [Writing Stan code](../CLASS_MATERIALS/Lectures/Week_13_Intro_to_Stan.slides.html)
    - slides: [Time series](../CLASS_MATERIALS/Lectures/Week_13_Time_series.slides.html)

Week 14 (*1/25*)

: Crossvalidation for model comparison; sparsifying priors and variable selection

    - slides: [Overfitting and crossvalidation](../CLASS_MATERIALS/Lectures/Week_14_overfitting_crossvalidation.slides.html)
    - slides: [Multicollinear example](../CLASS_MATERIALS/Lectures/Week_14_Example.slides.html)
    - slides: [Shrinkage (sparsifying priors)](../CLASS_MATERIALS/Lectures/Week_14_Shrinkage.slides.html)
    - slides: [Overdispersion](../CLASS_MATERIALS/Lectures/Week_14_Overdispersion.slides.html)
    - Reading: Kruschke, chapters 17 (one-variable linear models), 18 (multivariate linear models)
    - [Homework 13](../CLASS_MATERIALS/Homeworks/HW13.html) *(group homework, individual writeups due 1/3)*

Week 15 (*2/1*)

: Many response variables

    - slides: [Multivariate responses](../CLASS_MATERIALS/Lectures/Week_15_Multivariate_responses.slides.html)
    - slides: [the Multivariate Normal](../CLASS_MATERIALS/Lectures/Week_15_Multivariate_normal.slides.html)
    - Code from in-class [demo on correlated Normals](../CLASS_MATERIALS/Demos/Correlated_normals.Rmd)
    - Group presentations
    - [Homework 14](../CLASS_MATERIALS/Homeworks/HW14.html) *(due 2/11)*

Week 16 (*2/8*)

: Data analysis example

    - slides: [Hurricane Lizards](../CLASS_MATERIALS/Lectures/Week_16_Hurricane_lizards.slides.html)

Week 17 (*2/15*)

: Factor analysis, dimensionality reduction, and visualization; clustering; PCA, PCoA, MDS, t-SNE, UMAP

    - slides: [Dimension reduction and PCA](../CLASS_MATERIALS/Lectures/Week_17_Dimension_reduction_and_PCA.slides.html)
    - [Homework 15](../CLASS_MATERIALS/Homeworks/HW15.html) *(due 2/22)*
    - [Homework 16](../CLASS_MATERIALS/Homeworks/HW16.html) *(due 2/28)*

Week 18 (*2/22*)

: Factor analysis contiued; latent factors, deconvolution for mixtures of expression data; nonnegative matrix factorization

    - slides: [On ordination](../CLASS_MATERIALS/Lectures/Week_17_On_ordination.slides.html)
    - slides: [t-SNE](../CLASS_MATERIALS/Lectures/Week_18_tSNE.slides.html)
    - slides: [Deconvolution and NMF](../CLASS_MATERIALS/Lectures/Week_18_Nonnegative_matrix_factorization.slides.html)
    - [Homework 17](../CLASS_MATERIALS/Homeworks/HW17.html) *(due 3/8)*

Week 19 (*3/1*)

: Introduction to spatial statistics and spatial autocorrelation; kernel density estimation.

    - slides: [Making maps](../CLASS_MATERIALS/Lectures/Week_19_Biketown_maps.slides.html)
    - slides: [Spatial autocorrelation](../CLASS_MATERIALS/Lectures/Week_19_Spatial_autocorrelation.slides.html)
    - slides: [Spatial density estimation](../CLASS_MATERIALS/Lectures/Week_19_Spatial_density_estimation.slides.html)
    - [Homework 18](../CLASS_MATERIALS/Homeworks/HW18.html) *(due 3/15)*

Week 20 (*3/8*)

: Spatial statistics: kernel density estimation and interpolation.

    - slides: [Random forests](../CLASS_MATERIALS/Lectures/Week_20_Random_forests.slides.html)
    - slides: [Review](../CLASS_MATERIALS/Lectures/Week_20_Review.slides.html)
    - Reading: 



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

    - Slides: [Prior distributions](../CLASS_MATERIALS/Lectures/Week_07_Prior_distributions.slides.html)
    - Slides: [Probability rules](../CLASS_MATERIALS/Lectures/Week_07_Probability_rules.slides.html)
    - Slides: [The Beta distribution](../CLASS_MATERIALS/Lectures/Week_07_Beta_distribution.slides.html)
    - [Homework 7](../CLASS_MATERIALS/Homeworks/HW07.html) *(due 11/18)*
    - Reading: Kruschke, chapters 1, 2, 4, 5, 6, 7

Week 8 (*11/17*)

: Bayesian hierarchical modeling - shrinkage, and sharing power

    - Slides: [Posterior sampling with MCMC](../CLASS_MATERIALS/Lectures/Week_08_Posterior_sampling.slides.html)
    - Slides: [Models with Stan](../CLASS_MATERIALS/Lectures/Week_08_Levels_of_randomness.slides.html)
    - Slides: [Baseball: Hierarchical logistic models](../CLASS_MATERIALS/Lectures/Week_08_Baseball.slides.html)
    - Reading: Kruschke, chapters 9, 10

Week 9 (*11/24*, no class Thursday)

: Logistic models, and sharing power

    - Slides: [Generalized Linear Models](../CLASS_MATERIALS/Lectures/Week_09_GLMs.slides.html)
    - Slides: [Intro to brms](../CLASS_MATERIALS/Lectures/Week_09_Intro_to_brms.slides.html)
    - [Homework 8](../CLASS_MATERIALS/Homeworks/HW08.html) *(due 12/3)*
    - Reading: Kruschke, chapters 13, 21

Week 10 (*12/1*)

: Robust linear models; Generalized Linear Models (GLMs).

    - Slides: [Cauchy distribution](../CLASS_MATERIALS/Lectures/Week_10_Cauchy_distribution.slides.html)
    - Slides: [Robust models](../CLASS_MATERIALS/Lectures/Week_10_Robust_fitting.slides.html)
    - Slides: [Poisson distribution](../CLASS_MATERIALS/Lectures/Week_10_Poisson_distribution.slides.html)
    - Slides: [Poisson models](../CLASS_MATERIALS/Lectures/Week_10_Poisson_lineage_models.slides.html)
    - Slides: [Summary](../CLASS_MATERIALS/Lectures/Week_10_Summary.slides.html)
    - [Homework 9](../CLASS_MATERIALS/Homeworks/HW09.html) *(due 12/9)*
    - Reading: Kruschke, chapters 15, 16, 17

