## Aditya Agre 121B1B006 
## TYCOA6

## Q1
ID = c(101,102,103,104,105,106)
Age = c(45,61,34,33,56,71)
Gender = c("M", "F","F","M","M","F")
Adhar = c("YES","NO","YES","YES","NO","YES")
Mobile = c(123456789,223456789,323456789,423456789,523456789,623456789)

dataframe = data.frame(ID,Age,Gender,Adhar,Mobile)
View(dataframe)


## Q2
data()
View(Titanic)
# summary of titanic
summary(Titanic)
# structure of titanic
str(Titanic)


# Q3
library(readr)
healthcare_dataset_stroke_data <- read_csv("healthcare-dataset-stroke-data.csv", col_types = cols(bmi = col_number()))
View(healthcare_dataset_stroke_data)

Data1 = data.frame(healthcare_dataset_stroke_data)
View(Data1)


# Q4
is.na(Data1)
sum(is.na(Data1))
which(is.na(Data1))

#Q5
D1 = select(Data1,-6)
View(D1)

#Q6
D2 = spread(Data1, work_type, stroke)
View(D2)

# Q7
D3 = filter(Data1, ever_married == "No", work_type == "Private")
View(D3)

# Q8
D4 = arrange(Data1, gender,age)
View(D4)

# Q9
D5 = group_by(Data1, gender)
D6 = summarise(D5, Average_age = mean(age))
View(D6)
