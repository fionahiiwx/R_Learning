## SCORE 5/8

## Q1
## Use the murders data set
## use the $ operator to access the population size data and store it in the object pop
## use the sort() to define so that it is sorted 
## use the [] operator to report the smallest population size
library(dslabs)
data(murders)
pop <- murders$population
pop <- sort(pop) #sort the object and save it in the same object
pop[1]
## ans: 563626
## CORRECT







## Q2
## Now instead of the smallest population size, lets find out the row number in the data frame murders,
## of the state with the smallest population size
## This time, we need to use order() instead of sort
## hint: output should be 51
pop <- murders$population
ord <- order(pop)
ord[1]
## ans: 51
## CORRECT







## Q3
## Get the index of the lowest population entry
## use only one line of code
ord[1]
## ans: 51
## correct ans: (find the index of the smallest value for variable total)
which.min(murders$total)
##: 46

## exp
## Find the index for the smallest population
which.min(murders$population)
##: 51






## Q4
## Find the index of the smallest state 
## Define a variable state to hold the state names from the murders data frame
## Combine this to find the state name for the smallest data
state <- murders$state[ord[1]]
state
## Wyoming
## correct ans:
i <- which.min(murders$population)
states <- murders$state
states[i]
##: Wyoming







## Q5
## define a variable statesthe state name from murders
## use rank() to determine the population size rank(from smallest to biggest) of each state
## name these ranks in an object called ranks
## create a data frame with state names and their respective ranks.
## Call the data frame my_df
ranks <- rank(murders$population)
my_df <- data.frame(murders$state, ranks)
my_df
## CORRECT
## proper ans: (names=states, ranks=rank)






## Q6
## create variable states and ranks to store the state names and ranks by population size repectively
## create an object ind that stores the indexes needed to order the population values 
## create the data frame with both variable following the correct order
## use the () operator to reorder each collumn in the data frame
## the columns of the data frame must be in specific order and have specific names:
## states, ranks
states <- murders$state
states
ranks <- rank(murders$population)
ranks
ind <- order(murders$population)
ind
my_df <- data.frame(states, ranks)
my_df
## Wrong
## Wyoming first
## correct ans:
states <- murders$state
states
ranks <- rank(murders$population)
ranks
ind <- order(murders$population)
my_df <- data.frame(name=states[ind], rank=ranks[ind])
my_df








## Q7
## use the new data set na_example
## check the structure
## find out the mean of the entire data set
## use is.na to create a logical index ind that tells which entries are NA 
## determine how many NA ind has
data(na_example)
str(na_example)
ind <- is.na(na_example)
sum(ind)
## ans: 145
## CORRECT


## Q8
## write one line of code to compute the average but only for the entries that are not NA making use of the ! operator
## before ind (remember that u can use help("!"))

ind <- mean(is.na(na_example))
## WRONG
## correct ans:
mean(na_example[!ind])
##: 2.301754

## example
x <- c(1, 2, 3)
ind <- c(FALSE, TRUE, FALSE)
x[!ind]
