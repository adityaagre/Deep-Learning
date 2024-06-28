data()
View(mtcars)

data_new = mtcars

data1 = select(data_new, 2:5)
data1

data2 = select(mtcars, -cyl)
View(data2)

data3 = filter(mtcars, mpg>15)
View(data3)

data4 = slice(mtcars, 5:25)


data5 = arrange(mtcars, desc(gear), wt)

data6 = arrange(mtcars, desc(gear))

data7 = group_by(data_new, cyl)

data8 = summarise(data7, avg1 = mean(wt))

data9 = mtcars %>% select(1:9) %>% filter(wt>=3) %>% arrange(cyl)

## Is there any column for which we can arrange or sort
## Sort the data acc to day and hour
data10 = arrange(storms, day, hour)

## Extract the data for tropical stom 
data11 = filter(storms, status == "tropical storm")

## Remove column with NA from storms
data12 = select(storms, -9, -12, -13)



