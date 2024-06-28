View(iris)
data()
dat = iris # load the iris dataset and renamed it dat
#preview of this dataset and its structure:

head(dat) # first 6 observations
str(dat) # structure of dataset
min(dat$Sepal.Length)
mx = max(dat$Sepal.Length)

#Alternatively the range() function
rng = range(dat$Sepal.Length)
rng
# mean, median, mode
mean(dat$Sepal.Length)
median(dat$Sepal.Length)
#First and third quartile
quantile(dat$Sepal.Length, 0.25) # first quartile
quantile(dat$Sepal.Length, 0.75) # third quartile

#Standard deviation and variance
sd(dat$Sepal.Length) # standard deviation
var(dat$Sepal.Length) # variance
#to compute the standard deviation (or variance) of multiple variables at the same time
lapply(dat[, 1:4], sd)
lapply(dat[, 1:4], mean)
#Summary
summary(dat)
## seperate sumary for each species
by(dat, dat$Species, summary)
by(diamonds, diamonds$cut, summary)

#Desriptive analysis by 
library(pastecs)
stat.desc(dat)

#Desriptive analysis by descr 
install.packages("summarytools")
descr(dat, headings = FALSE ) # most common descriptive statistics
descr(dat, headings = FALSE, stats = "common" )

#Coefficient of variation
cv_ = sd(dat$Sepal.Length) / mean(dat$Sepal.Length)
cv_ 

#Mode
# number of occurrences for each unique value
tab <- table(dat$Sepal.Length) 
tab

sort(tab, decreasing = TRUE) # sort highest to lowest
sort(table(dat$Species), decreasing = TRUE)

#To visualize dispersion of Sepal Length species wise
ggplot(dat) + aes(Sepal.Length, Species) + geom_boxplot()+geom_point()
Dat1=group_by(dat, Species)
df=summarise(Dat1, sd=sd(Sepal.Length), CV=(sd(Sepal.Length)/mean(Sepal.Length))*100)
df
#Correlation
Data1=select(iris, -Species)
cor(Data1)
d1=cor(Data1)
library(corrplot)
corrplot(d1)
corrplot(d1, method="number")
corrplot(d1, method="pie")

#Scatterplot to understand Correlation
plot(dat$Sepal.Length, dat$Petal.Length)
ggplot(dat) +
  aes(x = Sepal.Length, y = Petal.Length) +
  geom_point(size=1.5, col="Blue") + labs(title = "Relation Sepal Length and Petal Length")
ggplot(dat) +
  aes(x = Sepal.Length, y = Petal.Length, colour = Species) +
  geom_point()

#Density plot
#Density plot is a smoothed version of the histogram and is used in the same concept, that is, to represent the distribution of a numeric variable. The functions plot() and density() are used together to draw a density plot:
plot(density(dat$Sepal.Length))
d=select(SDAUR_Continuous_Evaluation_Sheet_22_23_4_, 1:9)
d=data.frame(d) 
