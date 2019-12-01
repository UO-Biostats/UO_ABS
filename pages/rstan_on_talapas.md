---
layout: page
title: Using `rstan` on the cluster
description: Instructions on how to run rstan on talapas
---

After reading this, you will be able to:

1. Log into [talapas](https://hpcf.uoregon.edu/content/talapas),
the high performance computing cluster on campus.

2. Utilize `rsync` to send files between talapas and your local machine.

3. Run `rstan` on talapas and send the model samples to your machine.

These instructions were written with OSX users in mind.
Whenever you see `<username>` you should replace it with 
your uoregon username.

## 1 `ssh` into the cluster
Open your terminal and `ssh` into talapas with the following command
```
ssh <username>@talapas-login.uoregon.edu
```
You will be prompted for a password. Type your uoregon password and hit RETURN.

Now navigate to the UO biostats directory
``` 
cd /projects/bi607/
```
You can list `ls` all directories here, one of which is `<username>`.
If you move to it `cd <username>` you will likely see that it is empty.
I recommend creating a new directory for your homework.
Suppose I was wanted to work on homework 7, then typing `mkdir hw7`
will create a new directory named `hw7` where you can store all homework 7 files.
You can look at the full path to this directory by typing `pwd`.
Do it, you'll need that path for the next step.

## 2 Become BFFs with `rsync`
Now you need to populate your shiny new homework directory with some files.
Let's start with our data file, `BattingAverage.csv`. 
In a different tab or window for your terminal, navigate to where
you have `BattingAverage.csv` stored and run the command
```
rsync -vzPe ssh BattingAverage.csv <username>@talapas-uoregon.edu:/projects/bi607/<username>/hw7/
```
In case you're curious, the options for `rsync` are:
- `-v` be verbose
- `-z` compress the file for the transfer
- `-P` show transfer progress
- `-e` specify the remote shell to use (in this case `ssh`)

The general structure of `rsync` is `rsync FROM TO`, so we're telling it to 
send `BattingAverage.csv`, which is in the current directory, to our 
`hw7` directory on the cluster.

## 3 Submitting a job
Now, in order to run `rstan` on talapas, you need two more files:
1. an R script that reads in the data and fits an `rstan` model
2. an `sbatch` file to run the R script on the cluster

You can make these in any text editor you want, 
either on your local machine (in which case you will have to `rsync` them to talapas),
or on the cluster using either vim or nano.

Here is an example R script, named `run_rstan.R`:
```
library(rstan)

# read in the data
data <- read.table('/projects/bi607/mlukac/hw7/BattingAverage.csv', header=TRUE, sep=',') 

# the stan model code
stan_code <- "
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

# compile and sample
model_fit <- stan(model_code = stan_code,
                  chains = 4,
                  iter = 2000,
                  control = list(max_treedepth = 13),
                  data = list(N = nrow(data),
                              hits = data$Hits,
                              at_bats = data$AtBats,
                              npos = length(unique(data$PriPos)),
                              position = data$PriPosNumber
                              )   
                  )   

# save the fitted model to an .rds file
saveRDS(model_fit, file='baseball_model.rds')
```

And here is an example `sbatch` file named `run_rstan.sbatch`
```
#!/bin/bash
#SBATCH --account=bi607
#SBATCH --partition=short
#SBATCH --job-name=rstan
#SBATCH --time 1:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=<username>@uoregon.edu

module load gcc/7.3 R/3.6.1

Rscript run_rstan.R
```
The options for the `sbatch` file are pretty self explanatory,
but for more information see this 
[cheat sheet.](https://slurm.schedmd.com/pdfs/summary.pdf)

With these three files in the `hw7` directory, just run the command 
```
sbatch run_rstan.sbatch
```

And that's it! Your job should be submitted, or in the queue.
You can run the command `squeue -u <username>` to see where
the job is in the queue or how long it's been running.
When it's complete you will find two additional files in your directory;
1. `slurm-<JOB ID>.out` which has all the output (including errors) from the `rstan` job
2. `baseball_model.rds` the fitted `rstan` model

You can now `rsync` the fitted model back to your local machine,
load it into your Rstudio environment with `data <- readRDS(file = 'baseball_model.rds')`
and start looking at how your chains mixed, the posterior samples, etc.

