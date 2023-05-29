#### SCORE /

######### TITANIC SURVIVAL ASSESSMENT ##########

## Put all what u have learn and ur skills together to form an exploratory data analysis
## on a machine learning data set: TITANIC SURVIVAL
## Background:
## The Titanic was a British ocean liner that struck an iceberg and sunk on its 
## maiden voyage in 1912 from the United Kingdom to New York.
## More than 1500 of the estimated 2224 passengers and crew died in the accident,
## making this one of the largest maritime disasters ever outside of war.
## The ship carried a wide range of passengers of all ages and both genders,
## from luxury travelers in first class to immigrants in the lower classes.
## However, not all passenger were equally likely to survive the accident.
## We use real data about a selection of 891 passengers 
## to learn more about the Titanic incident.



## ASSUMPTIONS:
## 1. The younger and women passengers are more
##    likely to survive than men and older passengers.
## 2. First and second class passengers would be more likely to survived than 
##    third class passengers.
## 3. The combination of being first and second class, and female would have an
##    even higher chance to survive compared to being in first/second class or
##    just female.

library(titanic)
library(tidyverse)
library(gridExtra)
data(titanic_train)

class(titanic_train$PassengerId)
class(titanic_train$Survived)
class(titanic_train$Pclass)
class(titanic_train$Name)
class(titanic_train$Sex)
class(titanic_train$Age)
class(titanic_train$SibSp)
class(titanic_train$Parch)
class(titanic_train$Ticket)
class(titanic_train$Fare)
class(titanic_train$Cabin)
class(titanic_train$Embarked)


## How many died and survived
table(titanic_train$Survived)
## 549 died while 342 survived


## Percentage of people survived and died
table(titanic_train$Survived) / 891 * 100
## 61.6% died while 38.4% survived


## No. of passengers that survived in each class
table(titanic_train$Pclass, titanic_train$Survived)
#: Class 1: 80 died, 136 survived
#: Class 2: 97 died, 87 survived
#: Class 3: 372 died, 119 survived


## Percentage of passengers that survived in each class
table(titanic_train$Pclass, titanic_train$Survived) / 891 * 100
#: Class 1: 8.99% died, 15.3% survived
#: Class 2: 10.8% died, 9.76% survived
#: Class 3: 41.8% died, 13.4% survived
## Class 1 is the only class that has a higher percentage of survival than death


## No. of survival in females in each class
titanic_female <- titanic_train %>%
  filter(Sex == "female")
table(titanic_female$Pclass, titanic_female$Survived)
## Class 1: 3 dead, 91 survived
## Class 2: 6 dead, 70 survived
## Class 3: 72 dead, 72 survived
## The ratio of female's between survived and dead decreases going down the class.


## No. of survival in males in each class
titanic_male <- titanic_train %>%
  filter(Sex == "male")
table(titanic_male$Pclass, titanic_male$Survived)
## Class 1: 77 dead, 45 survived
## Class 2: 91 dead, 17 survived
## Class 3: 300 dead, 47 survived
## Males have a higher deaths compared to survived. When compared to females, 
## no. of females that survived is more than no. of males that survived in
## every class.


## Comparison of the number of both genders' that survived
a <- titanic_train %>%
  filter(Survived == 1) %>%
  group_by(Sex) %>%
  ggplot(aes(Sex)) +
  geom_bar()
a
## The number of females that survived were twice the number of males that survived
## the disaster. 


########
#### WRONG #####
p1 <- titanic_train %>%
  filter(Survived == 0 & !is.na(Age)) %>%
  mutate(Status = ifelse(Age < 13, "Child", ifelse(Age >= 50, "Elder", "Adult"))) %>%
  ggplot(aes(Status, fill = Sex)) +
  geom_bar() +
  scale_y_continuous(trans = "log2") +
  ylab("Number of people that died") +
  ggtitle("Number of People that Died in each Status")
p2 <- titanic_train %>%
  filter(Survived == 1 & !is.na(Age)) %>%
  mutate(Status = ifelse(Age < 13, "Child", ifelse(Age >= 50, "Elder", "Adult"))) %>%
  ggplot(aes(Status, fill = Sex)) +
  geom_bar() +
  scale_y_continuous(trans = "log2") +
  ylab("Number of people that survived") +
  ggtitle("Number of People that Survived in each Status")
