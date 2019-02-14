## The following code was adapted from
## https://statquest.org/2017/12/18/statquest-mds-and-pcoa-in-r/#code

library(ggplot2)
## In this example, the data is in a matrix called
## data.matrix
## columns are individual samples (i.e. cells)
## rows are measurements taken for all the samples (i.e. genes)
## Just for the sake of the example, here's some made up data...
data.matrix <- matrix(nrow=100, ncol=10)
colnames(data.matrix) <- c(
  paste("wt", 1:5, sep=""),
  paste("ko", 1:5, sep=""))
rownames(data.matrix) <- paste("gene", 1:100, sep="")
for (i in 1:100) {
  wt.values <- rpois(5, lambda=sample(x=10:1000, size=1))
  ko.values <- rpois(5, lambda=sample(x=10:1000, size=1))
  
  data.matrix[i,] <- c(wt.values, ko.values)
}
head(data.matrix)
dim(data.matrix)

###################################################################
##
## 1) Just for reference, draw a PCA plot using this data...
##
###################################################################
pca <- prcomp(t(data.matrix), scale=TRUE, center=TRUE) 

## calculate the percentage of variation that each PC accounts for...
pca.var <- pca$sdev^2
pca.var.per <- round(pca.var/sum(pca.var)*100, 1)
pca.var.per
barplot(pca.var.per)
## now make a fancy looking plot that shows the PCs and the variation:
pca.data <- data.frame(Sample=rownames(pca$x),
                       X=pca$x[,1],
                       Y=pca$x[,2])
pca.data

ggplot(data=pca.data, aes(x=X, y=Y, label=Sample)) +
  geom_text() +
  xlab(paste("PC1 - ", pca.var.per[1], "%", sep="")) +
  ylab(paste("PC2 - ", pca.var.per[2], "%", sep="")) +
  theme_bw() +
  ggtitle("PCA Graph")

###################################################################
##
## 2) Now draw an MDS plot using the same data and the Euclidean
##    distance. This graph should look the same as the PCA plot
##
###################################################################

## first, calculate the distance matrix using the Euclidian distance.
## NOTE: We are transposing, scaling and centering the data just like PCA.
distance.matrix <- dist(scale(t(data.matrix), center=TRUE, scale=TRUE),
                        method="euclidean")

## do the MDS math (this is basically eigen value decomposition)
mds.stuff <- cmdscale(distance.matrix, eig=TRUE, x.ret=TRUE)

## calculate the percentage of variation that each MDS axis accounts for...
mds.var.per <- round(mds.stuff$eig/sum(mds.stuff$eig)*100, 1)
mds.var.per

## now make a fancy looking plot that shows the MDS axes and the variation:
mds.values <- mds.stuff$points
mds.data <- data.frame(Sample=rownames(mds.values),
                       X=mds.values[,1],
                       Y=mds.values[,2])
mds.data

ggplot(data=mds.data, aes(x=X, y=Y, label=Sample)) +
  geom_text() +
  theme_bw() +
  xlab(paste("MDS1 - ", mds.var.per[1], "%", sep="")) +
  ylab(paste("MDS2 - ", mds.var.per[2], "%", sep="")) +
  ggtitle("MDS plot using Euclidean distance")

###################################################################
##
## 3) Now draw an MDS plot using the same data and metric of your choice 
##    This graph should look different than the first two
##
###################################################################

plot_mds <- function(data.matrix, metric = 'euclidean'){
  ## first, calculate the distance matrix using the given metric.
  ## NOTE: We are transposing, scaling and centering the data just like PCA.
  distance.matrix <- dist(scale(t(data.matrix), center=TRUE, scale=TRUE),
                          method=metric)
  
  ## do the MDS math (this is basically eigen value decomposition)
  mds.stuff <- cmdscale(distance.matrix, eig=TRUE, x.ret=TRUE)
  
  ## calculate the percentage of variation that each MDS axis accounts for...
  mds.var.per <- round(mds.stuff$eig/sum(mds.stuff$eig)*100, 1)
  
  ## now make a fancy looking plot that shows the MDS axes and the variation:
  mds.values <- mds.stuff$points
  mds.data <- data.frame(Sample=rownames(mds.values),
                         X=mds.values[,1],
                         Y=mds.values[,2])
  
  ggplot(data=mds.data, aes(x=X, y=Y, label=Sample)) +
    geom_text() +
    theme_bw() +
    xlab(paste("MDS1 - ", mds.var.per[1], "%", sep="")) +
    ylab(paste("MDS2 - ", mds.var.per[2], "%", sep="")) +
    ggtitle(paste0("MDS plot using ",metric," distance"))
}

plot_mds(data.matrix)
