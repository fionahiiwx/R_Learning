# Q1
# Load the US murders data sets
# use the func str to examine the structure of the murders object
# we can see that these object is a data frame with 51 rows and 5 collumns
# pls describe the variables represented in this data frame
library(dslabs)
data("murders")
str(murders)
# they are characters. WRONG!!
# Ans: The state name, abbreviation of state name, state regioin, state population, total number of murders for 2010

# Q2
# What are the collumn names used by the data frame for these 5 variables?
# state, abb, region, population and total.
names(murders)
# CORRECT

# Q3
# Use the accessor to extract the state abbreviations and assign them to the object a
# and determine the class of this object.
a <- murders$abb 
class(a)
# CORRECT

# Q4
# Now use the [] to extract the state abbreviaitons and assign them to the object b
# Use the identical function to determine if a and b are the same
b <- murders[["abb"]] 
identical(b, a)
# CORRECT

# Q5
# With one line of code, use the function levels and lengths to determine the number of regions
# defined by these data sets
length(levels(murders$region))
# CORRECT

# Q6
# The function table takes a vector and returns the frequency of each element
# U can quickly see how many states are in each region by applying this function
# Use this function in one line of code to create a table of states per regions
table(state.region) #OR
table(murders$region) #you typed this out since the beginning
# CORRECT

# EXTRAS
# exp of what table func does
x <- c("a", "a", "b", "b", "b", "c")
table(x)
