#1 Consider the data and weights set given below
# Give m that minimizes Sommme w(x-m)^2
## sum(w*x)/sum(w)
## 0.1471

#Proof :
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

least_square <- function(m){
    n<-length(x)
    S <- 0
    for(i in 1:n){
        S <- S + w[i]*(x[i]-m)^2
    }
    S
}

m <- c(0.1471,0.0025,1.077,0.300)

m_res <- sapply(m, least_square)
m[which(m_res==min(m_res))]

#2
#Fit the regression to the origin, give the slpoe
#0.826
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
sum(x*y)/sum(x^2)
lm(y~x-1)

#3 data(mtcars) mpg / weight slope
## -5.344  
data(mtcars)
lm(mpg~wt,mtcars)
mw =mean(mtcars$wt)
mm=mean(mtcars$mpg)
sum((mtcars$wt-mw)*(mtcars$mpg-mm))/sum((mtcars$wt-mw)^2)

#4 Consider data with an outcome (Y) and a predictor (X). 
# The standard deviation of the predictor is one half that of the outcome. 
# The correlation between the two variables is .5. What value would the slope 
# coefficient for the regression model with YYY as the outcome and XXX as the predictor?
# Corr*Sy/Sx =2*0.5 
## 1

#5 Students were given two hard tests and scores were normalized to have empirical mean 0 
# and variance 1. The correlation between the scores on the two tests was 0.4. 
# What would be the expected score on Quiz 2 for a student who had a normalized score of 1.5 on Quiz 1?
# (Corr*Sy/Sx) * x = 0.4*sqrt(1)/sqrt(1)*1.5
## 0.6

#6 Consider the data given by the following
#What is the value of the first measurement if x were normalized (to have mean 0 and variance 1)?
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
(8.58-mean(x))/sd(x)
## -0.9717

#7 Consider the following data set (used above as well). 
# What is the intercept for fitting the model with x as the predictor and y as the outcome? 
## 1.567
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

lm(y~x)

slope <- cor(x,y)*sd(y)/sd(x)
mean(y)-mean(x)*slope


#8
#You know that both the predictor and response have mean 0. What
#can be said about the intercept when you fit a linear regression?

##It must be identically 0.

#9 Consider the data given by
# What value minimizes the sum of the squared distances between these points and itself?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)
0.573


#10 s1 slope Y/X s2 slope X/Y
# S1/S2 ?
Var(Y)/Var(x)
