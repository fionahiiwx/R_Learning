## 

library(dslabs)
data(heights)

## Q1
## about vector lengths
## what's vector length?
## 1. define the variable male with male heights
male <- heights$height[heights$sex == "Male"]
## 2. define the variable female that contains the female height
female <- heights$height[heights$sex == "Female"]
## 3. report the length of each variable
length(male)
#: 812
## CORRECT
length(female)
#: 238
## CORRECT


## Q2
## about percentiles
## supposedly we can't make a plot and we want to compare data side by side
## if the no. of data point is very large (10,000,000) listing all of it is impractical
## more practical approach is to look at the percentile
## 1. Create 2 five row vectors showing the 
##    10th, 30th, 50th, 70th and 90th percentiles for 
##    the heights of each sex called these vectors: 
##    female_percentiles and male_percentile
## did this with Tr's help
quantile(heights$height, seq(.01,0.99,0.01))
p <- seq(0.1, 0.9, 0.2)
female_percentiles <- quantile(female, p)
female_percentiles
male_percentiles <- quantile(male, p)
male_percentiles


## 2. Create a data frame called df with these 2 vectors as columns.
##    the columns name should be female and male and should appear in that order
df <- data.frame(female = female_percentiles, male = male_percentiles)
df
## CORRECT