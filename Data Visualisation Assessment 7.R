#### SCORE

library(dslabs)
library(tidyverse)
data(gapminder)

## Q1
## Use ggplot and points layer, create a scatter plot of life_expectancy vs fertility
## for Africa continent in 2012.

gapminder %>%
  filter(continent == "Africa" & year == 2012) %>%
  ggplot(aes(fertility,life_expectancy)) +
  geom_point()
## CORRECT


## Q2
## Remake the plot from previous question but this time, use colour to distinguish
## the different regions of Africa to see if this explains the clusters

gapminder %>%
  filter(continent == "Africa" & year == 2012) %>%
  ggplot(aes(fertility, life_expectancy, col = region)) +
  geom_point()
## CORRECT


## Q3
## Create a table showing the country and region for the African countries
## (use select()) that in 2012 had fertility rate of 3 or less and
## life expactancies of at least 70

gapminder %>%
  filter(continent == "Africa" & year == 2012 & 
           fertility <= 3 & life_expectancy >= 70) %>%
  select(country, region)
## CORRECT


## Q4
## Life expectancy at the Vietnam war. The Vietnam war lasted from 1955 to 1975

## Do the data support war having a negative effect on life expectancy?
#: The life expectancy of Vietnam was very low when it was around the time of
#: war, as war can lead to a large amount of deaths and no one is safe
#: from getting killed in a war. Their life expectancy drastically increases
#: after the was has ended which further proves that their life expectancy
#: on average without war is much higher. 

## U will create a time series plot that covers the period from 1960 to 2010 of
## life expectancy for Vietnam and the United States, using color to distinguish
#  the 2 countries.
## U start the analysis by generating a table
## Safe the table in a table called "tab"

countries <- c("Vietnam", "United States")
tab <- gapminder %>%
  filter(country %in% countries & year >= 1960 & year <= 2010)
tab 
## CORRECT



## Q5
tab %>%
  ggplot(aes(year, life_expectancy, col = country)) +
  geom_line()
## CORRECT




## Q6
## Life_expectancy in Cambodia
## Cambodia was involved in this conflict and, after the war, Pol Pot and his communist
## khmer rouge took control and ruled Cambodia from 1975 to 1979
## He is considered one of the most brutal dictators in history

## Do the data support this claim?
#: The curve was relatively increasing but during the time when pol plot
#: and his communist khmer rouge took country, there's a significant decrease
#: life expectancies. This just showed that they were mass
#: killing citizens of Cambodia. Then, the life expectancies rose 
#: back up drastically after they had stopped ruling Cambodia.

## create time series plot from 1960 to 2010
## life_expectancy vs year in Cambodia
library(dplyr)
library(dslabs)
data(gapminder)

p <- gapminder %>%
  filter(country == "Cambodia", year >= 1960, year <= 2010) %>%
  ggplot(aes(year, life_expectancy)) +
  geom_line()
p
## CORRECT





## Q7
########## Dollars per day part 1 ###########
## U are going to calculate and plot dollars per day for African countries
## in 2010 using gdp data
## In the first part of this analysis, u will create the dollars per day variable
## save data set to daydollars

library(dplyr)
library(dslabs)
data(gapminder)

daydollars <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year == 2010 & !is.na(gdp))
daydollars
## CORRECT




## Q8
## Dollars per day part 2
## In the 2nd part of this analysis we will plot the smooth density plot
## using a log base 2 x axis
p <- daydollars %>%
  ggplot(aes(dollars_per_day, y = ..count..)) +
  geom_density() +
  scale_x_continuous(trans = "log2")
p
## CORRECT



## Q9
## Dollars per day part 3
## Create the dollars per day as in Q7,
## but for the African countries in the years 1970 and 2010
## Create a smooth density plot of dollars per day for 1970 and 2010 using a log scale
## for the x-axis
## U are required to show a different density plot for 1970 and 2010
library(dplyr)
library(dslabs)
data(gapminder)

daydollars <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year %in% c("1970", "2010"), !is.na(gdp))

p <- daydollars %>%
  ggplot(aes(dollars_per_day, y = ..count..)) +
  geom_density() +
  scale_x_continuous(trans = "log2") +
  facet_grid(. ~ year)
p

## CONCLUSION:
#: From the graph, it had shown us something different from what we had thought 
#: to be which is the rich getting richer while the poor getting poorer. 
#: In fact, the rich did indeed get richer but the poor did not get
#: poorer. They on the other hand, had mostly stayed stagnant with 
#: some actually improving. All in all, statistics had showed that most of them
#: had improvements in their income in 2010 compared to in 1970.  






## Q10
## Dollars_per_day part 4
## stacked density plot
## bw = 0.5
## use fill and argument position appropriately
library(dplyr)
library(dslabs)
data(gapminder)

daydollars <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year %in% c("1970", "2010"), !is.na(gdp))

p <- daydollars %>%
  ggplot(aes(dollars_per_day, y = ..count.., fill = region)) +
  geom_density(bw = 0.5, position = "stack") +
  scale_x_continuous(trans = "log2") +
  facet_grid(. ~ year)
