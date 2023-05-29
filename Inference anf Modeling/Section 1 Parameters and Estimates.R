# 1. To understand how to use sampling model to perform a poll
# 2. Explain the terms pop, parameter and sample as they relate to stat inference
# 3. Use a sample to estimate pop proportion from the sample avg
# 4. Calc the expected val and std error of the sample avg

#### polls and prob theory ####
# construct scenario like what we learn b4 (like the beads and urn)
# the challenge is to guess spread of the proportion
# can take a sample with replacement to mimic running poll is expensive
# it'll cost like 0.10 per beat for sample
# if sample size is like 250 and won
# it'll be broken evenly since you pay $25 to collect ur $25
# Your entry into the comp can be interval
# So like u get halk what u paid

library(tidyverse)
library(dslabs)
take_poll(25) # drawing 25 beads

# The beads inside the urn represent individuals voting on the election day
# Like red is for party A and blue is for party B
# Assume no other colors
# only 2: A and B

# we want to predict proportion of blue beads in urn
# this quantity "p", which tells us the proportion of red beads is "1-p",
# and the spread is "p-(1-p)", simplify it to "2p-1".
# "population" = The beads in urn
# "parameter" = The proportion of blue beads in pop "p"
# "sample" = the 25 beads from previous plot
# The task of stat inference is to predict parameter "p" using the observed
# data in the sample

# Can we do with 25 observations from above?
# It's informative
# For exp: can see 13 red and 12 blue beads (from the plots)
#          it is unlikely that p>0.9 or p<0.1
#          because if they were they would be unprob to see 13 red and 12 blue
# We can construct an estimate "p" using only the info we observed
# estimate can be thought of as summary of observed data that we think is
# info about the parameter of interest
# seems intuitive that the proportion of blue beads in sample is 0.48 (for this
# case only) must be at least related to actual proportion of "p"
# And need to note that sample proportion is random
# Like if we run "take_poll(25)" multiple times, we'll be getting diff ans 
# each time since it's random
# "sample proportion" = the ranges of the random proportions of p
# by describing the dist of this random, we will be able to gain more
# insights and knowledge how good this estimate is and how we can make it better

# key points:
# 1. task of stat inference is to estimate an unknown pop parameter using 
#    observed data from sample
# 2. The collection of elements in the urn is called the "population"
# 3. a "parameter" is num that summarizes data for an entire population
# 4. a "sample" is an observed data from a subset of population
# 5. an "estimate" is a summary of the observed data about a parameter we believed is
#    informative. It's data-driven guess of the pop parameter.
# 6. To predict proportion of the blue beads in the urn, parameter "p"
# 7. The proportion of red beads in urn is "1-p"
# 8. The spread is "2p-1"


#### Sample Avg ####
# Taking an opinion poll is being modeled like taking random sample from urn
# Propose use of proportion of blue beads in sample as estimate of parameter "p"
# We can easily record the estimate of the spread "2p-1", but to make it simpler
# we illustrate stat inference for estimating "p"
# we use knowledge of prob to defend our us of sample proportion and quantify
# how close we think it is from the pop proportion "p"

# Have a random var X.
# X = 1 If we pick a blue bead at random and X = 0 if it is red.
# This implies that the pop is a list of 0s and 1s.
# If we sample N beads, then the avg of the draws X1,....,Xn is equivalent to 
# the proportion of blue beads in the sample.
# This is because by adding the Xs is equivalent to counting the blue bead and
# dividing by the total N, turns to proportion of blue beads
# X_bar = (X1+X2+...XN)/N = the avg (X with "-" on top)
# This theory is bout sum of draws as we know the distribution of (sum N x X_bar)
# as "N" is non-random constant and sample with replacement

# In this case, what do we know about the dist of sum of draws?
# we know that the expected value of sum of draws is N multiplied by
# the avg of values in urn. We also know that the avg of 1s and 0s in urn
# must be the proportion of blue beads (p).

# We encounter diff with what we did in probability previously, which is we
# don't know what is in the urn. We know it has blue and red, but don't know how
# many of each. So this is what we trying to estimate, the "p"


#### Parameter ####
# In stat inference, we define "parameter" to define unknowns part of our model
# In the urn model we are using to mimic opinion poll, we dk the proportion
# of blue beads in the urn
# Extrapolate = something like extracting
# idea presented on how we estimate parameter, and provide insights into how
# good these estimates are, extrapolate to many data science

#####
# Many data science task can be framed as estimating parameter
# We illustrate stat inference by working through process to estimate "p"
# From the estimate of "p" we can easily calc an estimate of the spread "2p-1"
# Consider random var, "X" that is 1 if blue and 0 if red chosen
# So the proportion of blue bead in N is X_bar 
# X_bar is the sample average and random var because it's the avg of random draws
# the bar on any symbol denotes the average
# So num of blue beads drawn in N draws is called (N x X_bar)
# Do we know the true proportion? No cause we trying to estimate parameter "p"
#####


#### POLLING VS FORECASTING ####
# if poll conducted few months b4 election, it is estimating the p for that moment
# not election day. Take not that key for election day might be diff since
# ppl opinion may fluctuate.
# Night of the election tend to be the most accurate 
# Forecaster try to predict election day and take consideration that
# opinion fluctuates
# Key point: poll taken in advance for that moment is p
# forecaster use early estimate of p to predict p of that day
# To understand how good the estimate is we test the stat property
# we describe the sample prop by random var we find

# sum of independent draws: N*X_bar
# E(N*X_bar) = N*p (the avg of the urn)
# dividing by the non random constant N = expected value of the avg X_bar is p
# we can also use what we learn to figure out std err
# SE(X_bar) = sqrt((p*(1-p))/N)
# E(X_bar) = p
# we can make SE as small as we want by increasing sample size due to law of large num
# with enough sample size it converge to p
# if we take large enough poll to make SE; exp about 0.01
# we will be certain of winner of the election
# but how large does the poll have to be for the SE to be this small?
# but there's a prob as we don't know p, so can't compute SE, 
# only N is known to us while p is unknown to us
# so for illustrative purpose, p is 0.51, and make plot of SE vs sample size N
p <- 0.51

N_1000 <- 1000
SE_1000 <- sqrt((p*(1-p))/N)
plot(SE, N)
SE_1000

N_10000 <- 10000
SE_10000 <- sqrt((p*(1-p))/N)
SE_10000

# opinion poll we target 500-3500
# approx 1.58% for p=51%
# it lead us astray if not aware of it being random
# when we are interpreting val of X_bar it important to remember that X_bar is 
# a random variable with an expected value of the SE of X_bar that represents 
# sample proportion of +tive events.

# the E(X_bar) is the parameter of interest p [E(X_bar) = p]
# this follow the fact that X_bar is the sum of 
# independent draw of a random variable of p times the a constant of 1/N
# as the num of draws N increases, the SE of our estimate X_bar decreases
# in theory, we can get a more acc estimate of p by increasing N, sample size.
# we can also use other random var to determine the expected value of the sum
# of draw E(S) and std error of sum of draws SE(S)
# E(S) = N*p
# SE(S) = sqrt(N*p*(1-p))

# 