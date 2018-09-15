#read datafile
data <-readRDS("data/summarySCC_PM25.rds")

# sum emissions by year
totalEmissionsByYear <- tapply(data$Emissions,data$year,sum)

# extract the years from the array produced by tapply
# (they are the names of the elements)
year <- as.numeric(names(totalEmissionsByYear))

# use a line plot to represent the result
plot(x=year,y=totalEmissionsByYear,type="l",ylim=c(0,max(totalEmissionsByYear)))
points(x=year,y=totalEmissionsByYear)

#export to png
dev.copy(png,"plot1.png")
dev.off()