plant_stress <- read.table('plant_stress.tsv', header=T, sep='/t')
head(plant_stress)

x <- 
y <- 

perc_lm <- lm(y ~ x)
summary (perc_lm)

plot(y ~ x, col = "blue")
abline(perc_lm, col = "red")

head (residuals(perc_lm))
x <- residuals(perc_lm)
print(x)

plot ( residuals(perc_lm) ~ fitted.values(perc_lm))
plot ( residuals(perc_lm) ~ fitted.values(x))