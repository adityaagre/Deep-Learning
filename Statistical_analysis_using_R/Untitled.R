data()
View(diamonds)

Data1 = diamonds
View(Data1)

data1 = spread(Data1, price,color)

data2 = filter(Data1, price > 18500)
View(data2)

data3 = arrange(Data1,desc(price))
View(data3)

data4 = select(Data1, -x, -y, -z)

data5 = group_by(Data1, cut)
data6 = summarise(data5, avg_value = mean(price))
View(data6)

ggplot(Data1, aes(cut)) + geom_bar()

## Now change width of barplot 
ggplot(Data1, aes(cut)) + geom_bar(width = 0.25)
## Give border 
ggplot(Data1, aes(cut)) + geom_bar(color = "Red")
