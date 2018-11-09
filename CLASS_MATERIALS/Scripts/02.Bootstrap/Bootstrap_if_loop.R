# This is a script for bootstrapping data
# The first step is to read the data from the external 
perchlorate_data <- read.table("Perchlorate_Data.csv", header = T, sep = ",")
head(perchlorate_data) #just to make sure that the data were read correctly

follicle_number<-perchlorate_data$Number_of_Follicles # subset just the follicle data
head(follicle_number) #again, head just to make sure that it is working correctly
x_boot_rep = NULL #initialize vector of random subsets
x_boot_sample = NULL #initialize vector of status of bootstrapped

# The next set of code is a very useful for loop
# Notice that you have i created 1000 times by looping 
for (i in 1:1000){
  x_boot_rep = sample(follicle_number, replace=TRUE)
  x = mean(x_boot_rep)
  x_boot_sample[i] = x
}

# Now we can look at the sampling distribution itself. 
head(x_boot_sample)
hist(x_boot_sample)
boxplot(x_boot_sample)

# Let's get an estimate with it's standard error from the sampling distribution statistics
estimate <- mean(x_boot_sample)
stan_err <- sd(x_boot_sample)
lower_CI <- estimate - 1.96*stan_err
upper_CI <- estimate + 1.96*stan_err
print(lower_CI)
print(upper_CI)

