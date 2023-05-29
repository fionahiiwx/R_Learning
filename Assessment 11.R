## SCORE 4/6
library(dslabs)
data(heights)

## Q1
## Write an if else statement that returns 1 if the sex is female and 2 if the sex is male
## What is the sum of the resulting vector?
x <- 0
num_ppl <-length(heights$height)
for (i in 1:num_ppl){
  if (heights$sex[i] == "Female"){
    x <- x+1
  } else{
    x <- x+2
  }
}
x
#: 1862
## CORRECT


## Q2
## Write an if else statement 
## that takes the height columns and returns the height if it is greater than 72 inches 
## and returns 0 otherwise
## What's the mean of the resulting vector?
num_ppl <-length(heights$height)
x <- vector(length = num_ppl)
for (i in 1:num_ppl){
  if (heights$height > 72){
    x[i] <- heights$height[i]
  } else{
    x[i] <- 0
  }
}
mean(x)
## WRONG
## 68.32301
## correct ans:
## 9.653


## Q3 a
## Write a function inches_to_ft that take a number of inches x and returns the number of feet
## 1 foot = 12 inches
## What is inches_to_ft(144)
inches_to_ft <- function(x){
  heights$height[x] / 12
}
inches_to_ft(144)
#: 6
## WRONG
## correct ans: 12


## Q3 b
## how many individuals in the heights dataset have a height less than 5 feet?
count <- 0
num_ppl <-length(heights$height)
for (i in 1:num_ppl){
  x <- inches_to_ft(i)
  if (x < 5){
    count <- count + 1
  }
}
count
#: 20
## CORRECT


## Q4 
## Which of the following are true?
## A, E, H
## correct: A, B, C, E



## Q5
## Given an integer x, the factorial of x is called x! and is the product of all integers
## up to n including x
## the factorial() function computes factorial in r
m <- 10
f_n <- vector(length = m)

for (n in 1:m){
  f_n[n] <- factorial(n)
}
f_n

## Complete the code to generate the vector of length m where the first entry is 1!, 
## second entry is 2! and so on until m!

#: 1       2       6      24     120     720    5040   40320  362880 3628800
## CORRECT