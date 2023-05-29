## INDEXING
library(dslabs)
data(murders)
## We can subset a vector base properties of another vector
murder_rate <- murders$total/murders$population * 100000
murder_rate
## using logical vectors 
## the principles of vector arithmetic to logical operations
## if we compare a vector to single vector it performs for each entries
index <- murder_rate < 0.71
index <- murder_rate <= 0.71
index
##:FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
##: FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
##: FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## vectors can be indexed with logicals
murders$state[index]
## How many entries are true
sum(index)
##: 5
## This is because the logical vectors gets coerced to numeric



## TRUE = 1, FALSE = 0, 5_of_TRUE = 5
## 2 logicals True only when both are true 
TRUE & TRUE ##: TRUE
TRUE & FALSE ##: FALSE
FALSE & FALSE ##: FALSE
## Creating 2 logical vectors representing our conditions
west <- murders$region == "West"
safety <- murder_rate <= 1
## Defining an index and identifying states with both condition equals to TRUE
index <- west & safety
murders$state[index]
#: Hawaii, Idaho, Oregon, Utah, Wyoming
