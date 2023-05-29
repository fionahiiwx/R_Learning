## Defining the distribtions of categorical outcomes,
## it is relatively straight forward. So we simply assing
## probability to each category. So in cases like beads in an urn.
## THe proportion defines the distribution.

## EXP
## polling
## like the votings for the prime minister....
## these proportions define the probability of each group
## the probability distributions is simply these 4 proportion
## 40% one group, 10% not voting, 5% .....

## categorical data makes it easy for probability distributions
## We'll later learn those for continuous data, for now is discrete.

## KEY POINT:
## 1. the probability distribution for a variable describes the probability
##    of observing each possible outcome.
## 2. the discrete categorical variables, the probability distributions is
##    defined by the proportions for each group.


#### INDEPENDENCE ####
## We say that 2 events are independent if the outcome of one doesn't affect the other

## EXP, coin tosses.
## The same is true when we pick beads from an urn with replacements.

## Many exp of events that are not independent come from card games.

## When we deal the first card, the probability of getting a King is 1/13
#  since there are 13 possibilities: Ace, Deuce, Three,.....Ten, Jack, Queen, King

## Now if we deal a King for the first card, and don;t replace it into the deck, 
#  the probabilities of a second card being  King is less as there are only left 3
#  Kings left: the probabilities is 3 out of 51. These events are therefore
#  "NOT INDEPENDENT": the first outcome affected the next one

## we are trying to see an example of an extreme case of non-independent
#  events, we consider drawing 5 beads without replacement.
beads <- rep(c("Red", "Blue"), time = c(2, 3))
x <- sample(beads, 5)
x

x[2:5]
## This would make us know that the "Red" would be the first one, the probability
## is going to be 1.
## Thus, this events are not independent.
## Conditional probabilities are useful when events are not independent.
## We compute the probability that the second dealt card is a King
## given that
## Pr(Card 2 is a King | Card 1 is a King) = 3/51 
## we use the | as shorthand for "given hand" or "conditional on" 

## if A and B are independent, we have the following equation:
## Pr(A | B) = Pr(A)
## This can be considered as the mathematical definition of independence



###### Multiplication rule ######
## Pr(A and B) = Pr(A) x Pr(B|A)

## The multiplation for dependent events considers the conditional probability of 
## both events occuring




##### The multiplication for independent events #####
## Pr(A and B and C) = Pr(A) x Pr(B) x Pr(C)




##### Expand the multiplication rule for dependent events to more than 2 events #####
## Pr(A and B and C) = Pr(A) x Pr(B|A) x Pr(C|A and B)




##### 