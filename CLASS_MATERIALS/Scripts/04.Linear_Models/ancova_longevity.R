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

#To make a nice plot of the curvilinear trends for all 5 groups, 
#follow the code on Logan pg. 461