p

## CONCLUSION:
#: All the region had higher income in 2010 compared to 1970. However,
#: this doesn't mean that all of them had improved. The peaks for the
#: poor did decrease over the decades while the peaks for the rich
#: had increased but the peaks for the poor is still higher than the
#: peaks of the rich. This just means that the rich got richer 
#: while some of the poor made some improvements with the
#: rest remaining stagnant. Most region had improved by a lot over the
#: decades except for Western Africa which had only improved by a bit.

#### CHANGE IT





## Q11
## We are going to continue looking at the gapminder data set
## with the life_expectancy and life in Africa in 2010
## gapminder_Africa_2010
## make scatter plot infant_mortality vs dollars_per_day
## with color to denode different regions in Africa

library(dplyr)
library(dslabs)
data(gapminder)
gapminder_Africa_2010 <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(year == 2010 & continent == "Africa" & !is.na(gdp))

p <- gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, col = region)) +
  geom_point()
p

# For conclusion purpose
a <- gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, label = country, col = region)) +
  geom_point() + 
  geom_text()
a

gapminder_Africa_2010 <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(year == 2010 & country %in% c("Angola", "Eritrea") & !is.na(gdp))
b <- gapminder_Africa_2010 %>%
  select(country, infant_mortality, dollars_per_day)
b

## CONCLUSION:
#: This shows that poorer people does not necessarily mean that they will have
#: high infant mortality. For example, Angola in Middle Africa had an
#: income of 3.37 dollars per day and Eritrea in Eastern Africa had only 0.45
#: dollars per day but the infant mortality in Angola
#: was much higher than in Eritrea by 178%.

## CHANGED


## Q12
## Infant mortality scatter plot part 2 - Logarithmic axis

gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, col = region)) +
  geom_point() +
  scale_x_continuous(trans = "log2")

## allows us to have a closer/better look




## Q13
## Infant mortality scatter plot part 3 - adding labels

gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, label = country, col = region)) +
  geom_point() +
  scale_x_continuous(trans = "log2") +
  geom_text()

## large variety in African countries. 



## Q14
## Infant mortality scatter plot part 3 -  comparison of scatter plots
## x= dollars_per_day, y=infant_mortality, 1970 & 2010

library(dplyr)
library(dslabs)
data(gapminder)

daydollars <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(year %in% c(1970, 2010), continent == "Africa", !is.na(gdp))

p <- daydollars %>%
  ggplot(aes(dollars_per_day, infant_mortality, col = region, label = country)) +
  geom_point() +
  scale_x_continuous(trans = "log2") +
  geom_text() +
  facet_grid(year ~ .)
p

## CONCLUSION:
#: From the graph, we can see that the infant mortality in all the countries
#: had decreased to about less than a 100 from 1970 to 2010. For example, 
#: Mali had dropped from around 200 to less than 100. Additionally, the rich had
#: also gotten richer. However, the poor did not get poorer but 
#: instead stayed poor with some even getting richer like Tunisia. 
#: Seychelles was already rich but got richer while Mali was poor and is still
#: poor even when it did increase by a bit from year 1970 to 2010.

## WHERE CORRELATION?





#######
###### HAVE TO CHANGE EITHER 9 or 10
## (Havent change)
## QUESTION 9:From the graph, it had shown us something different from what we had thought 
#: to be which is the rich getting richer while the poor getting poorer. 
#: In fact, the rich did indeed get richer but the poor did not get
#: poorer. They on the other hand, had mostly stayed stagnant with 
#: some actually improving. All in all, statistics had showed that most of them
#: had improvements in their income in 2010 compared to in 1970.

## (havent change)
## QUESTION 10: All the region had higher income in 2010 compared to 1970. However,
#: this doesn't mean that all of them had improved. The peaks for the
#: poor did decrease over the decades while the peaks for the rich
#: had increased but the peaks for the poor is still higher than the
#: peaks of the rich. This just means that the rich got richer 
#: while some of the poor made some improvements with the
#: rest remaining stagnant. Most region had improved by a lot over the
#: decades except for Western Africa which had only improved by a bit.


## (CHANGED)
## Question 11: This shows that poorer people does not necessarily mean that they will have
#: high infant mortality. For example, Angola in Middle Africa had an
#: income of 3.37 dollars per day and Eritrea in Eastern Africa had only 0.45
#: dollars per day but the infant mortality in Angola
#: was much higher than in Eritrea by 178%.



## (CHANGE IT)
## Question 14: From the graph, we can see that the infant mortality in all the countries
#: had decreased to about less than a 100 from 1970 to 2010. For example, 
#: Mali had dropped from around 200 to less than 100. Additionally, the rich had
#: also gotten richer. However, the poor did not get poorer but 
#: instead stayed poor with some even getting richer like Tunisia. 
#: Seychelles was already rich but got richer while Mali was poor and is still
#: poor even when it did increase by a bit from year 1970 to 2010.
#: Thus, an increase in income has some effect on the infant mortality but there's other
#: factors affecting it too.