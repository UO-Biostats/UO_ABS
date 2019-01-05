library(rstan)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)

set.seed(23)
n <- 300
ngroups <- 10
truth <- list(b=1.5, c=10*rexp(ngroups), sigma=2)
geno <- sample.int(ngroups, size=n, replace=TRUE)
x <- sample(seq(0, 10, length.out=50), size=n, replace=TRUE)
y <- pmax(0, truth$b * x + truth$c[geno] + truth$sigma * rt(n, df=2))

write.table(data.frame(y=y, x=x, geno=geno),
            file="leaf_anthocyanin.tsv",
            row.names=FALSE)

do_crossval <- function (k, fit, pred) {
    test <- sample(n, size=ceiling(n/k))
    train <- setdiff(1:n, test)
    the_fit <- fit(y[train], x[train], geno[train])
    y_pred <- pred(the_fit, x[test], geno[test])
    out <- sqrt(mean((y[test] - y_pred)^2))
    return(out)
}

lm_fit <- function (y, x, geno) { lm(y ~ x * geno) }

lm_pred <- function (lmfit, x, geno) { predict(lmfit, newdata=list(x=x, geno=geno)) }

s1_fit <- function (y, x, geno) {
    sampling(leaf_model,
             data=list(N=length(x), ngroups=ngroups, x=x, y=y, geno=geno))
}

s1_pred <- function (sfit, x, geno) {
    samps <- extract(sfit)
    b <- mean(samps$b)
    c <- colMeans(samps$c)
    return(b * x + c[geno])
}

s2_fit <- function (y, x, geno) {
    sampling(leaf_model2,
             data=list(N=length(x), ngroups=ngroups, x=x, y=y, geno=geno))
}

s2_pred <- function (sfit, x, geno) {
    samps <- extract(sfit)
    b <- colMeans(samps$b)
    c <- colMeans(samps$c)
    return(b[geno] * x + c[geno])
}

s3_fit <- function (y, x, geno) {
    sampling(leaf_model3,
             data=list(N=length(x), ngroups=ngroups, x=x, y=y, geno=geno))
}

s3_pred <- function (sfit, x, geno) {
    samps <- extract(sfit)
    b <- mean(samps$b)
    c <- colMeans(samps$c)
    return(b * x + c[geno])
}


leaf_model <- stan_model(model_code=
"
data {
    int N;
    int ngroups;
    vector[N] x; // time
    vector[N] y; // anthocyanin
    int geno[N]; // genotype index
}
parameters {
    real b; // slope
    vector[ngroups] c; // genotype intercept
    real<lower=0> sigma; // scale
}
model {
    y ~ cauchy(b * x + c[geno], sigma);
    b ~ normal(0, 10);
    c ~ normal(0, 10);
    sigma ~ normal(0, 10);
}
")


leaf_model2 <- stan_model(model_code=
"
data {
    int N;
    int ngroups;
    vector[N] x; // time
    vector[N] y; // anthocyanin
    int geno[N]; // genotype index
}
parameters {
    vector[ngroups] b; // slope
    vector[ngroups] c; // genotype intercept
    real<lower=0> sigma; // scale
}
model {
    y ~ cauchy(b[geno] .* x + c[geno], sigma);
    b ~ normal(0, 10);
    c ~ normal(0, 10);
    sigma ~ normal(0, 10);
}
")


leaf_model3 <- stan_model(model_code=
"
data {
    int N;
    int ngroups;
    vector[N] x; // time
    vector[N] y; // anthocyanin
    int geno[N]; // genotype index
}
parameters {
    real b; // slope
    vector[ngroups] c; // genotype intercept
    real<lower=0> sigma; // scale
    real<lower=0> nu; // df
}
model {
    y ~ student_t(nu, b * x + c[geno], sigma);
    b ~ normal(0, 10);
    c ~ normal(0, 10);
    sigma ~ normal(0, 10);
    nu ~ gamma(2, 0.1);
}
")

crossvals <- data.frame(lm=replicate(20, do_crossval(10, lm_fit, lm_pred)),
                        s1=replicate(20, do_crossval(10, s1_fit, s1_pred)),
                        s2=replicate(20, do_crossval(10, s2_fit, s2_pred)),
                        s3=replicate(20, do_crossval(10, s3_fit, s3_pred)))

summary(crossvals)
