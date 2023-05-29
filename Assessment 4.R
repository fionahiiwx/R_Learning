## SCORE  9/12




## Q1
## Create a numeric vector with the average high temperatures in January 
## for Beijing, Lagos, Paris, Rio de Janeiro, San Juan, and Toronto
## The average high temp: 35, 88, 42, 84, 81, 30 in degree farenheit
## call the object temp
temp <- c(35, 88, 42, 84, 81, 30)
temp
# Correct ans:
temp <- c(Beijing=35, Lagos=88, Paris=42, RiodeJaneiro=84, SanJuan=81, Toronto=30)
temp

## Q2
## The temp we stored in temp are from the cities Beijing, Lagos, Paris, Rio de Janeiro, San Juan, and Toronto
## Create a vector with these cities names and call the object city
## Make sure to use the correct order spelling and capitalisation
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
city
## CORRECT

## Q3
## Use the names() function and the objects defined to associate the temperature data with its corresponding city
## Note: To see what happened, after assigning the cities name to the temp vector
# try printing the temp vector to understand how the names are associated with elements of temp
names(temp) <- city
temp
## CORRECT


## Q4
## Use the [ and : operators to access the temperature of the first 3 cities in the list, which are already stored in temp
temp[0:3]
## Correct ans:
temp[1:3]





## Q5
## Access the object using just the [] operator.
## Use the [] operator to access the temp of Paris and San Juan stored in the temp object
temp[c("Paris", "San Juan")]
## correct ans:
temp[c(3,5)]


## Q6
## Use just the : operator to create a sequence of cosecutive integers starting at 12 and ending at 73 and save it in an object x,
## then determine the length of object x
x <- 12:73
length(x)
## ans: 62
## CORRECT


## Q7
## Use the function seq(), create a vector containing all the positive odd num smaller than 100
## num should be in ascending order
seq(1, 100, 2)
## CORRECT



## Q8
## Create a vector of num that starts at 6, does not go beyond 55, and adds num in increments of 4/7.
## So the first 3 num will be 6, 6+4/7, and 6+8/7.
## How many numbers does the list have?
## U can only use 1 line of code to ans both question
length(seq(6, 55, 4/7))
## ans: 86
## CORRECT



## Q9
## What is the class of the following object
a <- seq(1, 10, length.out = 100)
class(a)
## ans: numeric
## CORRECT




## Q10
## does this change depending on what we store in an object?
## what is the class of the following object
a <- seq(1, 10)
class(a)
## Yes. It is now an integer.
## CORRECT


## Q11
## Confirm that the class of 1 is numeric and the class of 1L is integer.
class(1)
class(1L)
## CORRECT


## Q12
## Create a vector of x<- c("1", "3", "5", "a")
## Notice that x has been coerce into a char string 
## convert x into a vector of number
x <- c("1", "3", "5", "a")
as.numeric(x)
## CORRECT