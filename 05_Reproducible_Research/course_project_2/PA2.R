library(downloader)
library(dplyr)
library(ggplot2)
url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
dataDir <- "data"
dataFile <- paste(dataDir,"StormData.csv.bz2",sep="/")
if(!dir.exists(dataDir)){ 
    dir.create(dataDir) 
}
download.file(url,destfile=dataFile)
data <- read.table(file = dataFile, sep = ",",header=TRUE)

# select the total fatalities by event type
fatalitiesByEvType <- data %>% 
                    select(FATALITIES,EVTYPE)%>% 
                    filter(FATALITIES!=0)%>% 
                    group_by(EVTYPE) %>% 
                    summarize(FATALITIES=sum(FATALITIES)) %>%
                    arrange(desc(FATALITIES))


# we will keep only the top 25 EVTYPE which have the highest FATALITIES
fatalitiesByEvType <- fatalitiesByEvType[1:25,]


g <- ggplot(fatalitiesByEvType, aes(x=EVTYPE,y=FATALITIES)) 
g + 
    # stat="identity" : use y=FATALITIES instead of the default count(EVTYPE)
    geom_bar(stat="identity", fill="coral4") +
    # plot a horizontal bar graph with the max value bar at the top position:
    scale_x_discrete(limits=rev(fatalitiesByEvType$EVTYPE)) +coord_flip()+
    # make sure that the title and labels are explicit and readable
    labs(y="Fatalities")+
    labs(x="Weather event type")+
    labs(title="Total fatalities due to weather events (1950-2011)")
    


# select the total injuries by event type
injuriesByEvType <- data %>% 
    select(INJURIES,EVTYPE)%>% 
    filter(INJURIES!=0)%>% 
    group_by(EVTYPE) %>% 
    summarize(INJURIES=sum(INJURIES)) %>%
    arrange(desc(INJURIES))


# we will keep only the top 25 EVTYPE which have the highest INJURIES
injuriesByEvType <- injuriesByEvType[1:25,]

g <- ggplot(injuriesByEvType, aes(x=EVTYPE,y=INJURIES)) 
g + 
    # stat="identity" : use y=INJURIES instead of the default count(EVTYPE)
    geom_bar(stat="identity",fill="coral2") + 
    # plot a horizontal bar graph with the max value bar at the top position:
    scale_x_discrete(limits=rev(injuriesByEvType$EVTYPE)) +coord_flip()+
    # make sure that the title and labels are explicit and readable
    labs(y="Injuries")+
    labs(x="Weather event type")+
    labs(title="Total injuries due to weather events (1950-2011)")


table(data$PROPDMGEXP)
table(data$CROPDMGEXP)

calculateValue <- function(base,exp){
    if (!is.numeric(base))
    {
        return(0)
    }
    value <- 0
    exp <- tolower(exp)
    if(exp==""){
        value <- base
    }
    if(exp=="b"){
        value <- base*10^9
    } else if(exp=="m"){
        value <- base*10^6
    } else if(exp=="k"){
        value <- base*1000
    }
    else if(exp=="h"){
        value <- base*100
    }    
    return(value)
}

damages <- data %>% select(EVTYPE,PROPDMG,PROPDMGEXP,CROPDMG,CROPDMGEXP) %>% 
            filter(PROPDMG!=0 & CROPDMG!=0) %>% 
            rowwise() %>% 
            mutate(PROPERTY.DAMAGE=calculateValue(PROPDMG,PROPDMGEXP))
damages <-  damages %>%
            rowwise() %>%
            mutate(CROP.DAMAGE=calculateValue(CROPDMG,CROPDMGEXP))

damagesByEvType <- damages %>% 
                    group_by(EVTYPE) %>%
                    summarize(PROPERTY.DAMAGE=sum(PROPERTY.DAMAGE),CROP.DAMAGE=sum(CROP.DAMAGE) )

damagesByEvType$TOTAL <- damagesByEvType$PROPERTY.DAMAGE + damagesByEvType$CROP.DAMAGE

damagesByEvType <- damagesByEvType %>% arrange(desc(TOTAL))

damagesByEvType <- damagesByEvType[1:15,] 

damagesPlotData <- damagesByEvType %>%  select(EVTYPE,property=PROPERTY.DAMAGE,crop=CROP.DAMAGE )
damagesPlotData <- melt(data = as.data.frame(damagesPlotData),id=c("EVTYPE"))
names(damagesPlotData) <- c("Event.Type","Damage.Type","Damage.Cost")

    

g <- ggplot(data = damagesPlotData, aes(x = Event.Type, y = Damage.Cost, fill = Damage.Type)) 
g + 
    # stat="identity" : use y=Damage.Cost instead of the default count(EVTYPE)
    geom_bar(stat="identity") +
    # plot a horizontal bar graph with the max value bar at the top position:
    scale_x_discrete(limits=rev(damagesByEvType$EVTYPE)) + coord_flip()+
    # make sure that the title and labels are explicit and readable
    labs(y="Damage cost")+
    labs(x="Weather event type")+
    scale_fill_discrete(name="Damage type") +
    labs(title="Total damages cost due to weather events (1950-2011)")

