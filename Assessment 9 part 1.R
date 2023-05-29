## SCORE 2/3

library(dplyr)
library(dslabs)
data(murders)

## Q1
## Make a plot of total murders vs population, load the same data sets 
## transform the variables using the log base 10 transformation
## Plot the lot transformed total vs population
populations_lg <- log(murders$population, base = 10)
total_murders_lg <- log(murders$total, base = 10)
plot(populations_lg, total_murders_lg)
## CORRECT






## Q2
## Compute the population in millions and save it to the object named population_in_millions
## Create a histogram of the state populations 
population_in_millions <- murders$population * 10^6
hist(population_in_millions)
## WRONG
## Correct ans:
population_in_millions <- murders$population / 10^6
hist(population_in_millions)





## Q3
## In one line of code, 
## 1. stratify the state populations by region 
## 2. generate boxplots for the strata
boxplot(population ~ region, data = murders)
## CORRECT