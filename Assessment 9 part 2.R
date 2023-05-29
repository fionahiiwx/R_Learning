## SCORE 14/16




## Total of part 1 & 2: 16/19




library(dslabs)
data(heights)
options(digits = 3) # report 3 sig. fig. for all ans
## Q1
## First, determine the average height in this dataset
## Then, create a logical vector ind with the indices for those individuals who are above average height
## How many individual in the dataset are above average height?
head(heights)
total_heights <- sum(heights$height)
total_ppl <- nrow(heights)
average_height <- total_heights / total_ppl 
ind <- heights$height > average_height
sum(ind)
#: 532 
## CORRECT






## Q2
## How many individuals in the dataset are above average height and are female?
are_female <- heights$sex == "Female"
sum(ind & are_female) 
#: 31
## CORRECT




## Q3
## What proportion of individuals in the dataset are female?
are_male <- heights$sex == "Male"
sum(are_female) / (sum(are_male) + sum(are_female))
#: 0.227 
## CORRECT





## Q4
## Determine the minimum height in the dataset
min_height <- min(heights$height)
min_height
#: 50
## CORRECT




## Q5
## Determine the index of the first individual with the minimum height
min_height_ind <- which.min(heights$height)
min_height_ind
#: 1032
## CORRECT

## Alternative way of doing it:
match(c(min_height), heights$height)




## Q6
## Subset the sex column of the dataset by the index in Q5 to determine the individual's sex
heights$sex[min_height_ind]
#: Male
## CORRECT




## Q7
## Determine the maximum height 
max_height <- max(heights$height)
max_height
#: 82.7
## CORRECT





## Q8
## Which integer values are between the maximum and minimum heights?
## For example, if the minimum height is 10.2 and the maximum height is 20.8, your ans should be x <- 11:20
## to capture the integers in between those values
## (if either the max or min height are integers, include those values too)
## Create a vector x that includes the integers between the minimum and maximum heights
x <- min_height:max_height
x
#: 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82
## WRONG
## Correct way:
x <- 50:82
x





## Q9
## How many of the integers in x are NOT heights in the datasets?
sum((x %in% heights$height) == FALSE)
#:3
## CORRECT
## Alternative way:
sum(!x %in% heights$height)





## Q10
## Instruction: using the heights dataset, create a new column of heights in centimetres named ht_cm
## Recall that 1 inch = 2.54cm
## Save the resulting dataset as heights2
## What is the height in cm of the 18th individual? (index 18)
heights2 <- mutate(heights, ht_cm = heights$height * 2.54)
heights2$ht_cm[18]
#: 163
## CORRECT




## Q11
## What's the mean height in cm?
mean_height_in_cm <- sum(heights2$ht_cm) / nrow(heights2)
mean_height_in_cm
#: 174
## CORRECT








## Q12
## Create a dataframe females by filtering the heights2 data to contain only female individuals
## How many females are in the heights2 datasets
heights2 <- filter(heights2, sex == "Female")
nrow(heights2)
#: 238
## CORRECT





## Q13
## What is the mean height of the females in cm?
mean_height_female <- sum(heights2$ht_cm) / nrow(heights2)
mean_height_female
#: 165
## CORRECT




## Q14
## The olive dataset in dslabs contains -
## composition in percentage of 8 fatty acids in the lipid fraction of 572 Italian olive oils
## plot the percent palmitic acid vs palmitoleic acid in a scatterplot
## What relationship do you see?
data(olive)
plot(olive$palmitic, olive$palmitoleic)
#: As the percentage of palmitic acid increases, the percentage of palmitoleic acid increases as well.
#: The points are mostly cluttered at around (11, 0.7) and (14, 1.7).
#: There is only 1 point at the begining of the graph at around (6, 0.8) 
#: and only more after olive$palmitic = 8.5
##: WRONG
#: There's a positive *linear* relationship.






## Q15
## Create a histogram of the percentage of eicosenoic acid in olive (dataset) 
hist(olive$eicosenoic)

#: No
#: No
#: No
#: Yes



## Q16
## Make a boxplot of palmitic acid percentage in olive with seperate distributions for each region
## which region has the highest median palmitic acid percentage?
boxplot(palmitic~region, data = olive)
#: Southern Italy
## CORRECT




## Q17 cotinuation of Q16
## which region has the most variable palmitic acid percentage?
#: Southern Italy
## CORRECT