##Example of interaction plot
##Cell count is the response variable
##Factor 1 is Genotype (2 levels: B; A)
##Factor 2 is Treatment (3 levels: trt2; trt3; trt1)

data <- read.table(file='IntPlot_data.txt', sep="\t", header=TRUE, comment.char="")

#Define variables
Count <- data$cell_count
Genotype <- data$Genotype
Treatment <- data$Treatment

#Load necessary packages 
library(sfsmisc)
library(plotrix)

#Calculate means and SEMs using aggregate()
#Take note of factor level combo. order in the vectors
aggregate(Count~Genotype*Treatment, FUN = mean)
aggregate(Count~Genotype*Treatment, FUN = std.error)

#Define objects for plotting
null <- NULL #will use to initiate a blank plot area

#Define vectors of values 
means <- aggregate(Count~Genotype*Treatment, FUN = mean)[,3]
SEMs <- aggregate(Count~Genotype*Treatment, FUN = std.error)[,3]
lowers <- means-SEMs
uppers <- means+SEMs

#set margins and blank plot area

par(mgp = c(2.5, 1, 0), mar=c(3.5, 4, 2, 2))
plot(null, xlim=c(1,6), ylim=c(40,200), xaxt='n', ylab='Cell Count', xlab='', 
     font.lab=2, cex.lab=1)

#Draw lines connecting treatment means for each genotype

segments(1.5, means[3], 3.5, means[5], lwd=3.5, col='dark green')
segments(3.5, means[5], 5.5, means[1], lwd=3.5, col='dark green')
segments(1.5, means[4], 3.5, means[6], lwd=3.5, col='darkblue')
segments(3.5, means[6], 5.5, means[2], lwd=3.5, col='darkblue')

#Draw error whiskers, mean points, then error whisker staples

segments(c(5.5,5.5,1.5,1.5,3.5,3.5), uppers, c(5.5,5.5,1.5,1.5,3.5,3.5), lowers, lwd=3, lty=1)
points(c(5.5,5.5,1.5,1.5,3.5,3.5), means, pch=24, cex=1.7, bg=c('darkgreen', 'steelblue4',
        'palegreen', 'powderblue', 'palegreen4', 'steelblue2'))
points(c(5.5,5.5,1.5,1.5,3.5,3.5), uppers, pch="-", cex=2)
points(c(5.5,5.5,1.5,1.5,3.5,3.5), lowers, pch="-", cex=2)

#Write text to label lines

text(2.5, 190, "Genotype B", font=2, col="dark blue", cex=0.8)
segments(1.5, 190, 2, 190, lwd=3.5, col="dark blue")
text(2.5, 170, "Genotype A", font=2, col="dark green", cex=0.8)
segments(1.5, 170, 2, 170, lwd=3.5, col="dark green")

#Write x-axis labels for treatments

axis(1, pos=33.5, at=c(1.5, 3.5, 5.5), labels=(c('trt2','trt3',
     'trt1')), lwd.ticks=2, font.axis=2, cex.axis=0.8)
