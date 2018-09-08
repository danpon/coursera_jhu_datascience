
This dataset has been obtained by tidying the following dataset :

**Human Activity Recognition Using Smartphones Dataset**

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

which can be found at :
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

More specifically, the folowing operations have been applied to the original dataset files


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
   
The resulting variables are the following : 

**"subject"
"activity"
"time.bodyacc.mean.x"
"time.bodyacc.mean.y"
"time.bodyacc.mean.z"
"time.bodyacc.std.x"
"time.bodyacc.std.y"
"time.bodyacc.std.z"
"time.gravityacc.mean.x"
"time.gravityacc.mean.y"
"time.gravityacc.mean.z"
"time.gravityacc.std.x"
"time.gravityacc.std.y"
"time.gravityacc.std.z"
"time.bodyaccjerk.mean.x"
"time.bodyaccjerk.mean.y"
"time.bodyaccjerk.mean.z"
"time.bodyaccjerk.std.x"
"time.bodyaccjerk.std.y"
"time.bodyaccjerk.std.z"
"time.bodygyro.mean.x"
"time.bodygyro.mean.y"
"time.bodygyro.mean.z"
"time.bodygyro.std.x"
"time.bodygyro.std.y"
"time.bodygyro.std.z"
"time.bodygyrojerk.mean.x"
"time.bodygyrojerk.mean.y"
"time.bodygyrojerk.mean.z"
"time.bodygyrojerk.std.x"
"time.bodygyrojerk.std.y"
"time.bodygyrojerk.std.z"
"time.bodyaccmag.mean"
"time.bodyaccmag.std"
"time.gravityaccmag.mean"
"time.gravityaccmag.std"
"time.bodyaccjerkmag.mean"
"time.bodyaccjerkmag.std"
"time.bodygyromag.mean"
"time.bodygyromag.std"
"time.bodygyrojerkmag.mean"
"time.bodygyrojerkmag.std"
"freq.bodyacc.mean.x"
"freq.bodyacc.mean.y"
"freq.bodyacc.mean.z"
"freq.bodyacc.std.x"
"freq.bodyacc.std.y"
"freq.bodyacc.std.z"
"freq.bodyaccjerk.mean.x"
"freq.bodyaccjerk.mean.y"
"freq.bodyaccjerk.mean.z"
"freq.bodyaccjerk.std.x"
"freq.bodyaccjerk.std.y"
"freq.bodyaccjerk.std.z"
"freq.bodygyro.mean.x"
"freq.bodygyro.mean.y"
"freq.bodygyro.mean.z"
"freq.bodygyro.std.x"
"freq.bodygyro.std.y"
"freq.bodygyro.std.z"
"freq.bodyaccmag.mean"
"freq.bodyaccmag.std"
"freq.bodybodyaccjerkmag.mean"
"freq.bodybodyaccjerkmag.std"
"freq.bodybodygyromag.mean"
"freq.bodybodygyromag.std"
"freq.bodybodygyrojerkmag.mean"
"freq.bodybodygyrojerkmag.std"**

5) The original data set contained several observations for each (subject,activity)
In the processed, tidied dataset for each (subject,activity) there's only row with average values for each variables
