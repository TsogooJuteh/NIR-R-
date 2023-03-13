library("lmtest")
library("GGAlly")

data = attitude

#1 Checking that there is no linear dependence using R^2
model1 <- lm(rating ~ privileges, data=data)
model2 <- lm(rating ~ learning, data=data)#this R^2 is bigger, so it can be excluded
model3 <- lm(rating ~ raises, data=data)

summary(model1)$r.squared
summary(model2)$r.squared
summary(model3)$r.squared

#2 Checking how good the model is
model4 <- lm(rating ~ privileges+learning+raises, data=data)

summary(model4)$r.squared
summary(model4)

#3 enter the log of the regressors into the model
model5 <- lm(rating ~ log(privileges)+log(learning)+log(raises), data=data)

summary(model4)$r.squared#checking which model is good
summary(model5)$r.squared

#4 All possible products of pairs of regressors(including squares)
model6 <- lm(rating ~ privileges+learning+raises+I(privileges^2)+I(learning^2)+I(raises^2), data = data)
summary(model6)$r.squared#This model is good
summary(model5)$r.squared
summary(model4)$r.squared
