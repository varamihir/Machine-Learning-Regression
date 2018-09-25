dataset <- read.csv("Position_Salaries.csv")
dataset<- dataset[2:3]
dataset

library(rpart)
# Since this data is too small no need to create training and testing data sets
# Build a decision tree model
regressor <- rpart(Salary ~., 
                   dataset, control = rpart.control(minsplit=1))
# predicting a Salary for level6.5
y_pred <- predict(regressor, newdata = data.frame(Level = 6.5))
# Visualising the Decision tree model results(for higher resolution and smoother) and works with non continous 
# variables
library(ggplot2)
x_grid <- seq(min(dataset$Level), max(dataset$Level),0.01)
x_grid
ggplot() +
  geom_point(aes(x= dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata= data.frame(Level = x_grid))), color = 'blue') +
  ggtitle("level vs Salary(Decision Tree Regression Model") +
  xlab("Level") +
  ylab("Salary")

# we can just plot the tree using this code
#plot(regressor)
#text(regressor)