library(dplyr)

###################################################################
# 1. Merges the training and the test sets to create one data set #
###################################################################

# merge subject_train and subject_test : subject
subject_train <- read.table("./data_input/train/subject_train.txt",sep="")
subject_test  <- read.table("./data_input/test/subject_test.txt",sep="")
subject       <- rbind(subject_train, subject_test)

rm(subject_train)
rm(subject_test)

# merge y_train and y_test : y
y_train <- read.table("./data_input/train/y_train.txt",sep="")
y_test  <- read.table("./data_input/test/y_test.txt",sep="")
y       <- rbind(y_train, y_test)

rm(y_train)
rm(y_test)

# merge x_train and x_test : x
x_train <- read.table("./data_input/train/X_train.txt",sep="")
x_test  <- read.table("./data_input/test/X_test.txt",sep="")
x       <- rbind(x_train, x_test)

rm(x_train)
rm(x_test)

# merge subject, y and x : subjectyx
subjectyx <- cbind(subject ,y)
subjectyx <- cbind(subjectyx, x )

rm(subject)
rm(y)
rm(x)

#############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement #
#############################################################################################

# read columns list in "features.txt"
features <- read.table("./data_input/features.txt",sep="",stringsAsFactors = FALSE)

# positions of the columns with mean()/std() measurements
meanstd_col_positions <- grep("?mean\\(\\)|std\\(\\)",features$V2)

# namesof the columns with mean()/std() measurements (for future use in #4)
meanstd_col_names <- features$V2[meanstd_col_positions]

# 1st column in data : "subject"
# 2nd column : "y" (i.e "activity")
# 3nd column and next ones : columns from "x" corresponding to mean()/std() varibless
# NB : a column with position i in "x" has now a position x+2 in "data
positions <- c(c(1,2),meanstd_col_positions +2)
data <- subset(subjectyx ,select = positions)

rm(features)
rm(subjectyx)
rm(meanstd_col_positions)
rm(positions)

############################################################################# 
# 3. Uses descriptive activity names to name the activities in the data set #
#############################################################################

# read activities list in "activity_labels.txt"
activity_labels <- read.table("./data_input/activity_labels.txt",sep="")
activities <- activity_labels$V2

# replace activities id by activities names in the dataset
data$V1.1 <- activities[data$V1.1]

rm(activity_labels)
rm(activities)

######################################################################## 
# 4. Appropriately labels the data set with descriptive variable names #
########################################################################
# 1st column of data is "subject"
# 2nd column of data is "y" i.e. "activity"
# the next colums are the x variables corresponding to mean/std
# and the names of those have been stored in vector "meanstd_col_names" (see #2)
varnames <- c( c("subject","activity"),meanstd_col_names)

# to lower case
varnames <- tolower(varnames)

# replace name starting with "t" by names starting with "time."
varnames <- sub("^t","time.",varnames)

# replace name starting with f by names satring with "freq."
varnames <- sub("^f","freq.",varnames)

# replace "-" by "."
varnames <- gsub("-",".",varnames)

# eliminate parenthesis
varnames <- gsub("\\(\\)","",varnames)

# set column names for the dataset
colnames(data) <- varnames

rm(meanstd_col_names)
rm(varnames)

###############################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set #
# with the average of each variable for each activity and each subject.       #      
###############################################################################
tidydata <- group_by(data,subject,activity) %>% summarize_all(funs(mean))

# create output directory if it doen't exist
data_output_rep <- "data_output"
if(!file.exists(data_output_rep)){
    dir.create(data_output_rep)
}
filename <- paste(data_output_rep,"tidydata.txt",sep="/")

# export dataset in file "tidydata.txt"
write.table(tidydata,file=filename,row.name=FALSE)

rm(data)
rm(tidydata)
rm(data_output_rep)
rm(filename)