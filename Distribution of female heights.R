library(dslabs)
data(heights)
library(tidyverse)

x <- heights$height[heights$sex == "Female"]
z <- scale(x)
p <- seq(0.05, 0.95, 0.05)

observed_quantiles <- quantile(z, p)
theoretical_quantiles <- qnorm(p)
plot(theoretical_quantiles, observed_quantiles)
abline(0, 1)