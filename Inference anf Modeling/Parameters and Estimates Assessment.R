## Question 1 (CORRECT)
# suppose u poll a pop in which a prop p of voters democrats and 1-p are republicans
# ur sample size is N=25
# consider random var S which is total num of democrats in sample
# What is the expected val of this random var S?
# A. E(S) = 25(1-p)
# B. E(S) = 25p
# C. E(S) = sqrt(25p*(1-p))
# D. E(S) = p
#: B

## Question 2 (CORRECT)
# Consider the random var S which is the total num of democrats in ur sample of 25
# voters
# the var p describes prop of democrats in sample, whereas 1-p describe republican
# what is std error of S?
#: SE(S) = sqrt(25p*(1-p))

## Question 3 (CORRECT)
# consider random var as S/N which is equivalent to sample avg we have been denoting as
# X_bar
# The var N represents sample size and p is the prop of democrats in the pop
# What is the expected val of X_bar?
#: E(X_bar) = p

## Question 4 (CORRECT)
# what is the SE(X_bar)?
# the var N represents sample size 
# p is the prop of democrats in pop
#: SE(X_bar) = sqrt((p*(1-p))/N)

## Question 5 (CORRECT)
# calc se of a sample avg when u poll 25 ppl in the pop 
# generate a seq of 100 prop of democrats p that vary from 0(no democrats) to
# 1 (all democrats)
# plot SE over p for the 100 diff prop
N <- 25
p <- seq(0,1,length=100)
SE <- sqrt((p*(1-p))/N)
plot(p, SE)

## Question 6
# Create a for in loop that generates 3 plots of p vs SE
# when the sample sizes, N=25, N=100 and N=1000
# first line within for loop should use the sqrt() to generate vector of SE 
# for all val of p
# the second line in for loop use plot() to generate a plot with p on X-axis and
# SE on Y-axis
sample_sizes <- c(25, 100, 1000)
p <- seq(0,1,length=100)
par(mfrow=c(1,3))
for(N in sample_sizes){
  se <- sqrt((p*(1-p))/N)
  plot(p, se, ylim = c(0,0.5/sqrt(25)))
}

## Ques 7 in journal (CORRECT)
#: D. E[X_bar-(1-X_bar)] = E[2X_bar-1] = 2E[X_bar]-1 = 2p-1 = p-(1-p)

## Ques 8 in journal (CORRECT)
#: B. SE[X_bar-(1-X_bar)] = SE[2X_bar-1] = 2SE[X_bar] = 2sqrt(p(1-p)/N)

## Ques 9 (CORRECT)
# Say the actual prop of democratic voters is p=0.45. In this case,
# the republican party is winning by relatively large margin of d=-0.1
# or a 10% margin of victory. What's the std err of spread 2X_bar-1
# in this case?
N <- 25
p <- 0.45
se <- 2*sqrt(p*(1-p)/N)
se
#: 0.1989975

## Ques 10 (CORRECT)
# We hv said that the diff between the prop of democratic voters and republican
# voters is about 10% and that the sd of the spread is about 0.2 when N=25
# Choose the statement that explains why this sample size is suff or not.
# A. This sample size is suff as SE of about 0.2 is much smaller than spread of
#    10%
# B. This sample size is suff as the expected val of our est 2X_bar-1 is d,
#    so our prediction will be right on
# C. Without knowing p, we hv no way of knowing that increasing our sample size
#    would actually improve our SE
# D. This sample size is too small as SE is larger than the spread
#: D

