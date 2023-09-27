clean_frailty <- read.csv("./Frailty/data_raw/Female_Frailty.csv", header = T)
head(clean_frailty)



attach(clean_frailty)

#Checking for Missing Values
mean(Height);
mean(Weight);
mean(Age);
mean(clean_frailty$Grip.strength)
unique(Frailty)

clean_frailty %>% select(.) %>% filter(!complete.cases(.))

write.csv(clean_frailty,"./Frailty/data_clean/Female_Frailty.csv")
