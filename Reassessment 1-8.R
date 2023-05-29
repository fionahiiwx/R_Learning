## ASSESSMENT 1

## Q1
## What is the sum of the first n positive integers?
## formula for sum of integers 1 through n: n(n+1)/2
## define n = 100 and then use R to compute the sum of 1 through 100 using the formula.
## what is the sum?
n <- 100
x <- 1:n
sum(x*(x+1)/2)
##: 171700


## Q2
## Compute the sum of integers from 1 through 1000
## Assign the formula to r
r <- sum(1:100)
r
##: 5050


## Q3
## Look at the result of typing the following code into R:
n <- 1000
x <- seq(1, n)
sum(x)
## What do you think the function seq and sum do?
##: seq() makes a list of numbers from 1 to 100 and sum adds up all the number containing in the list together


## Q4 
## In math and programming, we say that we evaluate a function when we replace the argument with a given number.
## So if we type sqrt(4), we evalute the sqrt function.
## In R, you can evalute a funtion inside another function.
## the evaluate happens from inside out. 
## Use one line of code to compute the log in base 10, of the sqrt(100).
## Do not use variables
log10(sqrt(100))
##: 1


## Q5
## Which of the following will always return the numeric value stored in x?
## A. log(10^x)
## B. log10(x^10)
## C. log(exp(x))
## D. exp(log(x, base = 2))
##: C





## ASSESSMENT 2

# Q1
# Load the US murders data sets
# use the func str to examine the structure of the murders object
# we can see that these object is a data frame with 51 rows and 5 collumns
# pls describe the variables represented in this data frame
library(dslabs)
data(murders)
str(murders)
## it had variable of the name of the states, the abbreviation of the states, the region of the state, the population number in the state and the total number of gun murders in that state


# Q2
# What are the collumn names used by the data frame for these 5 variables?
# state, abb, region, population and total


# Q3
# Use the accessor to extract the state abbreviations and assign them to the object a
# and determine the class of this object.
a <- murders$abb
class(a)
##: Character


# Q4
# Now use the [] to extract the state abbreviaitons and assign them to the object b
# Use the identical function to determine if a and b are the same
b <- []

# Q5
# With one line of code, use the function levels and lengths to determine the number of regions
# defined by these data sets


# Q6
# The function table takes a vector and returns the frequency of each element
# U can quickly see how many states are in each region by applying this function
# Use this function in one line of code to create a table of states per regions








## ASSESSMENT 4


## Q1
## Create a numeric vector with the average high temperatures in January 
## for Beijing, Lagos, Paris, Rio de Janeiro, San Juan, and Toronto
## The average high temp: 35, 88, 42, 84, 81, 30 in degree farenheit
## call the object temp


## Q2
## The temp we stored in temp are from the cities Beijing, Lagos, Paris, Rio de Janeiro, San Juan, and Toronto
## Create a vector with these cities names and call the object city
## Make sure to use the correct order spelling and capitalisation


## Q3
## Use the names() function and the objects defined to associate the temperature data with its corresponding city
## Note: To see what happened, after assigning the cities name to the temp vector
# try printing the temp vector to understand how the names are associated with elements of temp


## Q4
## Use the [ and : operators to access the temperature of the first 3 cities in the list, which are already stored in temp


## Q5
## Access the object using just the [] operator.
## Use the [] operator to access the temp of Paris and San Juan stored in the temp object


## Q6
## Use just the : operator to create a sequence of cosecutive integers starting at 12 and ending at 73 and save it in an object x,
## then determine the length of object x


## Q7
## Use the function seq(), create a vector containing all the positive odd num smaller than 100
## num should be in ascending order


## Q8
## Create a vector of num that starts at 6, does not go beyond 55, and adds num in increments of 4/7.
## So the first 3 num will be 6, 6+4/7, and 6+8/7.
## How many numbers does the list have?
## U can only use 1 line of code to ans both question


## Q9
## What is the class of the following object


## Q10
## does this change depending on what we store in an object?
## what is the class of the following object


## Q11
## Confirm that the class of 1 is numeric and the class of 1L is integer.


