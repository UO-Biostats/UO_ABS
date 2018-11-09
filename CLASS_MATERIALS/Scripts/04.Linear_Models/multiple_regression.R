###########################################Week4_Thurs#################################################################

RNAseq_Data <- read.table('RNAseq_lip.tsv', header=T, sep='\t')

y <- RNAseq_Data$Lipid_Conc
g1 <- RNAseq_Data$Gene01
g2 <- RNAseq_Data$Gene02

plot(y~g1)
plot(y~g2)


Mult_lm <- lm(y ~ g1*g2)
summary(Mult_lm)

Add_lm <- lm(y ~ g1+g2)
summary(Add_lm)







g3 <- RNAseq_Data$Gene03

library(car)
scatterplotMatrix(~g1+g2+g3, diag="boxplot")

RNAseq3_lm <- lm(y ~ g1+g2+g3)
summary(RNAseq3_lm)
plot(RNAseq3_lm)

#If run just y~g3, slope is very sig., whereas it wasn't in the multiple regression!
summary(lm(y~g3))

#To get tolerance calculations
1/vif(lm(y ~ g1 + g2 + g3))#g1 and g3 have tolerance values < 0.2, which should be considered






##Polynomial exercise
g4 <- Week5_RNAseq_Data$Gene04
lip <- Week5_RNAseq_Data$Lipid_Conc

plot(g4~lip)

#linear model
RNAseq_lm_linear <- lm(g4 ~ lip)
summary (RNAseq_lm_linear)
abline(RNAseq_lm_linear, col="red")

influence.measures(RNAseq_lm_linear)

#quadratic model
RNAseq_lm_poly <- lm(g4 ~ poly(lip, 2))
summary(RNAseq_lm_poly)
lines(lip, fitted(lm(g4~ poly(lip, 2))), type="l", col="blue")

influence.measures(RNAseq_lm_poly)
