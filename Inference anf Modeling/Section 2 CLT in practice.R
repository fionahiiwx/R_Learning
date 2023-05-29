# using CLT to calc prob that a sample est X_bar is close to pop prop
# we gonna run the Monte Carlo simulation to corroborate theoretical results
# built using prob theory
# est the spread based on est of x_bar and sd
# to understand why bias can mean that larger sizes aren't necessarily better

# The CLT tells us that the dist func for a sum of draws is approx normal
# we also learn that by dividing a normally dist random var by a non-random
# constant result is norm dist
# this tells us that the distribution of x_bar is approx normal

# In summary, this x_bar has an approx norm dist
# expected val is p and se is sqrt(p(1-p)/N)

# Suppose we wanna know prob we are within 1% point from p. 
# What's the prob that the dist between x_bar and p and the absolute val of p
# is less than .01?
#: Pr(|x_bar-p| <= .01)

# Pr(x_bar<=p+.01) - Pr(x_bar<=p-.01)

# we can use math trick we learn in our previous session
# the trick is subtract expected val here and divide by se on both side
# of eq, so this gives us the standard normal random var, called Z
#: Pr(X_bar-E(X_bar))/SE <= (p+.01-E(X_bar))/SE(X_bar)
#= Pr(Z<=(p+.01-E(X_bar))/SE(X_bar))
#: Pr(X_bar-E(X_bar))/SE <= (p-.01-E(X_bar))/SE(X_bar)
#= Pr(Z<=(p-.01-E(X_bar))/SE(X_bar))


# we dk p so dk SE(X_bar)
# instead of p, we use X_bar, it's a plug-in est
# S^E(X_bar) = sqrt(X_bar(1-X_bar)/N)

# hat: to denote estimate
# instead of dividing by se, we use est of se

# Exp:
# 12 blue and 13 red beads
# X_bar = 0.48
# SE?
x_hat <- 0.48
se <- sqrt(x_hat*(1-x_hat)/25)
se
#: 0.09991997
#: about 0.1

# now we can ans the ques of prob being closer to p
# so the ans is using pnorm
pnorm(0.01/se) - pnorm(-0.01/se)
#: 0.07971926
# about 8%

# not very useful

# key points:
# as x_bar is sum of random draws divided by const, dist of x_bar is approx norm
# Z = (X_bar-E(X_bar))/SE(X_bar)
# the prob that x_bar within 0.01 of p followed by S^E(X_bar)
# the CLT works if X_bar used in place of p is called plug-in est
# we'll use prob of x_bar within 0.01 is 
# Pr(Z<=.01/sqrt(X_bar(1-X_bar)/N)) - Pr(Z<=(-.01)/sqrt(X_bar(1-X_bar)/N))

### margin of error ###
# a poll of 25 ppl is not really useful at least to closed election
# we can now define is as it's 2 times the se
# as if u ask what's the prob that we are within 2 std error from p
# Pr(Z<=2)-Pr(Z<=-2)
pnorm(2)-pnorm(-2)
#: 0.9544997
# there's a 95% chance of X_bar being within 2 sd 
# 95% is somewhat of an arbitrary choice as a common choice
# this tells us that our poll based on sample size of 25 is not very useful
# we don't really learn much when margin of error is large
# so voters like to use larger sample size
# x_bar = 0.48
# sample_size = 2000
# est_se = 0.011
# with a margin error of 2%

### Monte Carlo ###
# suppose we wanna use Monte Carlo simulation to corroborate the tools we have
# built using prob theory
B <- 10000
N <- 1000
x_hat <- replicate(B, {
  x <- sample(c(0,1), size=N,replace=TRUE, prob=c(1-p,p))
  mean(x)
})
# but the prob is we dk p
# so can't run the code
# it'll take a long time to run this but can take 10,000
# samples, count the beads and keep track of prop of blue
# we can pick value of p, or several and run simulations
p <- .45
N <- 1000
X <- sample(c(0,1), size=N, replace=TRUE, prob=c(1-p,p))
X_hat <- mean(X)
X_hat
#: 0.446


mean(x_hat)
# which get's us 0.45
sd(x_hat)
# u get 1.5% 

# we gonna do histogram and qqplot
par(mfrow = c(1,2))
hist(x_hat)
qqnorm(x_hat)
#: shows that this normal approx is accurate

library(tidyverse)
library(gridExtra)
p1 <- data.frame(x_hat=x_hat) %>%
  ggplot(aes(x_hat)) +
  geom_histogram(binwidth = 0.005, col = "pink")
p2 <- data.frame(x_hat=x_hat) %>%
  ggplot(aes(sample=x_hat)) +
  stat_qq(dparams=list(mean(x_hat), sd=sd(x_hat))) +
  geom_abline() +
  ylab("x_hat") +
  xlab("theoretical normal")
grid.arrange(p1, p2, nrow = 1)


#### The spread ####
# The comp is to predict the spread not prop p
# as we only assume there's 2 parties
# we know spread is just p-(1-p)=2p-1
# can easily be adapted to est to p-1
# once we have est X_bar and S^E(X_bar)
# we est spread by 2X_bar - 1, it is replacing the p
# since we multiply random var by 2, so we know the std error goes up by 2
# so sd error of this new one is 2S^E(X_bar)
# note that subtracting 1 doesn't add any variability so it doesn't affect se

# for exp
# with 25 beads, our estimate p is .48, with margin err .02, our est of spread
# is .04 with margin error of .40.

# spread between 2 outcomes with probs p and 1-p is 2p-1.
# the expected value of the spread is 2X_bar-1
# the std err of the spread is 2S^E(X_bar)
# the margin of err of the spread is 2 times the margin of error of x_bar

##### Bias ####
# why not run a very large poll
# for realistic value of p, like 0.35 to 0.65.
# if we run very large poll with 100,000 ppl, theory tells us that we would be
# able to predict the election almost perfectly since the largest possible margin
# err is around .3%

# plotting margin of error in an extremely large population of 100,000 ppl

library(tidyverse)
N <- 100000
p <- seq(0.35, 0.65, length = 100)
se <- sapply(p, function(x){
  2*sqrt(x*(1-x)/N)
})
data.frame(p=p, se=se) %>%
  ggplot(aes(p,se)) +
  geom_line()

# an extremely large poll would theoretically be able to predict
# election result almost perfectly
# these sample size is not practical
# in addition to cost concern, polling doesn't reach everyone in the pop
# (eventual voters with equal prob)SS
# it may also include data outside of pop
# ppl who will not end up voting 
# these systematic err in polling are called BIAS 