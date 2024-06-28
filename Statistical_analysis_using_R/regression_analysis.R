df = data.frame(a = c(1,2,3,4,5,6,7), b = c(10,20,30,40,55,60,70))
View(df)

## a is independent var. b is dependent
## To get regression line, y = mx + c
## so, b = ma + c.  m=slope, c=intercept

model1 = lm(b~a, df)
View(model1)
summary(model1)
## adjusted r squared = 0.99. so, very high accuracy
## p-value 1.41e-06
## This p value is less than 0.05
## therefore there is dependency between the variables.
## (MODEL IS SIGNIFICANT)
## R-squared shows accuracy of model



## We got values of slope and intercept



