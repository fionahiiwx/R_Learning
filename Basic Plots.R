## Exploratory data visualization
## ONe can quicly go from idea to data with flexibility and ease
## we are using back US MURDERS
## we infer that states with larger population have more murders
library(dslabs)
data(murders)
library(dplyr)


##
population_in_million <- murders$population / 10^6
total_gun_murders <- murders$total
plot(population_in_million, total_gun_murders)

## Histograms are powerful graphical summaries of a list of numbers 
## that gives u a general overview of the types of values u have
murders <- mutate(murders, rate = total/population*100000)
hist(murders$rate)
## hist() show's u a histogram graph


murders$state[which.max(murders$rate)]
## District of Columbia




## BOX PLOTS
## provides a more compact summary of a distribution 
## than a histogram and a more useful for comparing distribution
## we use them to compare the regions 
boxplot(rate ~ region, data = murders)




## visualization
