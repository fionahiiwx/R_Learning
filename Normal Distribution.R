library(dslabs)
data(heights)
library(tidyverse)
## So for a list in the vector, x,
average <- sum(x)/length(x)
SD <- sqrt(sum((x-average)^2)/length(x))

ind <- heights$sex == "Male"
x <- heights$height[ind]



## calculate mean and standard deviation manually
average <- sum(x)/length(x)
SD <- sqrt(sum((x-average)^2)/length(x))



## use the built-in mean and standard deviation
average <- mean(x)
SD <- sd(x)
table <- c(average = average, SD = SD)
table
#:      average             SD
#:       69.314(inches)  3.611(inches)

## concept of standard units
## of value tells us how many SD this value is away 
## z 
## calculate standard units
z <- scale(x)
z

## calculate proportion of values within 2 SD of mean
mean(abs(z) < 2)
#: 0.9495074 
## 95% (within the -2<z<2, what the normal distribution expected)
## we can assume that the data is approximately normal
## we can estimate the proportion just by looking at it which is between -2 and 2

## if u look back at the normal distribution, what do u notice?
#: the max of z to the -z^2 is when z=0. If we convert normally distributed data, 
#: we can quickly know
#: for example, the person is in average height, that would mean z=0, short z=-2, tall z=2.
## it doesn't matter what the original units are.
## it applies to approximately normal

## count no. of -2<z<2 divided by total
## quantile plots!!


## NORMAL CDF & PNORM
## Useful approximate distribution.
## cumulative distribution for normal distribution is define by mathematical formula, pnorm()
## random quantity is normally distributed with avg and standard deviation is s.
## if we are willing to use the normal approximation, we don't need the entire dataset
## exp: probability that the randomly selected student is taller than x inches.
## we just need the avg height and SD then we just use the code
## we don't use data to define. 
## Normal distribution is used to describe continuous variable not discrete
## However, assuming practicing to be data science needed data which is discrete.
## plot distribution of heights in data
plot(prop.table(table(x)), xlab = "a = Height in inches", ylab = "Pr(X = a)")
## probabilities in actual data over length 1 ranges containing an integer.
mean(x <= 68.5) - mean(x <= 67.5)
#: 0.115
mean(x <= 69.5) - mean(x <= 68.5)
#: 0.119
mean(x <= 70.5) - mean(x <= 69.5)
#: 0.122
## this is using the actual data not the approximate data

## probabilities in normal approximation match well 
pnorm(68.5, mean(x), sd(x)) - pnorm(67.5, mean(x), sd(x))
#: 0.1031
pnorm(69.5, mean(x), sd(x)) - pnorm(68.5, mean(x), sd(x))
#: 0.1097
pnorm(70.5, mean(x), sd(x)) - pnorm(69.5, mean(x), sd(x))
#: 0.1081

## approximation is useful in normal. However, not the ones without integers
## probabilities in actual data over other ranges don't match other approx.
## as well. 
mean(x <= 70.9) - mean(x <= 70.1)
#: 0.02216749
pnorm(70.9, mean(x), sd(x)) - pnorm(70.1, mean(x), sd(x))
#: 0.08359562
## They are not good as this 2 are quite different but the other 3 are quite close.
## these situation are called DISCRETIZATION. WHY?
## this is due to rounding off.
## As long as we know how to handle it, it can still be useful.