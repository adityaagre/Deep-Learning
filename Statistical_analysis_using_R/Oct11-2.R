data = Placement_Data_Full_Class_3_Placement_Data_Full_Class_3_
View(Data)

## we want only placed student
data = filter(data, salary>0)

data1 = select(data, 3,5,8,11,13,15)
View(data1)

d2 = cor(data1)
View(d2)
