### Tidying the samsung dataset

#### Introduction

- Original dataset can be found here :
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

- The working directory structure is :
	- sub-directory "data_input" which contains the orginal dataset files 
	- sub-directory "data_output" which contained the processed data
	- R script "run_analysis.R" which processes the data
	- file "cookbook.txt" describes the variables

### how to use

- check that :
	- the working directory is the directory containing "run_analysis.R"
	- original dataset files are in the sub-directory "data_input"
- in R console or RStudio type : **source("run_analysis.R")**
- the processed dataset file is then created : *data_output/tidydata.txt*

