library(dslabs)
data(heights)
library(tidyverse)
ind <- heights$sex == "Male"
x <- heights$height[ind]




## quantile()
## using a quantile() function with desired quantile, "q"
## and u can find it by this code
quantile(data,q) 



## Percentile
## percentile are the quantiles that divide the dataset into 100 intervals each with 1% probability
## u can determine all the percentile of a dataset named data:
p <- seq(0.01, 0.99, 0.01)
percentile <- quantile(data, p) ## data: exp: heights$height
percentile



## Quartiles()
## Quartiles divide a dataset into 4 parts into 25% probability.
## they are equal to 25th, 50th, and 75th percentiles
# the 25th percentile is also known as the 1st quartile, 
# the 50th is also known as the median,
# and the 75th percentile is also known as the 3rd quartile.




## summary() function 
## Returns the minimum quartile and maximum of a vector

library(dslabs)
data(heights)
## use sumarry on the heights$height to find the quartile
summary(heights$height)
#:    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#:  50.00   66.00   68.50   68.32   71.00   82.68
## Find the percentiles of height$height
p <- seq(0.01, 0.99, 0.01)
percentile <- quantile(heights$height, p)
percentile
## quantile() function returns a named vector


## the "names" is just generic
percentile[names("percentile == 25")] ## general
percentile[names("percentile == 75")] ## general


## FINDING QUANTILES WITH qnorm()
## qnorm(): 
## this function gives the theoretical value of a quantile with probability "p"
# observing a value equals to or less than that quantile value 
# given a normal distribution with mean, mew and sd
qnorm(p, mu, sigma) ##general
## need to understand quantile, normal distribution, miu and standard deviation


## by default, mu=0 and sigma=1
## Therefore, calling qnorm() with no arguments 
## gives quantiles for the standard normal distribution
qnorm(p)
## recall that quantiles are defined such that p is the probability of 
## a random observation less than or equal to the quantile




# another subtopic
## relation to pnorm()
## pnorm() gives the probability that a value from 
## a standard normal distribution will be less than or equal to a z score value z
pnorm(-1.96)
#: 0.0249979
## the result of pnorm() is the quantile
qnorm(0.0249979)
#: -1.96
## pnorm() and qnorm() are inverse functions *****
pnorm(qnorm(0.025))
#: 0.025



## THEORETICAL QUANTILES
## u can use qnorm() to find the theoretical quantiles.
## which is the theoretical values ASSUMING that the dataset is following the normal distributions
## supposedly the males follow the normal distribution, avg=69 and sd=3
p <- seq(0.01, 0.99, 0.01)
theoretical_quantile <- qnorm(p, 69, 3)
theoretical_quantile
## It can be compared to sample countiles determine with the quantile() function 
## in order to evaluate whether the sample follows a distribution







## QUANTILE-QUANTILE PLOTS (QQ-PLOTS)
## if a distribution is well approximated by the normal distribution, we can have a very useful and short summary
## *BUT* to check if it is a good approx, we use QQ-plots

## 1. define series of proportions (p=0.01, p=0.15, ...p=0.95 and etc)
## 2. determine value of q. So that proportions in the data below q is p
## 3. What are the q? -They are referred to as the quantiles
mean(x <= 69.5) 
#: 0.5147783
## we have 50% that's below 69.5 inches
# so that means that if p=0.5, then the q associated with that p is 69.5
## we can make this computation for a series of p
## if the quantiles for the data match the quantile for the normal distribution, 
# then it must be because the data is approximated by normal distribution
## to obtain the quantile, e use quantile()
observed_quantiles <- quantile(x, p)
## we defined an object, observed_quantiles, and 
# calculate the quantiles at x at a series of values of p, which is stored in the object p
## we use qnorm() for the theoretical quantiles




## an object theoretical_quantiles to see if they match or not to plot them against each other and 
## draw an identity line to see if the lines fall on the points

# define x and z
library(dslabs)
data(heights)
library(tidyverse)
ind <- heights$sex == "Male"
x <- heights$height[ind]
z <- scale(x)
## proportion of data below 69.5
mean(x <= 69.5)
## calculate observed and theoretical quantiles
p <- seq(0.05, 0.95, 0.05)
observed_quantiles <- quantile(x, p)
theoretical_quantiles <- qnorm(p, mean=mean(x), sd=sd(x))
## make QQ-plot
plot(theoretical_quantiles, observed_quantiles)
abline(0, 1)
## the point fall near the line so it is a good approximation.


## *****last note*******
## So this work becomes slightly simpler if we use standard units
## we don't have to define mean and sd in function qnorm()

## Make QQ-plot with scaled values 
observed_quantiles <- quantile(z, p)
theoretical_quantiles <- qnorm(p) ## same with or without mean, sd)
plot(theoretical_quantiles, observed_quantiles)
abline(0, 1)





## histrogram
## we are convinced that the male in heights dataset 
# is well approximated with the normal distribution
## avg of 69.44 inches, sd=3.2 inches
## QQ-plots are used to check