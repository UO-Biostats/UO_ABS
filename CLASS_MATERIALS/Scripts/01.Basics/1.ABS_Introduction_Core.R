
###########################################Week1_Tues################################################


setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_1/')
RNAseq_Data <- read.table('GacuRNAseq_Subset.csv', header=T, sep=',')

print(RNAseq_Data$ENSGACG00000000010)
print(RNAseq_Data$ENSGACG00000000010>45.0)


summary1 <- summary(RNAseq_Data$ENSGACG00000000003)
print(summary1)

hist(RNAseq_Data$ENSGACG00000000003)


boxplot(RNAseq_Data$ENSGACG00000000003)
boxplot(RNAseq_Data$ENSGACG00000000003~RNAseq_Data$Population)

plot(RNAseq_Data$ENSGACG00000000003,RNAseq_Data$ENSGACG00000000003)

boxplot(RNAseq_Data$ENSGACG00000000003~RNAseq_Data$Treatment, col="red", ylab= "Expression Level",
        xlab="Treatment", border="orange", main="Boxplot of variation in gene expression across microbiota treatments")





x <- 2
y <- x*3

3*y <- 3

log(x)


x <- "I Love"
y <- "Biostatistics"
z <- c(x,y)

z_factor <- as.factor(z)

x <- c(2,3,4,2,1,2,4,5,10,8,9)



seq_1 <- seq(0.0, 10.0, by = 0.1)
seq_2 <- seq(10.0, 0.0, by = -0.1)



x <- rnorm(10000, 0, 10)
y <- sample(1:10000, 10000, replace=T)


plot(x,y)
hist(x)



x <- rnorm(1000, 0, 100)

seq_1 <- seq(0.0, 10.0, by = 0.1)
plot(seq_1, xlab="space", ylab="series 1", type = "p",
     col = "red", pch=19)





###########################################Week1_Thurs################################################
#Make comments
seq_1 <- seq(0.0, 10.0, by = 0.1)
print(seq_1)

seq_2 <- seq(10.0, 0.0, by = -0.1)
print(seq_2)

par(mfrow=c(1,2))
plot(seq_1, xlab="time", 
     ylab="p in population 1", 
     type="p", col="red")
plot(seq_2, xlab="time", 
     ylab="p in population 2", 
     type="p", col="green")





setwd("/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_1")
RNAseq_Data <- read.table("GacuRNAseq_Subset.csv",
               header=TRUE, sep=",")

print(RNAseq_Data)


head(RNAseq_Data)
tail(RNAseq_Data)


print(RNAseq_Data[,2])
print(RNAseq_Data[1,])
print(RNAseq_Data$ENSGACG00000000010)
print(RNAseq_Data$ENSGACG00000000010>45.0)

summary1 <- summary(RNAseq_Data$ENSGACG00000000003)
print(summary_1)

#Now for some plots
hist(RNAseq_Data$ENSGACG00000000003)

boxplot(RNAseq_Data$ENSGACG00000000003)
boxplot(RNAseq_Data$ENSGACG00000000003~
          RNAseq_Data$Population)

plot(RNAseq_Data$ENSGACG00000000003, 
     RNAseq_Data$ENSGACG00000000003)

boxplot(RNAseq_Data$ENSGACG00000000003~RNAseq_Data$Treatment,
        col="red", ylab="Expression Level", 
        xlab="Treatment", 
        border=c("blue","orange"),
        main="Boxplot of Gene 03 expression by microbiota")








# Below I’m having you plot the distribution using the ‘histogram’ function.
# Binomial Distribution
# function rbinom takes three parameters
#  1. The number of observations to generate
#  2. The number of trials for each observation
#  3. Probability of a success

b <- rbinom(n=100, size=20, prob=0.5)
hist(b)


# FYI:This kind of statement can be run in one line as well, which is sometimes 
# easier.
hist(rbinom(n=100, size=20, prob=0.5))
hist(rbinom(n=1000, size=20, prob=0.5))



###########################################Week1_Thurs################################################

install.packages("tidyverse")

library(tidyverse)
library(magrittr)





###########################################Week2_Thurs################################################

#R Interlude (ML estimation in R)

p <- seq(0, 1.0, by=0.001)
lnL <- dbinom(3594, 10000, x, log=TRUE)

plot(p, lnL, type = 'l')

lnL_func <- data.frame(p, lnL)


#Now, subset the dataframe to get the row for which lnL is at its max
subset(lnL_func, lnL==max(lnL))#MLE is 0.359

#Now, subset the datframe to get all rows for which lnL is at least as large as lnL-1.92
ci_interval <- subset(lnL_func, lnL>=max(lnL)-1.92)

#Approximate CI min and max as follows
min(ci_interval$p)
max(ci_interval$p)




###########################################Week3_Tues################################################

duck_ht <- rnorm(100, mean=20, sd=4)
beav_ht <- rnorm(100, mean=15, sd=3)

species <- c(rep("duck",100),rep("beav",100))
heights <- c(duck_ht,beav_ht)

ht_data <- data.frame(heights,species)

boxplot(heights~species, data=ht_data)
t.test(heights~species, data=ht_data)#Default, two-sided Welch
t.test(heights~species, data=ht_data, alternative="less")#ducks>beavs Welch
t.test(heights~species, data=ht_data, alternative="greater")#ducks<beavs Welch

