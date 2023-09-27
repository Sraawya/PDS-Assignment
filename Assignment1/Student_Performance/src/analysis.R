library(tidyverse)

clean_student_Performance <- read.csv("./Student_Performance/data_clean/clean_StudentsPerformance_data.csv", header =T)
head(clean_student_Performance)
attach(clean_student_Performance)

glimpse(clean_student_Performance)

#Score Densitity
hist(reading.score, main = "Reading Score", col = "orange")


#Spread of parental level of education
parentalLevelOfEducation <- table(parental.level.of.education)
piepercent <- round(100*parentalLevelOfEducation/sum(parentalLevelOfEducation),1)
pie(parentalLevelOfEducation, label = piepercent,values = "%", main="Percentage of Parent Level of Education", col= rainbow(6),  density = 50)
parentalLevelOfEducation
legend("topright", c("associate's degree", "bachelor's degree", "high school", "master's degree", "some college", "some high school"),cex=  0.8, fill =  rainbow(6))


#clean_student_Performance
#test.preparation.course vs score
library(ggplot2)
library(dplyr)

ggplot(clean_student_Performance, aes(x = test.preparation.course, y =math.score)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(x = "Test Preperation Course", y = "Maths Score") +
  ggtitle("Test Preperation Course vs. Maths Score")


#Pairsplot
pairs(~math.score+reading.score+writing.score, main="Pairs plot for score" , col= "blue")

#mosaicPlot
typesOfRaceOrEthinicity <-table(race.ethnicity)
view(typesOfRaceOrEthinicity)
mosaicplot(typesOfRaceOrEthinicity, main="Distribution of students",col="orange")




