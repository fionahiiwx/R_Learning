## VECTOR ARITHMATIC
murders$state[which.max(murders$population)]
## How are we going to know 
max(murders$population)
## IN R, arithmatic operation on vectors occur elements wise
heights <- c(69, 62, 66, 73, 70, 70, 63, 75) ## these are in inches
heights*2.54
##: 175.26 157.48 167.64 185.42 177.80 177.80 160.02 190.50
## These are in cm
# avg: 69 inches
heights - 69
murder_rate <- murders$total/murders$population * 100000
murder_rate
## decreasing
murders$state[order(murder_rate, decreasing = TRUE)]
