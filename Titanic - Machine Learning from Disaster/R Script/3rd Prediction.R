###########################################################################
# Titanic: Machine Learning from Disaster #
# 3rd Prediction 
# In this case, we'll take into account the 'Pclass' and 'Fare' variables,
# observe their patterns
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

# 
boxplot(train$Fare ~ train$Pclass, xlab = "Class", ylab = "Fare", col = c("green"))

##############################

train$Pclass

##############################

# Create a new variable named "Fare2" consisting of 4 subsets of Fare
train$Fare2[train$Fare < 10] <- '<10'
train$Fare2[train$Fare >= 10 & train$Fare < 20] <- '10-20'
train$Fare2[train$Fare >= 20 & train$Fare < 30] <- '20-30'
train$Fare2[train$Fare >= 30] <- '30+'

View(train)




# some tests, do as you feel like

table(train$Sex, train$Survived)

summary(train$Sex)

aggregate(Survived ~ Sex, data=train, FUN=sum)

aggregate(Survived ~ Sex, data=train, FUN=length)

aggregate(Survived ~ Sex, data=train, FUN=function(x) {sum(x)/length(x)})

# back to 3rd prediction

# Comparing more than two subsets, we need to use command "aggregate"

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=sum)

# Let's look at actually how many were they in each subset

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=length)

# comparing subsets in terms of FUN=function(x) {sum(x)/length(x)}

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x)}) 

# In percentage

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x) * 100}

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x)})

# Create new column in test set with our prediction that everyone dies
test$Survived <- 0
# Update the prediction to say that all females will survive
test$Survived[test$Sex == 'female'] <- 1
# Update once more to say that females who pay more for a third class fare also perish
test$Survived[test$Sex == 'female' & test$Pclass == 3 & test$Fare >= 20] <- 0

# send the dataframe with two columns   

prediction3rd <- data.frame (test$PassengerId, test$Survived)

# naming the columns

names (prediction3rd) <- c("PassengerId","Survived")

# no rownames

rownames (prediction3rd) <- NULL

# Finally, time to submit it to Kaggle.com

write.csv (prediction3rd, file = "prediction3.csv", row.names=FALSE)
