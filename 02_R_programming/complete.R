complete <- function(directory,id=1:332){
  result <- data.frame()
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
    n<-nrow(df_curr[complete.cases(df_curr),])
    new_result_row <- data.frame(id=i,nobs=n)
    result <- rbind(result,new_result_row)
    }
    result
}