t.test(heights~species, data=ht_data, var.equal=TRUE)#two-sided uncorrected
#gives lower p-value, because no unequal variance df penalty





#Bootstrap example
Gene1_means <- NULL
for(i in 1:10000){
  x <- sample(RNAseq$Gene01, 20, replace=TRUE)#randomly resamples Gene01 expression measurements
  Gene1_means[i] <- mean(x)#calculates the mean rate for each pseudo sample i  
}




#Function example 
coefvar <- function(x, na.rm = FALSE) {
  if (na.rm == TRUE)
    VAR <- x[!is.na(x)]
  else VAR <- x
  SD <- sd(VAR)
  Mn <- mean(VAR)
  N <- length(VAR)
  (SD*100/Mn)*(1 + 1/(4*N))
}



###########################################Week3_Thurs################################################

setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_3')
perc <- read.table('perchlorate_data.tsv', header=T, sep='\t')

my_lm <- lm(perc$T4_Hormone_Level~perc$Follicle_Area)

print(my_lm)#gives just the parameter estimates

summary(my_lm)#gives estimates, std. errs of estimates, t-values, and p-values


plot(perc$T4_Hormone_Level~perc$Follicle_Area, col="blue", pch=19)
abline(my_lm, col="red")


#resids

x <- perc$Follicle_Area
y <- perc$T4_Hormone_Level
perc_lm <- lm(y~x)
plot(y~x, col="blue")
abline(perc_lm, col="red")

head(residuals(perc_lm))
plot(residuals(perc_lm)~fitted.values(perc_lm))#wedge shaped!!!
plot(residuals(perc_lm)~x)

plot(perc_lm)







#No intercept
my_lm_NoInt <- lm(perc$T4_Hormone_Level~-1+perc$Follicle_Area)
summary(my_lm_NoInt)





###########################################Week4_Tues################################################

##First example
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_4')
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









##gfp data
gfp <- read.table('gfp_temp.tsv', header=T, sep='\t')
x <- gfp$temp
y <- gfp$gfp

gfp_lm <- lm(y ~ x)
summary(gfp_lm)

#Now let's plot the relationship
plot(y ~ x, col = "blue")
abline(gfp_lm, col = "red")


#Now let's look at the residuals
hist(residuals(gfp_lm), breaks=30)

plot(residuals(gfp_lm) ~ fitted.values(gfp_lm))
plot(residuals(gfp_lm) ~ x)






##Going back to look at outliers for zfish protein
plot(zfish_lm)
#What does the 4th plot show us?

influence.measures(zfish_lm)








#Used to create the gfp data
temp <- c(rep(15, 30), rep(17, 30), rep(19, 30), rep(21, 30), rep(23, 30), rep(25, 30), rep(27, 30), rep(29, 30))
gfp <- c(rnorm(30,200,10),rnorm(30,205,10),rnorm(30,210,10),rnorm(30,215,10),rnorm(30,220,10),rnorm(30,225,10),rnorm(30,230,10),rnorm(30,235,10))
gfp_data <- data.frame(gfp,temp)
write.table(gfp_data, "gfp_temp.tsv", sep = "\t")








###########################################Week4_Thurs#################################################################

setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_4')
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
g4 <- RNAseq_Data$Gene04
lip <- RNAseq_Data$Lipid_Conc

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
















###########################################Week5_Tues#################################################################
#One-way ANOVA
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_4')
RNAseq_Data <- read.table('RNAseq_lip.tsv', header=T, sep='\t')

g1 <- RNAseq_Data$Gene01
Pop <- RNAseq_Data$Population

boxplot(g1~Pop, col=c("blue","green"))

#Or, to plot all points:
stripchart(g1~Pop, vertical=T, pch=19, col=c("blue","green"),
           at=c(1.25,1.75), method="jitter", jitter=0.05)

Pop_Anova <- aov(g1 ~ Pop)
summary(Pop_Anova)





##Manual F-ratio Calculation

#Group subsets
ys_Bt <- subset(RNAseq_Data, Population=="Boot")$Gene01
ys_RS <- subset(RNAseq_Data, Population=="RabbitSlough")$Gene01

#Group Ns
n_Bt <- length(ys_Bt)
n_RS <- length(ys_RS)

#Means
ybar_grand <- mean(RNAseq_Data$Gene01)
ybar_Bt <- mean(ys_Bt)
ybar_RS <- mean(ys_RS)

#Residuals
sqrd_resids_Bt <- (ys_Bt-ybar_Bt)^2 
sqrd_resids_RS <- (ys_RS-ybar_RS)^2

MS_groups <- sum((n_Bt*(ybar_Bt-ybar_grand)^2),(n_RS*(ybar_RS-ybar_grand)^2))/
              (2-1)

MS_resids <- sum(sqrd_resids_Bt,sqrd_resids_RS)/
              (sum(n_Bt,n_RS)-2)

F_ratio <- MS_groups/MS_resids
print(F_ratio)#29.33763

#Calculate prob. of observing an F this large under null hypoth.
pf(29.33763,1,18,lower.tail=FALSE)#3.802321e-05

#aov() summary again
summary(Pop_Anova)









#Tukey contrasts
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_3')
perc <- read.table('perchlorate_data.tsv', header=T, sep='\t')

x <- perc$Perchlorate_Level
y <- log10(perc$T4_Hormone_Level)

