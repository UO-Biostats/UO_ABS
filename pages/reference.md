---
layout: page
title: Useful links
description: useful links for Advanced Biological Statistics
---

### Course resources

* A page of [example datasets](datasets.html).
* A [primer on linear algebra](../CLASS_MATERIALS/Lectures/LA_primer_slides.html)
* A description of how to [use git](using-git.html) to get the course material.
* Some notes on [how the slides are made from Rmd](development.html).
* Tips on [writing Rmd reports](rmarkdown_tips.html)
* Tips on [writing peer reviews](peer_reviews.html)
* How to [use `rstan` on the cluster](rstan_on_talapas.html)
* How to [check if `rstan` is installed correctly](check_stan_install.html)

### Stan

* [Stan documentation](https://mc-stan.org/users/documentation/) 
    - the [Reference Manual](https://mc-stan.org/docs/2_18/reference-manual/index.html)
        describes the syntax and workings of a Stan program
    - the [Functions Reference](https://mc-stan.org/docs/2_18/functions-reference/index.html)
        is where you look up *"what's that function again?"*
    - the [User's Guide](https://mc-stan.org/docs/2_18/stan-users-guide/index.html) has examples
        of complex models implemented in Stan, and discusses good programming practice

* [RStan documentation](https://mc-stan.org/users/interfaces/rstan.html) 
* [Example models in Stan](https://github.com/stan-dev/example-models): 
    each contains a Stan program, code for simulating data, real data, and model output and diagnostics
* Vignette on [stanfit objects](https://cran.r-project.org/web/packages/rstan/vignettes/stanfit-objects.html)
* Brief guide to [Stan's warnings](http://mc-stan.org/misc/warnings)

### Miscellaneous R tips

* [knitr chunk options](https://yihui.name/knitr/options/) for control of Rmarkdown code chunks
* [Formulae in R](http://conjugateprior.org/2013/01/formulae-in-r-anova/) and, in more detail, [General linear models in R FAQ](http://bbolker.github.io/mixedmodels-misc/glmmFAQ.html)
* How to [print the source code](https://stackoverflow.com/questions/19226816/how-can-i-view-the-source-code-for-a-function/19226817#19226817) 
    for functions that don't show it to you when you type their names. (tldr; `showMethods(fun); getMethod(fun, c(x='class1', y='class2'))`)

### ggplotting

* [ggplot2 quick reference](http://ggplot2.tidyverse.org/reference/)
* [practical ggplot2](https://wilkelab.org/practicalgg/) an annotated website of examples by Claus Wilke

### Rstudio

* Strongly recommended global configuration: 
![Never save or restore .RData](rstudio_config_1.png)

### General resources

- [linuxcommand.org](http://linuxcommand.org/) and [bashguide](http://mywiki.wooledge.org/BashGuide)
- [Software Carpentry](http://software-carpentry.org/lessons/)
- Reproducible Research by Karl Broman:
  [talk](https://github.com/kbroman/Talk_ReproRes) and
  [course](http://kbroman.org/Tools4RR)
- Karl Broman's excellent [short tutorials](http://kbroman.org/pages/tutorials.html) on
  git/github, make, perl, and more.
- [Bioinformatics Data Skills](http://shop.oreilly.com/product/0636920030157.do) by Vince Buffalo
- [Professional Skills for Data Science](http://www.stat.wisc.edu/network-skills) by Brian Yandell,
  and his course on the same topic
  [Stat 627](https://github.com/datascience-uwmadison/stat627).
- [Jenny Bryan's stat 545](http://stat545-ubc.github.io/) at UBC

### Probability and statistics

- List of [common probability distributions](https://en.wikipedia.org/wiki/Probability_distribution#Common_probability_distributions)
- [ANOVA: a short intro using R](https://stat.ethz.ch/~meier/teaching/anova/) by Lukas Meier
- Interactive plot of the [beta distribution](https://www.desmos.com/calculator/mnvwjlvnyj)
- Interactive plot of the [gamma distribution](https://www.desmos.com/calculator/vk2tqrxpk5)
- Interactive plot of [Student's t-distribution](https://www.desmos.com/calculator/u1ftxqcsqd)
