library(sqldf)
data <-read.csv.sql("data/household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")

png(filename="plot2.png", units="px", width=480, height=480)

strdatetime <- paste(data$Date,data$Time)
datetime <- strptime(strdatetime,"%d/%m/%Y %H:%M:%S")

plot(x=datetime, y=data$Global_active_power, type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(x=datetime, y=data$Global_active_power) 


dev.off()