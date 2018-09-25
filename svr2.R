dataset <- read.csv("Position_Salaries.csv")
dataset
dataset <- dataset[,2:3]
dataset
# No need for training and test data set, as it is so small
# Build a SVR model
library(e1071)
regressor <- svm(Salary ~.,
                 data = dataset,
                 type = "eps-regression")
# predicting a Salary for level6.5

y_pred <- predict(regressor, newdata = data.frame(Level = 6.5))
# This model predicted $177859 salary for level 6.5
# Visualising the SVR results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = "red") +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)), color = "blue") +
  ggtitle("Salary vs level(SVR") +
  xlab("Level") +
  ylab("Salary")
# this model predicted most of the salaries very close to what we have in the data. The only outlier we see
# CEO salary...