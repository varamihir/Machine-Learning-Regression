
#### find out in data set that 160k salary is truth for the level 6.5
### Polynomial Regression***
### Polynomial Regression model is a multiple regression model that is composed of one independent variable
### and addtional independent variables that are pulling in terms of this first independent variable


# Importing the dataset
dataset <- read.csv("Position_Salaries.csv")
dataset <- dataset[2:3]
dataset
## Since this data is too small we don't need to split into training and testing data set
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

## In this data set there is no linear relationship between level and salary. It is better to use polynomial
# regresssion model.
# Fitting a linear Regression model to  the data set
lin_reg <- lm(Salary~ .,data = dataset)
summary(lin_reg)

# Fitting poynomial regression to the dataset. We need to creat level for polynomial regression
# Add level2 independent varibale column to the data set, it will create square of 10 values of data set.
#  we can add higher degree to the dataset will addlevel 3 it will create cube of 10 values of dataset and so on.
dataset$Level2 <- dataset$Level^2
dataset$Level3 <- dataset$Level^3
dataset$Level4 <- dataset$Level^4

dataset
poly_reg <- lm(Salary ~., 
               data = dataset)
summary(poly_reg)
## Looking at the summary p- value of level2 and level3 statistically siginficant.

# Visualizing the Linear Regression results, data doesn't fit well in this model
library(ggplot2)
ggplot() +
  geom_point(aes(x= dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata= dataset)), color = 'blue') +
  ggtitle("level vs Salary(Linear Regression Model") +
  xlab("Level")+
  ylab("Salary")
# Visualizing the Polynomial Regression model results with 3 degree..
# you will see how powerful is this model compare to Linear Regression model, and the we see the salary mentioned
# is close to the level in the data and all the predicetd values are close to the observed value.
ggplot() +
  geom_point(aes(x= dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata= dataset)), color = 'blue') +
  ggtitle("level vs Salary(Polynomial Regression Model") +
  xlab("Level") +
  ylab("Salary")
# Predicting a new result with Linear Regression model, since we just want to predict the salary for 6.5 level
# we need only one cell.
y_pred <- predict(lin_reg, newdata = data.frame(Level = 6.5))
y_pred            
# Linear Regression model predicted $330378.8 salary that is too much as employee asked
# Predicting a new result with Polynomial Regression model
y_pred <- predict(poly_reg, data.frame(Level = 6.5,
                                       Level2 = 6.5^2,
                                       Level3 = 6.5^3,
                                       Level4 = 6.5^4))
                                      
y_pred
## Yes here is the best prediction for the Level6.5 salary....$158862.5, that is very close to the salary as future employee
## asked.