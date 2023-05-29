### Q1. SAMPLE AVG (Correct)
# Write func code take_sample that takes the prop of Democrats p and 
# sample size N as arguments and returns the sample avg of Democrats (1) and
# Republicans (0)
# Calc the sample avg if the prop of Democrats equals 0.45 and 
# the sample size is 100
##
# 1. Define func called take_sample that takes p and N as arguments
# 2. Use sample() func as the first statement in ur func to sample N elements
#    from a vector of options where Democrats are assigned the val "1" and
#    Republicans are assigned the val "0" in that order
# 3. Use the mean() func as the 2nd statement in your func to find avg val
#    of the random sample
set.seed(1)
take_sample <- function(p,N){
  X <- sample(c(1,0), size=N, replace=TRUE, prob=c(p,1-p))
  mean(X)
}
p <- 0.45
N <- 100
take_sample(p,N)
#: 0.46




### Q2. Distribution of Errors (Correct)
# Assume that the prop of the Democrats in pop p equals to 0.45
# and that ur sample size N is 100 polled voters
# the take_sample func u define previously generates est, X_bar
# Rep the random sampling 10,000 times and calc p-X_bar for each random sample
# Save these diff as a vector called "errors"
# Find the avg of "errors" and plot a hist of the dist
##
# 1. use the replicate() func to replicate subtracting the result of take_sample
#    from value of p 10,000 times
# 2. use the mean() func to calc the avg of the diff between the sample avg and
#    actual val of p
set.seed(1)
p <- 0.45
N <- 100
B <- 10000
errors <- replicate(B, p-take_sample(p, N))
mean(errors)
#: -4.9e-05




## Q3 (Correct)
# U made a vector of diff between actual val of p and est, X_bar
# We call this diff between actual and est val "errors"
# The "errors" object has already been loaded 
# Plot the hist() func to plot a hist of the val contained in vector err
# Write a statement that best describes the dist of errors
hist(errors)
#: The errors are distributed normally and symmetrically around 0.


## Q4 (Correct)
# Avg size of error
# Define p as prop of democrats in the pop being polled 
# Define N as the num of ppl polled 
# The var B specifies num of time we want the sample to be replicated = 10,000
# we generated errors by subtracting the estimate from the prop of democratic
#   voters
# Calc the mean of the absolute val of each simulated error
set.seed(1)
p <- 0.45
N <- 100
B <- 10000
err <- replicate(B, p-take_sample(p,N))
mean(abs(err))
#: 0.039267

## Q5 (Correct)
# Std deviation of the square
# the sd is related to the typical size of the err we made when predicting
# we say size cause the err are centered often around 0
# in that sense, the typical err is 0
# for mathematical reason related to the CLT, we actually use the sd of err
#    rather than the avg of the abs vals
# the sd is the square root of the avg squared dist (X_bar - p)^2
# the sd is defined as the square root of distance square 
# calc the sd of the spread
# use the sample code to generate err (linked back to previous lines)
# use ^2 to square the dist 
# calc the avg squared dist using mean() func
# calc the square root of these val using sqrt() func
set.seed(1)
p <- 0.45
N <- 100
B <- 10000
err <- replicate(B, p-take_sample(p,N))
sqrt(mean(err^2))
# 0.04949939

## Q6
# Est the SE
# The theory we just learned tells us what sd is going to be as it is the 
# SD of X_bar
# est the SE given an expected val of 0.45 and sample size of 100
# calc the se using sqrt() func 
set.seed(1)
p <- 0.45
N <- 100
sqrt(take_sample(p,N)*(1-take_sample(p,N))/N)
#: 0.04937611

# Q7 (Correct)
# SE of the est
# in practice, we dk p, so we construct est of the theoretical prediction 
# based by plugging in X_bar for p
# calc the SE of the est 
# simulate a poll X using sample() func
# when using sample(), create a vector using c() that contains all possible polling
#    options where '1' indicates a democratic voter and '0' indicates republican
#    voter
# when using sample(), use 'replace = TRUE' within sample() func to indicate that
#   sampling from vector should occur with replacement
# when using sample)(), use 'prop =' within the sample() to indicate the prop of
#   selecting either element (0 or 1)
# Use mean() to calc the avg of the simulated poll, X_bar
# Calc the SE of the estimate 
set.seed(1)
p <- 0.45
N <- 100
X <- sample(c(0,1), N, replace=TRUE, p = c(1-p,p))
X_bar <- mean(X)
sqrt(X_bar*(1-X_bar)/N)
#: 0.04983974

# Q8
# Plotting the SE
# SE est obtained from Monte Carlo simulation,
# the theoretical prediction and est of the theoretical prediction are all very close
# which tells us that the theory is working
# this gives us a prac approach in knowing that the typical err we will make if 
# we predict p with X_bar
# The theoretical results give us an idea of how large a sample size is required
# to obtain the precision we need
# earlier we learn that the largest se occur for p=0.5

# Create a plot of the largest SE for N ranging from 100 to 5,000
# Base on this plot, how large does the sample size have to be to have a sd of
# about 1%?

N <- seq(100,5000,len=100)
p <- 0.5
se <- sqrt(p*(1-p)/N)
plot(N, se)
# 2,500