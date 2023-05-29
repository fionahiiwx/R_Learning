library(dslabs)
library(ggplot2)
library(tidyverse)
library(RColorBrewer)
data(us_contagious_diseases)

##Cases per 10,000 in California

class(us_contagious_diseases$disease)
class(us_contagious_diseases$state)
class(us_contagious_diseases$year)
class(us_contagious_diseases$weeks_reporting)
class(us_contagious_diseases$count)
class(us_contagious_diseases$population)

##Cases  of Measles per 10,000
the_disease = "Measles"
dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & 
           disease == the_disease) %>%
  mutate(rate = count/population * 10000 * 52 / weeks_reporting,
         state = reorder(state, rate))

avg <- us_contagious_diseases %>%
  filter(disease == the_disease) %>%
  group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE) * 10000)

dat %>%
  filter(!is.na(rate)) %>%
  ggplot() +
  geom_line(aes(year, rate, group = state), color = "grey50",
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = avg, size = 1) +
  scale_y_continuous(trans = "sqrt", breaks = c(5, 25, 125, 300)) +
  xlab("") +
  ylab("") +
  geom_text(data = data.frame(x = 1955, y = 50),
            mapping = aes(x, y, label = "US average"),
            color = "black") +
  geom_vline(xintercept = 1963, col = "blue") +
  ggtitle("Cases of Measles per 10,000 people") 
avg %>%
  filter(year %in% c(1963, 1968)) %>%
  select(year, us_rate)
## the blue lines indicates the year the vaccines were introduced. (1963)

## in 1963 and in 1968 (5 years)
avg %>%
  filter(year %in% c(1963, 1968)) %>%
  select(year, us_rate)

(17.8-1.15)/17.8*100

## Cases of Polio per 10,000
the_disease = "Polio"
dat <- us_contagious_diseases %>%
  filter(disease == the_disease) %>%
  mutate(rate = count/population * 10000 * 52 / weeks_reporting,
         state = reorder(state, rate))

avg <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") &
           disease == the_disease) %>%
  group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE) * 10000)

dat %>%
  filter(!is.na(rate)) %>%
  ggplot() +
  geom_line(aes(year, rate, group = state), color = "grey50",
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = avg, size = 1) +
  scale_y_continuous(trans = "sqrt", breaks = c(5, 25, 125, 300)) +
  xlab("") +
  ylab("") +
  geom_text(data = data.frame(x = 1950, y = 3.5),
            mapping = aes(x, y, label = "US average"),
            color = "black") +
  geom_vline(xintercept = 1955, col = "blue") +
  ggtitle("Cases of Polio per 10,000 people")
## vaccine available in 1955

## Cases of Rubella per 10,000
the_disease = "Rubella"
dat <- us_contagious_diseases %>%
  filter(disease == the_disease) %>%
  mutate(rate = count/population * 10000 * 52 / weeks_reporting,
         state = reorder(state, rate))

avg <- us_contagious_diseases %>%
  filter(disease == the_disease) %>%
  group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE) * 10000)

dat %>%
  filter(!is.na(rate)) %>%
  ggplot() +
  geom_line(aes(year, rate, group = state), color = "grey50",
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = avg, size = 1) +
  scale_y_continuous(trans = "sqrt", breaks = c(5, 25, 125, 300)) +
  xlab("") +
  ylab("") +
  geom_text(data = data.frame(x = 1982, y = 0.3),
            mapping = aes(x, y, label = "US average"),
            color = "black") +
  geom_vline(xintercept = 1969, col = "blue") +
  ggtitle("Cases of Rubella per 10,000 people")
## vaccine available in 1969

avg %>%
  filter(year %in% c(1969, 1974)) %>%
  select(year, us_rate)
(2.62-0.52)/2.62*100

## Cases of Pertussis per 10,000
the_disease = "Pertussis"
dat <- us_contagious_diseases %>%
  filter(disease == the_disease) %>%
  mutate(rate = count/population * 10000 * 52 / weeks_reporting,
         state = reorder(state, rate))

avg <- us_contagious_diseases %>%
  filter(!state %in% c("Alaska", "Hawaii") & 
           disease == the_disease) %>%
  group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE) * 10000)

dat %>%
  filter(!is.na(rate)) %>%
  ggplot() +
  geom_line(aes(year, rate, group = state), color = "grey50",
            show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = avg, size = 1) +
  scale_y_continuous(trans = "sqrt", breaks = c(5, 25, 125, 300)) +
  xlab("") +
  ylab("") +
  geom_text(data = data.frame(x = 1950, y = 3.5),
            mapping = aes(x, y, label = "US average"),
            color = "black") +
  geom_vline(xintercept = 1948, col = "blue") +
  ggtitle("Cases of Pertussis per 10,000 people")
## vaccine available in 1940s
## 

## 
us_contagious_diseases %>%
  group_by(disease)
levels(us_contagious_diseases$disease)

us_contagious_diseases %>%
  group_by(state)
levels(us_contagious_diseases$state)


us_contagious_diseases %>%
  group_by(disease) %>%
  summarize(start = min(year), end = max(year), total = end-start) %>%
  select(disease, start, end, total)


##########

dat <- us_contagious_diseases %>%
  filter(year == 1963 & disease == "Measles", !is.na(population)) %>%
  mutate(rate = (count/population*10000*52/weeks_reporting),
         state = reorder(state, rate))

dat %>%
  ggplot(aes(rate, reorder(state, rate))) +
  ylab("state") +
  geom_bar(stat = "identity") +
  xlab("Rate of Measles")


##No. of diseas reported per week
us_contagious_diseases %>%
  ggplot(aes(weeks_reporting)) +
  geom_bar() +
  xlab("Weeks Reporting") +
  ylab("Number of Diseases") +
  ggtitle("Number of Diseases Reported per Week")


dat %>%
  filter(!is.na(population) & rate <= 50 & year >= 1928) %>%
  group_by(year, disease) %>%
  summarize(rate = sum(count)/sum(population) * 10000) %>%
  ggplot(aes(year, rate, col = disease)) +
  geom_line() +
  ggtitle("All The Diseases in the United States")


## number of week reported
us_contagious_diseases %>%
  filter(weeks_reporting <= 1) %>%
  group_by(weeks_reporting) %>%
  summarize(sum = count(weeks_reporting)) %>%
  select(weeks_reporting, sum)


## population
the_disease = "Measles"
us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & disease == the_disease) %>%
  mutate(state = reorder(state, population)) %>%
  ggplot(aes(population, reorder(state, population))) +
  geom_bar(stat = "identity")


### 
a <- us_contagious_diseases %>%
  filter(!is.na(population), year >= 1960) %>%
  group_by(year, disease) %>%
  summarize(rate = 
              sum(count)/sum(population) * 10000)
a %>%
  filter(rate <= 4) %>%
  ggplot(aes(year, rate, col = disease)) +
  geom_line() +
  ggtitle("All The Diseases in the United States")
