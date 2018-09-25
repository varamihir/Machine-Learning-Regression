#Random Forest Regression, it is combination of decision trees
dataset <- read.csv("Position_Salaries.csv")
dataset<- dataset[2:3]


library(randomForest)
# Since this data is too small no need to create training and testing data sets
# Build a Random Forest regression model, and keep increasing the no. of ntree(10,100,500) parameters and check the prediction
# which one is close to the observed value
set.seed(1234)
regressor <- randomForest(x = dataset[1] , y = dataset$Salary,
                   ntree = 500)
# predicting a Salary for level6.5 ,that is close the value was observed using 500 ntrees... 
y_pred <- predict(regressor, newdata = data.frame(Level = 6.5))
# Visualising the Random forest regression results(for higher resolution and smoother) and works with non continous 
# variables
library(ggplot2)
x_grid <- seq(min(dataset$Level), max(dataset$Level),0.01)
#x_grid
ggplot() +
  geom_point(aes(x= dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata= data.frame(Level = x_grid))), color = 'blue') +
  ggtitle("level vs Salar(Random Forest Regression Model") +
  xlab("Level") +
  ylab("Salary")