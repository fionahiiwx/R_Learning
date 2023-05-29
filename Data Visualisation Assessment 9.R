## $, mutate(), filter(), reorder(), summarize()

## Q1
## Reordering the levels of the states' variables 
## create an object dat
## redefine the state object so that the levels are reordered by rate 
## print the new object state and its levels using levels
## so that you can see that the vector is now reordered by the levels
# [1, 4, 7, 8, 13]
# states
## year = 1967, disease = Measles
library(dslabs)
library(ggplot2)
library(dplyr)
data(us_contagious_diseases)

dat <- us_contagious_diseases %>%
  filter(year == 1967 & disease == "Measles", !is.na(population)) %>%
  mutate(rate = (count/population*10000*52/weeks_reporting),
         state = reorder(state, rate))
# need to use the 52 and 10,000 somewhere again
levels(dat$state)
## CORRECT



## Q2
## create bar plot
dat %>%
  ggplot(aes(rate, reorder(state, rate))) +
  ylab("state") +
  geom_bar(stat = "identity") +
  xlab("Rate of Measles")
## CORRECT



## Q3
## bar plot (x=region, y=murder rate avg)
library(dslabs)
library(ggplot2)
library(dplyr)
data(murders)

murders %>%
  mutate(rate = total/population * 10000) %>%
  ggplot(aes(region, rate)) +
  geom_bar(stat = "identity")
## CORRECT

## What's the main problem with this interpretation?
#: We cannot get a lot of information from this graph, like the range, median and which
#: rate has denser points there. Since it's not like every country in that 
#: region would have that rate. 




## Q4
## box plot
library(dslabs)
library(ggplot2)
library(dplyr)
data(murders)

murders %>%
  mutate(rate = total/population * 10000,
         region = reorder(region, rate, FUN = median)) %>%
  ggplot(aes(region, rate)) +
  geom_boxplot() +
  geom_point()
## CORRECT

