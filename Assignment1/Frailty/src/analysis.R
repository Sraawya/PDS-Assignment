frailty <- read.csv("./Frailty/data_clean/Female_Frailty.csv", header = T)
frailty

attach(frailty)

Weight <- as.numeric(Weight)
Frailty <- as.factor(Frailty)

class(Frailty)
class(Weight)

# Then, perform the t-test
t_test_frailty <- t.test(Weight ~ Frailty)

t_test_frailty

#summary(frailty)

capture.output(t_test_frailty,file = "./Frailty/results/t_test.txt")
