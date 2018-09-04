corr <- function(directory,threshold=0){
  
  result <- vector()
  files <- list.files(directory)
  

  for(f in files){
    path <- paste(directory,"/",f,sep="")
    df_curr <- read.csv(path)
    df_curr_complete <- df_curr[complete.cases(df_curr),]
    n<-nrow(df_curr_complete)
    if(n>threshold)
    {
      correlation  <- cor(df_curr_complete$sulfate,df_curr_complete$nitrate)
      result <- c(result,correlation)
    }  
  }
  result
}
