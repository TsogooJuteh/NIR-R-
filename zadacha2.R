library("lmtest")
library("GGAlly")

data = attitude

#1
model1 <- lm(rating ~ privileges, data=data)
model2 <- lm(rating ~ learning, data=data)
model3 <- lm(rating ~ raises, data=data)

summary(model1)$r.squared
summary(model2)$r.squared
summary(model3)$r.squared

#2
model4 <- lm(rating ~ privileges+learning+raises, data=data)

summary(model4)$r.squared
summary(model4)

#3
model5 <- lm(rating ~ log(privileges)+log(learning)+log(raises), data=data)

summary(model4)$r.squared
summary(model5)$r.squared

#4
summary(model1)$r.squared#rating ~ privileges
summary(model2)$r.squared#rating ~ learning
summary(model3)$r.squared#rating ~ raises
summary(model4)$r.squared#rating ~ privileges+learning+raises

model6 <- lm(rating ~ privileges+learning, data = data)
summary(model6)$r.squared
model7 <- lm(rating ~ privileges+raises, data = data)
summary(model7)$r.squared
model8 <- lm(rating ~ learning+raises, data = data)
summary(model8)$r.squared
model9 <- lm(rating ~ privileges^2, data = data)
summary(model9)$r.squared
model10 <- lm(rating ~ learning^2, data = data)
summary(model10)$r.squared
model11 <- lm(rating ~ raises^2, data = data)
summary(model11)$r.squared
model12 <- lm(rating ~ privileges^2+learning^2, data = data)
summary(model12)$r.squared
model13 <- lm(rating ~ privileges^2+raises^2, data = data)
summary(model13)$r.squared
model14 <- lm(rating ~ raises^2+learning^2, data = data)
summary(model14)$r.squared
model15 <- lm(rating ~ privileges^2+learning^2+raises^2, data = data)
summary(model15)$r.squared