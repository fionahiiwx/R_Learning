## IN general, coercion is an attempt by R to be flexible in data types
## So when the entry does not match, R will attempt to guess before  throwing in an error
## Failing to understand coercion in R can make the coder crazy as it behaves differently than other language
## Good thing is that it can heklp you guess b4 giving u an error
## Bad thing is that it can confuse coders
x <- c(1, "Finland", 3)
x
## Output: "1"      "Finland" "3"
## There's no error eventhough it should be
class(x)
## instead of numeric for 1 and 3, it automatically converted them to characters to avoid error
## R coerced the data into character string
## Why?
## Because it guessed that we put a character string there in the middled. 
## We meant that the 1 and the 3 are characters too
## You can turn number into character with the as.character()
x <- 1:5
y <- as.character(x)
y


y <- as.numeric(x)
y

## missing data = NA, common in practise from coercion
## When R fails to coerce something, if it really can't, it produce out NA
x <- c("1","b" ,"3")
as.numeric(x)
## 1 NA 3

