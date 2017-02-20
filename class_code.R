##############################################
# ISM-WW Technology Workshop                 #
# Classification Example                     #
# Kellen Betts  |  kellen.betts@gmail.com    #
# Date: 9/29/16                              #
##############################################


## Example based on: Foreman, J.W. (2014). Data Smart. Indianopolis, IN: Wiley.


# Install packages
#install.packages("randomForest",dependencies=TRUE)
#install.packages("ROCR",dependencies=TRUE)
library(randomForest)
library(ROCR)


# Import data
PregnancyData <- read.csv("class_data_train.csv")
PregnancyData.Test <- read.csv("class_data_test.csv")
str(PregnancyData)


# Factor the data
PregnancyData$PREGNANT <- factor(PregnancyData$PREGNANT)
PregnancyData.Test$PREGNANT <- factor(PregnancyData.Test$PREGNANT)
summary(PregnancyData$PREGNANT)
?factor


# Logistic model
Pregnancy.lm <- glm(PREGNANT~., data=PregnancyData, family=binomial("logit"))
summary(Pregnancy.lm)


# Random forest model
Pregnancy.rf <- randomForest(PREGNANT~., data=PregnancyData, importance=TRUE)
#summary(Pregnancy.rf)
varImpPlot(Pregnancy.rf, type=2)
varImpPlot(Pregnancy.lm, type=2)



# Run model on test data
par(mar=c(1,1,1,1))
PregnancyData.Test.lm.Pred <- predict(Pregnancy.lm, PregnancyData.Test, type="response")
PregnancyData.Test.rf.Pred <- predict(Pregnancy.rf, PregnancyData.Test, type="prob")
summary(PregnancyData.Test.lm.Pred)
summary(PregnancyData.Test.rf.Pred)


# Check the results
t(PregnancyData.Test[1,])
t(PregnancyData.Test.lm.Pred[1])
t(PregnancyData.Test.rf.Pred[1,2])

