library(tidyverse)
library(mdsr)
library(skimr)
diabetes_clean = read.csv("C:\\Users\\sraaw\\OneDrive\\Desktop\\PDS\\Assignment3\\data_clean\\diabetes_clean.csv")


#-----------------------Maximum and Mean using seed value of 50 and sample population of 25------------------------#

set.seed(50)

sample_25 <- diabetes_clean %>% slice_sample(n=25)

attach(sample_25)

sample_25 %>% skim(Glucose)

diabetes_clean %>% skim(Glucose)

#Mean and Maximum of population
data_mean_glucose <- mean(diabetes_clean$Glucose)
data_max_glucose <- max(diabetes_clean$Glucose)


#Mean and Maximum of sample
sample_25_mean_glucose <- mean(sample_25$Glucose)
sample_25_max_glucose <- max(sample_25$Glucose)


#Values
data_mean_glucose
data_max_glucose
sample_25_mean_glucose
sample_25_max_glucose


stats <- c(data_mean_glucose, sample_25_mean_glucose, data_max_glucose, sample_25_max_glucose)
names(stats) <- c("Pop_Mean", "Sample_Mean", "Pop_Max", "Sample_Max")
barplot(stats, main="Comparison of Glucose Statistics", ylab="Glucose", col=c("blue", "lightblue", "orange", "yellow"), ylim=c(0, 250))


#-----------------98th percentile of BMI of the sample and the population-------------------------#

sample_BMI_98 <-sample_25 %>% summarize(q98_sample = quantile(sample_25$BMI, p=0.98))
sample_BMI_98

pop_BMI_98 <- diabetes_clean %>% summarize(q98_pop = quantile(diabetes_clean$BMI,  p=0.98))
pop_BMI_98


stats  <- c(sample_BMI_98, pop_BMI_98)

# Extracting the BMI values
sample_BMI <- stats$q98_sample
population_BMI <- stats$q98_pop


stats

sample_BMI
population_BMI

# Creating a simple side-by-side comparison plot
bar_heights <- c(sample_BMI, population_BMI)
bar_names <- c("Sample BMI", "Population BMI")

bar_heights

barplot(bar_heights, names.arg = bar_names, main = "Comparison of BMI", ylab = "BMI", col = c("magenta", "turquoise"), ylim = c(0, 60))


#----Using bootstrap (replace= True), create 500 samples (of 150 observation each)
#from the population and find the average mean, standard deviation and percentile for BloodPressure 
#and compare this with these statistics from the population for the same variable.

#Mean, SD and Percentile of BP
pop_Mean_bp <- mean(diabetes_clean$BloodPressure)
pop_SD_bp <- sd(diabetes_clean$BloodPressure)
pop_percentile_bp <- quantile(diabetes_clean$BloodPressure, c(0.25,0.5,0.75))


#Creating empty vectors to store bootstap results
sample_mean_bp <- rep(NA,500)
sample_sd_bp <- rep(NA,500)
sample_quant_boot <- matrix(NA, nrow =3, ncol = 500)


sample_size <- 150
sample_num <- 500

for(i in 1:sample_num){
  sample_i <-sample(diabetes_clean$BloodPressure, size = sample_size, replace = TRUE)
  sample_mean_bp[i] <- mean(sample_i)
  sample_sd_bp[i] <- sd(sample_i)
  sample_quant_boot[,i] <-quantile(sample_i, probs = c(0.25,0.5,0.75))
}


#Comparing populationadn bootstrap statistics for Blood Pressure
par(mfrow = c(3,2))
hist(diabetes_clean$BloodPressure, main = "Population", xlab = "BloodPressure")
hist(sample_mean_bp, main="Bootstrap Mean", xlab="BloodPressure")
abline(v = pop_Mean_bp, col = "red")
hist(sample_sd_bp, main = "Bootstrap SD", xlab = "BloodPressure")
abline(v = pop_SD_bp, col = "blue")
matplot(sample_quant_boot, type = "l", main = "Bootstrap Percentiles", xlab = "Sample",
        ylab = "BloodPressure", lty = 1, col = 1:3)
lines(pop_percentile_bp, lty = 2, col = "yellow")





