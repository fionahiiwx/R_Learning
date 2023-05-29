## SCORE 4/6

library(dslabs)
data(heights)

## Q1
## Extract the variable names from the dataset using the names() function
## What are the 2 variable names used?
names(heights)
#: sex and height
## CORRECT



## Q2
## What data type is the sex variable?
#: categorical
## CORRECT



## Q3
## Use the unique and length function to determine how many unique heights were reported
length(unique(heights))
#: 2
## WRONG
## correct ans: 139
x <- heights$height
length(unique(x))



## Q4
## Use the table() function to compute the frequencies of each unique height value
## because we are using the resulting frequency table in subsequent questions,
## Save the results into an object called tab
x <- heights$height
tab <- table(x)
tab
## CORRECT


## Q5
## continuation of the previous question, 
## you computed the variable tab that reports the num of times each unique value appears
## for values reported only once, tab would be 1
## use logicals and the function sum() to count the number of times this happens
sum(tab == 1)
#: 63
## CORRECT



## Q6
## Since there are finite number of reported heights, 
## and technically the height can be considered ordinal,
## which of the following is TRUE:
## A. This is a numerical variable because numbers are used in it
## B. This is actually a categorical variable: tall, medium or short
## C. It is actually preferable to consider heights ordinal since on a computer
##    u will need a finite num of possibilities
## D. it is more effective to consider heights to be 
##    numerical given the number of unique values we observe and 
##    the fact that if we keep collecting data even more would be observed
#: C
## WRONG
## correct ans: D