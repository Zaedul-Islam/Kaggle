###########################################################################
# Titanic: Machine Learning from Disaster #
# 2nd Prediction 
# In this case, We will take into account the "Sex" and "Age" variables 
# As females and children were given priority for getting into boat, we are 
# predicting that all females survived the ship wreck
###########################################################################

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

# Let's look at the number of male and female passengers in the "train" dataset
summary(train$Sex)

# female   male 
# 314      577 

# Proportion of male and female passengers in the titanic
prop.table(table(train$Sex))

# female     male 
# 0.352413 0.647587 

# Create a Two Way Table
table(train$Sex, train$Survived)

#         0   1
# female 81  233
# male   468 109

# Proportion of male and female passengers survived 
prop.table(table(train$Sex, train$Survived))

#             0          1
# female 0.09090909 0.26150393
# male   0.52525253 0.12233446

prop.table(table(train$Sex, train$Survived), 1)

prop.table(table(train$Sex, train$Survived), 1) * 100

barplot(table(train$Sex), xlab="Passenger", ylab="People", main="Train Data Passenger")

# Assigning '0' to 'Survived' column
test$Survived <- 0

# Assuming all the female passengers survived
test$Survived[test$Sex == 'female'] <- 1

secondPrediction <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)

# We need to submit a csv file with the PassengerId and Survived predictions to kaggle.com
# write.csv fuction writes the prediction dataframe out to a CSV file, excluding the row numbers
write.csv(secondPrediction, file = "2nd Prediction.csv", row.names = FALSE)

