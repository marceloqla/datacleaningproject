
activities <- read.table('activity_labels.txt')
activities$V2 <-as.character(activities$V2)
column_names <- read.table("features.txt")
test <- read.table("test/X_test.txt")
names(test) <- column_names$V2
test_act_labels <- read.table("test/y_test.txt")
new_vec <- c()
i = 1
for (a in test_act_labels$V1){
  new_vec[i] <- activities[a, 2]
  i <- i + 1
}
test <- test[, grep("mean\\(|std\\(", names(test))]
test$Activity <-as.factor(new_vec)
test_subjects <- read.table('test/subject_test.txt') 
test$Subject <- as.factor(test_subjects$V1)
  
train <- read.table("train/X_train.txt")
names(train) <- column_names$V2
train_act_labels <- read.table("train/y_train.txt")
new_vec <- c()
i = 1
for (a in train_act_labels$V1){
  new_vec[i] <- activities[a, 2]
  i <- i + 1
}
train <- train[, grep("mean\\(|std\\(", names(train))]
train$Activity <- as.factor(new_vec)
train_subjects <- read.table('train/subject_train.txt') 
train$Subject <- as.factor(train_subjects$V1)

allsets <- rbind(train, test)
library(reshape2)
melted <- melt(allsets, id = c("Subject", "Activity"))
allmeans <- dcast(melted, Subject + Activity ~ variable, mean)
library(plyr)
arrange(allmeans,"Subject","Activity")
write.table(allmeans, row.names=FALSE, "tidy.txt")
