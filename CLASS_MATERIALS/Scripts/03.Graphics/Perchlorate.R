# This exercise will help you get used to reading in and manipulating data files
# First off, remember to set your working directory to find your file correctly

Perchlorate_Data <- read.table('Week1_Perchlorate_Data.csv', header=T, sep=',')

# OK, now let's look at the data
print (Perchlorate_Data)

# This is a little easier
head (Perchlorate_Data)
tail (Perchlorate_Data)

# How do we look at a subset of the data?
# Can you see how we can do the same thing different ways?

print (Perchlorate_Data[,2])

print (Perchlorate_Data[1,])

print (Perchlorate_Data[1,2])

print (Perchlorate_Data$T4_Hormone_Level)

print (Perchlorate_Data$T4_Hormone_Level>45.0)

# OK, let's try some summary stats and figures

blah <- summary(Perchlorate_Data$T4_Hormone_Level)
print (blah)

hist(Perchlorate_Data$T4_Hormone_Level)

boxplot(Perchlorate_Data$T4_Hormone_Level)

plot(Perchlorate_Data$T4_Hormone_Level,Perchlorate_Data$Follicle_.Area)


boxplot(Perchlorate_Data$T4_Hormone_Level~Perchlorate_Data$Perchlorate_Level, col = "red", notch = T, ylab = "T4 Hormone level", xlab = "Treatment level", border ="orange", main = "Boxplot of variation in T4 levels of zebrafish across different treatments of perchlorate")