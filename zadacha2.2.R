library("lmtest")
library("GGAlly")

data = attitude

#1 Confidence intervals for all coefficients in the model, p = 95%
model1 <- lm(rating ~ privileges+raises+learning, data = data)
confint(model1, level = 0.95) #Get the confidence intervals for all coefficients

#2
coef(model1)
summary(model1)

#3 Confidence interval for one forecast, p=95%
new.data = data.frame(privileges=8, raises=6, learning=4)
predict(model1, new.data, interval="confidence", level=0.95)