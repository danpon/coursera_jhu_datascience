# read codes
SCC <- readRDS("data/Source_Classification_Code.rds")

# read data
data <-readRDS("data/summarySCC_PM25.rds")

# select SCC  for coal combustion-related sources
SCC_COAL <- SCC[grep("?Coal",SCC$Short.Name),1]

# select data for coal combustion-related sources
dataCoal <-  data[data$SCC %in% SCC_COAL,]

# sum emissions by year
totalEmissionsByYear <- tapply(dataCoal$Emissions,dataCoal$year,sum)

# extract the years from the array produced by tapply
# (they are the names of the elements)
year <- as.numeric(names(totalEmissionsByYear))

# use a line plot to represent the result
plot(x=year,y=totalEmissionsByYear,type="l",ylim=c(0,max(totalEmissionsByYear)))
points(x=year,y=totalEmissionsByYear)

#export to png
dev.copy(png,"plot4.png")
dev.off()