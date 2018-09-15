# read codes
SCC <- readRDS("data/Source_Classification_Code.rds")

# read data
data <-readRDS("data/summarySCC_PM25.rds")

# select SCC  for motor vehicle sources 
SCC_VEH <- SCC[grep("?Vehicles",SCC$SCC.Level.Two),1]

# select data for  motor vehicle sources in Baltimore
dataVeh <-  data[(data$SCC %in% SCC_VEH) & (data$fips == "24510"), ]

# sum emissions by year
totalEmissionsByYear <- tapply(dataVeh$Emissions,dataVeh$year,sum)

# extract the years from the array produced by tapply
# (they are the names of the elements)
year <- as.numeric(names(totalEmissionsByYear))

# use a line plot to represent the result
plot(x=year,y=totalEmissionsByYear,type="l",ylim=c(0,max(totalEmissionsByYear)))
points(x=year,y=totalEmissionsByYear)

#export to png
dev.copy(png,"plot5.png")
dev.off()