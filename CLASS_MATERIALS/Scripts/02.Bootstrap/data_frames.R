# This exercise will help you get used to reading in and manipulating data files
# First off, remember to set your working directory to find your file correctly

Perc_Data <- read.table('Perchlorate_Data.csv', header=T, sep=',')


# OK, now let's look at the data
print (Perc_Data)


# This is a little easier
head (Perc_Data)
tail (Perc_Data)


# How do we look at a subset of the data?
# Can you see how we can do the same thing different ways?

print (Perc_Data[,2])

print (Perc_Data[1,])

print (Perc_Data[1,2])

print (Perc_Data$T4_Hormone_Level)

print (Perc_Data$T4_Hormone_Level>45.0)


# OK, let's try some summary stats and figures

blah <- summary(Perc_Data$T4_Hormone_Level)
print (blah)

hist(Perc_Data$T4_Hormone_Level)

boxplot(Perc_Data$T4_Hormone_Level)

plot(Perc_Data$T4_Hormone_Level,Perc_Data$Follicle_Area)

boxplot(Perc_Data$T4_Hormone_Level~Perc_Data$Perchlorate_Level, col = "red", 
        notch = T, ylab = "T4 Hormone level", xlab = "Treatment level", 
        border ="orange", main = "Boxplot of variation in T4 levels of zebrafish across different treatments of perchlorate")