MyANOVA <- aov(y ~ x)
summary (MyANOVA)
boxplot(y ~ x)

#install.packages("multcomp")
library(multcomp)

summary(glht(MyANOVA, linfct = mcp(x = "Tukey")))







#One-way ANOVA with power
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_3')
perc <- read.table('perchlorate_data.tsv', header=T, sep='\t')

x <- perc$Strain
y <- log10(perc$T4_Hormone_Level)

MyANOVA <- aov(y ~ x)
summary (MyANOVA)
boxplot(y ~ x)

#install.packages('pwr')
library(pwr)

#parameter calcuations for two-sample t-test power
N_AB <- length(subset(perc, Strain=="AB")$T4_Hormone_Level)#N is 200
N_WK <- length(subset(perc, Strain=="WK")$T4_Hormone_Level)#N is 190

mean_AB <- mean(log10(subset(perc, Strain=="AB")$T4_Hormone_Level))#mean is 1.592324
mean_WK <- mean(log10(subset(perc, Strain=="WK")$T4_Hormone_Level))#mean is 1.48759

sd_AB <- sd(log10(subset(perc, Strain=="AB")$T4_Hormone_Level))#sd is 0.191506
sd_WK <- sd(log10(subset(perc, Strain=="WK")$T4_Hormone_Level))#sd is 0.2123544
#For calculations that require the "common standard deviation" use the higher within-group sd.

diff <-  mean_AB-mean_WK#If using power.t.test(), this is the "delta" value

t_ES <- (mean_AB-mean_WK)/sd_WK#If using pwr.t2n.test, this is the "d" value
#In this case, we use the sd of WK values as a conservative estimate of the common std. dev. 

#Power calc. for two-sample t-test with different Ns
pwr.t2n.test(n1=N_AB, n2=N_WK, d=t_ES, sig.level=0.05, power=NULL)#Our power is 0.998


#Power calc. for ANOVA, assuming medium effect size (f=0.25)
#Effect size (f) is difficult to calculate, so we use basic guidelines for 
pwr.anova.test(k=2, n=N_WK, f=0.25, sig.level=.05, power=NULL)#Our power is 0.998



#Sample size calc for unbalanced, two-sample t-test, given power of 0.9, alpha of 0.05, 
#and a mean diff of 1.3 T4 units ("d" will be 0.114/sd_WK)
t_ES_new <- 0.114/sd_WK
pwr.t2n.test(n1=N_AB, n2=NULL, d=t_ES_new, sig.level=0.05, power=0.9)
#If we have 200 AB fish, we need 46 WK fish
#This isn't that usefull, because we'd like to use ~ equal Ns

pwr.t2n.test(n1=75, n2=NULL, d=t_ES_new, sig.level=0.05, power=0.9)
#If we assume 75 AB fish, then we need 73 WK fish, and the numbers are pretty balanced




###########################################Week5_Thurs#################################################################
#Tukey contrasts
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_3')
perc <- read.table('perchlorate_data.tsv', header=T, sep='\t')

x <- perc$Perchlorate_Level
y <- log10(perc$T4_Hormone_Level)

MyANOVA <- aov(y ~ x)
summary (MyANOVA)
boxplot(y ~ x)

#install.packages("multcomp")
library(multcomp)

summary(glht(MyANOVA, linfct = mcp(x = "Tukey")))









#One-way ANOVA with power
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_3')
perc <- read.table('perchlorate_data.tsv', header=T, sep='\t')

x <- perc$Strain
y <- log10(perc$T4_Hormone_Level)

MyANOVA <- aov(y ~ x)
summary (MyANOVA)
boxplot(y ~ x)

#install.packages('pwr')
library(pwr)

#parameter calcuations for two-sample t-test power
N_AB <- length(subset(perc, Strain=="AB")$T4_Hormone_Level)#N is 200
N_WK <- length(subset(perc, Strain=="WK")$T4_Hormone_Level)#N is 190

mean_AB <- mean(log10(subset(perc, Strain=="AB")$T4_Hormone_Level))#mean is 1.592324
mean_WK <- mean(log10(subset(perc, Strain=="WK")$T4_Hormone_Level))#mean is 1.48759

sd_AB <- sd(log10(subset(perc, Strain=="AB")$T4_Hormone_Level))#sd is 0.191506
sd_WK <- sd(log10(subset(perc, Strain=="WK")$T4_Hormone_Level))#sd is 0.2123544
#For calculations that require the "common standard deviation" use the higher within-group sd.

diff <-  mean_AB-mean_WK#If using power.t.test(), this is the "delta" value

t_ES <- (mean_AB-mean_WK)/sd_WK#If using pwr.t2n.test, this is the "d" value
#In this case, we use the sd of WK values as a conservative estimate of the common std. dev. 

#Power calc. for two-sample t-test with different Ns
pwr.t2n.test(n1=N_AB, n2=N_WK, d=t_ES, sig.level=0.05, power=NULL)#Our power is 0.998


#Power calc. for ANOVA, assuming medium effect size (f=0.25)
#Effect size (f) is difficult to calculate, so we use basic guidelines for 
pwr.anova.test(k=2, n=N_WK, f=0.25, sig.level=.05, power=NULL)#Our power is 0.998



