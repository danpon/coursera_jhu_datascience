library(dplyr)
library(ggplot2)

# read codes
SCC <- readRDS("data/Source_Classification_Code.rds")

# read data
data <-readRDS("data/summarySCC_PM25.rds")

# select SCC  for motor vehicle sources 
SCC_VEH <- SCC[grep("?Vehicles",SCC$SCC.Level.Two),1]
 
# select data for motor vehicle sources in Baltimore and LA
dataVeh <-  data[(data$SCC %in% SCC_VEH) & (data$fips %in% c("24510","06037")), ]
totalByYearAndCity <-   dataVeh %>% 
    group_by(fips,year) %>% 
    summarize(total = sum(Emissions))

# to get a cleaner legend, we add a new column "city" 
# with explict values instead of fips codes
totalByYearAndCity$city <- factor(totalByYearAndCity$fips,
                    levels = c("06037","24510"),
                    labels = c("LA", "Baltimore")) 


ggplot(totalByYearAndCity, aes(x=year, y=total, group=city)) +
    geom_line(aes(color=city))+
    geom_point(aes(color=city))

# export to png
dev.copy(png,"plot6.png")
dev.off()