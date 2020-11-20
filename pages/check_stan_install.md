---
layout: page
title: Verifying Stan Install
description: verifying the rstan installation 
---

Here we will check that RStan is installed on your machine.
First we'll use a basic model, check that it compiles with `stan_model()`,
then check that it correctly performs MCMC with `sampling()`.
Then we'll do the same with a slightly more complicated baseball model.

If you get any errors, you should read them carefully!

## Quick check

To run a quick check at the command line,
navigate to `CLASS_MATERIALS/Tutorials/` in this repository, and run

`Rscript check_rstan_install.R`

If everything is working correctly you should see some sampling
for both models. Otherwise you will see some error messages.


## Interactive check

Here's how you can do the same checks, by hand,
so you can cut-and-paste into Rstudio, for instance.

### 8 schools

First, run this code to define the variables with the data
and the Stan model block:
```r
schools_dat <- list(J = 8,
                    y = c(28,  8, -3,  7, -1,  1, 18, 12),
                    sigma = c(15, 10, 16, 11,  9, 11, 10, 18))

schools_block <- "
data {
  int<lower=0> J;         // number of schools 
  real y[J];              // estimated treatment effects
  real<lower=0> sigma[J]; // standard error of effect estimates 
}
parameters {
  real mu;                // population treatment effect
  real<lower=0> tau;      // standard deviation in treatment effects
  vector[J] eta;          // unscaled deviation from mu by school
}
transformed parameters {
  vector[J] theta = mu + tau * eta;        // school treatment effects
}
model {
  target += normal_lpdf(eta | 0, 1);       // prior log-density
  target += normal_lpdf(y | theta, sigma); // log-likelihood
}
"
```

Ok, now run
```r
mod <- stan_model(model_code = schools_block)
```
and then, if that succeeds,
```r
fit <- sampling(mod, data = schools_dat, chains = 1, iter = 2000)
```
If all is good, you should be able to do
```r
print(fit)
```
and see a nice summary of the output!

### Baseball

This is a somewhat more complex model.
First, the data and Stan block
(*note:* you may have to change the location of `BattingAverage.csv` below):
```r
batting <- read.csv("../Lectures/BattingAverage.csv", header=TRUE, stringsAsFactors=TRUE)
batting_dat <- list(N=nrow(batting),
                    hits=batting$Hits,
                    at_bats=batting$AtBats,
                    npos=nlevels(batting$PriPos),
                    position=as.numeric(batting$PriPos))
batting_block <- "
data {
    int N;   // number of players
    int hits[N];
    int at_bats[N];
    int npos; // number of positions
    int position[N];
}
parameters {
    real<lower=0, upper=1> theta[N];
    real<lower=0, upper=1> mu[npos];
    real<lower=0> kappa[npos];
}
model {
    real alpha;
    real beta;
    hits ~ binomial(at_bats, theta);
    for (i in 1:N) {
        alpha = mu[position[i]] * kappa[position[i]];
        beta = (1 - mu[position[i]]) * kappa[position[i]];
        theta[i] ~ beta(alpha, beta);
    }
    mu ~ beta(1,1);
    kappa ~ gamma(0.1,0.1);
}
"
```

Now, let's see if compilation and sampling work:
```r
mod <- stan_model(model_code=batting_block)
fit <- sampling(mod, data = batting_dat, chains = 1, iter = 2000)
```
Again, if all is good, you should be able to do
```r
print(fit)
```
and see a nice summary of the output!