grid.arrange(p1, p2, ncol = 3)
## There's more people surviving than dead for children and elder but is even for
## the adults. This is due to the fact that the children and elder have the
## to enter the emergency boat to safety whereby the adults only enter when most
## children and elders had entered. The females also have the priority to 
## onboard the emergency boats first which is why more women survived compared to male
## even if they're an adult.



## Fare in each embark for each class
b <- titanic_train %>%
  filter(PassengerId != 62 & PassengerId != 830) %>%
  ggplot(aes(Embarked, Fare, fill = factor(Pclass))) +
  geom_boxplot()
b
## Overall, there's more people embarking in Cherbourg and the least in Queenstown.
## There's higher number of people embarking in the first and second class 
## compared to the other class. Passengers that embarked in Cherbourg are 
## relatively richer than the others in all the class



## Embark and no. ppl in each class
embarking <- titanic_train %>%
  filter(PassengerId != 62 & PassengerId != 830) %>%
  ggplot(aes(Embarked, fill = Sex)) +
  facet_grid(. ~ Pclass) +
  geom_bar()
embarking
## Most people embark in Southampton.
## Those who embarked in Cherbourg is richer than the others as there's
## more passengers from class 1 than the other 2 compared to Southampton and
## Queestown where the number of passengers embarking respectively is the highest in
## class 3.


titanic_train %>%
  filter(!is.na(Age)) %>%
  ggplot(aes(Age, group = Sex, fill = Sex)) +
  geom_density(alpha = 0.2)










## demographic of titanic passenger
## qq plot of age distribution, survival by sex,
## survival by age, survival by passenger class,survival by fare,
## survival by age, sex and passenger class

## Variable types
## ordinal, non-ordinal, continuous, discrete
## PassengerID = discrete
## Survived = Ordinal, continuous
## Pclass = Ordinal, discrete
## Name = discrete
## Sex = Ordinal, discrete
## Age = Continuous
## Sibsp = Ordinal, continuous
## Parch = discrete
## Ticket = Non-ordinal, discrete
## Fare = Ordinal, discrete
## Cabin = Non-ordinal, discrete
## Embarked = Ordinal, discrete

## demographic of titanic passengers
titanic_train %>%
  filter(!is.na(Age)) %>%
  ggplot(aes(Age, group = factor(Sex), fill = factor(Sex))) +
  geom_density(alpha = 0.2, bw = 5)

## How many males and female of age 40
age40 <- titanic_train %>%
  filter(Age == 40) %>%
  group_by(Sex) %>%
  count(Sex)
age40

## Oldest female = 63
## Oldest male = 80
titanic_train %>%
  filter(!is.na(Age)) %>%
  group_by(Sex) %>%
  summarize(max(Age))

## How many male and female 
## female = 314
## male = 577
titanic_train %>%
  group_by(Sex) %>%
  count(Sex)


## qqplot of age distribution
params <- titanic_train %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))

p <- titanic_train %>%
  ggplot(aes(sample = Age))

p + geom_qq(dparams = params) +
  geom_abline()
## 


## survival by sex
a <- titanic_train %>%
  filter(!is.na(Age)) %>%
  ggplot(aes(factor(Survived), fill = factor(Sex))) +
  geom_bar(position = "dodge")
a
## Less than half of passengers survived
## Most female survived but most male didn't survive
## Most of the survivors were female


## survival by age
b <- titanic_train %>% 
  filter(!is.na(Age)) %>%
  ggplot(aes(x = Age, y = ..count.., fill = factor(Survived))) +
  geom_density(alpha = 0.2)
b


## survival by fare
c <- titanic_train %>%
  filter(Fare > 0) %>%
  ggplot(aes(factor(Survived), Fare)) +
  geom_boxplot(alpha = 0.2) +
  scale_y_continuous(trans = "log2") +
  geom_point(position = "jitter", show.legend = FALSE)
c  

## survival by passenger class
c <- titanic_train %>%
  ggplot(aes(factor(Pclass), fill = factor(Survived))) +
  geom_bar()
c

d <- titanic_train %>%
  ggplot(aes(factor(Pclass), fill = factor(Survived))) +
  geom_bar(position = "fill")
d

e <- titanic_train %>%
  ggplot(aes(factor(Survived), fill = factor(Pclass))) +
  geom_bar(position = "fill")
e


## Survival by Age, Sex and Passenger Class
f <- titanic_train %>%
  ggplot(aes(Age, y = ..count.., fill = factor(Survived))) +
  geom_density(alpha = 0.2) +
  facet_grid(factor(Pclass) ~ Sex)
f

