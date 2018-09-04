pollutantmean <- function(directory,pollutant,id=1:332){
  df <- data.frame()
  for(i in id){
    if(i<10){
      filename <- paste("00",i,sep="")
    } 
    else if(i <100) 
    {
      filename <- paste("0",i,sep="")
    } 
    else
    {
      filename <- paste("",i,sep="")
    }
    path <- paste(directory,"/",filename,".csv",sep="")
    df_curr <- read.csv(path)
    df <- rbind(df,df_curr)
  }
  mean(df[,pollutant],na.rm=TRUE)
}
