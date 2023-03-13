library("lmtest")
library("GGAlly")
library("car")

data = attitude

#1 Checking that there is no linear dependence using R^2
model1 <- lm(rating ~ privileges+learning+raises, data=data)
vif(model1)#the value of vif is 1.37,1.86,1.76. It shows there are not linear dependent
summary(model1)
#2 Checking how good the model is
summary(model1)#if p-value < 0.05, it is considered good
#r-squared is 0.45

#3 enter the log of the regressors into the model
model2 <- lm(rating ~ log(privileges)+log(learning)+log(raises), data=data)
summary(model1)$r.squared#checking which model is good
summary(model2)$r.squared
#model2 is worse than model3(log) (R^2"0.38<0.45")

#4 All possible products of pairs of regressors(including squares)
model3 <- lm(rating ~ privileges+learning+raises+I(privileges^2)+I(learning^2)+I(raises^2), data = data)
summary(model3)$r.squared#This model is good
summary(model2)$r.squared
summary(model1)$r.squared
