data()
View(diamonds)

## ggplot: gg = Grammar of Graphics
## aes = aesthetics

## rplot tp 1
ggplot(diamonds, aes(x = cut)) + geom_bar()

## here bars dont have their value/ frequencies written over them.
## We also want colors for bars
## And customize axis names

ggplot(diamonds, aes(x = cut)) + geom_bar(color ="Blue")
## But this only colors the boundaries of bars

ggplot(diamonds, aes(x = cut)) + geom_bar(color = "Red", fill = "Yellow")

ggplot(diamonds, aes(x = cut)) + geom_bar(color = "Red", fill = "Yellow", size = 10)
## This changes the boundary width

ggplot(diamonds, aes(x = cut)) + geom_bar(fill = "Yellow")

ggplot(diamonds, aes(x = cut)) + geom_bar(fill = "Yellow", width = 0.5)
## Note max width is 1

## ggplot(diamonds, aes(x = cut, y = "price") + geom_point()
## Point plot needs both the x and y quantities.
## Bith must be numeric values. Therefeore this gave error.


## POINT GRAPH
ggplot(diamonds, aes(x = depth, y = price)) + geom_point()

View(CO2)
## We'll make a point plot with this low rows dataset. Eg: CO2

ggplot(CO2, aes(x = conc, y = uptake)) + geom_point()

data2 = arrange(CO2, conc)
ggplot(data2, aes(x = conc, y = uptake)) + geom_point()

ggplot(data2, aes(x = conc, y = uptake)) + geom_point(size = 2)

ggplot(data2, aes(x = conc, y = uptake)) + geom_point(size = 5)

ggplot(data2, aes(x = conc, y = uptake)) + geom_point(color = "Green", size = 3)



## Histogram 
## Again works on one var. (x only)

ggplot(CO2, aes(x = uptake)) + geom_histogram(color = "Blue")
## Here blue color is only given to bar boundaries only

ggplot(CO2, aes(x = uptake)) + geom_histogram(binwidth = 10, fill = "Red", color = "Yellow", size = 2)
## Width of bins that the data is divided in

## But in histogram we cant tell where most data is cincentrated



## Boxplot

ggplot(CO2, aes(x = uptake)) + geom_boxplot()
## this gives you min, q1, median, q3, max
## Here no outliers are found

## Histogram is useful only when data is normally distributed.
## Not possible generally

## Normal distribution: median cooincides with average