## Q12
## Create a vector of x<- c("1", "3", "5", "a")
## Notice that x has been coerce into a char string 
## convert x into a vector of number






## ASSESSMENT 5

## Q1
## Use the murders data set
## use the $ operator to access the population size data and store it in the object pop
## use the sort() to define so that it is sorted 
## use the [] operator to report the smallest population size


## Q2
## Now instead of the smallest population size, lets find out the row number in the data frame murders,
## of the state with the smallest population size
## This time, we need to use order() instead of sort
## hint: output should be 51


## Q3
## Get the index of the lowest population entry
## use only one line of code


## Q4
## Find the index of the smallest state 
## Define a variable state to hold the state names from the murders data frame
## Combine this to find the state name for the smallest data


## Q5
## define a variable statesthe state name from murders
## use rank() to determine the population size rank(from smallest to biggest) of each state
## name these ranks in an object called ranks
## create a data frame with state names and their respective ranks.


## Q6
## create variable states and ranks to store the state names and ranks by population size repectively
## create an object ind that stores the indexes needed to order the population values 
## create the data frame with both variable following the correct order
## use the () operator to reorder each collumn in the data frame
## the columns of the data frame must be in specific order and have specific names:
## states, ranks


## Q7
## use the new data set na_example
## check the structure
## find out the mean of the entire data set
## use is.na to create a logical index ind that tells which entries are NA 
## determine how many NA ind has


## Q8
## write one line of code to compute the average but only for the entries that are not NA making use of the ! operator
## before ind (remember that u can use help("!"))








## ASSESSMENT 7

##Q1
## Compute the per 100,000 murder rate for each state and store it in an object called murder_rate
## Use logical operators to create a logical vector name it low
## determine which entries of murder_rate are lower than 1


## Q2
## Use the func which() to determine the indices of murder_rate associated with values lower than 1


## Q3 
## Report the names of the states with murder_rates lower than 1


## Q4
## Report the states in the Northeast with a murder_rate lower than 1
## Define low as before
## use logical operator to create a new object ind that's TRUE when low is TRUE and the state is in the Northeast
## Show the state names that satisfy these conditions


## Q5
## Compute the murder_rate for each state and the avg of these numbers
## How many states are below the avg?


## Q6
## Use the match() function to indentify state's abb: AK, MI, IA
## Store the vector to abbs
## Define an index of the entries that match the 3 abbreviations and extract the names of the states


## Q7
## Define a char vector with the abbreviation: MA, ME, MI, MO, MU
## Use the %in% operator to create a logical vector that's TRUE when the abb is in the murders data frame


## Q8
## Use the 'which' command and also '!' operator 
## to find out which index abbreviation are not actually part of the data set
## and store in ind
## print out the name of the abb






## ASSESSMENT 8

## Q1
## Use the function mutate to add a murders collumn named grade with the per 100 000 murder rate


## Q2
## Use the function mutate to add a collumn rank containing the rank,
## from highest to lowest murder rate
## tips: make sure u have redefine murders


## Q3
## do not define a new object, show the state names and abbreviations in murders


## Q4
## Show the top 5 states with the highest murder rate
## After we add murder rate and rank, do not change the murders data set,
## just show the result


## Q5
## Create a new data frame called no_south that removes states from the south regions
## How many states are in this category?
## tips: u can use the function nrow() for this
## tips: u can remove rows using the != operator


## Q6
## Create a new data frame called murders_nw with only the states from the northeast and the west
## how many states are in this category?
## tips: use %in%


## Q7
## add a murder rate collumn and a rank column as 1 done before 
## crate a table, call it my_states, that satisfies both the conditions:
## 1. it is in the northeast or west
## 2. murder rate is less than 1
## Show ONLY the state name, the rate and the rank


## Q8
## By refering the previous question instead of creating new object, show the result and only include the state, rate and rank columns
## Do this in one line


## Q9
## Use one line of code to create a new data frame, called my_states, that has murder rate and rank columns
## consider only states in the northeast or west which has a murder rate lower than 1,
## and contain only the state, rate and rank columns
## the line should have 4 components seperated by 3 operators


