library(dplyr)

##############
# QUESTION 1 #
##############
data_rep <-"quizz_week_3_data"
if(!file.exists(data_rep)){
    dir.create(data_rep)
}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
datafile <- paste(data_rep,"housing_idaho_2006.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
data <- read.csv(datafile)
agriculture_logical <-  data$ACR==3 & data$AGS==6
which(agriculture_logical)

##############
# QUESTION 2 #
##############
library(jpeg)
data_rep <-"quizz_week_3_data"
if(!file.exists(data_rep)){
    dir.create(data_rep)
}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
imagefile <- paste(data_rep,"jeff.jpeg",sep="/")
download.file(url=dataurl,destfile =imagefile,method = "curl" )
quantile(readJPEG(source = imagefile,native=TRUE),probs=c(0.3,0.8))


##############
# QUESTION 3 #
##############
data_rep <-"quizz_week_3_data"
if(!file.exists(data_rep)){
    dir.create(data_rep)
}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
datafile <- paste(data_rep,"gdp.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
gdp <- read.csv(datafile,skip=4,stringsAsFactors = FALSE)
gdp$X.1 <- as.numeric(as.character(gdp$X.1))
gdp <- filter(gdp,!is.na(X.1))
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
datafile <- paste(data_rep,"gdp.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
countries <- read.csv(datafile)
mergedData <- merge(gdp,countries,by.x="X",by.y ="CountryCode")
mergedData <- arrange(mergedData,desc(X.1))
nrow(mergedData)
mergedData[13,"X.3"]

##############
# QUESTION 4 #
##############
mergedDataByIncomeGroup <- group_by(mergedData,Income.Group)
summarize(mergedDataByIncomeGroup,mean(X.1))


##############
# QUESTION 5 #
##############
library(Hmisc)
mergedData$gdpGroups <- cut2(mergedData$X.1,g=5)
table(mergedData$gdpGroups,mergedData$Income.Group)