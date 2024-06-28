View(diamonds)

## Avg with summarise:
data1 = summarise(diamonds, avg=mean(carat))
View(data1)

data2 = group_by(diamonds, color) %>% summarise("avg"=mean(price))
View(data2)
## J has max average

## Boxplot of prices per color
ggplot(diamonds, aes(price, color)) + geom_boxplot()
## J has least outliers

ggplot(diamonds, aes(price)) + geom_boxplot() + facet_wrap(~color)

## 
ggplot(diamonds, aes(color)) + geom_bar()


## Measures of dispersion
## range, sd, cv
## sd = standard deviation
print(sd(diamonds$price))
## coefficient of variation = (sd/mean)*100
print(var(diamonds$price))
## Range = max - min
print(range(diamonds$price))

