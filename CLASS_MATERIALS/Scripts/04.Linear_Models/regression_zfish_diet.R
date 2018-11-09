##First example
zfish <- read.table('zfish_diet_new.tsv', header=T, sep='\t')

x <- zfish$Protein
y <- zfish$Weight

zfish_lm <- lm(y ~ x)
summary(zfish_lm)

#Now let's plot the relationship
plot(y ~ x, col = "blue")
abline(zfish_lm, col = "red")


#Now let's look at the residuals
hist(residuals(zfish_lm), breaks=30)


plot(residuals(zfish_lm) ~ fitted.values(zfish_lm))
plot(residuals(zfish_lm) ~ x)
#effectively the same plot (because of the pos. relationship between x and y)

plot(zfish_lm)
#This should produce 4 plots. What do they mean???



##Model I
x <- zfish$SL
y <- zfish$Weight

size_lm <- lm(y ~ x)
summary(size_lm)

plot(y ~ x, col="blue")
abline(size_lm, col="red")

##Model II
library(lmodel2)
size_lm_ModII <- lmodel2(y ~ x)
size_lm_ModII

#plot SMA line from parameter estimates
abline(a=0.1912797, b=0.1097880, lty=2)