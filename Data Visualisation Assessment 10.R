### SCORE 3/4


## Q1
## Tile plot - Measles and Smallpox
## us_contagious_disease
library(dslabs)
library(ggplot2)
library(tidyverse)
library(RColorBrewer)
data(us_contagious_diseases)

## initialize the_disease = "Smallpox"
## dat <-
## use filter(!state %in% c("Hawaii", "Alaska"))
## exclude years in which cases were reported in fewer than 10 weeks from the plot
## modify the tile plot to show the rate of smallpox cases instead of measles cases
## use geom_tile() with "grey50" 
## use (expand = c(0, 0)) in scale x
## use scale_fill_gradientn(colours = brewer.pal(9, "Reds"), trans = "sqrt")
## Use the function theme_minimal() with a layer of theme(panel.grid = element_blank())
## give the title "The Disease"

the_disease = "Smallpox"
dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & weeks_reporting >= 10 & 
           disease == the_disease) %>%
  mutate(rate = count/population * 10000,
         state = reorder(state, rate)) 

dat %>%
  ggplot(aes(year, state, fill = rate)) +
  geom_tile(color = "grey50") +
  scale_x_continuous(expand = c(0, 0)) +
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") +
  theme_minimal() +
  theme(panel.grid = element_blank()) +
  ggtitle("The Disease") +
  ylab("") +
  xlab("")

## CORRECT

the_disease = "Smallpox"
dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & weeks_reporting >= 10 & 
           disease == the_disease) %>%
  mutate(rate = count/population * 10000,
         state = reorder(state, rate)) 

dat %>%
  ggplot(aes(year, state, fill = rate)) +
  geom_tile(color = "grey50") +
  scale_x_continuous(expand = c(0, 0)) +
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") +
  theme_minimal() +
  theme(panel.grid = element_blank()) +
  ggtitle("Smallpox") +
  ylab("") +
  xlab("")

## Q2
## requirements are the same from Q1
## use geom_line(col = "grey50") and a geom_vline() to intercept
## show.legend = false
## alpha = 0.2, size = 2
## another layer
## geom_line(aes()) +
## geom_line(mapping =, data = avg, size = 1, colour "black)
## avg <-
## use breaks = c(5, 25)
## geom_vline(xintercept = 1963, col = "blue")

the_disease = "Smallpox"
dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & weeks_reporting >= 10 & 
           disease == the_disease) %>%
  mutate(rate = count/population * 10000,
         state = reorder(state, rate))

avg <- us_contagious_diseases %>%
  filter(disease == the_disease & weeks_reporting >= 10) %>%
  group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE) * 10000)

dat %>%
  ggplot() +
  geom_line(aes(year, rate, group = state), color = "grey50", show.legend = FALSE,
            alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = avg, size = 1, color = "black") +
  scale_y_continuous(trans = "sqrt", breaks = c(5, 25, 125, 300)) +
  ggtitle("Cases per 10,000 by state") +
  ylab("") +
  xlab("") +
  geom_text(data = data.frame(x=1955, y=50), 
            mapping = aes(x, y, label = "US average"), color = "black") +
  geom_vline(xintercept = 1963, col = "blue")

## WRONG

the_disease = "Smallpox"
dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & weeks_reporting >= 10 & 
           disease == the_disease) %>%
  mutate(rate = count/population * 10000,
         state = reorder(state, rate))

avg <- us_contagious_diseases %>%
  filter(disease == the_disease) %>%
  group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE) * 10000)

dat %>%
  ggplot() +
  geom_line(aes(year, rate, group = state), color = "grey50", show.legend = FALSE,
            alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = avg, size = 1, color = "black") +
  scale_y_continuous(trans = "sqrt", breaks = c(5, 25, 125, 300)) +
  ggtitle("Cases of Smallpox per 10,000 by state") +
  ylab("") +
  xlab("") +
  geom_text(data = data.frame(x=1938, y= 1.3), 
            mapping = aes(x, y, label = "US average"), color = "black") +
  geom_vline(xintercept = 1963, col = "blue")



## Q3
## Time series plot - All diseases in California
## For the state of California, make a time series plot that showing rates for all diseases
## Include only years with 10 or more weeks reporting
## Use a different color for each disease
## Include ur aes() function inside of ggplot() rather than inside ur geom layer
## geom_line()

us_contagious_diseases %>%
  filter(weeks_reporting >= 10 & state == "California") %>%
  group_by(year, disease) %>%
  summarize(rate = sum(count)/sum(population) * 10000) %>%
  ggplot(aes(year, rate, col = disease)) +
  geom_line() +
  ggtitle("All Diseases in the California")
## CORRECT

## Q4
## Continuation of Q3
## compute US rate by summarize to sum over state.
## call the variable rate
## Filter out population to get all the data
## plot each disease in a different color

us_contagious_diseases %>%
  filter(!is.na(population)) %>%
  group_by(year, disease) %>%
  summarize(rate = sum(count)/sum(population) * 10000) %>%
  ggplot(aes(year, rate, col = disease)) +
  geom_line() +
  ggtitle("All The Diseases in the United States")
## CORRECT
us_contagious_diseases %>%
  filter(!is.na(population) & year >= 1940) %>%
  group_by(year, disease) %>%
  summarize(rate = sum(count)/sum(population) * 10000) %>%
  ggplot(aes(year, rate, col = disease)) +
  geom_line() +
  ggtitle("All The Diseases in the United States")
