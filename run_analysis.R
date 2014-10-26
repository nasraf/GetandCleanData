require(reshape2)

##read training data set 
train_data<-read.table("train/X_train.txt",header=FALSE, sep="")

##read training labels
train_label<-read.table("train/y_train.txt",header=FALSE,sep="")

##read subject_train
subject_train<-read.table("train/subject_train.txt", header=FALSE)

##read test data set - 2947 obs. of 561 variables
test_data<-read.table("test/X_test.txt",header=FALSE,sep="")

##read test labels
test_label<-read.table("test/y_test.txt",header=FALSE)

##read subject_test
subject_test<-read.table("test/subject_test.txt", header=FALSE)


##read features
features<-read.table("features.txt", header=FALSE, stringsAsFactors=F)


##combine training data with train labels and subject_train
train_data_label_subject<-cbind(subject_train,train_label,train_data,deparse.level = 1)

##combine test data with test labels and subject_test
test_data_label_subject<-cbind(subject_test,test_label,test_data,deparse.level = 1)

##combine train data with test data
train_test_data<-rbind(train_data_label_subject,test_data_label_subject,deparse.level = 1)

## include header names for subject and actvity
col_header<-colnames(train_test_data)<-c("subject","activity",features[[2]])

## select only varible names with mean() and std()
col_header <- (col_header[(grepl("mean()",col_header) | grepl("std()",col_header) | 
                    grepl("subject",col_header) | grepl("activity",col_header)) == TRUE])

##read only features ending with mean() and std()

meanstd_data <- train_test_data[, col_header]
meanstd_data$activity <- factor(meanstd_data$activity, levels=1:6, labels=c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))


## Appropriately labels the data set with descriptive variable names.
## ex: Acc to  "Accelerometer


i=3
for (i in 3:(length(col_header))) {
  desc.name<-col_header[i]
  desc.name<-gsub("Acc"," Accelerometer ",desc.name)
  col_header[i]<-c(desc.name)

  desc.name<-col_header[i]
  desc.name<-gsub("^t","Time ",desc.name)
  col_header[i]<-desc.name
  
  desc.name<-col_header[i]
  desc.name<-gsub("-"," ",desc.name)
  col_header[i]<-desc.name

  desc.name<-col_header[i]
  desc.name<-gsub("mean","Mean Value ",desc.name)
  col_header[i]<-desc.name
  
  desc.name<-col_header[i]
  desc.name<-gsub("[:():]","",desc.name)
  col_header[i]<-desc.name

  desc.name<-col_header[i]
  desc.name<-gsub("Gyro","Gyroscope ",desc.name)
  col_header[i]<-desc.name

  desc.name<-col_header[i]
  desc.name<-gsub("Jerk","Jerk ",desc.name)
  col_header[i]<-desc.name
  
  desc.name<-col_header[i]
  desc.name<-gsub("^f","Frequency ",desc.name)
  col_header[i]<-desc.name

  desc.name<-col_header[i]
  desc.name<-gsub("BodyBody","Body ",desc.name)
  col_header[i]<-desc.name
  
  desc.name<-col_header[i]
  desc.name<-gsub("Body","Body ",desc.name)
  col_header[i]<-desc.name
  
  desc.name<-col_header[i]
  desc.name<-gsub("std","Standard Deviation",desc.name)
  col_header[i]<-desc.name
  
  desc.name<-col_header[i]
  desc.name<-gsub("X"," Signal In X Direction",desc.name)
  col_header[i]<-desc.name
  
  desc.name<-col_header[i]
  desc.name<-gsub("Y"," Signal In Y Direction",desc.name)
  col_header[i]<-desc.name
  
  desc.name<-col_header[i]
  desc.name<-gsub("Z"," Signal In Z Direction",desc.name)
  col_header[i]<-desc.name

}

## tidy data set with the average of each variable for each activity and each subject

tidy_data<-dcast(meanstd_data, subject+activity ~ col_header,fun.aggregate = mean)

write.table(tidy_data,"tidydata.txt",row.names = FALSE)
