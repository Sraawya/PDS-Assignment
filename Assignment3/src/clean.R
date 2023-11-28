diabetes_raw = read.csv("C:\\Users\\sraaw\\OneDrive\\Desktop\\PDS\\Assignment3\\data_raw\\diabetes_raw.csv")

head(diabetes_raw)
summary(diabetes_raw)

#Total number of rows
nrow(diabetes_raw)

#Clean Data
#Checking for any missing value
any(is.na(diabetes_raw))

#Checking for any null values
any(is.null(diabetes_raw))


write.csv(diabetes_raw, "C:\\Users\\sraaw\\OneDrive\\Desktop\\PDS\\Assignment3\\data_clean\\diabetes_clean.csv")
