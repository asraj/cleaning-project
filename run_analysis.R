# Read Source files
features <-read.table("features.txt")
activities <-read.table("activity_labels.txt")
x_train<-read.table("train/x_train.txt")
train_label<-read.table("train/y_train.txt")
x_test<-read.table("test/x_test.txt")
test_label<-read.table("test/y_test.txt")
subject_train <-read.table("train/subject_train.txt")
subject_test <-read.table("test/subject_test.txt")

# Assign column name to the data set
colnames(x_train)<-features[,2]
colnames(x_test)<-features[,2]

colnames(train_label)<-"activity_id"
colnames(test_label)<-"activity_id"

colnames(subject_train)<-"subject"
colnames(subject_test)<-"subject"

colnames(activities)<-c("activity_id","activity")

# Combine subject, activity and experiment data
x_train_labelled <-cbind(subject_train,train_label,x_train)
x_test_labelled <-cbind(subject_test,test_label,x_test)

# combine train and test data
x_data<-rbind(x_train_labelled,x_test_labelled)

#filter for data with mean and standard deviation
data_mean_std<-x_data[,c(1,2, grep("mean|std",colnames(x_data)))]

# Remove column with mean Frequency
data_filtered<-data_mean_std[,-c(grep("meanFreq",colnames(data_mean_std)))]

# Merge experiment date with activity names
data_mean_std_act<-merge(data_filtered,activities)

library(reshape2)

#Reshape to data for have variable name and values
data_melt <-melt(data_mean_std_act,id=c("activity_id","subject","activity"))

#Summarize the experiment variable values for mean
summary<-dcast(data_melt,subject+activity+variable~.,mean)

colnames(summary)[4]<-"mean"

#Write the summarized data
write.table(summary,"summary.txt",row.names=F)
