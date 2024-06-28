#Problem Statement 1
library(ggplot2)
ie2=data.frame(Car_details_v3)
View(ie2)
df=ie2[c("fuel","mileage")]
set.seed(42)
df1<-df[sample(8000,100),]
ggplot(df1, aes(x = mileage , y=fuel)) +geom_point()+labs(x = "Fuel Type", y = "Mileage") + ggtitle("Mileage by Fuel Type")


#Problem Statement 2
df2=ie2[c("owner","km_driven")]
set.seed(42)
df3=df2[sample(8000,80),]
ggplot(df3, aes(x = owner, y = km_driven)) + geom_bar(stat = "identity", fill = "blue") + labs(x = "Owner", y = "Kilometers Driven") + ggtitle("Kilometers Driven by Owner")



#Problem Statement 3
summary(ie2)
model=lm(selling_price ~ year, data = ie2)

ie2=ie2[ie2$selling_price<1e7,]#remove outliers of very high price
ggplot(ie2, aes(x = year, y = selling_price)) + geom_point() + geom_smooth(method = "lm", se = FALSE, color = "blue") +labs(x = "Age of Cars", y = "Selling Price") + ggtitle("Relationship between Age of Cars and Selling Price")
ggplot(ie2, aes(x = year, y = selling_price)) +geom_point() +geom_smooth(method = "lm", se = FALSE, color = "blue") +labs(x = "Age of Cars", y = "Selling Price") +ggtitle("Relationship between Age of Cars and Selling Price") + geom_abline(intercept = coef(model)[1], slope = coef(model)[2], color = "red")

model




#Problem Statement 4
summary(ie2)
ggplot(ie2, aes(x = mileage, y = selling_price)) +geom_point() + geom_smooth(method = "lm", se = FALSE, color = "blue") +labs(x = "Mileage", y = "Selling Price") + ggtitle("Relationship between Mileage and Selling Price")
model=lm(selling_price ~ mileage, data = ie2)
summary(model)



#Problem Statement 5
df_petrol= ie2[ie2$fuel=="Petrol",]#creating Subsets
df_diesel=ie2[ie2$fuel=="Diesel",]#creating Subsets
#hypothesis Testing
t_test_result <- t.test(df_petrol$selling_price, df_diesel$selling_price)
t_test_result
