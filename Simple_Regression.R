## Simple Linear Regression

rm(list = ls(all=T)) ## Clear the work environment
getwd()
setwd("C:/Users/VIVAN DSOUZA/Desktop/Udemy/Machine Learning A-Z/Part 2 - Regression/Section 4 - Simple Linear Regression/Practice")

## import the data
dataset <- read.csv("Salary_Data.csv")

## Splitting the dataset into training and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

## Fitting simple Linear regression to the Training set
regression = lm(formula = Salary ~ ., data = training_set)
summary(regression)

## Predicting the Test set Result
y_pred = predict(regression, newdata = test_set)
y_pred    ## predicted salaray
test_set  ## Real Salary

## Visualizing the training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), 
             colour = "red") +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regression, newdata = training_set)),
            colour = "blue") +
  ggtitle("Salary vs Experience (Training Set)") +
  xlab("Years of experience") +
  ylab("Salary")

## Visualizing the test set results
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), 
             colour = "red") +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regression, newdata = training_set)),
            colour = "blue") +
  ggtitle("Salary vs Experience (Test Set)") +
  xlab("Years of experience") +
  ylab("Salary")