#Sample size calc for unbalanced, two-sample t-test, given power of 0.9, alpha of 0.05, 
#and a mean diff of 1.3 T4 units ("d" will be 0.114/sd_WK)
t_ES_new <- 0.114/sd_WK
pwr.t2n.test(n1=N_AB, n2=NULL, d=t_ES_new, sig.level=0.05, power=0.9)
#If we have 200 AB fish, we need 46 WK fish
#This isn't that usefull, because we'd like to use ~ equal Ns

pwr.t2n.test(n1=75, n2=NULL, d=t_ES_new, sig.level=0.05, power=0.9)
#If we assume 75 AB fish, then we need 73 WK fish, and the numbers are pretty balanced






###########################################Week6_Tues#################################################################

#Nested ANOVA
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_6')

andrew_data <- read.table('andrew.tsv', header=T, sep='\t')
head(andrew_data)

#Create new TREAT2, which is a 2-level factor
andrew_data$TREAT2 <- factor(c(rep("low",40),rep("high",40)))

#The nested factor is PATCH - also need to turn this into a factor 
andrew_data$PATCH <- factor(andrew_data$PATCH)

#Evaluate distribution of ALGAE at the appropriate level
andrew.agg <- with(andrew_data, aggregate(data.frame(ALGAE), 
              by = list(TREAT2=TREAT2,PATCH=PATCH), mean))

library(nlme)
andrew.agg <- gsummary(andrew_data, groups=andrew_data$PATCH)

boxplot(ALGAE ~ TREAT2, andrew.agg)

#Now do the nested ANOVA
nested.aov <- aov(ALGAE ~ TREAT2 + Error(PATCH), data=andrew_data)
summary(nested.aov)

#p = 0.107, so we can't reject Null Hyp. of no urchin effect

#Now estimate variance components:
library(nlme)
VarCorr(lme(ALGAE ~ 1, random = ~1 | TREAT2/PATCH, andrew_data))

(360.6102*100)/(103.6382+360.6102+298.6004)
#47.3% of variance due to among-patch diffs within treatment

(103.6382*100)/(103.6382+360.6102+298.6004)
#Only 13.6% of variance due to diffs between treatments





###########################################Week6_Thur#################################################################

#Factorial ANOVA
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_6')
rnadata <- read.table('RNAseq.tsv', header=T, sep='\t')
head(rnadata)

## continuous response variable 
gene <- rnadata$Gene80 

## main effect 1 
microbiota <- rnadata$Microbiota

## main effect 2
genotype <- rnadata$Genotype

boxplot(gene ~ microbiota)
boxplot(gene ~ genotype)
boxplot(gene ~ microbiota*genotype)

## Fit the factorial linear model
rna_aov <- aov(gene ~ microbiota + genotype + microbiota:genotype)
## Here's an equivalent way to do it
rna_aov <- aov(gene ~ microbiota*genotype)

## Examine the fitted model diagnostics
plot(rna_aov)


## Examine the ANOVA table
summary(rna_aov)
anova(rna_aov)






#Try contrasts

## continuous response variable 
gene <- rnadata$Gene80 

## main effect 1 
microbiota <- rnadata$Microbiota

## main effect 2
genotype <- rnadata$Genotype

## make new “pseudo factor,” combining genotype and microbiota
gxm <- interaction(genotype,microbiota)
levels(gxm)

boxplot(gene ~ gxm)

## specify the contrasts
contrasts(gxm) <- cbind(c(1, 0, -1, 0), c(0, 1, 0, -1))

## Fit the factorial linear model
rna_aov <- aov(gene ~ gxm)


## Examine the ANOVA table, using supplied contrasts
summary(rna_aov, split = list(gxm = list('CV vs. Mono in Mt'=1,
                                         'CV vs. Mono in WT'=2)))









##Unbalanced, mixed variance components estimate

## continuous response variable, excluding first 5 and last 5 observations 
gene <- rnadata$Gene80[6:75] 

## main effect 1 
microbiota <- rnadata$Microbiota[6:75]

## main effect 2
genotype <- rnadata$Genotype[6:75]

boxplot(gene ~ microbiota)
boxplot(gene ~ genotype)
boxplot(gene ~ microbiota*genotype)

## Estimate the variance components using Restricted Maximum Likelihood (REML)

library(lme4)
lmer(gene ~ 1 + (1 | microbiota) + (1 | genotype) + (1 | microbiota:genotype))




###########################################Week7_Tues################################################

##ANCOVA R interlude from class (Tueday, Week 7)
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_7')
longevity_data <- read.table('longevity.csv', header=T, sep=',')
head(longevity_data)

## continuous response variable
long <- longevity_data$LONGEVITY
## main effect 1
treat <- longevity_data$TREATMENT
## covariate
thorax <- longevity_data$THORAX

## check to see if the covariate should be included
boxplot(long ~ treat)
plot(long ~ thorax)

## assess assumptions of normality and homogeneity of variance
plot(aov(long ~ thorax + treat ), which = 1)
## try it again with a transformed response variable
plot(aov(log10(long) ~ thorax + treat ), which = 1)

## visually assess linearity, homogenetiy of slopes and covarate range equality
library(lattice)
print(xyplot(log10(long) ~ thorax | treat, type = c("r", "p")))

## formally test homogenetiy of slopes by testing the interaction term
anova(aov(log10(long) ~ thorax*treat))
## formally test covariate range disparity by modelling the effoct of teh treatments on the covariate
anova(aov(thorax ~ treat))

