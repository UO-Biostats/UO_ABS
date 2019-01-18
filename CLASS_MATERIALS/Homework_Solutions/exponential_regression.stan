data {
    int N;
    vector[N] D;
    vector[N] T;
    vector[N] R;
}
parameters {
    real<lower=0> b0;
    real<lower=0> bD;
    real<lower=0> bT;
}
model {
    R ~ exponential(inv(b0 + bD * D + bT * T));
    b0 ~ normal(0, 10);
    bD ~ normal(0, 10);
    bT ~ normal(0, 10);
}

