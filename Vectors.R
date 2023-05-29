## VECTORS
## Most basic unit to store data: VECTORS
## Complex data sets can be broken down into components that are vectors.
# "C" in c() stands for concatinate

codes <- c(298, 679, 358)
countries <- c("Faroe Islands", "Fiji", "Finland") 

## ^ We use quotes to denote that the entries are characters rather than variables
## Why error without quotes? Haven't defined the object's names

codes <- c(Faroe_Islands=298, Fiji=670, Finland=358)
codes
class(codes) ## "numeric"

codes <- c("Faroe Islands"=298, "Fiji"=670, "Finland"=358) ## It's the same if there's "" or not
codes

codes <- c(298, 679, 358)
countries <- c("Faroe Islands", "Fiji", "Finland") 
names(codes) <- countries ## Also the same but using different function
codes




## SEQUENCE
## Function that generates sequences: seq() 
## very useful

seq(1, 10) ## output: 1 2 3 4 5 6 7 8 9 10
seq(1, 10, 2) ## the 2 tells it to jump to the second one which makes it: 1 3 5 7 9 
1:10 ## it's the same thing as line 25







## SUBSETTING
## We use [] to access elements of a vector
codes[2] ## Fiji
         ##  679

codes[c(1, 3)] ## Access first 2 element in "codes"
## Faroe Islands   Finland
##           298       358

codes["Finland"] ## Access the entry of whatever the name was assigned to
## Finland
##     358

## We can also have vectors of names that are longer than 1
codes[c("Faroe Islands", "Finland")]
