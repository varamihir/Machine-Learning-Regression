# Simple Linear Regression
data <- read.csv("Salary_Data.csv")
View(data)
# Salary is dependent variable and yrs of experience is Independent
# There is no missing value.
# Split the data into training and testing data sets
#lets spilit in 2/3
library(caTools)
set.seed(123)
spilt <- sample.split(data$Salary, SplitRatio = 2/3)
training <- subset(data, spilt == TRUE)
training
testing <- subset(data, spilt == FALSE)
testing
# fitting simple regression to the training data set

regressor <- lm(formula = Salary ~ YearsExperience, data = training)
summary(regressor)
# Predicting the test data set
pred_Salary <- predict(regressor, newdata = testing)
pred_Salary
#Visualize training data set
library(ggplot2)
ggplot()+
  geom_point(aes(x = training$YearsExperience, y = training$Salary), 
             color = "red")+
  geom_line(aes(x = training$YearsExperience, y = predict(regressor, newdata = training)), 
            color = "blue")+
  ggtitle("Salary Vs yrs of Experience(training set)")+
  xlab("year of Experience")+
  ylab("Salary")
# Visualize test data set
ggplot()+
  geom_point(aes(x = testing$YearsExperience, y = testing$Salary),
             color = 'red')+
  geom_line(aes(x = training$YearsExperience, y = predict(regressor, newdata = training)),
            color ='blue')+
  ggtitle("Salary vs Yrs of Experience(testing)")+
xlab("Yrs of experience")+
ylab("Salary")
  

