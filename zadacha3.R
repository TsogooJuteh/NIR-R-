install.packages("devtools")
devtools::install_github("https://github.com/bdemeshev/rlms")

library("lmtest")
library("rlms")
library("dplyr")
library("GGally")
library("car")
library("sandwich")
library("foreign")
library("haven")
library("devtools")

df <- read_sav("r21i_os24a.sav")
df <- rlms_read("r21i_os24a.sav")

data = select(df, qj13.2, qh5, q_educ, status, qj6.2, q_marst, qj1.1.2)
names(df)
data2 = na.omit(data)#remove missing values

#1 Build linear regression and adding VIF
lm_model <- lm(qj13.2 ~ qh5+q_educ+status+qj6.2+q_marst+qj1.1.2, data = data2)
vif(lm_model)

#2 Experiment with the functions of real parameters: use logarithms, powers
data2$log_qj13.2 <- log(data2$qj13.2) #logarithm
data2$pwr_qh5 <- data2$qh5^0.9 #power
data2$pwr_q_educ <- data2$q_educ^1.2
data2$times_q_age_qh5 <- data2$q_age * data2$qh5
data2$times_q_educ_qj1.1.2 <- data2$q_educ * data2$qh5

data2 = na.omit(data2)
data2 = data2[is.finite(data2$log_qj13.2), ]
lm_model2 <- lm(log_qj13.2 ~ pwr_qh5+pwr_q_educ+times_q_educ_qj1.1.2, data=data2)
vif(lm_model2)

#3 Choose the best model from the last 2 models
summary(lm_model)#this model is better
summary(lm_model2)

#4 Make a conclusion about which individuals receive the highest salary.
coef(lm_model)#If the coef of the lm_model2 is positive, depending on education and age the salary increases.

#5 Subset the data for urban, unmarried/divorced women with higher education
subset_data <- filter(data, qh5 == 1 & q_marst %in% c(2, 3) & q_educ == 6)
lm_subset_data <- lm(log_qj13.2 ~ q_educ + pwr_q_educ  + status + qj6.2 + q_marst + times_q_educ_qj1.1.2, data=data2)
coef(lm_subset_data)
