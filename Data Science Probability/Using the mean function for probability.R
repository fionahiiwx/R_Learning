## IN R, applying the mean() function to a logical vector returns the proportion
## of elements that are TRUE
## It very common to use the mean() function in this way to calculate probabilities.
beads <- rep(c("Red", "Blue"), times = c(2, 3))
beads

## to find the probability of drawing a blue bead at random
mean(beads == "Blue")
#: 0.6

## The code is broken down insides are first: are evaluate the
## logical statement beads == blue, which generates the vector:
#: FALSE, FALSE, TRUE, TRUE, TRUE
## when the mean function is applied, R coerce
## COERCE: obtain something from someone by using force or threats]
## it'LL be changing TRUE to 1, FALSE to 0: 
#: 0, 0, 1, 1, 1

## the mean of the 0 and 1, give proportion of TRUE values.
## probabilites are directly related to proportions of events that satisfies the event.