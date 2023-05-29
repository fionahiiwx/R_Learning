## Q1
## What is the sum of the first n positive integers?
## formula for sum of integers 1 through n: n(n+1)/2
## define n = 100 and then use R to compute the sum of 1 through 100 using the formula.
## what is the sum?
n <- 100
(n*(n+1))/2
# CORRECT

## Q2
## Compute the sum of integers from 1 through 1000
## Assign the formula to r
n <- 1000
r <- (n*(n+1))/2
r
# CORRECT

## Q3
## Look at the result of typing the following code into R:
n <- 1000
x <- seq(1, n)
sum(x)
## What do you think the function seq and sum do?
## sum is adding up all the numbers which contains in the parameter x. CORRECT!
## seq is a sequence of numbers from 1 to n in order. WRONG!
## Ans: seq creates a list of numbers.# WRONG
## Ans: sums adds them up.

## Q4 
## In math and programming, we say that we evaluate a function when we replace the argument with a given number.
## So if we type sqrt(4), we evalute the sqrt function.
## In R, you can evalute a funtion inside another function.
## the evaluate happens from inside out. 
## Use one line of code to compute the log in base 10, of the sqrt(100).
## Do not use variables
log(sqrt(100), base = 10)
## Ans:
log10(sqrt(100))
# CORRECT

## Q5
## Which of the following will always return the numeric value stored in x?
## A. log(10^x)
## B. log10(x^10)
## C. log(exp(x))
## D. exp(log(x, base = 2))
## My Ans: C 
## Ans: C
# CORRECT

## EXTRAS
## log to the base 2
log2(16)
## sqrt of the log to the base 2 of 16
sqrt(log2(16))

x <- 5
log(10^x)
log10(x^10)
log(exp(x))
exp(log(x, base = 2))