## 1.Random Sampling

sample(1:10, 3)
##sample(1:10, 11)
sample(1:10, 25, replace = "true")




## 2.Systematic Sampling

df1 = data.frame(a = c(1,2,3,4,5,6,7,8,9,10), b = c("a","b","c", "d", "e", "f", "g", "h", "i","j"), c = c(11,12,33,44,55,66,77,88,99,100))
df1

obtain_sys = function(N,n)
{
  ## N is population size
  ## n is sample size
  k = floor(N/n)
  r = sample(1:k, 1)
  ## We want terms with k difference between them
  seq(r, r + k*(n-1), k)
}

sys_sample_df = df1[obtain_sys(nrow(df1),3), ]



## 3.Stratified sampling
group_a = subset(supermarket_sales, Branch == "A")
group_b = subset(supermarket_sales, Branch == "B")
group_c = subset(supermarket_sales, Branch == "C")

sample1 = popsamp(30,group_a)
sample2 = popsamp(30,group_b)
sample3 = popsamp(30,group_c)

samp_final = rbind(sample1,sample2,sample3)
View(samp_final)

View(diamonds)

