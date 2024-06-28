data = mtcars
View(data)
m1 = lm(mpg ~ hp + drat + wt, data = data)
summary(m1)

summary(data)
