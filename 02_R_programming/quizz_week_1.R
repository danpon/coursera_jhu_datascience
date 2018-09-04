x <- 4
class(x)
x <- c(4, TRUE)
class(x)
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)
x <- list(2, "a", "b", TRUE)
x[[2]]
x <- 1:4
y <- 2:3
x+y
x <- c(3, 5, 1, 10, 12, 6)
x
x[x < 6] <- 0
x
x <- c(3, 5, 1, 10, 12, 6)
x[x %in% 1:5] <- 0
x
data <- read.csv("hw1_data.csv")
head(data)
data[c(152,153),]
dim(data)
data$Ozone[47]
data[47,"Ozone"]
na_oz <- data$Ozone[is.na(data$Ozone)]
complete_oz <- data$Ozone[complete.cases(data$Ozone)]
mean(complete_oz)
high_oz_temp <- subset(data,Ozone >31 & Temp > 90)
mean(high_oz_temp$Solar.R)
data_6 <- subset(data,Month==6)
mean(data_6$Temp[complete.cases(data_6$Temp)])
data_5 <- subset(data,Month==5)
data_5
max(data_5$Ozone[complete.cases(data_5$Ozone)] )

x <- 1:4
y <- 2
class(x+y)
x+y

