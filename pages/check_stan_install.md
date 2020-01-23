---
layout: page
title: Using RStan on the cluster
description: verifying the rstan installation 
---

# Verifying Stan Install
Here we will check that RStan is installed on your machine.
First we'll use a basic model, check that it compiles with `stan_model()`,
then check that it correctly performs MCMC with `sampling()`.
Then we'll do the same with a slightly more complicated baseball model.

To do this, please navigate to `CLASS_MATERIALS/Tutorials/` and run

`Rscript check_rstan_install.R`

If everything is working correctly you should see some sampling
for both models. Otherwise you will see some error messages.

