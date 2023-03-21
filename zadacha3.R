install.packages("devtools")
devtools::install_github("https://github.com/bdemeshev/rlms")

library("lmtest")
library("rlms")
library("dplyr")
library("GGally")
library("car")
library("sandwich")

df <- rlms_read("r21i_os24a.sav")

help(df)
