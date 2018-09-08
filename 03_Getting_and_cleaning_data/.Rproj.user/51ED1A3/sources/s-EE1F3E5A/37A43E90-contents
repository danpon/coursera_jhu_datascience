data_rep <-"quizz_week_1_data"
if(!file.exists(data_rep)){
    dir.create(data_rep)
}
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
datafile <- paste(data_rep,"housing.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
housing <- read.csv(datafile)
head(housing)
expansive_houses <- subset(housing,VAL==24)
nrow(expansive_houses)

install.packages("xlsx")
library(xlsx)
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
datafile <- paste(data_rep,"NaturalGasAquisitionProgram.xlsx",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
dat <- read.xlsx(datafile,sheetIndex=1, rowIndex=18:23,colIndex=7:17)
sum(dat$Zip*dat$Ext,na.rm=T)

install.packages("XML")
library(XML)
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
datafile <- paste(data_rep,"restaurants.xml",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
doc <- xmlTreeParse(file=datafile,useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
zipCodes <- xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipCodes[zipCodes=="21231"])

install.packages("data.table")
library(data.table)
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
datafile <- paste(data_rep,"housing_idaho.csv",sep="/")
download.file(url=dataurl,destfile =datafile,method = "curl" )
DT <- fread(datafile)

tapply(DT$pwgtp15,DT$SEX,mean) # Slow
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2] #Syntax error
DT[,mean(pwgtp15),by=SEX] # OK
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15) # Slow
mean(DT$pwgtp15,by=DT$SEX) #Don't return two means
sapply(split(DT$pwgtp15,DT$SEX),mean) # Slow



