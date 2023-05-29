library(dslabs)
data(murders)

## Indexing Functions


## THREE functions that is related to indexing using logical operators:




## 1.
## which (gives us the entries of a logical vectors that are TRUE)
## exp
x <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)
which(x)
##: 2 4 5
## u want to look up a specific state.
murders$state
index <- which(murders$state == "Massachusetts")
index
##: 22
## It is the only TRUE in it.
murder_rate[index]
##: 1.802179
index <- murders$state == "Massachusetts"
murder_rate[index]
##: 1.802179
## still the same ans [line17 and line23] even without which() as we just use the logic vector
## second one is smaller than the other one as it doesn't have which()





## 2. 
## match (looks for entries in a vector and returns the index needed to access them)
index <- match(c("New York", "Florida", "Texas"), murders$state)
index
##: 33 10 44
## New York = 33, Florida = 10, Texas = 44
murders$state[index]
##: "New York" "Florida"  "Texas" 
murder_rate[index]
##:2.667960 3.398069 3.201360


## !!!- 3. %in% -!!!!!!!!
## If rather than an index, we want to know whether or not each element of a first vector is in a second vector
## so we use the function %in%
x <- c("a", "b", "c", "d", "e")
y <- c("a", "d", "f")
y %in% x
##: TRUE  TRUE FALSE
## get a false at the end as x does not have "f"

c("Boston", "Dakota", "Washington") %in% murders$state
##: FALSE FALSE  TRUE
## we use this often, subsetting strata 