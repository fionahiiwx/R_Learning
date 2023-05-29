install.packages("dplyr")
library(dplyr)

library(dslabs)
data(murders)


## u will find it necessary to create a data frame
## u can do this by using data.frame() function

##exp
grades <- data.frame(names = c("Fiona", "Meagan", "Ling"), 
                     exams_1 = c(90, 95, 99),
                     exam_2 = c(91, 96, 100))
grades

## now bewarned, by default data.frame() turns characters into factors
class(grades$names)
## it's a factor

grades <- data.frame(names = c("Fiona", "Meagan", "Ling"), 
                     exams_1 = c(90, 95, 99), 
                     stringsAsFactors = FALSE)
class(grades$names)
## 