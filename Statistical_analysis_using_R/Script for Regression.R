#An example when we cant apply Regression model
library(readr)
Placement_Data_Full_Class_3_ <- read_csv("/Users/adityaagre/Desktop/cool/academics/Sem5/Statistical_analysis_using_R/Placement_Data_Full_Class (3) - Placement_Data_Full_Class (3).csv")

 #Before finding correlation categorical variables should be removed
Data=select(Placement_Data_Full_Class_3_, ssc_p, hsc_p, degree_p, mba_p, salary)
is.na(Data)
#NA's are found in salary ,omit NA  entries 
Data=na.omit(Data)
cor(Data)
CORR=cor(Data)
library(corrplot)
corrplot(CORR, method="number")
#If salary is dependent variable its observed very poor correlation independent varibles 
#Let us check is there any outliers
ggplot(Data, aes(salary))+geom_boxplot()+xlim(200000,300000)
ggplot(Data, aes(ssc_p))+geom_boxplot()
ggplot(Data, aes(hsc_p))+geom_boxplot()
ggplot(Data, aes(mba_p))+geom_boxplot()
#Outliers are very less which can not affect on correlation
max(Data$salary)
summary(Data)
#Outliers are removed
New_Data=filter(Data, salary<300000, hsc_p<90)
cor(New_Data)
CORR=cor(Data)
corrplot(CORR, method="number")
#Still correlations are not good
#Cant apply prediction model as very less dependency is obsereved

#Now consider another data
library(readr)
 heart_data <- read_csv("/Users/adityaagre/Desktop/cool/academics/Sem5/Statistical_analysis_using_R/heart.data.csv")
Heart_Data=select(heart_data, -1)
#Before finding correlation categorical variables should be removed
cor(Heart_Data)
CORR=cor(Heart_Data)
library(corrplot)
corrplot(CORR, method="pie")
#Strong cor-relationship observed in independent and dependent variables   
#multicollinearity(Correlation in independent variable) is not obeserved
ggplot(Heart_Data, aes(biking))+geom_boxplot()
ggplot(Heart_Data, aes(smoking))+geom_boxplot()
ggplot(Heart_Data, aes(heart.disease))+geom_boxplot()
ggplot(Heart_Data, aes(heart.disease))+geom_histogram(fill="white", color="red")
ggplot(Heart_Data, aes(biking,heart.disease))+geom_point()
ggplot(Heart_Data, aes(smoking,heart.disease))+geom_point()

#Visulisation shows all data is normally distributed and no outliers

# Regression Model
Heart_disease.Model=lm(heart.disease~biking+smoking,Heart_Data)
summary(Heart_disease.Model)
#P-value is small than 0.05 so model is fit for prediction

#Create a new dataframe with the information needed to plot the model
plotting.data<-expand.grid( biking = seq(min(Heart_Data$biking), max(Heart_Data$biking), length.out=30),
  smoking=c(min(Heart_Data$smoking), mean(Heart_Data$smoking), max(Heart_Data$smoking)))
#Predict the values of heart disease based on your linear model
plotting.data$predicted.y <- predict.lm(Heart_disease.Model, newdata=plotting.data)

#Round the smoking numbers to two decimals
plotting.data$smoking <- round(plotting.data$smoking, digits = 2)
#Change the ‘smoking’ variable into a factor
plotting.data$smoking <- as.factor(plotting.data$smoking)
#Plot the original data
heart.plot <- ggplot(Heart_Data, aes(x=biking, y=heart.disease)) +
  geom_point()

heart.plot
#Add the regression lines
heart.plot <- heart.plot +
  geom_line(data=plotting.data, aes(x=biking, y=predicted.y, color=smoking))

heart.plot
#Make the graph ready for publication
heart.plot <-
  heart.plot +
  theme_bw() +
  labs(title = "Rates of heart disease (% of population) \n as a function of biking to work and smoking",
       x = "Biking to work (% of population)",
       y = "Heart disease (% of population)",
       color = "Smoking \n (% of population)")

heart.plot
#Final plot with equation of line
heart.plot + annotate(geom="text", x=30, y=1.75, label=" = 15 + (-0.2*biking) + (0.178*smoking)")
