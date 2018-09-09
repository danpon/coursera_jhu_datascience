### Tidying the samsung dataset

#### Introduction

- Original dataset can be found here :
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

- The working directory structure is :
	- sub-directory "data_input" which contains the orginal dataset files 
	- sub-directory "data_output" which contained the processed data
	- R script "run_analysis.R" which processes the data
	- file "CodeBook.md" describes the variables and the transformations from the original datasets 

### How to use

- check that :
	- the working directory is the directory containing "run_analysis.R"
	- original dataset files are in the sub-directory "data_input"
- in R console or RStudio type : **source("run_analysis.R")**
- the processed dataset file is then created : *data_output/tidydata.txt*

### How the script works

1) Merge the training and test datasets and bind them in a single dataset :

   - Merge subject_train.txt and subject_test.txt
   - Merge y_train.txt and y_test.txt
   - Merge X_train.txt and X_test.txt
   - Bind subject, y and X in single dataset
     (1st column : subject, 2nd column : y - i.e activity, next columns X)
   
2) Extract only the measurements on the mean and standard deviation for each measurement	 
  
3) Replace the activities numeric values by labels 
   (from the file "activity_labels.txt" in the original dataset)
 
4) Rename the variable names accoriding to the following rules :
   - all variables are lower cases
   - name starting with "t" have been replaced by names starting with "time."   
   - name starting with "f" have been replaced by names starting with "freq."   
   - "-" replaced by "."
   - parenthesis have been removed 
   
5) The original data set contained several observations for each (subject,activity)
   In the processed, tidied dataset for each (subject,activity) there's only row with average values for each variables
   
6) The tidied dataset is exported in the "./data_output/tidydata.txt" file