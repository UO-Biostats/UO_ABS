
###########################################Week1_Tues################################################


x <- 2
y <- x*3

3*y <- 3

log(x)


x <- "I Love"
y <- "Biostatistics"
z <- c(x,y)
print(z)


z_factor <- as.factor(z)
print(z)

x <- c(2,3,4,2,1,2,4,5,10,8,9)
print(x)


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



x <- rnorm(10000, 0, 10)
y <- sample(1:10000, 10000, replace=T)

plot(x,y)
hist(x)



x <- rnorm(1000, 0, 100)
seq_1 <- seq(0.0, 10.0, by = 0.1)
plot(seq_1, xlab="space", ylab="series 1", type = "p", col = "red", pch=19)



###########################################Reading in Some RNAseq_data################################################


RNAseq_Data <- read.table('GacuRNAseq_Subset.csv', header=T, sep=',')

print(RNAseq_Data$ENSGACG010)
print(RNAseq_Data$ENSGACG010>45.0)


summary1 <- summary(RNAseq_Data$ENSGACG003)
print(summary1)

hist(RNAseq_Data$ENSGACG003)

boxplot(RNAseq_Data$ENSGACG0003)
boxplot(RNAseq_Data$ENSGACG0003~RNAseq_Data$Population)

plot(RNAseq_Data$ENSGACG003,RNAseq_Data$ENSGACG0003)

boxplot(RNAseq_Data$ENSGACG003~RNAseq_Data$Treatment, col="red", ylab= "Expression Level",
        xlab="Treatment", border="orange", main="Boxplot of variation in gene expression across microbiota treatments")


###########################################Sampling from probability distributions ################################################


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

## Just adding a little bit at the the end
