setwd("D:/Own Files/20200420 all files in getting and cleaning data coursera course")
train<-read.table("./UCI HAR Dataset/train/X_train.txt")
test<-read.table("./UCI HAR Dataset/test/X_test.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
names<-features[,2]
names<-as.character(names)
colnames(train)<-names
colnames(test)<-names
merged<-rbind(train,test)
install.packages("dplyr")
library(dplyr)
positions<-grep("mean[(]|std[(]",names)
selected<-merged[,positions]
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
activity<-activity[,2]
activity<-as.character(activity)
trainlabel<-read.table("./UCI HAR Dataset/train/y_train.txt")
testlabel<-read.table("./UCI HAR Dataset/test/y_test.txt")
##trainlabel<-trainlabel[,1]
##testlabel<-testlabel[,1]
labelmerge<-rbind(trainlabel,testlabel)
labelmerge<-labelmerge[,1]
labelmerge<-as.factor(labelmerge)
levels(labelmerge)<- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
final<-cbind(selected,labelmerge)
colnames(final)[67]<-"activities"
trainsubject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
testsubject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subjectmerge<-rbind(trainsubject,testsubject)
colnames(subjectmerge)<-"subject"
final<-cbind(final,subjectmerge)
tidydataactivity<-NULL
for (i in 1:66){
  if(i==1){
    t<-tapply(final[,i],final$activities,mean)
    t<-as.data.frame(t)
    colnames(t)<-colnames(final)[i]
    tidydataactivity<-t
  } else {
    t<-tapply(final[,i],final$activities,mean)
    t<-as.data.frame(t)
    colnames(t)<-colnames(final)[i]
    tidydataactivity<-cbind(tidydataactivity,t)
  }
}
tidydatasubject<-NULL
for (i in 1:66){
  if(i==1){
    t<-tapply(final[,i],final$subject,mean)
    t<-as.data.frame(t)
    colnames(t)<-colnames(final)[i]
    tidydatasubject<-t
  } else {
    t<-tapply(final[,i],final$subject,mean)
    t<-as.data.frame(t)
    colnames(t)<-colnames(final)[i]
    tidydatasubject<-cbind(tidydatasubject,t)
  }
}
tidydata<-rbind(tidydataactivity,tidydatasubject)