#define contrasts to compare preg vs. virgin and 1-mate virgin vs 8-mates virgin trts.
contrasts(treat) <- cbind(c(0,0.5,0.5,-0.5,-0.5), c(0,0,0,1,-1))
#confirm orthogonality of contrasts
round(crossprod(contrasts(treat)),1)#All off-diags 0, so yes, they are orthogonal.

#Now set up the linear model
partridge.aov <-aov(log10(long) ~ thorax + treat)

#Test the contrasts
install.packages("lsmeans")
library(lsmeans)

(partridge.lsm <- lsmeans(partridge.aov, "treat"))
contrast(partridge.lsm, list("Preg vs Virg" = c(0,0.5,0.5,-0.5,-0.5),
                             "1 Virg vs 8 Virg" = c(0,0,0,1,-1)))


##Chi-squared test
count <- c(161, 38, 53, 6)
type <- gl(4, 1, 4, c("YellowSmoothed", "YellowWrinkled", "GreenSmoothed",
                      "GreenWrinkled"))
seeds <- data.frame(type, count)
## convert the dataframe into a table
seeds_table <- xtabs(count ~ type, seeds)
## Assess the assumption less that 20% of data fewer than 5 expected values
chisq.test(seeds_table, p = c(9/16, 3/16, 3/16, 1/16), correct = F)$exp
## Now perform the test itself; the 'F' means that a correction is not needed
chisq.test(seeds_table, p = c(9/16, 3/16, 3/16, 1/16), correct = F)


##Contingency Analysis
eyes <- as.factor(c(rep("blue",347+191),rep("brown",177+329)))
hair <- as.factor(c(rep("blonde",347),rep("brunette",191),
                    rep("blonde",177),rep("brunette",329)))
features <- data.frame(eyes,hair)
colnames(features) <- c("eyes","hair")

features.xtab <- table(features$eyes, features$hair)
features.xtab <- with(features, table(eyes, hair))
features.xtab

#Assess min sample size requirements, then perform the chi-square test 
chisq.test(features.xtab, corr=F)$exp
chisq.test(features.xtab, corr=F)
#p<2e-16, so variables are not independent

#G-test
install.packages("Deducer")
library(Deducer)
likelihood.test(features$eyes,features$hair)
#similarly small p-value

#Which sources contribute to dependence the most?
chisq.test(features.xtab, corr=F)$res
#contributions are pretty equal

#Calculate odds ratios for having brown eyes, given blonde hair
install.packages("abd")
library(abd)
features.matrix <- matrix(c(347, 177, 191, 329), nrow = 2)
rownames(features.matrix) <- c("blue", "brown")
colnames(features.matrix) <- c("blonde", "brunette")
features.matrix
oddsRatio(features.matrix, quiet=FALSE)#0.2961
1/0.2961
#3.38 times less likely to have brown eyes than blue if a blonde.

#Mosaic plot
install.packages('vcd')
library(vcd)

strucplot(features.xtab, shade=T, labeling_args=list(set_varnames=c(eyes="eye color",
                                  hair="hair color"), offset_varnames=c(left=1.5, top=1.5)),
                                  margins=c(5,2,2,5))


##Uta presence data
install.packages("rms")
library(rms)
#use lrm in the rms package



###########################################Week8_Tues################################################
#MANOVA example
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_8')
clay_data <- read.table('Clays_RNAseq.tsv', header=T, sep='\t')
head(clay_data)

## continuous response variable 
geneA <- clay_data$Gene110 
geneB <- clay_data$Gene147 
geneC <- clay_data$Gene292 

## Assess whether these response variables co-vary

## Detect outliers
#install.packages('mvoutlier')
library(mvoutlier)



outliers <- aq.plot(clay_data[c("Gene110","Gene147","Gene292")])
outliers # show list of outliers
# The aq.plot( ) function in the mvoutlier package allows you to identfy multivariate 
# outliers by plotting the ordered squared robust Mahalanobis distances of the 
# observations against the empirical distribution function of the MD2i. 
# Input consists of a matrix or data frame. The function produces 4 graphs and returns
# a boolean vector identifying the outliers.

##Multivarite normality
install.packages('mvnormtest')
library(mvnormtest)

three_genes <- t(as.matrix(cbind(clay_data$Gene110,clay_data$Gene147,clay_data$Gene292)))
mshapiro.test(three_genes)




## main effect 1 
microbiota <- clay_data$Microbiota

## Fit the MANOVA model
clay_manova <- manova(cbind(geneA, geneB, geneC) ~ microbiota)

summary(clay_manova, test = "Pillai")
summary(clay_manova, test = "Wilks")
summary(clay_manova, test = "Hotelling-Lawley")
summary(clay_manova, test = "Roy")

summary.aov(clay_manova)





## Now change the main effect variable around so that it has the four 
## microbiota&genotype levels.


## New effect (“genotype-microbiota combination”): 
geno_micro <- clay_data$Geno.Micro

## Fit the MANOVA model
clay_manova <- manova(cbind(geneA, geneB, geneC) ~ geno_micro)

summary(clay_manova, test = "Pillai")
summary(clay_manova, test = "Wilks")
summary(clay_manova, test = "Hotelling-Lawley")
summary(clay_manova, test = "Roy")

summary.aov(clay_manova)


