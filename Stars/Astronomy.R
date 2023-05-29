## Background:
## Astronomy is one of the oldest data driven sciences.
## In the late 1800, the director fo the Harvard College observatory
## hired women to analyse astronomical data, which at the time was using
## photographic glass plates. This women becomes known as "Harvard's Computer".
## They computed the position and luminosity of various astronomical objects
## such as stars and galaxies. Today, astronomy is a more data driven science with
## an inordinate(very large, excessive) amount of data being produced by modern
## instruments everyday. 

library(tidyverse)
library(dslabs)
library(stars)
data(stars)

## How many stars are in each type 
types <- stars %>%
  group_by(type) %>%
  count(type)
types

## num of types (bar)
num_of_types <- stars %>%
  ggplot(aes(type)) +
  geom_bar()
num_of_types

## THERE'S 10 types: A, B, DA, DB, DF, F, G, K, M, 0

## Magnitude vs temp (label) vs temp
mg_vs_temp_label <- stars %>%
  ggplot(aes(temp, magnitude, col = type, label = star)) +
  scale_x_reverse() +
  scale_y_reverse() +
  geom_label()
mg_vs_temp_label

## Magnitude vs temp (points) vs temp
mg_vs_temp <- stars %>%
  ggplot(aes(temp, magnitude, col = type, label = star)) +
  scale_x_reverse() +
  scale_y_reverse() +
  geom_point()
mg_vs_temp


## The hottest star: Alnitak, 33600, O
hottest_star <- stars %>%
  filter(temp == max(temp)) %>%
  select(star, temp, type)
hottest_star

## The coolest star: G15-I5, 2500, M
coolest_star <- stars %>%
  filter(temp == min(temp)) %>%
  select(star, temp, type)
coolest_star

## Highest magnitude: G15-I5, 17, M
max_mg <- stars %>%
  filter(magnitude == max(magnitude)) %>%
  select(star, magnitude, type)
max_mg

