# read the train data
# read the test data
# read the respective subject and activity info and col bind to the train and test data

train <- read.table(file="UCI HAR Dataset/train/X_train.txt",header=FALSE)
test <- read.table(file="UCI HAR Dataset/test/X_test.txt",header=FALSE)
trs <- read.table(file="UCI HAR Dataset/train/subject_train.txt",header=FALSE)
tract <- read.table(file="UCI HAR Dataset/train/y_train.txt",header=FALSE)
train <- cbind(trs,tract,train)
tes <- read.table(file="UCI HAR Dataset/test/subject_test.txt",header=FALSE)
teact <- read.table(file="UCI HAR Dataset/test/y_test.txt",header=FALSE)
test <- cbind(tes,teact,test)

# combine the train and test data sets
comb <- rbind(train,test)

# get the sensor parameters
f <- read.table(file="UCI HAR Dataset/features.txt",header=FALSE,col.names = c("id","desc"))
g <- c(as.vector(f[,"desc"]))

# name the cols
names(comb) <- c("subject","activity",g)

# get rid of unwanted cols that are not mean or std readings
f_filter <- c(TRUE, TRUE,grepl("mean|std",g))
comb_filter <- comb[, f_filter]

library(reshape)
library(reshape2)
# summarise activity for each person
varlabel <- setdiff(colnames(comb_filter),c("subject","activity"))
comb_melt <- melt(comb_filter,id=c("subject","activity"),measure.vars=varlabel)

#tidy data
tidy_data <- dcast(comb_melt, subject + activity ~ variable, mean)
# save data to file
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)
