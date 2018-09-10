library(sqldf)

data <-read.csv.sql("data/household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")

png(filename="plot1.png", units="px", width=480, height=480)

hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")

dev.off()