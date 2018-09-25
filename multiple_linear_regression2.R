dataset <- read.csv("50_Startups.csv")
View(dataset)
# In machine learning algorithum first we need to convert factor variable into labels..
# Profit is a dependent variable while others are independent variable  
dataset$State <- factor(dataset$State,
                        levels = c("New York","California","Florida"),
                        labels = c(1,2,3))
head(dataset)
#Splitting dataset into training and testing dataset
library(caTools)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set<- subset(dataset, split == TRUE)
testing_set <- subset(dataset, split == FALSE)

# lets build a multilinear Regression model using training dataset
regressor <- lm(formula= Profit ~.,
                data = training_set)
summary(regressor)
# checking Summary we should always check for P value it should always be less than 5% or .05.Lower the p-Value more
#  statisticaly siginficant that vairable is.
#We can see R made dummy variable state2, state3 by itself and automaticaly removed state1 variable.
# In this case we see cofficients (3***) next to R.D.Spend that mean this is the only variable that has impact on profit.

# Lets build a optimal model using backward elemination
# Step2 build a model with all the variables using main data set.
regressor1 <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend +State,
                data = dataset)

summary(regresso1)
# Step 3 What I noticed in summary of regressor, State has higher P value > 0.05, it means it doesn't have any 
# impact on profit dependent variable.
# Step 4 Remove the state variable and  fit the model without this variable

regressor2 <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend, data = dataset)
summary(regressor2)
# Now what we see that Administration variable has higher p value > 0.05, that means Administration variable is not statstically siginficant
# so we can remove this variable.
regressor3 <-lm(Profit ~R.D.Spend + Marketing.Spend, data = dataset)
summary(regressor3)
# In summary of regressor 3, Marketing spend has p value is 0.06 that is very close to siginificant(0.05)... But still R.D.Spend
# will remove this variable and build a model with only R.D.Spend variable

regressor4 <- lm(Profit~ R.D.Spend, data = dataset)
summary(regressor4)
        
