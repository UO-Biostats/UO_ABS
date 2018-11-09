RNAseq_Data <- read.table('Week4_RNAseq.csv', header=T, sep=',')
head(RNAseq_Data)

x <- RNAseq_Data $Treatment
y <- RNAseq_Data $VPS13A
z <- RNAseq_Data $YIPF5
a <- RNAseq_Data $ADA

RNAseq_aov <- aov(y ~ x)
summary (RNAseq_aov)
boxplot(y ~ x)


library(car)
scatterplot(x~y)

RNAseq_lm_linear <- lm(y ~ z)
summary (RNAseq_lm_linear)
influence.measures(RNAseq_lm_linear)

RNAseq_lm_poly <- lm(y ~ poly(z, 2))
summary (RNAseq_lm_poly)
influence.measures(RNAseq_lm_poly)

library(car)
scatterplotMatrix(~a+y+z, diag= "boxplot")