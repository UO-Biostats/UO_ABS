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

First, load the `rstan` package:
```r
library(rstan)
```

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
This should print out some stuff like this:
```

SAMPLING FOR MODEL '32af4e878d1455a0a170e2073248307e' NOW (CHAIN 1).
Chain 1:
Chain 1: Gradient evaluation took 1.6e-05 seconds
Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 0.16 seconds.
Chain 1: Adjust your expectations accordingly!
Chain 1:
Chain 1:
Chain 1: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 1: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 1: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 1: Iteration:  600 / 2000 [ 30%]  (Warmup)
Chain 1: Iteration:  800 / 2000 [ 40%]  (Warmup)
Chain 1: Iteration: 1000 / 2000 [ 50%]  (Warmup)
Chain 1: Iteration: 1001 / 2000 [ 50%]  (Sampling)
Chain 1: Iteration: 1200 / 2000 [ 60%]  (Sampling)
Chain 1: Iteration: 1400 / 2000 [ 70%]  (Sampling)
Chain 1: Iteration: 1600 / 2000 [ 80%]  (Sampling)
Chain 1: Iteration: 1800 / 2000 [ 90%]  (Sampling)
Chain 1: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 1:
Chain 1:  Elapsed Time: 0.054897 seconds (Warm-up)
Chain 1:                0.047577 seconds (Sampling)
Chain 1:                0.102474 seconds (Total)
Chain 1:
> print(fit)
Inference for Stan model: 32af4e878d1455a0a170e2073248307e.
1 chains, each with iter=2000; warmup=1000; thin=1;
post-warmup draws per chain=1000, total post-warmup draws=1000.
```

If all is good, you should now be able to do
```r
print(fit)
```
and see a nice summary of the output, something like this:
```
Inference for Stan model: 32af4e878d1455a0a170e2073248307e.
1 chains, each with iter=2000; warmup=1000; thin=1;
post-warmup draws per chain=1000, total post-warmup draws=1000.

           mean se_mean   sd   2.5%    25%    50%    75%  97.5% n_eff Rhat
mu         8.07    0.21 4.79  -1.32   5.06   7.91  10.91  17.93   524 1.00
tau        6.30    0.26 5.33   0.18   2.40   5.05   8.64  19.98   418 1.00
eta[1]     0.38    0.03 0.87  -1.37  -0.16   0.41   0.97   2.00   629 1.01
eta[2]     0.00    0.03 0.93  -1.90  -0.57   0.01   0.59   1.81   954 1.00
eta[3]    -0.22    0.03 0.92  -1.91  -0.82  -0.22   0.38   1.53   921 1.00
eta[4]     0.00    0.03 0.97  -1.85  -0.63  -0.03   0.65   1.90   945 1.00
eta[5]    -0.35    0.03 0.84  -1.99  -0.95  -0.36   0.20   1.32   868 1.00
eta[6]    -0.21    0.03 0.91  -1.97  -0.82  -0.24   0.38   1.65   895 1.00
eta[7]     0.38    0.03 0.88  -1.41  -0.22   0.42   0.99   2.03   865 1.00
eta[8]     0.09    0.04 0.92  -1.90  -0.44   0.12   0.68   1.86   603 1.00
theta[1]  11.12    0.30 7.69  -1.06   6.16  10.14  15.28  29.09   643 1.00
theta[2]   8.15    0.21 6.57  -4.24   3.89   7.84  12.19  21.55   967 1.00
theta[3]   6.26    0.28 7.49 -10.09   2.22   6.56  10.82  20.39   723 1.00
theta[4]   7.66    0.19 6.66  -6.75   3.77   7.96  11.58  20.51  1284 1.00
theta[5]   5.35    0.20 6.23  -9.26   1.52   5.96   9.51  16.14   976 1.00
theta[6]   6.36    0.24 7.02  -9.04   2.45   6.84  10.66  19.09   881 1.00
theta[7]  10.77    0.20 6.33   0.35   6.41   9.96  14.64  25.40  1054 1.00
theta[8]   9.12    0.29 7.81  -5.40   4.63   8.67  13.35  26.44   739 1.00
lp__     -39.66    0.14 2.61 -45.40 -41.19 -39.46 -37.85 -35.10   371 1.00

Samples were drawn using NUTS(diag_e) at Fri Nov 20 10:09:24 2020.
For each parameter, n_eff is a crude measure of effective sample size,
and Rhat is the potential scale reduction factor on split chains (at
convergence, Rhat=1).
```

### Baseball

This is a somewhat more complex model.
First, the data and Stan block
(*note:* you may have to change the location of `BattingAverage.csv` below):
```r
batting <- read.csv("../Lectures/data/BattingAverage.csv", header=TRUE, stringsAsFactors=TRUE)
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
print(fit, pars=c("mu", "kappa"))
```
and see something like this:
```
Inference for Stan model: 1e1b401f92e65870a3dbf7e947638a0e.
1 chains, each with iter=2000; warmup=1000; thin=1; 
post-warmup draws per chain=1000, total post-warmup draws=1000.

           mean se_mean    sd  2.5%    25%    50%    75%  97.5% n_eff Rhat
mu[1]      0.25    0.00  0.01  0.24   0.25   0.25   0.26   0.26   698 1.00
mu[2]      0.25    0.00  0.01  0.24   0.24   0.25   0.25   0.26   622 1.00
mu[3]      0.26    0.00  0.01  0.24   0.25   0.26   0.26   0.27   806 1.00
mu[4]      0.24    0.00  0.01  0.23   0.24   0.24   0.24   0.25   512 1.00
mu[5]      0.26    0.00  0.01  0.24   0.25   0.26   0.26   0.27   660 1.00
mu[6]      0.25    0.00  0.01  0.24   0.25   0.25   0.25   0.26   447 1.00
mu[7]      0.13    0.00  0.01  0.12   0.12   0.13   0.13   0.14   186 1.00
mu[8]      0.26    0.00  0.01  0.25   0.25   0.26   0.26   0.27   790 1.00
mu[9]      0.25    0.00  0.01  0.23   0.24   0.25   0.25   0.26   654 1.00
kappa[1] 111.53    0.90 23.12 73.68  95.61 108.39 124.96 166.97   666 1.00
kappa[2] 103.32    1.14 23.82 59.75  86.91 101.28 118.25 154.18   437 1.00
kappa[3]  97.62    0.84 21.14 63.39  81.69  95.57 111.66 143.43   628 1.00
kappa[4]  96.56    0.92 20.34 61.82  82.45  93.79 107.81 141.29   489 1.01
kappa[5] 101.10    1.15 22.38 63.73  84.45  99.67 115.62 151.91   377 1.00
kappa[6] 106.94    1.18 21.90 70.68  91.04 105.07 119.21 153.82   342 1.00
kappa[7]  54.44    1.40 13.14 34.40  45.29  52.31  61.42  85.32    88 1.00
kappa[8] 118.92    1.28 26.48 74.16 100.05 117.58 136.22 173.49   426 1.00
kappa[9]  95.74    0.86 22.40 61.19  79.52  92.44 109.71 145.52   680 1.01

Samples were drawn using NUTS(diag_e) at Fri Nov 20 10:12:37 2020.
For each parameter, n_eff is a crude measure of effective sample size,
and Rhat is the potential scale reduction factor on split chains (at 
convergence, Rhat=1).
```

