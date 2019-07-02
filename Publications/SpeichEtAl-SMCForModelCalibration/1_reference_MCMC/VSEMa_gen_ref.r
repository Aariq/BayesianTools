## VSEMa: with highly correlated parameters 3 (LUE) and 4(GAMMA)

########################################
# Setting up VSEM and Bayesian Setup
########################################

library(BayesianTools)

set.seed(123)

# Create input data for the model
PAR <- VSEMcreatePAR(1:1000)
#plot(PAR, main = "PAR (driving the model)", xlab = "Day")

# load reference parameter definition (upper, lower prior)
refPars <- VSEMgetDefaults()
# this adds one additional parameter for the likelihood standard deviation (see below)
refPars[12,] <- c(2, 0.1, 4) 
rownames(refPars)[12] <- "error-sd"
head(refPars)

# create some simulated test data 
# generally recommended to start with simulated data before moving to real data
referenceData <- VSEM(refPars$best[1:11], PAR) # model predictions with reference parameters  
referenceData[,1] = 1000 * referenceData[,1] 
# this adds the error - needs to conform to the error definition in the likelihood
obs <- referenceData + rnorm(length(referenceData), sd = refPars$best[12])
oldpar <- par(mfrow = c(2,2))
#for (i in 1:4) plotTimeSeries(observed = obs[,i], predicted = referenceData[,i], main = colnames(referenceData)[i])

# Best to program in a way that we can choose easily which parameters to calibrate
parSel = c(1:6, 12)

# here is the likelihood 
likelihood <- function(par, sum = TRUE){
  # set parameters that are not calibrated on default values 
  x = refPars$best
  x[parSel] = par
  predicted <- VSEM(x[1:11], PAR) # replace here VSEM with your model 
  predicted[,1] = 1000 * predicted[,1] # this is just rescaling
  diff <- c(predicted[,1:4] - obs[,1:4]) # difference betweeno observed and predicted
  # univariate normal likelihood. Note that there is a parameter involved here that is fit
  llValues <- dnorm(diff, sd = x[12], log = TRUE)  
  if (sum == FALSE) return(llValues)
  else return(sum(llValues))
}

# optional, you can also directly provide lower, upper in the createBayesianSetup, see help
prior <- createUniformPrior(lower = refPars$lower[parSel], 
                            upper = refPars$upper[parSel], best = refPars$best[parSel])

bayesianSetup <- createBayesianSetup(likelihood, prior, names = rownames(refPars)[parSel])


########################################
# Generate reference run
########################################

settings <- list(iterations = 2000000, nrChains = 3, thin=100)
reference <- runMCMC(bayesianSetup = bayesianSetup, sampler = "DEzs", settings = settings)

save.list <- list(PAR, obs, reference)

save(save.list, file = "./out/reference_VSEMa_list.RData") 