library(sqldf)
data <-read.csv.sql("data/household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")

png(filename="plot4.png", units="px", width=480, height=480)

strdatetime <- paste(data$Date,data$Time)
datetime <- strptime(strdatetime,"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

# plot [1,1]
plot(x=datetime, y=data$Global_active_power, type="n",xlab="",ylab="Global Active Power")
lines(x=datetime, y=data$Global_active_power) 

# plot [1,2]
plot(x=datetime, y=data$Voltage, type="n",xlab="datetime",ylab="Voltage")
lines(x=datetime, y=data$Voltage) 

# plot [2,1]
plot(x=datetime, y=data$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
lines(x=datetime, y=data$Sub_metering_1) 
lines(x=datetime, y=data$Sub_metering_2,col="red")
lines(x=datetime, y=data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty =c(1,1,1) )

# plot [2,2]
plot(x=datetime, y=data$Global_reactive_power, type="n",xlab="datetime",ylab="Global_reactive_power")
lines(x=datetime, y=data$Global_reactive_power) 

dev.off()