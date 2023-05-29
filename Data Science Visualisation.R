## Data Visualization and Distributions


## SECTION 1
## For communication data driven findings
## 1. It's important as we are not talking base on our own thought but a scientific method
## 2. use distribution to summarize data
## 3. use the average under standard deviation to understand the normal distribution ***
## 4. Assess how well a normal distribution fits the data using a quantile-quantile plot (Q-Q plot)
## data journalism, including infographic, graphs... for reporting

## Key Points
## Data visualization is a key component EDA, in which the properties of data are explored through
## visualization and summarization technique
## plots of data easily communicate information that is extract from raw values
## it can also help discover biases, systematic errors, mistakes and other problems
## before those data are incorporated into potentially flaw analysis

library(dslabs)
data(murders)
head(murders)


## 1. DISTRIBUTIONS
## Numerical data is usually summarize with a avg no.
## Occasionally a second is used, standard deviation
## exp: bringing a report on this particular school is 680+-50
##      the report has summarize an entire vector of score
##      these 2 num are actually all we need to find out
##      same technique will serve as alternative as the same when not enough

## 1st building block: DISTRIBUTION, learning to summarize list of vectors or numeric vectors
## most basic statistic of list of objects or numbers is DISTRIBUTIONS
## once a vector has been summarize as a distribution, 
## there are several data science technique to relay the data
## **** in some cases, it can be summarize with 2 no., avg and deviation no. ****


## 2. DATA TYPES
## Important step to visualization data is to know which type of data u are dealing with
## CATEGORICALS & NUMERICALS
## categorical split into another group (ordinals and non-ordinals)
## numerical splits into (discrete or continuous)
## 1. know what type of data ( 2 variable, categorical & numerical)



## CATEGORICAL DATA - variable that are defined by small number of groups
## Ordinal - inherent category
## exp: sex(male, female), regions(from murders dataset)
## some categorical data can be ordered
## Non-ordinal - no order
## exp: spiciness(mild, medium, hot)
## [doesn't need to be number, sometimes refer to ordinal data in statistics]



## NUMERICAL DATA - take a variety of values
## exp: population sizes, murder rate, heights
## continuous variable - can take any value such as heights 
##                       if it is values with enough precision
## Note That: discrete numeric data can be considered as ordinal 
## exp: height rounded off to inches
## We usually reserve the ordinal to with each group having many members
## Discrete - when we have many groups with few cases we typically group them