###########################################
# Titanic: Machine Learning from Disaster #
# 1st Prediction (Where all the passengers died)
###########################################

#1 Set the working directory
setwd("E:/Workstation/Machine Learning Training/Kaggle/Titanic - Machine Learning from Disaster/R Script")

#2 Import the training dataset from your local computer: train
train <- read.csv("E:/Workstation/Machine Learning Training/Kaggle/Titanic - Machine Learning from Disaster/Dataset/train.csv")

# Viewing the "train" dataframe in raw format
train

# Viewing the "train" dataframe in table format
View(train)

# Viewing the structure of "train" dataframe
str(train)

# Import the testing dataset from your local computer: test
test <- read.csv("E:/Workstation/Machine Learning Training/Kaggle/Titanic - Machine Learning from Disaster/Dataset/test.csv")

# Viewing the "test" dataframe in raw format
test

# Viewing the "test" dataframe in table format
View(test)


# Let's do some exploratory data analysis
# How many people in your training set survived?
table(train$Survived) 

# What is the proportion of people who survived? 
prop.table(table(train$Survived))

# How about the gender in two way comparison who survived? 
table(train$Sex, train$Survived)

# To access a single column in the dataframe, use $ after the dataframe
# What is the fate of the people in the train dataset?
table(train$Survived)

# 0   1 
# 549 342 

# What about the proportion?
prop.table(table(train$Survived))

# 0         1 
# 0.6161616 0.3838384 

# What about the proportion in percentage?
prop.table(table(train$Survived)) * 100

# 0        1 
# 61.61616 38.38384 

# Visual representation of survived in train dataset
barplot(table(train$Survived), xlab="Survived", ylab="People", main="Train Data Survival")

# In the worst case scenario, everyone died in test dataset, let's make it our first prediction
# rep command insert the value 0, 418 times in the newly created $Survived column
# rep command is similar to for loop in other programming languages
test$Survived <- rep(0, 418)

# We need to submit a csv file with the PassengerId and Survived predictions to kaggle.com
# write.csv fuction writes the prediction dataframe out to a CSV file, excluding the row numbers
prediction <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(prediction, file = "1st Prediction.csv", row.names = FALSE)

