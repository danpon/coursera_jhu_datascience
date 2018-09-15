# question 2

library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

# question 7
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

# question 9
install.packages("ggplot2movies")
library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)