#Steps for Q1 - merge training and test data set to create one set

#Read the training data
DF_train<-read.table("./UCI HAR Dataset/train/X_train.txt") 

#Read the test data
DF_test<-read.table("./UCI HAR Dataset/test/X_test.txt") 

#Read the subject/participant labels [1-30] for the training data
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt") 

#Read the subject/participant labels [1-30] for the test data
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt") 

#Read the activity identifiers (1-6) for the training data
activity_train<-read.table("./UCI HAR Dataset/train/y_train.txt") 

#Read the activity identifiers (1-6) for the test data
activity_test<-read.table("./UCI HAR Dataset/test/y_test.txt")

#Join subject and activity label columns to the training data set
DF_train<-cbind(subject_train,activity_train,DF_train)

#Join subject and activity label columns to the test data set
DF_test<-cbind(subject_test,activity_test,DF_test)

#Combine both training and test data sets into DF which is a data frame of 563 colums
DF<-rbind(DF_train,DF_test)

#At this point, there are no column labels which we will add now.
#The first 2 columns correspond to the subject/participant and the activity.
#The other 561 columns correspond to a 561 feature vector of time and frequency domain variables.

#labels for each of the 561 variables in the vector
feature_labels<-read.table("./UCI HAR Dataset/features.txt")

#Remove redundant index column [1-561]. We just want the labels in V2
feature_labels<-subset(feature_labels, select=-c(V1))

#Converting from data.frame to vector in order to add the vector as header to the data set
feature_labels_vector<-as.vector(feature_labels$V2)

#Q4 - adding descriptive headers for the subject identifier, the activity identifier columns as well
#as the 561 variable measurement vector.
colnames(DF)<-c("subject","activity",feature_labels_vector)
#All 563 columns of the data set are now labeled.

#Q2 - Extracts only the measurements on the mean and standard deviation for each measurement
DF<-subset(DF, select=grep("subject|activity|(mean|std)\\(\\)", names(DF)))

#Q3 - Use descriptive activity names to name the activities in the data set
# i.e 1:WALKING 2:WALKING_UPSTAIRS 3:WALKING_DOWNSTAIRS 4:SITTING 5:STANDING 6:LAYING

activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

#rename columns V1 and V2 to more descriptive names: activity_index, activity_name
names(activity_labels)<-c("activity_index", "activity_name")

#perform a merge on ID columns activity (in DF_extract) and activity_index (in activity_labels)
#a new column DF_activity_name will be added to the data set.
DF<-merge(DF, activity_labels, by.x="activity", by.y="activity_index")

if(!require("dplyr"))
{
  install.packages("dplyr")
}

library(dplyr)

#reorder the columns o the data set for readability.
DF<- DF %>% select(activity,subject,activity_name,everything())

                                            
#drop the redundant column "activity" which had the activity_identifier since we now have the activity names

DF<-subset(DF,select=-c(activity)) 


#Q5 - Create a second, independent tidy data set with the average of each variable for each activity and each subject.
DF_clean_and_summarized<- DF %>% group_by(subject, activity_name) %>% summarize_each(funs(mean)) %>% arrange(subject)

tidy_data_set<-"tidy_data.txt"
if (file.exists(tidy_data_set)) file.remove(tidy_data_set)
write.table(DF_clean_and_summarized, file="./tidy_data.txt", quote=FALSE, row.names = FALSE)