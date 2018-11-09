####Parametric and Bootstrapped two-sample t-tests
####Advanced Biostatistics, 10-12-16, Fall 2016

#First, generate our toy data.
#A sample of 100 duck heights and a sample of 100 beaver heights.
#We are drawing these samples from normal distributions with different means.

#To ensure consistency of results in the face of random sampling, set the random num. generator seed!
set.seed(89973)

#Note that mean duck height is 1 unit greater than mean beaver height.

duck_ht <- rnorm(100, mean=20, sd=5)
beav_ht <- rnorm(100, mean=19, sd=5)

#Now we create a vector of factor levels corresponding to the data
species <- c(rep("duck",100),rep("beav",100))

#And combine the two height samples into a single vector.
heights <- c(duck_ht,beav_ht)

#Here we combine the two complete vectors into a single data frame.
ht_data <- data.frame(heights,species)

#If we look at boxplots for our two samples, we see the duck distribution is shifted toward\
#larger values relative to the beaver distribution, as expected.

boxplot(heights~species, data=ht_data)

#Let's perform a one-tailed test, for which the alternative hypothesis is that\
#mean beaver height is less than mean duck height.
#We will assume equal variances and therefore avoid using the Welch correction.

t.test(heights~species, data=ht_data, alternative="less", var.equal=TRUE)

#t=-2.7112, df=198, p=0.003647, so we reject the null hypothesis in favor of our alternative.
#beavers are shorter, on average, than ducks.


#Now let's do a bootstrapped t-test, even though it's not necessary because our assumptions\
#of normally distributed samples and equal varainces are met.

#First, calculate the test statistic t from our acutal samples, using the t equation
#It might be easier if we specify some variables first.
#Alternatively, we could write a function to calulcate t, but we won't this time.

b_mean_obs <- mean(beav_ht)
b_var_obs <- var(beav_ht)
b_n <- length(beav_ht)
d_mean_obs <- mean(duck_ht)
d_var_obs <- var(duck_ht)
d_n <- length(duck_ht)

#Here is the ugly calculation for our observed t-value (our test statistic)

t_obs <- (b_mean_obs-d_mean_obs)/#numerator
  sqrt(((b_n-1)*b_var_obs+(d_n-1)*d_var_obs)/(b_n+d_n-2)*((1/b_n)+(1/d_n)))#denominator

print(t_obs)#our t-statistic is -2.711154

#If we want to take advantage of the t.test function to do this calculation,\
#We can pull out just the "statistic" from the summary info. written by t.test()

t.test(beav_ht, duck_ht, alternative="less", var.equal=TRUE)$statistic

#Note that this is the same value for t, -2.711154 


#Now for the re-sampling of our data, and generation of a "null" distribution of t-values.

t_boot <- NULL
for(i in 1:10000){
  b_samp <- sample(ht_data$heights, 100, replace=TRUE)#randomly resamples 100 of 200 heights
  b_mean_samp <- mean(b_samp)#mean of our "beaver" resample
  b_var_samp <- var(b_samp)#variance of our "beaver" resample
  b_n <- length(b_samp)#N for our "beaver" resample
  
  d_samp <- sample(ht_data$heights, 100, replace=TRUE)#randomly resamples 100 of 200 heights
  d_mean_samp <- mean(d_samp)#mean of our "duck" resample
  d_var_samp <- var(d_samp)#variance of our "duck" resample
  d_n <- length(d_samp)#N for our "duck" resample
  
  #Now for our ugly calculation of t for each iteration of the loop. Will calc. 10000 ts.
  
  t_boot[i] <- (b_mean_samp-d_mean_samp)/#numerator
    sqrt(((b_n-1)*b_var_samp+(d_n-1)*d_var_samp)/(b_n+d_n-2)*((1/b_n)+(1/d_n)))#denominator 
}

#The bootstrapped standard error of t is simply the standard devaation of t_boot

sd(t_boot)#0.9920832

#let's plot the distribution of our re-sampled t-statistic
hist(t_boot, xlim=c(-5,5))

#Note that as expected, our mean for the distrubtion is about 0, our null expectation, which\
#assumes NO difference between the beaver and duck means

#add a vertical line to the histogram marking our actual, observed t
abline(v=t_obs, col="red")#The difference is way out in the left tail!

#Now we ask how frequently we observe a re-sampled t-value as small or smaller than our\
#original t. This is our p-value for a one-tailed test. Remember, our alternative\
#hypothesis is that beavers are shorter than ducks, on average.

p <- mean(t_boot<=t_obs)#What proportion of re-sampled ts out of 10,000 are <= -2.711154 ?
print(p)# p = 0.0032

#Again we reject our null hypothesis of no difference in favor of ducks being taller than beavers.

