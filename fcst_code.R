##############################################
# ISM-WW Technology Workshop                 #
# Forecasting Example                        #
# Kellen Betts  |  kellen.betts@gmail.com    #
# Date:  9/29/16                             #
##############################################


## Example based on: Foreman, J.W. (2014). Data Smart. Indianopolis, IN: Wiley.


# Install packages 
install.packages("forecast")
library(forecast)


# Import data
sword <- read.csv("fcst_data.csv")
head(sword)


# Convert to time series data
sword.ts <- ts(sword,frequency=12,start=c(2013,1))
sword.ts
#par(mfrow=c(1,1))
plot(sword.ts)


# Forecasting
sword.forecast <- forecast(sword.ts)
sword.forecast
sword.forecast$method
?forecast
?ets
plot(sword.forecast)
