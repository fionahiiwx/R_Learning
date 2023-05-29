## What's R?
## have pipeline and prepare data visualisation for communication
## programming language
## can even suggest how to improve R only for the pros


## 3 concept
## conditional expression and building functions
## for loop










## 1. conditionals
## if/else statement
## in R

## General structure of an if/else statement
a <- 0
if (a != 0){
  print(1/a)
} else{
  print("No Reciprocal for 0")
}

## EXP 2
## tells us which states, if any, have a murder rate less than 0.5
library(dslabs)
data(murders)
murder_rate <- murders$total/murders$population * 100000
min_ind <- which.min(murder_rate)
if (murder_rate[min_ind] < 0.5){
  print(murders$state[min_ind])
} else{
  print("No states has murder rate that low")
}
#: Vermont

## EXP 3
## changing the conditions to less than 0.25 
murder_rate <- murders$total/murders$population * 100000
min_ind <- which.min(murder_rate)
if (murder_rate[min_ind] < 0.25){
  print(murders$state[min_ind])
} else{
  print("No states has murder rate that low")
}
#: "No states has murder rate that low

a <- 0
ifelse(a>0, 1/a, NA)
#: NA

## Use ifelse() on vectors
a <- c(0, 1, 2, -4, 5)
result <- ifelse(a>0, 1/a, NA)
result
#: NA 1.0 0.5  NA 0.2

data(na_example) 
sum(is.na(na_example))
#: 145
no_nas <- ifelse(is.na(na_example), 0, na_example)
sum(is.na(no_nas))
#: 0

##we can also use any() and all() functions
b <- c(TRUE, TRUE, FALSE)
any(b)
#: TRUE 
## It's TRUE as there's at least 1 TRUE in it
all(b)
#:FALSE
## NOT all is TRUE so the output is FALSE

##exp
avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}
s <- 3 
avg(1:10)
s
x <- 1:100
avg(x)
#: 50.5

identical(mean(x), avg(x))
##: TRUE
## var define in function are not safe in it (LEXICAL SCOPE)






## 2. Functions
## general form of function:
# my_function <- function(x){
# }
# operations that operates on x which is define by user of function
# value final line is return
## exp
avg <- function(x, arithmetic = TRUE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}

## create a function that finds sum of 1 through n
sums <- function(n){
  sum(1:n)
}
sums(5)
#: 15

## proper way
sums_n <- function(n){
  x <- 1:n
  sum(x)
}
sums_n(106)
#: 5671



## 3. for in loop
## general form:
## for(i in range of values){
# operations that use i, which is changing across the range of values
for (i in 1:5){
  print(i)
} 
#: 1
#: 2
#: 3
#: 4
#: 5

i
#: 5

## exp
m <- 25
## create an empty vector
s_n <- vector(length = m)
for (n in 1:m){
  s_n[n] <- sums_n(n) #sum of num 1:n
}
n <- 1:m
## overlaying our function with summation formula
plot(n, s_n) ## quadratic
lines(n, n*(n+1)/2)
##using a tables of value comparing to the summation formula
head(data.frame(s_n = s_n, formula = (n*(n+1)/2)))


## other important functions *****
## 1. apply()
## 2. sapply()
## 3. tapply()
## 4. mapply()
## 5. split()
## 6. cut()
## 7. quantile()
## 8. reduce()
## 9. identical()
## 10. unique()

## function nchar()
## tells you how many characters long a character vector is
char_len <- nchar(murders$state)
head(char_len)
#: 7 6 7 8 10 8