## Any differences relative to before?



## Now change the model around so that it is a factorial ANOVA with microbiota ## and genotype as separate factors.


## Keep factors separate: 
## 2 main effects 
microbiota <- clay_data$Microbiota
genotype <- clay_data$Genotype

## Fit the factorial MANOVA model
clay_manova <- manova(cbind(geneA, geneB, geneC) ~ genotype*microbiota)

summary(clay_manova, test = "Pillai")
summary(clay_manova, test = "Wilks")
summary(clay_manova, test = "Hotelling-Lawley")
summary(clay_manova, test = "Roy")

summary.aov(clay_manova)


## Any differences relative to before?






## Now include 10 response variables, re-evaluate assumptions, and re-fit the ## factorial model.
## Fit the MANOVA model
clay_manova <- manova(cbind(clay_data$Gene5,clay_data$Gene6,clay_data$Gene7,clay_data$Gene8,
                            clay_data$Gene9,clay_data$Gene10,clay_data$Gene11,clay_data$Gene12,
                            clay_data$Gene13,clay_data$Gene14)~genotype*microbiota)

summary(clay_manova, test = "Pillai")
summary(clay_manova, test = "Wilks")
summary(clay_manova, test = "Hotelling-Lawley")
summary(clay_manova, test = "Roy")


summary.aov(clay_manova)




###########################################Week8_Thurs################################################

##RNA-seq LDA R interlude

## Linear Discriminant Analysis (LDA or also known as DFA)
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_8')
clay_data <- read.table('Clays_RNAseq.tsv', header=T, sep='\t')

## Continuous response variables 
geneA <- clay_data$Gene110 
geneB <- clay_data$Gene147 
geneC <- clay_data$Gene292

## New effect ("genotype-microbiota combination"):
geno_micro <- clay_data$Geno.Micro

library(MASS)
clay_lda <- lda(geno_micro ~ geneA + geneB + geneC)
clay_lda
## What information do the different components of clay_lda contain? 

## Show results focused on first column of the DFA weightings
clay_lda$scaling[,1]

## Now, repeat the analysis but use the first 100 genes instead of just 3
clay_data_100 <- clay_data[,6:105]
clay_lda_100 <- lda(geno_micro~., clay_data_100)#Don't worry about the warning

## Now, Let's predict the DF scores for the original objects, based on the 50 genes. 
predict(clay_lda_100)
## What information does the predict() output contain?

plot(predict(clay_lda_100)$x[,2]~predict(clay_lda_100)$x[,1])




##"biomarkers" LDA R interlude

#make toy data set for "biomarkers" exercise
var1 <- rnorm(200, 500, 10)+seq(1,200,1)
var2 <- rnorm(200, 400, 50)+seq(1,200,1)
var3 <- rnorm(200, 225, 3)+seq(1,200,1)
var4 <- rnorm(200, 865, 20)+seq(100,.5,-0.5)
var5 <- rnorm(200, 425, 50)
var6 <- rnorm(200, 20, 12)+seq(50,.25,-0.25)

df <- data.frame(var1,var2,var3,var4,var5,var6)


## Load the data
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_8')
biomarkers <- read.table('biomarkers.tsv', header=T, sep='\t')
head(biomarkers)

## Specify our 6 response variables
mark1 <- biomarkers$marker1
mark2 <- biomarkers$marker2
mark3 <- biomarkers$marker3
mark4 <- biomarkers$marker4
mark5 <- biomarkers$marker5
mark6 <- biomarkers$marker6

## Specify “diagnosis” as our categorical predictor variable 
diag <- biomarkers$diagnosis


## Quick MANOVA to test for effect of diagnosis
#assumptions
library(mvoutlier)
library(mvnormtest)
#Mahalanobis Distance
outliers_marker <- aq.plot(biomarkers[c("marker1","marker2","marker3",
                                        "marker4","marker5","marker6")])
outliers_marker#No adjusted-quantile outliers
#Test for multivariate normality
six_markers <- t(as.matrix(cbind(mark1,mark2,mark3,mark4,mark5,mark6)))
mshapiro.test(six_markers)#p=0.082, so data are mv normal


marker_manova <- manova(cbind(mark1,mark2,mark3,mark4,mark5,mark6) ~ diag)  
summary(marker_manova, test = "Pillai")
summary(marker_manova, test = "Wilks")
summary(marker_manova, test = "Hotelling-Lawley")
summary(marker_manova, test = "Roy")
summary.aov(marker_manova)#individual ANOVAs for each marker  
  
## Now set up the DF (discriminant functions)  
library(MASS)
diag_lda <- lda(diag ~ mark1 + mark2 + mark3 + mark4 + mark5 + mark6)
diag_lda

## Show results focused on first column of the DFA weightings
diag_lda$scaling[,1]

## Now, Let's predict the DF scores for the original objects
predict(diag_lda)
LD_scores <- as.data.frame(predict(diag_lda)$x)

## Make a histogram of the discriminant function scores for the different diagnoses
ldahist(LD_scores$LD1, biomarkers$diagnosis)
ldahist(LD_scores$LD2, biomarkers$diagnosis)

