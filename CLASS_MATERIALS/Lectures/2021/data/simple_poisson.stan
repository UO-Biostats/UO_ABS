data {
    int N;
    int counts[N];
    vector[N] age;
    vector[N] expo;
    int geno[N];
}
parameters {
    vector[2] a;
    real b;
    vector[2] c;
}
model {
    vector[N] mu;
    mu = exp(a[geno] + b * age 
             + c[geno] .* expo);
    counts ~ poisson(mu);
    a ~ normal(0, 5);
    b ~ normal(0, 5);
    c ~ normal(0, 5);
}
