library(readr)
clean_train <- read_csv("C:/Users/sraaw/OneDrive/Desktop/PDS/Assignment2/data_clean/train.csv")
View(clean_train)



# Create one-hot encoded variables for Fuel_Type and Transmission
fuel_type_encoded <- model.matrix(~ clean_train$Fuel_Type - 1, data = clean_train)
transmission_encoded <- model.matrix(~ clean_train$Transmission - 1, clean_data = train)

# Combine the one-hot encoded variables with the original data frame
clean_train <- cbind(clean_train, fuel_type_encoded, transmission_encoded)

View(clean_train)

# Creating a new feature
current_year <- as.numeric(format(Sys.Date(), "%Y"))
clean_train$Current_Age <-current_year - train$Year
View(clean_train$Current_Age)
View(clean_train)


write.csv(clean_train ,"C:/Users/sraaw/OneDrive/Desktop/PDS/Assignment2/data_clean/train_current_Age.csv")
