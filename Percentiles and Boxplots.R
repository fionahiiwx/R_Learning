## Percentiles are special cases for quantiles.
## percentiles are the quantile that u obtain
## we are gonna code things that are common in eda
## the case of p=0.25. the 25th percentile.
## this will give use the num of which 25 percent other data is below.
## 50th percentile is the most famous one which is also known as median.

## In normal distribution, median and avg are the same!!

library(dslabs)
library(dplyr)
library(tidyverse)
data(murders)


## histogram
murders <- mutate(murders, rate=total/population*100000)
count <- murders$population
hist(murders$rate)
## qq-plot
qqplot()
abline(0,1)
## the normal approximation does not apply
## only a succinct summary


## boxplot is useful to make a quick comparison to 2 or more data together
