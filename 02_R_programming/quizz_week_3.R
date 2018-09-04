library(datasets)
data(iris)
virginica <- subset(iris,Species=="virginica")
virginica
mean(virginica$Sepal.Length,na.rm=TRUE)
apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)

hp_by_cyl <- tapply(mtcars$hp, mtcars$cyl, mean)
hp_by_cyl[3]-hp_by_cyl[1]