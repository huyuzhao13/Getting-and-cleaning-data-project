## Load packages to be used (please install the following packages before load them)
library(dplyr)
library(mgsub)
## Download and unzip files
if ((!file.exists("data.zip"))&(!dir.exists("UCI HAR Dataset"))){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","data.zip",mode="wb")
  unzip("data.zip")
}
## Read data and labels
train_data<-read.table("./UCI HAR Dataset/train/X_train.txt")
test_data<-read.table("./UCI HAR Dataset/test/X_test.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
features<-features[,2]
features<-as.character(features)
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
activity<-activity[,2]
activity<-as.character(activity)
train_activity_label<-read.table("./UCI HAR Dataset/train/y_train.txt")
test_activity_label<-read.table("./UCI HAR Dataset/test/y_test.txt")
train_subject_number<-read.table("./UCI HAR Dataset/train/subject_train.txt")
test_subject_number<-read.table("./UCI HAR Dataset/test/subject_test.txt")
## Merge train and test data set
colnames(train_data)<-features
colnames(test_data)<-features
merged_data<-rbind(train_data,test_data)
## Extracts only the measurements on the mean and standard deviation for each measurement
mean_std_positions<-grep("mean[(]|std[(]",features)
merged_mean_std_data<-merged_data[,mean_std_positions]
## Uses descriptive activity names to name the activities in the data set
activity_label_merge<-rbind(train_activity_label,test_activity_label)
activity_label_merge<-activity_label_merge[,1]
activity_label_merge<-as.factor(activity_label_merge)
levels(activity_label_merge)<- activity
data_with_activity<-cbind(merged_mean_std_data,activity_label_merge)
colnames(data_with_activity)[67]<-"activities"
subject_number_merge<-rbind(train_subject_number,test_subject_number)
colnames(subject_number_merge)<-"subject"
data_with_activity_and_subject<-cbind(data_with_activity,subject_number_merge)
##Appropriately labels the data set with descriptive variable names
colnames(data_with_activity_and_subject)<-mgsub(colnames(data_with_activity_and_subject),c("^t","^f","Acc","[(][)]","X","std","Y","Z","Mag","Gyro","-","BodyBody","mean"),c("Time","Frequency","Accelerometer","","X_axis","Standard_deviation","Y_axis","Z_axis","Magnitude","Gyroscope","","Body","Mean"))
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data_activity<-NULL
for (i in 1:66){
  if(i==1){
    t<-tapply(data_with_activity_and_subject[,i],data_with_activity_and_subject$activities,mean)
    t<-as.data.frame(t)
    colnames(t)<-colnames(data_with_activity_and_subject)[i]
    tidy_data_activity<-t
  } else {
    t<-tapply(data_with_activity_and_subject[,i],data_with_activity_and_subject$activities,mean)
    t<-as.data.frame(t)
    colnames(t)<-colnames(data_with_activity_and_subject)[i]
    tidy_data_activity<-cbind(tidy_data_activity,t)
  }
}
tidy_data_subject<-NULL
for (i in 1:66){
  if(i==1){
    t<-tapply(data_with_activity_and_subject[,i],data_with_activity_and_subject$subject,mean)
    t<-as.data.frame(t)
    colnames(t)<-colnames(data_with_activity_and_subject)[i]
    tidy_data_subject<-t
  } else {
    t<-tapply(data_with_activity_and_subject[,i],data_with_activity_and_subject$subject,mean)
    t<-as.data.frame(t)
    colnames(t)<-colnames(data_with_activity_and_subject)[i]
    tidy_data_subject<-cbind(tidy_data_subject,t)
  }
}
tidydata<-rbind(tidy_data_activity,tidy_data_subject)
