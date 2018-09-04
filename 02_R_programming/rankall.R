rankall <- function(outcome,num=1) {
    ## Read outcome data
    data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", na.strings="Not Available",stringsAsFactors = FALSE )
    
    ## Check the outcome is valid
    o_name <- c("heart attack","heart failure","pneumonia")
    o_column <- c(11, 17,23 )
    
    indice_outcome <- which(o_name == outcome, arr.ind=TRUE)
    if(length(indice_outcome)==0){
      stop("invalid outcome")
    }
    
    ## retrieve states
    states <- unique(data$State)
    states <- states[order(states)]
    
    ## subset of data specific to the state and outcome selected
    ## this subset contains only 3 columns : state hospital and outcome rate
    data_select <- subset(data,select = c(7,2,o_column[indice_outcome]))
    names(data_select) <- c("state", "hospital", "rate")
    
    ## remove <NA> data
    data_select <- data_select[complete.cases(data_select),]
    
    ## order the data (from the lower outcome rate to the higher)
    data_select <- data_select[order(data_select$state,data_select$rate,data_select$hospital),]
    
    ## split the dataset by state
    data_select <- split(data_select,data_select$state)
  
   
    
    getHospitalByStateAndRank <- function(state) {
      ## calculate the rank from the 'num' parameter
      rank <- num
      if(num=="best"){
        rank <- 1
      } else if(num=="worst"){
        rank <- nrow(data_select[[state]]) 
      } else if(!(is.numeric(num)&&(num==round(num)))) {
        stop("invalid num. Should be 'best', 'worst' or a strictly positive integer")
      } else if(num<=0) {
        stop("invalid num. Should be a strictly positive integer (or'best' or 'worst')")
      } 
      data_select[[state]]$hospital[rank]
    }
    
    hospitals <- sapply(states,getHospitalByStateAndRank)
    
    data.frame(state=states,hospital=hospitals)
}