data {
    int N; // number of obs
    int counts[N];
    vector[N] age;
    vector[N] expo;
    int geno[N];
}
parameters {
    real<lower=0> mu[N]; // per-indiv 'mean'
    vector[2] a;
    real b;
    vector[2] c;
    real<lower=0> sigma;
}
model {
    vector[N] y;
    y = a[geno] + b * age + c[geno] .* expo;
    counts ~ poisson(mu);
    mu ~ lognormal(y, sigma);
    a ~ normal(0, 10);
    b ~ normal(0, 10);
    c ~ normal(0, 10);
    sigma ~ normal(0, 10);
}
