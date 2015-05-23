# R script for coursera data cleaning project 
# Download / unzip data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Store "run_analysis.R" in working directory "..../UCI HAR Dataset".
# Load library(dplyr)
# Load library(plyr)

# 1. Merge the data for training and testing 

# results X_data table of 10299 observations of 66 variables
temp_a<-read.table("train/X_train.txt")
temp_b<-read.table("test/X_test.txt")
X_data<-rbind(temp_a,temp_b)

# results in Y_data table of 10299 observations of 1 variable
temp_a<-read.table("train/Y_train.txt")
temp_b<-read.table("test/Y_test.txt")
Y_data<-rbind(temp_a,temp_b)

# results in Y_data table of 10299 observations of 1 variable
temp_a<-read.table("train/subject_train.txt")
temp_b<-read.table("test/subject_test.txt")
subject_data<-rbind(temp_a,temp_b)
names(subject_data)<-"subject"

# 2. Extracts "mean" and "std" of each measurement
features<-read.table("features.txt")
mean_or_std_cols<-grep("mean|std",features[,2])
X_data<-X_data[,mean_or_std_cols]
names(X_data)<-features[mean_or_std_cols,2]

# 3. Uses descriptive activity info from "activity_labels.txt"
activity_labels<-read.table("activity_labels.txt")
Y_data[,1]=activity_labels[Y_data[,1],2]
names(Y_data)<-"activity"

# 4. Labels extracted data ("mean_or_std") with subject and activity
Labeled_Data<-cbind(subject_data,Y_data,X_data)

# 5. Calculates averages of each variable for each activity and each subject
result_of_merged_data<-aggregate(Labeled_Data[,3:81], by=list(Labeled_Data$activity,Labeled_Data$subject), mean)
result_of_merged_data<-rename(result_of_merged_data,c("Group.1"="activity","Group.2"="subject"))


# 6. Writes computed data to a file "result_of_merged_data.txt" 
write.table(result_of_merged_data,"result_of_merged_data.txt",row.names=FALSE)
