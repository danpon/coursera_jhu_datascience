##############
# QUESTION 1 #
##############
data_rep <-"quizz_week_4_data"
if(!file.exists(data_rep)){
    dir.create(data_rep)
}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
datafile <- paste(data_rep,"housing_idaho_2006.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
data <- read.csv(datafile)
listRes <- strsplit(names(data), "wgtp")
listRes[[123]]

##############
# QUESTION 2 #
##############
library(dplyr)
data_rep <-"quizz_week_4_data"
if(!file.exists(data_rep)){
    dir.create(data_rep)
}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
datafile <- paste(data_rep,"housing_idaho_2006.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
data <- read.csv(datafile,skip = 4, stringsAsFactors = FALSE)
data$X.1 <- as.numeric(as.character(data$X.1))
data <- filter(data,!is.na(X.1))
gdp <- gsub(",","",trimws(data$X.4))
gdp <- as.numeric(as.character(gdp))
mean(gdp)

##############
# QUESTION 3 #
##############
grep("^United",data$X.3)
data$X.3[grep("^United",data$X.3)]

##############
# QUESTION 4 #
##############
library(dplyr)
data_rep <-"quizz_week_4_data"
if(!file.exists(data_rep)){
    dir.create(data_rep)
}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
datafile <- paste(data_rep,"data_gdp.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
data_gdp <- read.csv(datafile,skip = 4, stringsAsFactors = FALSE)
data_gdp$X.1 <- as.numeric(as.character(data_gdp$X.1))
data_gdp <- filter(data_gdp,!is.na(X.1))

dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
datafile <- paste(data_rep,"data_countries.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
data_countries <- read.csv(datafile,stringsAsFactors = FALSE)

merged_data <-  merge(data_gdp,data_countries,by.x="X",by.y ="CountryCode")

special_notes <- tolower(merged_data$Special.Notes)
fiscal_year_logical <- grep("?fiscal year",special_notes)
fiscal_year <-special_notes[fiscal_year_logical]
fiscal_year_june_logical <- grep("?june",fiscal_year)
fiscal_year_june <- fiscal_year[fiscal_year_june_logical]

##############
# QUESTION 5 #
##############
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
sampleTimes <- ymd(sampleTimes)
sample2012 <- sampleTimes[year(sampleTimes)==2012]
length(sample2012)
sample2012Monday <- sample2012[ weekdays(sample2012) =="lundi"]
length(sample2012Monday)
