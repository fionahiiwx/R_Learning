## SCORE 6/8
library(dslabs)
data(heights)
library(tidyverse)
ind <- heights$sex == "Male"
x <- heights$height[ind]

## Q1
## What proportion of the data is between 69 & 72 inches
## (taller than 69 but shorter or equal to 72)?
## a proportion is between 0 and 1
mean(x <= 72) - mean(x <= 69)
#: 0.3337438
## CORRECT
## Use mean to compute the proportion of entries of a logical vector that are TRUE



## Q2
## Use the normal approximation to estimate the proportion of the data that is between 69 and 72 inches
## Use avg and stdev, u can't use x (no access to x)
avg <- mean(x)
stdev <- sd(x)
pnorm(72, avg, stdev) - pnorm(69, avg, stdev)
#: 0.3061779
## CORRECT


## Q3
## Use normal approximation to estimate the proportion of heights between 79 and 81 inches
## and save it in an object called "approx"
## report how many times bigger the actual proportion is compared to the approximation 
exact <- mean(x <= 81) - mean(x <= 79)
approx <- pnorm(81, avg, stdev) - pnorm(79, avg, stdev)
exact/approx
#: 1.614261
## approx is not always useful, so this is the exp to show approx in extreme value.
## It's overestimated or underestimated
## "Tails of distribution"




## Q4
## Using the normal approximation, estimate the proportion of adult man that are taller than 7ft,
## referred to as 7 footers. Remember that 1foot = 12inches.
## print out your estimate; do not store it in an object
## Note: assume that the distribution of adult man in the world as normally distributed 
##       with an average of 69 inches and sd of 3 inches
1 - pnorm(84, 69, 3)
#: 2.866516e-07
## CORRECT
## another way:
1 - pnorm((7*12), 69, 3)
## pnorm() finds the approx that's from the num given to 0




## Q5
## Use your answer from the previous question to estimate the proportion of men that are 7 feet tall
## or taller in the world and store that as "p"
## Then multiply this value by 1 billion round the number of 18-40 year old man who are 7 feet tall
## or taller to the nearest integer to round (don't store this value in an object)
p <- 1 - pnorm(84, 69, 3)
round(p*10^9)
#: 287
## CORRECT



## Q6
## Use your answer in Q4 to estimate the proportion in man that are 7 feet tall 
## or taller in the world and store that value as "p"
## Use your answer from Q5 to round the number of 18-40 yr old man who are 7 feet tall
## or taller to the nearest integer to round and store it as "N"
## Calculate the proportion of the world's 18-40 yr old 7 footers
## note: take 10 (people/player)
p <- 1 - pnorm(84, 69, 3)
N <- round(p*10^9)
10/N
#: 0.03484321
## CORRECT


## Q7
## Report the estimated proportion of people at least 6ft 8inches height(use or take 150(people/...))
p <- 1 - pnorm(80, 69, 3) ##  or pnorm(6*12+8, 69, 3)
N <- round(p*10^9)
150/N
#: 0.00122084
## CORRECT


## Q8 
## By answering the previous questions, we found that it is not at all rare for a 7 footer
## What would be a fair critique of your calculations?
#: -

## refer to Q3
## Ans: The normal approximation tends to underestimate the extreme values. 
##      It's possible that there are more 7 footers than we predicted.