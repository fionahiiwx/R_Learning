## SCORE 5/9

library(dplyr)

## Q1
## Use the function mutate to add a murders collumn named grade with the per 100 000 murder rate
library(dslabs)
data(murders)
murders <- mutate(murders, rate = total/population*100000)
## CORRECT





## Q2
## Use the function mutate to add a collumn rank containing the rank,
## from highest to lowest murder rate
## tips: make sure u have redefine murders
rate <- total/population*100000
data(murders)
murders <- mutate(murders, rank = rank(-(total/population*100000)))
## CORRECT




## Q3
## do not define a new object, show the state names and abbreviations in murders
filter(state, rate, rank)
## CORRECT






## Q4
## Show the top 5 states with the highest murder rate
## After we add murder rate and rank, do not change the murders data set,
## just show the result
high <- filter(murders, rank <= 5)
high
## CORRECT







## Q5
## Create a new data frame called no_south that removes states from the south regions
## How many states are in this category?
## tips: u can use the function nrow() for this
## tips: u can remove rows using the != operator
no_south <- filter(murders, region != "South")
nrow(no_south)
## 34
## CORRECT






## Q6
## Create a new data frame called murders_nw with only the states from the northeast and the west
## how many states are in this category?
## tips: use %in%

## WRONG
## Correct Ans:
murders_nw <- filter(murders, region %in% c("Northeast", "West"))
nrow(murders_nw)
## 22




## Q7
## add a murder rate collumn and a rank column as 1 done before 
## crate a table, call it my_states, that satisfies both the conditions:
## 1. it is in the northeast or west
## 2. murder rate is less than 1
## Show ONLY the state name, the rate and the rank

## WRONG
## COrrect Ans:
murders <- mutate(murders, rate = total/population*100000, rank = (-rate))
my_states <- filter(murders, region %in% c("Northeast", "West") & rate < 1)
select(my_states, state, rate, rank)



## Q8
## By refering the previous question instead of creating new object, show the result and only include the state, rate and rank columns
## Do this in one line

## WRONG
## Correct Ans:
murders <- mutate(murders,rate = total/population*100000, rank = (-rate))
filter(murders, region %in% c("Northeast", "West"), rate < 1) %>% select(state, rate, rank)






## Q9
## Use one line of code to create a new data frame, called my_states, that has murder rate and rank columns
## consider only states in the northeast or west which has a murder rate lower than 1,
## and contain only the state, rate and rank columns
## the line should have 4 components seperated by 3 operators

## WRONG
## Correct Ans:
my_states <- murders %>% mutate(rate = murders$total/murders$population*100000, rank(-rate)) %>% filter(murders, region %in% c("Northeast", "West"), rate < 1) %>% select(state, rate, rank)

