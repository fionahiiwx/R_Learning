## SCORE  3/3


## Q1
## USe vector arithmetic to convert temp to celcius
## Create a data frame called city_temps with city name and temperatures in celcius
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
temp <- c(35, 88, 42, 84, 81, 30)
temp <- (temp-32)*(5/9)
city_temps <- data.frame(city_name = city, temperature_in_celcius = temp)
city_temps
## CORRECT





## Q2
## What's the sum of the following equation:
## 1+1/2^2+1/3^2+....+1/100^2?
## Thanks to Euler, we know it should be close to pi^2/6
## Define an object x that contains the number 1 through 100
## Compute the sum
x <- seq(2, 100)
total <- (1 + sum(1/(x^2)))
total
##: 1.634984
## CORRECT
## ANOTHER WAY:
x <- 1:100
x 
sum(1/(x*x))






## Q3
## Compute the per 100,000 murder rate for each state and store it in the object murder_rate
## compute the average of the state murder rate for the US
library(dslabs)
data(murders)
murder_rate <- murders$total/murders$population * 100000
avg <- mean(murder_rate)
avg
##: 2.779125
## CORRECT








