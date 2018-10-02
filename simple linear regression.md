---
title: "Salary Data Set(Simple Linear Regression)"
author: "Varamihir"
date: "October 1, 2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
# Simple Linear Regression
data <- read.csv("Salary_Data.csv")
View(data)
```
#### Find out the linear correlation between salary and years of experience using Simple Linear Regression

```{r echo = TRUE}
library(caTools)
set.seed(123)
spilt <- sample.split(data$Salary, SplitRatio = 2/3)
training <- subset(data, spilt == TRUE)
training
testing <- subset(data, spilt == FALSE)
testing
```
# fitting simple regression to the training data set
```{r echo= TRUE}
regressor <- lm(formula = Salary ~ YearsExperience, data = training)
summary(regressor)
# Predicting the test data set
pred_Salary <- predict(regressor, newdata = testing)
pred_Salary
```
#Visualize training data set

```{r echo = TRUE}
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

```
