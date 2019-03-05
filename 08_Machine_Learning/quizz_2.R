#Question 1
#Load the Alzheimer's disease data using the commands:
#--library(AppliedPredictiveModeling)
#--data(AlzheimerDisease)
#Which of the following commands will create non-overlapping training and test sets 
#with about 50% of the observations assigned to each? 

#A
#adData = data.frame(diagnosis,predictors)
#trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
#training = adData[trainIndex,]
#testing = adData[-trainIndex,]


#Question2
#Make a plot of the outcome (CompressiveStrength) versus the index of the samples. 
#Color by each of the variables in the data set (you may find the cut2() function in the Hmisc package useful for turning continuous covariates into factors). 
#What do you notice in these plots? 

library(caret)
library(AppliedPredictiveModeling)
data(concrete)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

#A
library(Hmisc)
featurePlot(x = training[,c("Cement","BlastFurnaceSlag")],y=training$CompressiveStrength,plot="pairs")
#There is a non-random pattern in the plot of the outcome versus index. WRONG
#There is a non-random pattern in the plot of the outcome versus index that does not appear to be perfectly explained by any predictor suggesting a variable may be missing.

# Question 3
#Make a histogram and confirm the SuperPlasticizer variable is skewed. Normally you might use the log transform to try to make the data more symmetric.
#Why would that be a poor choice for this variable? 

#A
histogram(training$Superplasticizer)
#There are values of zero so when you take the log() transform those values will be -Inf.

# QUestion4
#Find all the predictor variables in the training set that begin with IL. 
#Perform principal components on these variables with the preProcess() function from the caret package. 
#Calculate the number of principal components needed to capture 90% of the variance. How many are there?
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]


#A 
library(dplyr)
t2 <- training %>% dplyr:: select(starts_with("IL"))
pp <- preProcess(t2, method="pca",thresh = 0.9)

# Question 5
#Create a training data set consisting of only the predictors with variable names beginning with IL and the diagnosis.
#Build two predictive models, one using the predictors as they are and one using 
#PCA with principal components explaining 80% of the variance in the predictors. 
#Use method="glm" in the train function. 

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]training = adData[ inTrain,]
testing = adData[-inTrain,]

t2 <- training %>% dplyr:: select(starts_with("IL"))
pp <- preProcess(t2, method="pca",thresh = 0.8)
trainPC <- predict(pp,training)
modelFit <- train(training$diagnosis ~ .,method="glm",data=trainPC)

#A
#Non-PCA Accuracy: 0.75
#PCA Accuracy: 0.71 WRONG

#Non-PCA Accuracy: 0.72
#PCA Accuracy: 0.65 WRONG

#Non-PCA Accuracy: 0.72
#PCA Accuracy: 0.71 WRONG

#Non-PCA Accuracy: 0.65
#PCA Accuracy: 0.72