###### for question
m <- stars %>%
  filter(temp > 5000) %>%
  mutate(star = reorder(star, magnitude)) %>%
  ggplot(aes(star, magnitude)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
m
## 
m <- stars %>%
  mutate(star = reorder(star, magnitude)) %>%
  ggplot(aes(star, magnitude)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
m

## Lowest magnitude: DeltaCanisMajoris, -8, F
min_mg <- stars %>%
  filter(magnitude == min(magnitude)) %>%
  select(star, magnitude, type)
min_mg


## lowest temp with highest luminosity
minmax <- stars %>%
  filter(temp == min(temp)) %>%
  select(star, magnitude, temp)
minmax
#######################
stars %>% 
  mutate(type = factor(type, 
         levels = c("O", "B", "DB", "A", "DA", "DF", "J", "K", "M")), 
         star = ifelse(star %in% c("Sun", "Polaris", "Betelgeuse", 
                                   "Deneb", "Regulus", "SirusB", "Alnitik",
                                   "*ProximaCentauri"), as.character(star), NA)) %>%
  ggplot(aes(log10(temp), magnitude, col = type)) +
  geom_point() +
  scale_x_reverse() +
  scale_y_reverse() +
  xlab("Temperature (log10 degrees K)") +
  ylab("Magnitude") +
  labs(col = "Spectral Class") +
  ggtitle("H-R Diagram of Selected Stars")
#################################################

##### QUESTIONS #####
## Absolute magnitude is a function of stars luminosity: True
## Where positive magnitude have higher luminosity: False 
## How many white dwarf: 4
## What's the temp closest to the avg temp of a giant,
## (lower temp than main sequence in opp corner of white dwarf): 6100K
## What is the least luminous star with surface temp of over 5000K: 
#:  VanMaanen's Star
## Which group is Sun in: Main sequence
## 2 stars with lowest temp and highest luminosity: (supergiant) Betelgeuse, Antares
## which star type have the lowest temp: M-type
## which star type have the highest temp: O-type
## Sun is the most luminous g-type also the hottest: No....Capella

### temp closest to avg temp of a giant
giant <- c("Rigel", "Deneb", "DeltaCanisMajoris", "Betelgeuse", "Antares",
           "ThetaScorpii", "Mirfak", "Polaris", "Canopus", "Avior", "Aldebaran",
           "Capella", "Gacrux", "Arcturus", "Atria", "Dubhe", "Pollux")
giants <- stars %>%
  filter(star %in% giant)
avg <- sum(giants$temp)/17
avg  
## 5860.588
giants
## closest is 6100
  
g_type <- stars %>%
  filter(type == "G") %>%
  select(star, magnitude, temp)
g_type
## 
## As a matter of fact, for various scientist, they don't follow
## conventional way plottings...astronomer star luminosity and temp b4 plotting
## flipping y-axis as more luminous star have lower magnitude
## scale_y_reverse()
## scale_x_reverse(), log10()
## Can place labels to know which ones are supergiant....


## Primary group of stars which most stars belong to main sequence stars
## however the more rare stars are evolved stars
## What's white dwarf: low luminosity
## remove text label and star
## star spectrum, light produce at various wavelength




#############
## Negative values of Magnitude have higher luminosity/brighter star!!!!!!!
#############




## mean magnitude and sd magnitude, density plot, distribution of star temp
## scatter plot of data with temp on x and y

## mean magnitude and sd magnitude
## Mean: 4.257292 ## 4.26
mean(stars$magnitude) 
## sd: 7.354308 ## 7.35
sd(stars$magnitude) ## how spread out the data is.
## the further the data points are from the mean, the greater the sd.

stars %>%
  ggplot(aes(sample = scale(magnitude))) +
  scale_x_reverse() +
  scale_y_reverse() +
  geom_qq() +
  geom_abline()


#######
## H-R diagram
stars %>%
  ggplot(aes(log10(temp), magnitude, col=type, label = star)) +
  geom_point() +
  geom_text(aes(label = star)) +
  scale_x_reverse() +
  scale_y_reverse()
##:To study the relationship between the variables
stars %>%
  ggplot(aes(log10(temp), magnitude, col = type)) +
  geom_point() +
  geom_text(data = data.frame(x = log10(5840), y = 4.8),
            mapping = aes(x, y, label = "Sun"),
            color = "blue") +
  scale_x_reverse() +
  scale_y_reverse() 
####### 
## distribution of star temp
## density plot of temp
stars %>%
  ggplot(aes(temp)) +
  geom_density()
## What am I suppose to do with my density plot?
#: 
## Majority have high temp: NO
## is it normal distribution? NO
## equal no. of stars across the temp range: 


## denisty plot of magnitude
stars %>%
  ggplot(aes(magnitude)) +
  geom_density()
## how many peak: 2
## 


#######
## bar plot for types of stars
stars %>%
  ggplot(aes(type)) +
  geom_bar()

stars %>%
   count(type)
##   type  n
##1     A 13
##2     B 19
##3    DA  2
##4    DB  1
##5    DF  1
##6     F  7
##7     G  4
##8     K 16
##9     M 32
##10    O  1

#######
stars %>%
  group_by(type) %>%
  ggplot(aes(log10(temp), magnitude)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_reverse() +
  facet_grid(type~.)
  

#######
## categorising our stars
stars <- stars %>% 
  mutate(group = case_when(
    .$star %in% c("Rigel", "Deneb", "DeltaCanisMajoris", "ThetaScorpii", "Mirfak",
                  "Polaris", "Canopus", "Avior", "Capella", "Aldebaran", "Gacrux",
                  "Arcturus", "Atria", "Dubne", "Pollux", "Betelgeuse", "Antares") ~ "Giant",
    .$star %in% c("*SiriusB", "*40EridaniB", "vanMaadenen'sStar", "ProcyonB") ~ "White Dwarf")


######
class(stars$magnitude)
class(stars$star)
class(stars$temp)
class(stars$type)
