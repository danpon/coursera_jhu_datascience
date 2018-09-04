outcome <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
# 30-day death rates from heart attack 
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])