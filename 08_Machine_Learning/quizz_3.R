#QUestion 1
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

library(dplyr)
inTrain = createDataPartition(segmentationOriginal$Case , p = 3/4)[[1]]
training = segmentationOriginal[ inTrain,]
testing = segmentationOriginal[-inTrain,]

set.seed(125) 
libray(rpart)

rpart.mod = train(Case ~ ., data = training, method = "rpart")

TotalIntenCh2 <- c(23,50,57,NA)
FiberWidthCh1 <- c(10,10,8,8)
VarIntenCh4  <- c(NA,100,100,100)
PerimStatusCh1 <- c(2,NA,NA,2)

x <- data.frame(TotalIntench2,FiberWidthCh1,VarIntenCh4,PerimStatusCh1)

predict(rpart.mod$finalModel, x)

#A
#a. PS b. WS c. PS d. WS WRONG
#a. PS b. WS c. PS d. Not possible to predict 


#QUetsion 2
#The bias is larger and the variance is smaller. 
#Under leave one out cross validation K is equal to the sample size.

#Question 3

#These data contain information on 572 different Italian olive oils from multiple regions in Italy. 
#Fit a classification tree where Area is the outcome variable. 
#Then predict the value of area for the following data frame using the tree command with all defaults

library(pgmm)
data(olive)
olive = olive[,-1]
inTrain = createDataPartition(olive$Area , p = 3/4)[[1]]
training =olive[ inTrain,]
testing = olive[-inTrain,]

rpart.mod = train(Area ~ ., data = training, method = "rpart")

newdata = as.data.frame(t(colMeans(olive)))
predict(rpart.mod$finalModel, newdata)


#Question 4

library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)

trainfit2<-train(form=chd~age+alcohol+obesity+tobacco+typea+ldl,data=trainSA, family= binomial(),method="glm")
predict(trainfit2$finalModel,testSA)

missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

missClass(testSA$chd, predict(trainfit2$finalModel,testSA))

#A
#Test Set Misclassification: 0.31 Training Set: 0.27 OK

# Question 5
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)
vowel.train$y=as.factor(vowel.train$y)
vowel.test$y=as.factor(vowel.test$y)
set.seed(33833)
fit5<- randomForest(y~.,vowel.train)
varImp(fit5)
#A
#x.1, x.2, x.3, x.8, x.6, x.4, x.5, x.9, x.7,x.10 WRONG

#x.2, x.1, x.5, x.6, x.8, x.4, x.9, x.3, x.7,x.10 OK