library(dplyr)
library(readr)
train <- read_csv("C:/Users/sraaw/OneDrive/Desktop/PDS/Assignment2/data_raw/train.csv")
head(train)
View(train)

#b) Removing the units from attributes ------------

#Remove kmpl from “Mileage”, CC from “Engine”, bhp from “Power”, and lakh from “New_price”
train$Mileage <- as.numeric(gsub(" kmpl", "", train$Mileage))
train$Engine  = as.numeric(gsub(" CC","", train$Engine))
train$Power = as.numeric(gsub(" bhp", "", train$Power))
train$New_Price = as.numeric(gsub(" Lakh", "", train$New_Price))
View(train)

summary(train)

#a)Checking for missing values and removing them

is.na(train)
is.na(train$New_Price)
class(train$New_Price)
train$New_Price <- as.numeric(train$New_Price)
train$New_Price=ifelse(is.na(train$New_Price),median(train$New_Price,na.rm=TRUE),train$New_Price)

is.na(train$Mileage)
class(train$Mileage)
train$Mileage = ifelse(is.na(train$Mileage),mean(train$Mileage, na.rm=TRUE), train$Mileage)
View(train)

write.csv(train ,"C:/Users/sraaw/OneDrive/Desktop/PDS/Assignment2/data_clean/train.csv")


