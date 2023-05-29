## SCORE 8/10

library(dslabs)
data(murders)

## Q1 in journal 
x <- c(1, 2, -3, 4)
if(all(x>0)){
  print("All positive")
} else{
  print("Not all positive")
}
all(x)
any(x)
any(!x)
all(!x)



## Q1
## Combine a number of functions for this question
## Use the ifelse() to write one line of code that assigns to the object new_names
## the state abbreviation when the state name is longer than 8 characters and assign 
## the state name when the name is not longer than 8 characters
new_names <- ifelse(nchar(murders$state) > 8, murders$abb, murders$state)
new_names
## CORRECT


## Q2
## Create a function sum_n that for any given value, say n, creates the vector 1:n,
## and then computes the sum of the integers from 1 to n
## Use the function to determine the sum of integers from 1 to 5000
sum_n <- function(n){
  x <- 1:n
  sum(x)
}
sum_n(5000)
## CORRECT
## other way:
sum_n <- function(n){
  sum(1:n)
}
sum_n(5000)



## Q3
## Create a function named altman_plot that takes 2 arguments, 
## x and y and plots y-x(on the y-axis) against x+y(on the x-axis)
altman_plot <- function(x, y){
  plot(x+y, y-x)
}
## CORRECT



## checking Q2 from journal
x <- 3
my_func <- function(y){
  x <- 5
  y
  print(x)
}
my_func(x)
## 5
## CORRECT

#######################
##exp
x <- 8
my_func <- function(y){
  x <- 9
  print(x)
  y+x
}
my_func(x)
## 9
## 17

## exp
x <- 3
my_func <- function(y){
  x <- 5
  y+5
}
my_func(x) #: 8
x #: 3
#####################




## Q4
## Write a function compute_s_n that for any given n computes the sum
## [Sn = 1^2 + 2^2 + 3^2 +........n^2]
## Report the value of the sum when n=10
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}
compute_s_n(10)
#: 385
## CORRECT




## Q5
## Define an empty numeric vector s_n of size 25.
## Compute the sum when n is equal to each integer from 1 to 25
## using the function you have defined in the previous question: compute_s_n
## Save result in s_n
m <- 25
s_n <- vector(length = m)
s_n <- compute_s_n(m)
s_n
## WRONG
## Correct way:
s_n <- vector("numeric", 25)
for (i in 1:25){
  s_n[i] <- compute_s_n(i)
}
s_n





## Q6
## Define n <- 1:25
## Note that with this we can use for(i in n)
## use a for loop to save the sums into a vector(s_n <- ...)
## Plot s_n (on y-axis)
n <- 1:25
m <- 25
s_n <- vector(length = m)
for (i in n){
  s_n[i] <- compute_s_n(i)
}
plot(n, s_n)
## CORRECT
## Another way:
n <- 1:25
s_n <- vector("numeric", 25)
for (i in n){
  s_n[i] <- compute_s_n(i)
}
plot(n, s_n)







## Q7
## Confirm that s_n and n(n+1)(2n+1)/6 are the same
formula <- n*(n+1)*(2*n+1)/6
identical(s_n, formula)
## CORRECT
