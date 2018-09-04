best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", na.strings="Not Available",stringsAsFactors = FALSE )
  
    ## Check that state and outcome are valid
    
    ## Check the state is valid
    if(!any(data$State == state)){
      stop("invalid state")
    }
    
    ## Check the outcome is valid
    o_name <- c("heart attack","heart failure","pneumonia")
    o_column <- c(11, 17,23 )
    
    indice_outcome <- which(o_name == outcome, arr.ind=TRUE)
    if(length(indice_outcome)==0){
      stop("invalid outcome")
    }
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate

    ## subset of data specific to the state and outcome selected
    ## this subset contains only 2 columns : hospital and outcome rate
    data_select <- subset(data,State==state,select = c(2,o_column[indice_outcome]))
    names(data_select) <- c("hospital", "rate")
    data_select <- data_select[order(data_select$rate,data_select$hospital),]
    return(data_select$hospital[1])
}