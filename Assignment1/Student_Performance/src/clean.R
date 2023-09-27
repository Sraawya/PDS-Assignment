library(tidyverse)

raw_student_Performance<- read.csv("./Student_Performance/data_raw/raw_StudentsPerformance_data.csv", header =T)

summary = summary(raw_student_Performance)

capture.output(summary, file = "C:/Users/sraaw/OneDrive/Desktop/PDS/Assignment1/Student_Performance/data_raw/readme.txt")

clean_student_Performance <- read.csv("./Student_Performance/data_raw/raw_StudentsPerformance_data.csv", header =T)


#Checking for Missing Values
mean(math.score);
mean(writing.score);
mean(reading.score);
unique(gender);
unique(test.preparation.course);
unique(parental.level.of.education);
unique(lunch);
unique(race.ethnicity)

clean_student_Performance %>% select(.) %>% filter(!complete.cases(.))

write.csv(clean_student_Performance,"./Student_Performance/data_clean/clean_StudentsPerformance_data.csv")
