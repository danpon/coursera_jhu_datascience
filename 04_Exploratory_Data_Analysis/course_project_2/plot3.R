library(dplyr)
library(ggplot2)


# read datafile
data <-readRDS("data/summarySCC_PM25.rds")

# sum by (type and year) for Baltimore (fips 24510)
totalByYearAndType <-   data %>% 
                        filter(fips == "24510") %>% 
                        group_by(type,year) %>% 
                        summarize(total = sum(Emissions))

# plot with a facet to separate each type (POINT, NONPOINT, ROAD, NONROAD)
ggplot(data=totalByYearAndType, aes(x=year,y=total) )+facet_wrap( ~ type, ncol = 2,dir="v") +geom_point()+geom_line()

# export to png
dev.copy(png,"plot3.png")
dev.off()