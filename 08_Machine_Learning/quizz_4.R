# Question 1
#Set the variable y to be a factor variable in both the training and test set. 
#Then set the seed to 33833. 
#Fit (1) a random forest predictor relating the factor variable y to the remaining variables and 
#(2) a boosted predictor using the "gbm" method. 
#Fit these both with the train() command in the caret package.
#What are the accuracies for the two approaches on the test data set? 
#What is the accuracy among the test set samples where the two methods agree? 
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)
library(caret)
vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)
set.seed(33833)
rfModel <- train(y~.,data=vowel.train,method="rf") 
gbmModel <- train(y~.,data=vowel.train,method="gbm")
rf <- predict(rfModel,vowel.test)
confusionMatrix(rf,vowel.test$y)
gbm <- predict(gbmModel,vowel.test)
confusionMatrix(gbm,vowel.test$y)

#RF Accuracy = 0.6082 GBM Accuracy = 0.5152 Agreement Accuracy = 0.6361 TRUE

#QUestion 2
#Set the seed to 62433 and predict diagnosis with all the other variables using a random forest ("rf"), 
#boosted trees ("gbm") and linear discriminant analysis ("lda") model. 
#Stack the predictions together using random forests ("rf"). What is the resulting accuracy on the test set? 
#Is it better or worse than each of the individual predictions? 

library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)
rfModel <- train(diagnosis~.,data=training,method="rf") 
gbmModel <- train(diagnosis~.,data=training,method="gbm")
ldaModel <- train(diagnosis~.,data=training,method="lda")
rf <- predict(rfModel,testing)
gbm <- predict(gbmModel,testing)
lda <- predict(ldaModel,testing)
allData <- data.frame(rf,gbm,lda,y=training$diagnosis)
stackModel <- train(y~.,data=allData,method="rf") 
stack <- predict (stackModel,testing)
confusionMatrix(stack,testing$diagnosis)
confusionMatrix(rf,testing$diagnosis)
confusionMatrix(gbm,testing$diagnosis)

# Stacked Accuracy: 0.80 is better than random forests and lda and the same as boosting. TRUE

#Question 3
#Set the seed to 233 and fit a lasso model to predict Compressive Strength. 
#Which variable is the last coefficient to be set to zero as the penalty increases? 
#(Hint: it may be useful to look up ?plot.enet). 
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]
set.seed(233)
lassoModel <- train(CompressiveStrength~.,data=training,method="lasso")
lasso <- predict(lassoModel,testing)
#Cement

#Question4
#Fit a model using the bats() function in the forecast package to the training time series.
#Then forecast this model for the remaining time points.
#For how many of the testing points is the true value within the 95% prediction interval bounds? 

library(lubridate) # For year() function below
dat = read.csv("gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)
library(forecast)
fit <- bats(training)
forecast(fit)

#A 95% F
#96%
#94% F


#QUestion 5

#Set the seed to 325 and fit a support vector machine using the e1071 package to predict Compressive Strength 
#using the default settings. Predict on the testing set. 
#What is the RMSE?

set.seed(3523)
library(AppliedPredictiveModeling)
library(caret)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]
set.seed(325)
library(e1071)
svm.model <- svm(CompressiveStrength ~ ., data = training)

svm.pred  <- predict(svm.model, testing)

sqrt(mean(svm.pred$residuals^2))

#6.72
