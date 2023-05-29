## SCORE 7/8

library(dslabs)
data(murders)


##Q1
## Compute the per 100,000 murder rate for each state and store it in an object called murder_rate
## Use logical operators to create a logical vector name it low
## determine which entries of murder_rate are lower than 1
murder_rate <- murders$total/murders$population * 100000
low <- murder_rate < 1
low
## CORRECT





## Q2
## Use the func which() to determine the indices of murder_rate associated with values lower than 1
which(low)
##: 12 13 16 20 24 30 25 38 42 45 46 51
## CORRECT




## Q3 
## Report the names of the states with murder_rates lower than 1
murders$state[low]
##: "Hawaii"        "Idaho"         "Iowa"          "Maine"         "Minnesota"     "New Hampshire" "North Dakota" 
##: "Oregon"        "South Dakota"  "Utah"          "Vermont"       "Wyoming"
## CORRECT



## Q4
## Report the states in the Northeast with a murder_rate lower than 1
## Define low as before
## use logical operator to create a new object ind that's TRUE when low is TRUE and the state is in the Northeast
## Show the state names that satisfy these conditions
northeast <- murders$region == "Northeast"
low <- murder_rate < 1
ind <- northeast & low
murders$state[ind]
##: Maine, New Hampshire, Vermont
## CORRECT


## Q5
## Compute the murder_rate for each state and the avg of these numbers
## How many states are below the avg?
avg <- mean(murder_rate)
lower <- murder_rate < avg
sum(lower)
##: 27
## CORRECT



## Q6
## Use the match() function to indentify state's abb: AK, MI, IA
## Store the vector to abbs
## Define an index of the entries that match the 3 abbreviations and extract the names of the states
abbs <- match(c("AK","MI","IA"), murders$abb)
name <- murders$state[abbs]
name
##: Alaska, Michigan, Iowa



## Q7
## Define a char vector with the abbreviation: MA, ME, MI, MO, MU
## Use the %in% operator to create a logical vector that's TRUE when the abb is in the murders data frame
abbs <- c("MA", "ME", "MI", "MO", "MU")
abbs %in% murders$abb
## CORRECT



## Q8
## Use the 'which' command and also '!' operator 
## to find out which index abbreviation are not actually part of the data set
## and store in ind
## print out the name of the abb
ind <- which(!abbs == murders$abbs)
murders$state[ind]
## WRONG
## MU


## EXP
x <- c(2, 3, 5)
y <- c(1, 2, 3, 4)
x %in% y
