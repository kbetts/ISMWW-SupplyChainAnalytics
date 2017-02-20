##############################################
# ISM-WW Technology Workshop                 #
# Linear Regression Example                  #
# Kellen Betts  |  kellen.betts@gmail.com    #
# Date:     9/29/16                          #
##############################################


# Install packages
#install.packages("ISLR")
#library(ISLR)
#library(MASS)


# Load dataset
# Data includes sales and related variables for carseats
Carseats <- read.csv("regress_data.csv")
names(Carseats)
head(Carseats)
tail(Carseats)


# Plotting the data
plot(Carseats$Age,Carseats$Sales,pch="+",col="blue")


# Linear regression
lm.fit <- lm(Carseats$Sales ~ Carseats$Income, data=Carseats)
lm.fit
summary(lm.fit)
confint(lm.fit)


# Plotting the results
plot(Carseats$Income,Carseats$Sales,pch="+",col="blue")
abline(lm.fit,lwd=3,col="red")
par(mfrow=c(2,2))
plot(lm.fit)


# Other plots
par(mfrow=c(1,1))
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))
