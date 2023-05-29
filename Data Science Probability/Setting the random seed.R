set.seed(1986)

# We will be using random number generators, many results presentd can be changed by charts.

# we want to avoid using the same seed every time, we can use year-month-day to do this.
# set.seed(1986) = year - month - day

# 1986 = december, 20th, 2018

# 6th december 2020 = 2002

set.seed(1)
set.seed(1, sample.kind = "Rounding")
# we can revert to the original sed.seed behavious by adding the sampl.kind = "Rounding"
# OUTPUT:
# Warning message:
#In set.seed(1, sample.kind = "Rounding") :
#  non-uniform 'Rounding' sampler used
# it is a confirmation that R is using the default non-uniform message