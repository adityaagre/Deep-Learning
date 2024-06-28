library(pastecs)


View(iris)
data = iris
head(data)

## structure of data
str(data)

## measures of 1 column 
mean(data$Sepal.Length)
max(data$Sepal.Length)
range(data$Sepal.Length)
median(data$Sepal.Length)
quantile(data$Sepal.Length)
quantile(data$Sepal.Length, 0.75)
sd(data$Sepal.Length)
var(data$Sepal.Length)

# All measures for all tbles
summary(data)

## Summary per species
by(data, data$Species, summary)

## complete summary with additional info.
stat.desc(data)

## standard dev for columns 1 to 4
lapply(data[, 1:4], sd)

## mean for columns 1 to 4
lapply(data[, 1:4], mean)





## install.packages("summarytools")
library(summarytools)

## Describe
descr(data, headings = FALSE)
descr(data, headings = FALSE, status = "common")

newdata = select(data, -Species)

## Co-relation
## -1 to 1
## negative corr: ye badhne se wo ghatta hai
cor(newdata)

## For plotting corelations
## install.packages("corrplot")
library(corrplot)

d1 = cor(newdata)
corrplot(d1)
corrplot(d1, method = "number")
corrplot(d1, method = "pie")
corrplot(d1, method = "square")




