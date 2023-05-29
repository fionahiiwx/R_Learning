SCORE 9/9

install.packages("HistData")
library(HistData)
data(Galton)

## Q1
## Exploring the Galton dataset - genetics study
## compute the avg and median of these data
## do not assign them to a variable
x <- Galton$child
mean(x)
#: 68.08847
## CORRECT
median(x)
#: 68.2
## CORRECT


## Q2
## compute the standard deviation and the median absolute deviation
sd(x)
#: 2.517941
## CORRECT
mad(x)
#: 2.9652
## CORRECT


## Q3 [Subjective question!]
## Error impact on average
## The mean and median are very similar and so are the SD and MAD
## Why this is expected?
#: Since the data is approximated by a normal distribution.
## CORRECT


## Q4
## Now suppose that Fiona made a mistake when entering the first value, 
# forgetting to use the decimal point
## Report how many inches in average grows after this mistake
## Specifically report the difference between the average of the data 
# with the mistake, x_with_error
## and the data without the mistake, x
x <- Galton$child
x_with_error <- x
x_with_error[1] <- x_with_error[1] * 10
mean(x_with_error) - mean(x)
#: 0.5983836
## CORRECT


## Q5
## Report how many inches the SD grows after this mistake
sd(x_with_error) - sd(x)
#: 15.6746
## CORRECT


## Q6
## Report how many inches the median grows after this mistake
median(x_with_error) - median(x)
#: 0
## CORRECT


## Q7
## Error impact on MAD 
## Report how many inches the MAD grows after this mistake
mad(x_with_error) - mad(x)
#: 0
## CORRECT


## Q8 (Subjective question)
## How could you use Exploratory Data Analysis (EDA) to detect that an error was made?
#: A QQ-plot, histogram or boxplot would show obvious outliers.
## CORRECT
## Tr ans
## QQ-plot, boxplot or histogram would reveal a clear outlier.


## Q9
## Write a function, error_avg, 
# that takes a value k and returns the avg of the vector x
## After the first entry, changed to k
## Show the result for k = -10000 and k = 10000
error_avg <- function(k){
  x[1] <- k
  mean(x)
}
error_avg(-10000)
#: 57.24612
## CORRECT
error_avg(10000)
#: 78.79784
## CORRECT