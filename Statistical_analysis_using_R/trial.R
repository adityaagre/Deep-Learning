data()
data = data.frame(Global_YouTube_Statistics)
data
Data=spread(data, Country, category)
data_new = gather(Data, "hello", "hello_again", 27:50)
View(data_new)


