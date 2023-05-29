##### CLIMATE CHANGE
## The planet's surface temp is increasing as greenhouse gases emissions
## increases. This global warming and carbon cycle disruption is wrecking
## havoc on natural systems. Living systems that depend on current temp,
## weather, currents and carbon balance are jeopardized, and human
## society will be forced to contand wide spread economy, social, political
## and environmental damage as the temp continue to rise. In this dataset,
## examine the relationship between global temp changes, greenhouse gases
## and human carbon emissions using time series of actual atmospheric and
## ice core measurements from the National Oceanic and Atmospheric Administration
## (NOAA) and Carbon Dioxide Information Analysis Center (CDIAC).

library(tidyverse)
library(dslabs)
library(gridExtra)
data(temp_carbon) ## year, temp_anomaly, land_anomaly, 
## ocean_anomaly, carbon_emissions
data(greenhouse_gases) ## year(con), gas(discrete), conc.(con)
data(historic_co2) ## year(con), co2(con), source(continuous)

temp_carbon_1880 <- temp_carbon %>%
  filter(year >= 1880)
summary(temp_carbon_1880)


## line graph of temp_carbon
temp_carbon_1880 %>%
  filter(!is.na(carbon_emissions)) %>%
  select(Year = year, Global = temp_anomaly, Land = land_anomaly,
         Ocean = ocean_anomaly) %>%
  gather(Region, Temp_anomaly, Global:Ocean) %>%
  ggplot(aes(Year, Temp_anomaly, col = Region)) +
  geom_line(size = 1) +
  geom_hline(yintercept = 0, linetype = "dashed", col = "red") +
  ylab("Temperautre anomaly (degree Celcius)") +
  xlab("Year")


## facet grid of density plot of conc. against year
p <- greenhouse_gases %>%
  ggplot(aes(year, concentration)) +
  geom_line() +
  facet_grid(gas~., scale = "free")
p

p2 <- greenhouse_gases %>%
  ggplot(aes(year, concentration)) +
  geom_line() +
  facet_grid(gas~.)
p2

## historic_co2
ic <- historic_co2 %>%
  filter(source == "Ice Cores") %>%
  ggplot(aes(year, co2)) +
  geom_line() +
  ggtitle("Carbon Dioxide Levels in Ice Cores")
ic
ml <- historic_co2 %>%
  filter(source == "Mauna Loa") %>%
  ggplot(aes(year, co2)) +
  geom_line() +
  ggtitle("Carbon Dioxide Levels in Mauna Loa")
ml
grid.arrange(ic, ml, ncol = 2)


## temp_carbon
c <- temp_carbon %>%
  ggplot(aes(year, carbon_emissions)) +
  geom_line()
c

## temp and year
ty <- temp_carbon_1880 %>%
  ggplot(aes(year, temp_anomaly)) +
  geom_line()
ty

## total conc. of each gas
tcoeg <- greenhouse_gases %>%
  group_by(gas) %>%
  summarize(total_conc = sum(concentration)) %>%
  select(gas, total_conc)
tcoeg
## CH4 = 69788
## CO2 = 28212
## N20 = 26847


## conc. of each gas in 2000
conc_2000 <- greenhouse_gases %>%
  filter(year == 2000) %>%
  select(gas, concentration)
conc_2000
conc_20 <- greenhouse_gases %>%
  filter(year == 20) %>%
  select(gas, concentration)
conc_20

conc_2000$concentration - conc_20$concentration
## CO2 = 89.1, CH4 = 1065.3, N2O = 263.2

## Total co2 made by each source
tcmbes <- historic_co2 %>%
  group_by(source) %>%
  summarize(total_co2 = sum(co2))
tcmbes
## Ice Cores = 149392
## Mauna Loa = 21264

## Years of data in historix_co2
## Mauna Loa = 1959 to 2018
## Ice Cores = -803182 to 2001

## avg temp_anomaly
mean(temp_carbon_1880$temp_anomaly)
## 0.06

## avg land_anomaly
mean(temp_carbon_1880$land_anomaly)
## 0.07086331

## avg ocean_anomaly
mean(temp_carbon_1880$ocean_anomaly)
## 0.05273381

## 

## color change .......

## climate change: global warming, increase of greenhouse gases in the air

## tip for presentation!!!!
## 10 min long
## don't need to put everything in slide
## put important notes on note
## exp: 900 rows with 7 collumns
## elaboration is not needed in the slide
## don't read word by word from slide

## classes
class(greenhouse_gases$year)
class(greenhouse_gases$gas)
class(greenhouse_gases$concentration)
class(historic_co2$year)
class(historic_co2$co2)
class(historic_co2$source)
class(temp_carbon$year)
class(temp_carbon$temp_anomaly)
class(temp_carbon$land_anomaly)
class(temp_carbon$ocean_anomaly)
class(temp_carbon$carbon_emissions)

## total of carbon emission
temp_carbon %>%
  filter(year <= 2014) %>%
  summarize(sum(carbon_emissions))
## 402068
## 402,068,000

## comparison of gases
CH4_1900 <- greenhouse_gases %>%
  filter(gas == "CH4" & year == 1900) %>%
  summarize(concentration)
CH4_2000 <- greenhouse_gases %>%
  filter(gas == "CH4" & year == 2000) %>%
  summarize(concentration)
(CH4_2000-CH4_1900)/CH4_1900*100
## increased by 96.9%

CO2_1900 <- greenhouse_gases %>%
  filter(gas == "CO2" & year == 1900) %>%
  summarize(concentration)
CO2_2000 <- greenhouse_gases %>%
  filter(gas == "CO2" & year == 2000) %>%
  summarize(concentration)
(CO2_2000-CO2_1900)/CO2_1900*100
## 23.9%

N2O_1900 <- greenhouse_gases %>%
  filter(gas == "N2O" & year == 1900) %>%
  summarize(concentration)
N2O_2000 <- greenhouse_gases %>%
  filter(gas == "N2O" & year == 2000) %>%
  summarize(concentration)
(N2O_2000-N2O_1900)/N2O_1900*100
## 13.8%

increase_13 <- temp_carbon_1880 %>%
  filter(year == 2013) %>%
  summarize(carbon_emissions)
increase_14 <- temp_carbon_1880 %>%
  filter(year == 2014) %>%
  summarize(carbon_emissions)
(increase_14-increase_13)/increase_13*100 


historic_co2 %>%
  ggplot(aes(year, co2, col = source)) +
  geom_line() +
  ylab("CO2 (ppm)")
## increase by 0.8% in a year


## bar chart of each total of gas in atmosphere
