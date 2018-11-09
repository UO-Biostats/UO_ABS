#SIMPLE BOOTSTRAP APPROACH TO GENERATE POINT ESTIMATE AND CONFIDENCE INTERVAL

#Using some perchlorate data...
#read in the file, making sure you've set the right working directory
Perchlorate_Data <- read.table('Perchlorate_Data.csv', header=T, sep=',')

#take a random sample with replacement of the testes area data
TA_sample <- sample(Perchlorate_Data$Testes_Area, replace=TRUE)

#find the mean of this sample
TA_average <- mean(TA_sample)
print(TA_average)

#now resample the testes area data 1000 times
TA_boot <- NULL
for (i in 1:1000){
  TA_boot <- rbind((sample(Perchlorate_Data$Testes_Area, replace=TRUE)), TA_boot)
}

#what does your final matrix look like?
tail(TA_boot)

#get the mean testes area for each bootstrap replicate
TA_boot_average <- apply(TA_boot, 1, mean)

#now plot a frequency distribution of the resampled means
#what does it look like?
hist(TA_boot_average)

#calculate the standard deviation of the resampled means (aka the bootstrap standard error)
sd(TA_boot_average)

#calculate the original standard error of the mean for x
sd(Perchlorate_Data$Testes_Area)/sqrt(390)

#calculate the 2.5th and 97.5th percentiles from the distribution of resampled means (~95% confidence interval)
lower_CI <- quantile(TA_boot_average, probs=0.025)
upper_CI <- quantile(TA_boot_average, probs=0.975)

#plot them on the resampled distribution
#what does this interval actually mean in terms of the testes area data?
hist(TA_boot_average)
abline(v=lower_CI, lwd=4, col='red')
abline(v=upper_CI, lwd=4, col='red')