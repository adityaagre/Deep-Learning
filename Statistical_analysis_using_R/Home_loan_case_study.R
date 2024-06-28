# Case Studyon home loan

data1 = loan_sanction_test




# Which gender has more applicants
plot1 = ggplot(loan_sanction_test, aes(Gender)) + geom_bar()

plot1


## Therefeore, MOst male applicants

## q2, areawise gender variations
plot2 = ggplot(loan_sanction_test, aes(Gender, fill = Property_Area)) + geom_bar()
plot2
## This gives stack bar
## Hard to check frequencies
## so, group them (position = dodge)
plot3 = ggplot(loan_sanction_test, aes(Gender, fill = Property_Area)) + geom_bar(position = "dodge")
plot3

plot4 = ggplot(loan_sanction_test, aes(Gender, fill = Property_Area)) + geom_bar(position = "fill")
plot4
## This plot is best for internal comparisons.
## All these 3 graphs are imp. 1. stack, 2. group, 3. 

## q3 mean loan amt acc to categories 
data5 = group_by(data1, Self_Employed)
data6 = summarise(data5, Average_LoanAmount = mean(LoanAmount))
data6
## But here some spaces have loan amounts as null. To handle this,
## We are omitting NA values
data7 = data1 %>% na.omit(data1) 
data7
data5 = group_by(data7, Self_Employed)
data6 = summarise(data5, Average_LoanAmount = mean(LoanAmount))
data6

## OR:
data8 = data1 %>% na.omit(data1) %>% group_by(Self_Employed) %>%  summarise(Average_LoanAmount = mean(LoanAmount))
data8

## Q4: If co-applicants income is zero, then find the mean of loan amount and loan-
## -amt term. compare to that if co-applicants income is not zero
## 
## Here, the coapplicant income is not given as zero or non zer. Therefore we cant have groupby.
## so, we filter and create 2 datasets.

data_a = filter(data7, CoapplicantIncome == 0) %>% summarise(mean_amt = mean(LoanAmount))
data_a

data_b = filter(data7, CoapplicantIncome > 0) %>% summarise(mean_amt = mean(LoanAmount))
data_b

## OR
data_a2 = filter(data7, CoapplicantIncome == 0)
data_a2_mean = summarise(data_a2, mean_amt = mean(LoanAmount))
data_a2_mean ## This gives 127

data_b2 = filter(data7, CoapplicantIncome > 0)
data_b2_mean = summarise(data_b2, mean_amt = mean(LoanAmount))
data_b2_mean ## This gives 144. Now we can compare for both.

## Q5 
plot10 = ggplot(loan_sanction_test, aes(LoanAmount, Education)) + geom_boxplot()
plot10
## If you want to see this genderwise too, 
plot11 = ggplot(loan_sanction_test, aes(LoanAmount, Education)) + geom_boxplot() + facet_wrap(~Gender)
plot11




