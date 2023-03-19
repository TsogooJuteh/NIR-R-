install.packages("devtools")
devtools::install_github("bdemeshev/rlms")

library("lmtest")
library("rlms")
library("dplyr")
library("GGally")
library("car")
library("sandwich")

data <- rlms_read("C:\\Rlib\\r25i_os26d.sav")

help(data)
