# Coursera3_Project
Getting_n_Cleaning_Data_Coursera_Project
# Background
The R script "run_analysis.R" was created for the project of the Coursera course "getting and cleaning data".
It uses data from sensors of a mobile phone which can be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
The script "run_analysis.R" needs to be stored in a working directory "..../UCI HAR Dataset", and requires additional packages (load libraries dplyr and plyr). 
The data consists of sensor data of a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
The data is split up in a training and a testing set and contains more variables than the required mean and std values.
# "run_analysis.R" does the following: 
## 1. Merges the data for training and testing 
   creates X_data table of 10299 observations of 561 variables (sensor data)
   creates Y_data table of 10299 observations of 1 variable (activity)
   creates subject table of 10299 observations of 1 variable (subject)
## 2. Extracts "mean" and "std" of each measurement
   extracts 79 columns ("means" and "std's") from the original data set
## 3. Uses descriptive activity info from "activity_labels.txt"
## 4. Labels extracted data ("mean_or_std") with subject and activity
## 5. Computes mean values of the "means" and "std's" for each activity and for each individual
## 6. Writes computed data to a file "result_of_merged_data.txt" 
6 activities x 30 individuals = 180 rows for mean values of 79 variables
