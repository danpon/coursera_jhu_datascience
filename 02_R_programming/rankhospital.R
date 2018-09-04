rankhospital <- function(state, outcome,num) {
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
    
    ## remove <NA> data
    data_select <- data_select[complete.cases(data_select),]
    
    ## order the data (from the lower outcome rate to the higher)
    data_select <- data_select[order(data_select$rate,data_select$hospital),]
    
    ## calculate the rank from the 'num' parameter
    rank <- num
    if(num=="best"){
      rank <- 1
    } else if(num=="worst"){
      rank <- nrow((data_select)) 
    } else if(!(is.numeric(num)&&(num==round(num)))) {
      stop("invalid num. Should be 'best', 'worst' or a strictly positive integer")
    } else if(num<=0) {
      stop("invalid num. Should be a strictly positive integer (or'best' or 'worst')")
    } 
    else if(num > nrow(data_select) ){
      return(NA)
    }
    
    return(data_select$hospital[rank])
}