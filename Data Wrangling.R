install.packages("dplyr")
library(dplyr)

library(dslabs)
data(murders)

## provides functionality to work with others
## introduces function of the most commmon ones in data manipulation with easy names to remember
## mutate() function: changing/add a table a new collumn of changing an existing ones uses
## filter() function: to filter by subsetting rows
## select() function: to subset the selecting collumn 
## pipe operator *** [%>%]: sending results of 1 function to another function





## 1. [mutate()]
## to add our own murder rate to our data frame
## murder() takes "murders" as it's first argument with the rate for the second one
murders <- mutate(murders, rate = total/population*100000)
head(murders)
## rate is the column that we manipulate
## if reloaded from dslabs, will overwrite the written codes









## 2. [filter()]
filter(murders, rate <= 0.71)
## gets the entire table for these 5 states which conditionals are TRUE









## 3. to make a smaller table [select()]
new_table <- select(murders, state, region, rate)
new_table


filter(new_table, rate <= 0.71)
## smaller table with 3 columns
## note: in the call to select[select(murders, state, region, rate)], 
## first argument is an object( it is to data table)
## (state, region, rate) they are variable name








## learn to put all of them together using pipe function
murders %>% select(state, region, rate) %>% filter(rate <= 0.71)
## same ans as the code in line 53
## know that using a pipe function, u no longer need to specify the required argument
## why? because dplyr assumed that whatever is being typed is what should be operated on
## a nice feature of it