## Now make a bivariate plot for DF1 and DF2, with diagnosis groups labeled uniquely.
par(mfrow=c(1,1), mar=c(5,4,4,2))
LD_scores$diag <- diag
plot(LD_scores$LD2~LD_scores$LD1, main="Prior diagnosis groups in 6-D biomarker space",
                                  pch=ifelse(LD_scores$diag=="benign",21,24),
                                  col=ifelse(LD_scores$diag=="benign", "blue",
                                             ifelse(LD_scores$diag=="sarcoma1","purple",
                                             "darkred")))
points(x=2.5, y=-2.5, pch=21, col="blue")
text(x=3, y=-2.5, "benign")

points(x=2.5, y=-2.8, pch=24, col="purple")
text(x=3.2, y=-2.8, "sarcoma 1")

points(x=2.5, y=-3.1, pch=24, col="darkred")
text(x=3.2, y=-3.1, "sarcoma 2")





###########################################Week9_Tues################################################

##Wine compounds PCA R interlude

setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_9')
wine_raw <- read.table('wine_chemicals.tsv', header = T, sep = '\t')
head (wine_raw)

# Step one: examine some pairwise plots to see if there is any correlation structure.

library(car)
scatterplotMatrix(wine_raw[,2:8])

# You can even do individual bivariate plots and label points by vineyard grouping.
# Try changing around the arguments in the 'text' command.

plot(wine_raw$C3, wine_raw$C4)
text(wine_raw$C3, wine_raw$C4, wine_raw$Vineyard, cex=0.7, pos=4, col="blue")


# Or, like we learned last week, label the different vineyards by color (or shape if you want).
plot(wine_raw$C3, wine_raw$C4, pch=19, col=ifelse(wine_raw$Vineyard==1, "blue",
                                       ifelse(wine_raw$Vineyard==2,"green","darkred")))




# Now calculate the summary statistics for the multivariate data.
# This allows you to grasp quickly whether they have the same means and variances.

sapply(wine_raw[,2:14], mean)
sapply(wine_raw[,2:14], sd)

# Since they don’t, we can standardize the data.
wine_stand <- as.data.frame(scale(wine_raw[,2:14]))
head(wine_stand)
sapply(wine_stand[,1:13], mean)
sapply(wine_stand[,1:13], sd)

# OK, time to run the principal component analysis:

wine_PCA <- princomp(wine_raw, scores = T, cor = T)

# After the PCA is run, you need to save the results to a new variable from which you can call the new data.
# Make sure that you know what the 'scores' and 'cor' arguments mean.
# Try running the analysis with cor = F. What happens?
princomp(wine_raw, scores = T, cor = F)#runs with covariance matrix

# Compare this result to running the PCA on the standardized data.
princomp(wine_stand, scores = T, cor = T)

# Look at the wine_PCA file. What new data are in this file?
wine_PCA$scores#For example



# Next, let's analyze the data using a scree plot.
plot (wine_PCA)

# we can now print the loadings of the new PCs.
wine_PCA$loadings

# And, let's print the biplot of the data.
biplot(wine_PCA)

# Lastly, let's look at the scores of the original objects on our new data.
y <- wine_PCA$scores
head(y)


# Note - here is a different function for performing the PCA, 
# but run it on both the raw and standardized data.
wine_PCA_2 <- prcomp(wine_raw)
plot (wine_PCA_2)
wine_PCA_3 <- prcomp(wine_stand)
plot (wine_PCA_3)




###########################################Week10_Tues################################################

##MDS with VEGAN R interlude

setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_10')

# First off, make sure to install the vegan package with all dependencies.
# install.packages(“vegan”)
library(vegan)

# We'll analyze a yeast dataset but with samples as rows and genes as columns.
yeast_data <- read.table('yeast_nmds.tsv', row.names = 1, header = T, sep = '\t')
head(yeast_data)

# Generate a dissimilarity matrix for all samples using vegdist().
# We use decostand() to “normalize,” which accounts for differing total read #s per sample.
# If the expression data are already normalized (e.g. copies per million), it is not needed.
vare.dis <- vegdist(decostand(yeast_data, "hellinger"), "euclidean")
print (vare.dis)

# What dissimilarity metric did we use?
# Proceed using this type of distance for now, but re-run the analysis with Bray-Curtis.

# Now let’s perform the MDS. 
# Remember, we’re reducing the dimensionality while retaining among-sample relationships.
vare.mds0 <- monoMDS(vare.dis)
print(vare.mds0)
# Note the stress value based on going from 499 to 2 dimensions. It should be < 0.15

# Do the original dissimilarities among samples map to our 2D ordination distance?
stressplot(vare.mds0, vare.dis)

# Now look for any clustering of the samples in the new, 2D space.
ordiplot (vare.mds0, type = "t")

# Now we can rerun the ordination and add all of the data (genes) as well.
vare.mds <- metaMDS(yeast_data, trace = F)
plot (vare.mds, type = "t")
      
# We can run our old friend PCA on our data as well.
vare.pca <- rda(yeast_data)
print (vare.pca)

# Showing both the locations of the samples. Try both plots.
plot (vare.pca)
plot (vare.pca, scaling = 3)

# And the weighting of the original variables (expression level) on the PCs
biplot (vare.pca, scaling = -1)


# Lastly, we can use the dissimilarity matrices to perform hierarchical clustering.
# Try both the non-normalized (clus.dis1) and normalized (clus.dis2) distances.
clus.dis1 <- vegdist(yeast_data)
clus.dis2 <- vegdist(decostand(yeast_data, "hell"), "euclidean")

