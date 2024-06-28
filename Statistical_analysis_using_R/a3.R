data1 = Placement_Data_Full_Class_3_Placement_Data_Full_Class_3_ 

# collect info of all academic performers.
# Find performance of HSC and SSC gender-wise.
# Find avg salaries as per specification of mba
# Find avg mba_p as per gender.


data2 = select(data1, 3:9, 13)

data3 = group_by(data1, gender)
data4 = summarise(data3, avg_ssc = mean(ssc_p), avg_hsc = mean(hsc_p))

data5 = group_by(data1, specialisation)
data6 = summarise(data5, avg_pagar = mean(salary)) 
## this gives NA as some salary values are NA

data7 = summarise(data3, avg_mba_gun_prapt = mean(mba_p))

data25= group_by(data8, workex)
data26 = summarise(data25, avg = mean(salary))
                  


# Filter the data for placed students

data8 = filter(data1, salary>0)

data9 = arrange(data8, salary)

data10 = filter(data8, salary>400000)


## Spread the data of salary as per MBA spec
data10 = spread(data8, specialisation, salary)

data11 = gather(data10, "gathered_spec","gathered_pagar", 14:15)

data12 = mutate(data8, "avg_of_hsc_ssc" = ((hsc_p+ssc_p)/2))                   



