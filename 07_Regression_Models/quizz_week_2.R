#1 
#Consider the following data with x as the predictor and y as as the outcome.
#Give a P-value for the two sided hypothesis test of whether ??1 \beta_1 ??1 
# from a linear regression model is 0 or not.
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm (y~x)
summary(fit)
#0.05296

# 2 
# Consider the previous problem, give the estimate of the residual standard deviation

# 0.223

#3 
# In the mtcars data set, 
#fit a linear regression model of weight (predictor) on mpg (outcome). 
#Get a 95% confidence interval for the expected mpg at the average weight. 
#What is the lower endpoint?
data(mtcars)
fit <- lm(mpg ~ I(wt - mean(wt)), data = mtcars)
confint(fit)
# 18.991

#4
# Refer to the previous question. Read the help file for mtcars\verb|mtcars|mtcars. What is the weight coefficient interpreted as?
#The estimated expected change in mpg per 1 lb increase in weight. WRONG
#The estimated expected change in mpg per 1,000 lb increase in weight.


#5 
#Consider again the mtcars\verb|mtcars|mtcars data set and a linear regression model 
#with mpg as predicted by weight (1,000 lbs). A new car is coming weighing 3000 pounds. Construct a 95% prediction interval for its mpg. 
#What is the upper endpoint?
fit <- lm(mpg ~ wt, data = mtcars)
predict(fit, newdata = data.frame(wt = 3), interval = "prediction")
#27.57

#6
#Consider again the mtcars\verb|mtcars|mtcars data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). A "short" ton is defined as 2,000 lbs. Construct a 95% confidence interval
#for the expected change in mpg per 1 short ton increase in weight. Give the lower endpoint.
fit <- lm(mpg ~ wt, data = mtcars)
confint(fit)[2, ] * 2
#-12.973

#7
#If my X from a linear regression is measured in centimeters 
#and I convert it to meters what would happen to the slope coefficient?
#It would get multiplied by 100

#8
#I have an outcome, YYY, and a predictor, XXX and fit a linear regression model with
#Y=??0+??1X+??Y = \beta_0 + \beta_1 X + \epsilonY=??0+??1X+?? to
#The new intercept would be ??^0???c??^1\hat \beta_0 - c \hat \beta_1??^0???c??^1 obtain ??^0\hat \beta_0??^0 and ??^1\hat \beta_1??^1. What would be the consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X+cX + cX+c for some constant, ccc?

#9
#Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor. About what is the ratio of the the sum of the squared errors, ???i=1n(Yi???Y^i)2 \sum_{i=1}^n (Y_i - \hat Y_i)^2 ???i=1n(Yi???Y^i)2 when comparing a model with just an intercept (denominator) 
# to the model with the intercept and slope (numerator)?
#This is simply one minus the R^2 values
#fit1 <- lm(mpg ~ wt, data = mtcars)
#fit2 <- lm(mpg ~ 1, data = mtcars)
#1 - summary(fit1)$r.squared
#0.25

#10
#Do the residuals always have to sum to 0 in linear regression?
#If an intercept is included, then they will sum to 0.