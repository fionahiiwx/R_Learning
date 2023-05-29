library(dslabs)
library(tidyverse)
data(murders)

normal <- murders %>%
  mutate(murder_rate = total/population * 100000) %>%
  ggplot(aes(murder_rate, state)) +
  geom_bar(stat = "identity")
normal

reordered <- murders %>%
  mutate(murder_rate = total/population * 100000) %>%
  mutate(state = reorder(state, murder_rate)) %>%
  ggplot(aes(murder_rate, state)) +
  geom_bar(stat = "identity")
reordered





## Average population sizes for each continent in a year (any year)
library(dslabs)
library(tidyverse)
data(gapminder)

gapminder <- gapminder %>%
  mutate(population_in_millions = population/10^6)

gapminder %>%
  group_by(continent) %>%
  filter(year == 2017) %>%
  mutate(continent = reorder(continent, population_in_millions)) %>%
  summarize(continent, avg_population_in_millions = mean(population_in_millions)) %>%
  ggplot(aes(continent, avg_population_in_millions, fill = )) +
  ylab("population in millions") +
  scale_y_continuous(trans = "log2") +
  geom_bar(stat = "identity")select(continent, avg_population_in_millions)



########

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(population_in_millions = mean(population/(10^6))) %>%
  ggplot(aes(reorder(continent, population_in_millions), population_in_millions)) +
  ylab("population in millions") +
  scale_y_continuous(trans = "log2") +
  geom_bar(stat = "identity")