cluster <- hclust(clus.dis1, "single")
plot(cluster)

# now, try these different versions of clustering
# what is different about them?

cluster_complete <- hclust(clus.dis1, "complete")
plot(cluster_complete)

cluster_average <- hclust(clus.dis1, "average")
plot(cluster_average)

# Lastly, let's ask R to cut the tree into several clusters for us
# I've written it as three. Try it with different numbers of clusters
# and the different types of clustering from above.

plot(cluster)

rect.hclust(cluster, 3)

groups <- cutree(cluster, 3)
groups


##############################stickleback RNA-seq example of nMDS###########################
library(vegan)
library(MASS)

#The metadata file containing info about the samples (stickleback guts)
Targets <- read.table("stickleback_metadata.tsv", sep="\t", head = TRUE)

myfile <- read.table("stickleback_data.tsv", head = TRUE, row.names = 1, sep='\t')
myfile <- t(myfile)#transpose the data frame to format for mds
head(myfile)

vare.dis <- vegdist(myfile)
vare.mds0 <- isoMDS(vare.dis, k=3)#This will reduce to 3 nMDS dimensions
stressplot(vare.mds0, vare.dis)
ordiplot(vare.mds0, type = "t")

#This sets up a vector of factor level combinations for Treatment and Population
Targets$TrtPop <- factor(paste(Targets$Treatment,Targets$Population,sep="."))

par(mgp = c(2.5, 1, 0))
pop=as.character(Targets$Population)
trt=as.character(Targets$Treatment)
trtpop=as.character(Targets$TrtPop)

#spider plot by Pop
fig <- ordiplot(vare.mds0, main="Stickleback Guts in Transcript Space\n(By Population)",
                ylab="nMDS Dimension 2", xlab="nMDS Dimension 1", 
                font.lab=2, font.axis=2, cex.axis=.7, type="none", cex.main=1)
ordispider(vare.mds0,groups=pop,label=FALSE)
points(fig, "sites", pch=19, col=c(rep("chartreuse4",48),rep("dodgerBlue3",36)), cex=1.2)


#spider plot by Treatment

fig <- ordiplot(vare.mds0, main="Stickleback Guts in Transcript Space\n(By Microbiota)",
                ylab="nMDS Dimension 2", xlab="nMDS Dimension 1", font.lab=2, 
                font.axis=2, cex.axis=.7, type="none", cex.main=1)
ordispider(vare.mds0,groups=trt,label=FALSE)
points(fig, "sites", pch=c(rep(19,6),rep(1,6),rep(19,6),rep(1,6),rep(19,12),rep(1,12),
                           rep(19,12),rep(1,12),rep(19,6),rep(1,6)), cex=1.2)


#spider plot by Treatment-Population combination
fig <- ordiplot(vare.mds0, main="Stickleback Guts in Transcript Space\n(By Population and Microbiota)",ylab="nMDS Dimension 2", xlab="nMDS Dimension 1", font.lab=2, 
                font.axis=2, cex.axis=.7, type="none", cex.main=1)
ordispider(vare.mds0,groups=trtpop,label=FALSE)
points(fig, "sites", pch=c(rep(19,6),rep(1,6),rep(19,6),rep(1,6),rep(19,12),rep(1,12),
                           rep(19,12),rep(1,12),rep(19,6),rep(1,6)), 
                           col=c(rep("chartreuse4",48),rep("dodgerBlue3",36)), cex=.7)



#ADONIS for full (Pop,Trt) factorial design

otu.env <- Targets #specify dataframe containing just expl. variables.

#run ADONIS using pairwise Bray-Curtis dissimilarities from above
adonis(vare.dis ~ Treatment*Population, otu.env, perm=1000)



###########################################Week10_Thurs################################################
##Heatmap for LG4 and LG19 Stickleback RNAseq data
setwd('/Users/csmall/Dropbox/BiometryCourse_Fall2015/Week_10')

# This is a subset of stickleback gut RNA-seq data (245 genes in 36 ind.)
heat_data <- read.table('stickleback_heat.tsv', row.names = 1, header = T, sep = '\t')
head(heat_data)
# FW_M = freshwater male; FW_F = freshwater female; OC_M = oceanic male; OC_F = oceanic female. 

#install.packages("gplots")
library(gplots)

# Use the heatmap.2() function to generate a heatmap for the data.
# Check out the help file and try tweaking some of the options.
heatmap.2(as.matrix(heat_data), col=redgreen(75), scale="row", key=T, keysize=1.5,
          density.info="none", trace="none",cexCol=0.9, labRow=NA)

# What kind of clustering is being used?


# Now remake the heatmap, but just using the genes on chromosome 19
heat_LG19 <- subset(heat_data, grepl("LG19", row.names(heat_data)))
heatmap.2(as.matrix(heat_LG19), col=redgreen(75), scale="row", key=T, keysize=1.5,
          density.info="none", trace="none",cexCol=0.9, labRow=NA)

# Remake the heatmap just using genes on chromosome 4, and include the gene names
heat_LG4 <- subset(heat_data, grepl("LG4", row.names(heat_data)))
heatmap.2(as.matrix(heat_LG4), col=redgreen(75), scale="row", key=T, keysize=1.5,
          density.info="none", trace="none",cexCol=0.9)

# Also try subsetting all oceanic fish, or all male fish, etc.
