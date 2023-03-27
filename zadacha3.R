install.packages("devtools")
devtools::install_github("https://github.com/bdemeshev/rlms")

library("lmtest")
library("rlms")
library("dplyr")
library("GGally")
library("car")
library("sandwich")
library("foreign")

df <- rlms_read("r21i_os24a.sav")

data2 = select(data, uj13.2, u_age, uh5, u_educ, status, uj6.2, u_marst, uj1.1.2)

data2 = na.omit(data2)

#1 Build linear regression and adding VIF
lm_model <- lm(uj13.2 ~ u_age+uh5+u_educ+status+uj6.2+u_marst+uj1.1.2, data = data2)
vif(lm_model)

#2 Experiment with the functions of real parameters: use logarithms, powers
data2$log_uj13.2 <- log(data2$uj13.2) #logarithm
data2$pwr_u_age <- data2$u_age^1.1 # power
data2$pwr_uh5 <- data2$uh5^0.9
data2$pwr_u_educ <- data2$u_educ^1.2
data2$times_u_age_uh5 <- data2$u_age * data2$uh5
data2$times_u_educ_uj1.1.2 <- data2$u_educ * data2$uh5

lm_model2 <- lm(log_uj13.2 ~ pwr_u_age+pwr_uh5+pwr_u_educ+times_u_age_uh5+times_u_educ_uj1.1.2, data=data2)
vif(lm_model2)

#3 Choose the best model from the last 2 models
summary(lm_model)$r.squared
summary(lm_model2)$r.squared

#4 Make a conclusion about which individuals receive the highest salary.
coef(lm_model2)#If the coef of the lm_model2 is positive, depending on education and age the salary increases.

#5