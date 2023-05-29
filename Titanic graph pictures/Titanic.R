library(titanic)
library(tidyverse)
library(gridExtra)
data(titanic_train)

titanic_train %>%
  filter(Embarked %in% c("C", "Q", "S")) %>%
  ggplot(aes(Embarked, fill = Embarked)) +
  geom_bar(position = "dodge") +
  ylab("Number of Passengers") +
  facet_grid(.~Pclass)

a <- titanic_train %>%
  select(Embarked)
a  
##C=168 , Q=77, S=644

### survival by sex
titanic_train %>%
  filter(Sex == "female" & Survived == 0) %>%
  select(Sex, Survived)
## 81
titanic_train %>%
  filter(Sex == "female" & Survived == 1) %>%
  select(Sex, Survived)
## 233
233/(233+81)*100
titanic_train %>%
  filter(Sex == "male" & Survived == 0) %>%
  select(Sex, Survived)
## 468
titanic_train %>%
  filter(Sex == "male" & Survived == 1) %>%
  select(Sex, Survived)
## 109
109/(468+109)*100
titanic_train %>%
  filter(Survived == 1) %>%
  select(Survived)
## 342
titanic_train %>%
  filter(Survived == 0) %>%
  select(Survived)
## 549
342/(549+342)*100
