## Computers provide a way to actually perform the simple random experiment:
## Like 2 red and 3 beads in an urn
## Random num generators permit us to mimic the process of picking at random

## Much of what mathematical and theoratical staticians study, 
#  relates to providing rigorous definitions of "practically equivalent"
#  as well

## use the rep() func to generate the urn/bag
beads <- rep(c("Red", "Blue"), times = c(2, 3))
beads

## use sample() func to pick a bead at random
sample(beads, 1)

## repeat it over and over again
B <- 10000
C <- 20000
events <- replicate(B, sample(beads, 1))
events2 <- replicate(C, sample(beads, 1))
tab <- table(events)
tab2 <- table(events2)
## use pr p.table() to give us proportions:
prop.table(tab)
prop.table(tab2)

## we don't actually have to use replicate() as
#  sample() allow us to pick more than 1 beads from the urn without replacements

sample(beads, 5)
sample(beads, 5)
sample(beads, 5)
## rearrangements of the 3 blue and 2 red beads

sample(beads, 6)
## error: as replace = FALSE
## can be used again without replicate over and over under the same condition
event3 <- sample(beads, 6, replace = TRUE)
prop.table(table(event3))
## By default, it is "replace = FALSE"
## Results are very similar to those previously obtained with replicate()

## Key points:
##- Monte Carlos simulation models to probability of outcomes by repeating the
#   process for large amount of times
##- sample functions draws random outcomes from a set of options
##- replicate() repeat lines of codes a set number of times, it is used with sample()
#   and similar functions for Monte Carlo Simulations

## 