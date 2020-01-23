suppressMessages(library("rstan"))
#if (.Platform$OS.type == "windows"){
#	nul <- "NUL"
#} else{ 
#	nul <- "/dev/null"
#}

# compile and sample 8 schools model
schools_model <- function(){
	# model data
	schools_dat <- list(J = 8,
        	            y = c(28,  8, -3,  7, -1,  1, 18, 12),
                	    sigma = c(15, 10, 16, 11,  9, 11, 10, 18))

	# try to compile model
	mod <- stan_model(file = '8schools.stan')
	if (exists("mod")) {
		print("8 schools model compiled")
	} else {
		print("MODEL NOT COMPILED. GRRR")
	}
	
#	sink(nul)
	fit <- sampling(mod, data = schools_dat, chains = 1, iter = 2000)
#	sink()
	if (exists("fit")) {
		print("8 schools sampling complete")
	} else {
		print("SAMPLING NOT DONE. GRRR")
	}

	rm(mod, fit, schools_dat)
}


# compile and sample baseball model
baseball_model <- function(){
#	sink(nul)
	mod <- stan_model(file = 'baseball.stan')
#	sink()

	if (exists("mod")) {
		print("baseball model compiled")
	} else {
		print("MODEL NOT COMPILED. GRRR")
	}

	batting <- read.csv("../Lectures/BattingAverage.csv", header=TRUE)
	batting_dat <- list(N=nrow(batting),
                            hits=batting$Hits,
        	            at_bats=batting$AtBats,
               	            npos=nlevels(batting$PriPos),
                  	    position=as.numeric(batting$PriPos))

#	sink(nul)
	fit <- sampling(mod, data = batting_dat, chains = 1, iter = 2000)
#	sink()

	if (exists("fit")) {
		print("baseball sampling complete")
	} else {
		print("SAMPLING NOT DONE. GRRR")
	}

	rm(mod, fit, batting, batting_dat)
}

schools_model()
baseball_model()
