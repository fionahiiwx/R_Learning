library(tidyverse)


##################### Prob of Loss in a Day ############################
# A doughnut shops sells 2500 doughnuts per day and any doughnuts that are
# not sold on that day would be recycled
# The probability of that doughnut not being sold on that day is 0.6
# Each doughnut is sold for $0.80 and each doughnut that's not sold is a loss
# of $0.12
p <- 0.6
donut_loss <- -.12
donut_price <- .80
n <- 2500
exp_val <- n * (donut_loss*p+donut_price*(1-p))
exp_val
#: $620
# Averagely making $620 per day but this is not the profit as it does not
# include the cost of making and opening the shop.

# sd
std_err <- sqrt(n) * abs(donut_loss-donut_price) * sqrt(p*(1-p))
std_err
#: 22.53531

pnorm(0, exp_val, std_err)
#: 6.241125e-167

##################### Profit ############################
# So let's see how much profit/loss would be by the end of a month with 
# expenses of $10,500 per month under the assumption that the probability
# of a doughnut not being sold on that day is always 0.6.
# (includes water, electricity bill, ingredients and staff pay)
# (set seed of 2022)

set.seed(2022)
p <- 0.6
donut_loss <- -.12
donut_price <- .80
n <- 2500
B <- 10000
month_rep <- replicate(B, {
  month <- replicate(30, {
    donut <- sample(c(donut_loss, donut_price), n, replace = TRUE, prob = c(p, 1-p))
    donut
  })
  sum(month)
})
sum(month_rep)/B - 10500
#: $8100.22
# An avg profit of $8,100.22 per month is made. This amount of profit can be
# a lot in some places but also a bit too little for living in big cities like
# New York.

################################ Useless ############################################
# Now what would the profits look like if I were to increase the amount of
# doughnuts sold? Would I gain more profit or end up losing? The cost of buying
# ingredients would also naturally increase as more was used to make it. It
# would increase by $720 per 200 and an addition of $2,000 for a new worker for
# every addition of 600 increased doughnuts
# ($0.12 for a doughnut made * 200 increased doughnuts made * 30 days = $720)
set.seed(2022)
n_seq <- seq(2500,3700,200)
bills <- c(10500, 11220, 11940, 14660, 15380, 16100, 18820)
donuts_month <- function(n){
  p <- 0.6
  donut_loss <- -.12
  donut_price <- .80
  B <- 10000
  month_rep <- replicate(B, {
    month <- replicate(30, {
      donut <- sample(c(donut_loss, donut_price), n, replace = TRUE, prob = c(p, 1-p))
      donut
    })
    sum(month)
  })
  sum(month_rep)/B
}
profits_m <- sapply(n_seq, donuts_month) - bills
data_prof1 <- data.frame(n_seq,profits_m)

data_prof1 %>%
  ggplot(aes(as.character(n_seq), profits_m)) +
  geom_bar(stat = "identity") + 
  labs(title = "Impact on Avg Profit with the Increase of Donut Production per Day", 
       x = "Number of Donuts Made per Day",
       y = "Avg Profit Made that Month")

# U can see from the graph that when deciding the increase of doughnuts and
# maximizing the profits earned, increase donuts in 400 interval would always
# be higher than by increasing 600 as new employers are needed, 
# thus lowering the profit.

##################### Donut Price Range ############################
# Now what about decreasing price of the doughnut sold?
# Assuming that decreasing $0.10 would increase 0.03 of the probability

set.seed(2022)
donut_price_seq <- seq(.8, .3, -.1)
p_seq <- seq(0.6,0.45,-0.03)

donuts_price <- function(donut_price, p){
  donut_loss <- -.12
  n <- 2500
  B <- 10000
  month_rep <- replicate(B, {
    month <- replicate(30, {
      donut <- sample(c(donut_loss, donut_price), n, replace = TRUE, prob = c(p, 1-p))
      donut
    })
    sum(month)
  })
  sum(month_rep)/B - 10500
}
profits_p <- c()
for (i in 1:6) {
  profits_p[i] <- donuts_price(donut_price_seq[i], p_seq[i])
}
data_prof2 <- data.frame(donut_price_seq,p_seq,profits_p)
data_prof2 %>%
  ggplot(aes(reorder(as.character(donut_price_seq), -donut_price_seq),
             profits_p, fill = reorder(as.character(p_seq), -p_seq))) +
  geom_bar(stat = "identity") + 
  labs(title = "Impact on Avg Profit with the Decrease of Donut Price",
       x = "Donut Price",
       y = "Avg Profit Made that Month",
       fill = "Probability not Sold")
# Looking at the graph, it can be seen that with the donut price of less than
# $0.60, the company would be losing money that month

##################### ??? ############################
# what more can I do?