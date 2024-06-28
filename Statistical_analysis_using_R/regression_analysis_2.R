## Regression model for heart disesase dataset


data1 = heart_data
summary(data1)
## First column is only serial number.
## removing it
data2 = select(data1, -1)
data2


## heart diseas is dependent variable
## is heart disease normally distributed?
summary(data2)
## heart disease has mean almost equal to median.
## So, the data is normally distributed.

## Now lets look at boxplot to make sure
ggplot(data2, aes(heart.disease)) + geom_histogram()
ggplot(data2, aes(heart.disease)) + geom_boxplot()
## Looking at both graphs, mean almost equal to mode.
## Therefore, heart disease is a normally distributed dependent variable

## Find relationship between dependent and independent variables
## dep var = heart disease
## indep var: 1. biking, 2. smoking
## We will use scatterplot
ggplot(data2, aes(heart.disease, smoking)) + geom_point()
## Scattered graph
## Positive correlation
ggplot(data2, aes(heart.disease, biking)) + geom_point()
## Strong negative correlation

## Now find correlation matrix
cor(heart_data)

## There are strong negative effects of biking on heart disease
## There are positive but weak effects of smoking habits on chances of heart disease

## Multiple linear regression
## Considering 2 independent variables at once(biking and smoking)
## dep var = heart disease

model2 = lm(heart.disease ~ biking + smoking, data2)
View(model2)
model2[["coefficients"]]
## Output:
## (Intercept)      biking     smoking 
## 14.9846580  -0.2001331   0.1783339 
## so, line equation is:
##  heart disease = -0.2001(biking) + 0.1783(smoking)

## Is this a significant model?
summary(model2)
## Adjusted R-squared:  0.9795 
## p-value: < 2.2e-16


## Model is significantly good. 
##(There is dependency between dependent and independent variables)