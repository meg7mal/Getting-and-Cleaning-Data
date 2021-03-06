#Code Book

1) **The Data Set**

A description of the data set used in this project can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Download it at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A group of 30 participants were asked to wear a waist-mounted Samsung Galaxy II smartphone
containing internal sensors. They were also asked to perform 6 "Acts of
daily living" such as WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, LAYING and STANDING.

Sensor data (from accelormeter and gyroscope of the device) was collected for a user performing a particular
activity several times in a fixed-width sliding window (128 times per window of 2.56s) . 
In each window, a vector of 561 variables was recorded and each variable corresponds to a time or 
frequency domain measurement, termed "features". This led to a very large data set of several thousand
records.

70% of the participants generated the training data while, 30% generated the test data records.

2) **Project Requirements**

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each 
  variable for each activity and each subject.



2) **Files of Interest**

The files we require to construct our final tidy data set are :

**Training data:**

* getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_test.txt - list of subject identifiers (1-30) corresponding to every record
* getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_test.txt - list of the 561 measurement variable vectors for each record
* getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_test.txt- list of the activity identifiers (1-6) for each record

Similarly,
**Test data:**

* getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt
* getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt
* getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt


**Files for labeling:**

* getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt - The list of features corresponding to each of the 561 measurement variables
* getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt - The list of activities corresponing to the activity identifiers
  i.e,
  1:WALKING
  2:WALKING_UPSTAIRS
  3:WALKING_DOWNSTAIRS
  4:SITTING
  5:STANDING
  6:LAYING

 
3) **Final Tidy data set**
 
The final output tidy data set will have **180 records** and the following **68 columns**

**Column 1:** subject (integer)- An identifier for the subject who participated

**Column 2:** activityName (factor)- An descriptive name for the activiy instead of a numerical identifier (found in activity_labels.txt)
                             The activity identifier column ("activity") is dropped after the merge with the table read from
                             activity_labels.txt because it is redundant. The factor levels are WALKING, WALKING_UPSTAIRS,                                         WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
                            
**Column 3 - Column 68:** (numeric) Correspond to the **averages** of only the **mean() and std()** of various measurements. _**The                                       data set is grouped by subject and activityName and the avergages for each mean() and std()                                          features are calculated.**_

**The column list for the final clean data set:**

 [1] "subject"                                                 
 [2] "activityName"                                            
 [3] "timeBodyAccelerometerMeanX"                              
 [4] "timeBodyAccelerometerMeanY"                              
 [5] "timeBodyAccelerometerMeanZ"                              
 [6] "timeBodyAccelerometerStandardDeviationX"                 
 [7] "timeBodyAccelerometerStandardDeviationY"                 
 [8] "timeBodyAccelerometerStandardDeviationZ"                 
 [9] "timeGravityAccelerometerMeanX"                           
[10] "timeGravityAccelerometerMeanY"                           
[11] "timeGravityAccelerometerMeanZ"                           
[12] "timeGravityAccelerometerStandardDeviationX"              
[13] "timeGravityAccelerometerStandardDeviationY"              
[14] "timeGravityAccelerometerStandardDeviationZ"              
[15] "timeBodyAccelerometerJerkMeanX"                          
[16] "timeBodyAccelerometerJerkMeanY"                          
[17] "timeBodyAccelerometerJerkMeanZ"                          
[18] "timeBodyAccelerometerJerkStandardDeviationX"             
[19] "timeBodyAccelerometerJerkStandardDeviationY"             
[20] "timeBodyAccelerometerJerkStandardDeviationZ"             
[21] "timeBodyGyroscopeMeanX"                                  
[22] "timeBodyGyroscopeMeanY"                                  
[23] "timeBodyGyroscopeMeanZ"                                  
[24] "timeBodyGyroscopeStandardDeviationX"                     
[25] "timeBodyGyroscopeStandardDeviationY"                     
[26] "timeBodyGyroscopeStandardDeviationZ"                     
[27] "timeBodyGyroscopeJerkMeanX"                              
[28] "timeBodyGyroscopeJerkMeanY"                              
[29] "timeBodyGyroscopeJerkMeanZ"                              
[30] "timeBodyGyroscopeJerkStandardDeviationX"                 
[31] "timeBodyGyroscopeJerkStandardDeviationY"                 
[32] "timeBodyGyroscopeJerkStandardDeviationZ"                 
[33] "timeBodyAccelerometerMagnitudeMean"                      
[34] "timeBodyAccelerometerMagnitudeStandardDeviation"         
[35] "timeGravityAccelerometerMagnitudeMean"                   
[36] "timeGravityAccelerometerMagnitudeStandardDeviation"      
[37] "timeBodyAccelerometerJerkMagnitudeMean"                  
[38] "timeBodyAccelerometerJerkMagnitudeStandardDeviation"     
[39] "timeBodyGyroscopeMagnitudeMean"                          
[40] "timeBodyGyroscopeMagnitudeStandardDeviation"             
[41] "timeBodyGyroscopeJerkMagnitudeMean"                      
[42] "timeBodyGyroscopeJerkMagnitudeStandardDeviation"         
[43] "frequencyBodyAccelerometerMeanX"                         
[44] "frequencyBodyAccelerometerMeanY"                         
[45] "frequencyBodyAccelerometerMeanZ"                         
[46] "frequencyBodyAccelerometerStandardDeviationX"            
[47] "frequencyBodyAccelerometerStandardDeviationY"            
[48] "frequencyBodyAccelerometerStandardDeviationZ"            
[49] "frequencyBodyAccelerometerJerkMeanX"                     
[50] "frequencyBodyAccelerometerJerkMeanY"                     
[51] "frequencyBodyAccelerometerJerkMeanZ"                     
[52] "frequencyBodyAccelerometerJerkStandardDeviationX"        
[53] "frequencyBodyAccelerometerJerkStandardDeviationY"        
[54] "frequencyBodyAccelerometerJerkStandardDeviationZ"        
[55] "frequencyBodyGyroscopeMeanX"                             
[56] "frequencyBodyGyroscopeMeanY"                             
[57] "frequencyBodyGyroscopeMeanZ"                             
[58] "frequencyBodyGyroscopeStandardDeviationX"                
[59] "frequencyBodyGyroscopeStandardDeviationY"                
[60] "frequencyBodyGyroscopeStandardDeviationZ"                
[61] "frequencyBodyAccelerometerMagnitudeMean"                 
[62] "frequencyBodyAccelerometerMagnitudeStandardDeviation"    
[63] "frequencyBodyAccelerometerJerkMagnitudeMean"             
[64] "frequencyBodyAccelerometerJerkMagnitudeStandardDeviation"
[65] "frequencyBodyGyroscopeMagnitudeMean"                     
[66] "frequencyBodyGyroscopeMagnitudeStandardDeviation"        
[67] "frequencyBodyGyroscopeJerkMagnitudeMean"                 
[68] "frequencyBodyGyroscopeJerkMagnitudeStandardDeviation"   
