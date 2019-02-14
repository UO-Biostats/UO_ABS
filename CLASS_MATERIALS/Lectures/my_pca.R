#simulate and plot data
set.seed(2178)
x <- rnorm(1e3, 5, 1)
y <- rnorm(1e3, 2*x, 2)
dat <- data.frame(x=x,y=y)
plot(dat$x,dat$y, pch=20, col='darkgrey', asp=1)
abline(0,2, lwd=2)

#center data (moves origin to the centroid)
center_dat <- data.frame(scale(dat, scale=FALSE))

#visualize data
par(mfrow=c(1,2))
with(center_dat,
     plot(x,y, data=center_dat, asp=1, pch=20, col='darkgrey', xlab='centered x', ylab='centered y'))
points(0,0, pch=20)

#plot ols regression line
ols <- lm(y~x, data=center_dat)
abline(ols$coefficients[1], ols$coefficients[2], col='blue', lwd=2)

#plot principal components
pc <- princomp(dat, cor=FALSE)
summary(pc)
pc1_slope <- pc$loadings[2,1]/pc$loadings[1,1]
pc2_slope <- pc$loadings[2,2]/pc$loadings[1,2]
abline(0, pc1_slope, col='darkred', lwd=2)
abline(0, pc2_slope, col='green', lwd=2)

#compute eigenpairs of covariance matrix
eigs <- eigen(cov(center_dat))
U <- eigs$vectors #columns are principal components
neg_cols <- (U[1,] < 0) #specifies columns that have negative first element
U[,neg_cols] <- -U[,neg_cols] #agrees with princomp
print(U)
print(pc$loadings)
#D <- diag(eigs$values)
#U%*%D%*%t(U) is cov(center_dat)

eigendata <- as.matrix(center_dat) %*% U #data projected to principal directions
plot(eigendata, asp=1, pch=20, col='grey', xlab='PC1', ylab='PC2')
points(0,0, pch=20)
abline(0,0, col='darkred', lwd=2)
abline(v=0, col='green', lwd=2)

#check that this is the same plot as scores
points(pc$scores[,1], pc$scores[,2], pch = 20, col = 'purple')

#can recover original data from scores and center
og_center_dat <- pc$scores %*% t(pc$loadings)
#og_dat <- sweep(og_center_dat, 2, pc$center, '+')
plot(og_center_dat, asp=1, pch=20, main='centered data')
points(center_dat, pch=20, col='darkred')

og_proj_dat <- pc$scores[,1] %*% t(pc$loadings[,1])
plot(og_proj_dat, asp=1, pch=20, main='centered data projected to PC1')
abline(0, pc1_slope, col='darkred', lwd=2)






##to summarize, wrap this in function and compare to princomp()
my_princomp <- function(data, cor=FALSE){
  ###This function is the same as princomp(data, cor=FALSE)
  #center data
  center <- apply(data, 2, mean)
  scale <- rep(1, ncol(data))
  data <- sweep(data, 2, center)
  if(cor){
    scale <- apply(data, 2, sd)
    data <- sweep(data, 2, scale, '/')
  }
  #get eigenpairs
  K <- cov(data)
  eig <- eigen(K)
  #adjust eigenvectors
  loadings <- eig$vectors
  neg_cols <- (loadings[1,] < 0) #specifies columns that have negative first element
  loadings[,neg_cols] <- -loadings[,neg_cols] #agrees with princomp
  scores <- as.matrix(data) %*% loadings
  sdev <- sqrt(eig$values)
  
  return(list(sdev = sdev,
              loadings = loadings,
              center = center,
              scale = scale,
              n.obs = nrow(data),
              scores = scores
              ))
}

my_pc <- my_princomp(data = dat)

max_ad <- function(x,y){
  return( max(abs( x-y )) )
}
#compare
max_ad(my_pc$sdev, pc$sdev)
max_ad(my_pc$loadings, pc$loadings)
max_ad(my_pc$center, pc$center)
max_ad(my_pc$scale, pc$scale)
max_ad(my_pc$scores, pc$scores)
