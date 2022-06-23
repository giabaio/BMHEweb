###################################################################
## Install the relevant packages
##################################################################
install.packages("SimJoint")
install.packages("boot")

###################################################################
## Exercise 1
###################################################################

#### Question 1 ####
S <- 1000 
M <- 100
theta_3 <- runif(S, 0.2, 0.3) # Hypothetical distribution for theta_3
TTP_exp <- matrix(nrow = S, ncol = M) # Set up empty matrix
for (s in 1:S) { # Simulate s = 1,...,S studies
  r <- -log(1 - theta_3[s]) # Derive rate from s-th value of the transition probability
  TTP_exp[s, ] <- rexp(n = M, rate = r) # Sample M times-to-progression 
}

#### Question 2 ####
S <- 1000 
# Correlated joint distribution for theta_4 and theta_5 
# (Column 1: theta_4, Column 2: theta_5)
theta_4_5 <- MASS::mvrnorm(S,
                           c(5,6),
                           matrix(c(0.3, 0.1, 0.1, 0.5), nrow = 2)) 
M <- 100
TTP_weib <- matrix(nrow = S, ncol = M) # Set up empty matrix
for (s in 1:S) { # Simulate s = 1,...,S studies
  shape <- theta_4_5[s, 1] # Weibull shape parameter from s-th value of theta_4
  scale <- theta_4_5[s, 2] # Weibull scale parameter from s-th value of theta_5
  TTP_weib[s, ] <- rweibull(n = M, shape = shape, scale = scale)# Sample M times-to-progression 
}

#### Question 3 ####
censoring_time <- 6 
## Exponential
censoring_indicator_exp <- (TTP_exp > censoring_time) # Set indicator for times > 24 months
TTP_exp[censoring_indicator_exp] <- censoring_time # Set censored times to 24 months
## Weibull
censoring_indicator_weib <- (TTP_weib > censoring_time) # Set indicator for times > 24 months
TTP_weib[censoring_indicator_weib] <- censoring_time # Set censored times to 24 months

###################################################################
## Exercise 2
###################################################################

#### Question 1 ####
S <- 1000; theta_6 <- rbeta(S, 70, 15) # Hypothetical distribution for theta_3
M <- 100
v <- 0.04
utility <- matrix(nrow = S, ncol = M) # Set up empty matrix

calculate_beta_parameters <- function(mean, sd){
  # Function to estimate beta parameters from mean and standard deviation
  shape1 <- ((1 - mean) / sd ^ 2 - 1 / mean) * mean ^ 2
  shape2 <- shape1 * (1 / mean - 1)
  
  # Return the calculated parameters.
  return(list(shape1 = shape1,
              shape2 = shape2))
}

for (s in 1:S) { # Simulate s = 1,...,S studies
  # Derive beta parameters with iteration specific mean
  params <- calculate_beta_parameters(theta_6[s], sqrt(v)) 
  utility[s, ] <- rbeta(n = M, shape1 = params$shape1, 
                  shape2 = params$shape2) # Sample M times-to-progression 
}

#### Question 2 ####
library(SimJoint) # Package containing function to reorder data
S <- 1000
O <- 2
M <- 100
correlation <- matrix(c(1, 0.3, 0.3, 1), nrow = 2) # Specify the correlation matrix
corr_data <- array(dim = c(M, O, S)) # Set up empty array
for (s in 1:S) { # Simulate s = 1,...,S studies
  corr_data[ , 1, s] <- TTP_exp[s, ] # Extract the TTP data
  corr_data[ , 2, s] <- utility[s, ] # Extract the utility data
  corr_data[ , , s] <- postSimOpt(corr_data[, , s], 
                          correlation)$X # Reorder the columns so they are correlated 
}
corr_data <- round(corr_data, 14) # The postSimOpt function saves the value up to the computers level
# of accuracy, this means that the 0s for the binary outcomes are not saved properly.
# By rounding the data, we can preserve the 0s.


