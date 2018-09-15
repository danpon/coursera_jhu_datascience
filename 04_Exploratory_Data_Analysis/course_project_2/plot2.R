# read datafile
data <-readRDS("data/summarySCC_PM25.rds")

# subset to keep only the data regarding Baltimore
dataBaltimore = subset(data,fips == "24510")

# sum emissions by year
baltimoreEmissionsByYear <- tapply(dataBaltimore$Emissions,dataBaltimore$year,sum)

# extract the years from the array produced by tapply
# (they are the names of the elements)
year <- as.numeric(names(baltimoreEmissionsByYear))

# use a line plot to represent the result
plot(x=year,y=baltimoreEmissionsByYear,type="l",ylim = c(0,max(baltimoreEmissionsByYear)))
points(x=year,y=baltimoreEmissionsByYear)

# export to png
dev.copy(png,"plot2.png")
dev.off()