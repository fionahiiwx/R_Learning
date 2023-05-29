## SORTING
## sort(): sorts the vecotr in increasing order
library(dslabs)
data(murders)
sort(murders$total)



## order(): return the indices that sorts the vector parameter
x <- c(31, 4, 15, 92, 65)
x
sort(x)
index <- order(x)
x[index]
##: 4 15 31 65 92
order(x) ## order(x) is the index the puts the index in order
## refer to (31, 4, 15, 92, 65)
##: 2 3 1 5 4

murders$state[1:10]
murders$abb[1:10]

## First, obtain the index that orders according to murders$total
## Then, indexing the states or abb using that index
index <- order(murders$total)
murders$abb[index]

## BUT there's easier way to get the biggest or smallest
## using max()
max(murders$total)
##: 1257

## max
i_max <- which.max(murders$total)
i_max
##: 5
## 5 is the index for California (the largest)
murders$state[i_max]
##: "California"

## min
i_min <- which.min(murders$total)
i_min
##: 46
## 46 is index of Vermont (the smallest)
murders$state[i_min]
##: "Vermont"

## Is Caliornia the most dangerous state?
## Yes

## rank()
x <- c(31, 4, 15, 92, 65)
x
rank(x)
##: 3 1 2 5 4 (3=31, 1=4.....[those num represent from smallest value])