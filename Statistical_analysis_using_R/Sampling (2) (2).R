install.packages("tigerstats")
library(tigerstats)
View(CO2)

#Random sampling
#set.seed make this example reproducible
set.seed(1)
srs <- popsamp(10,CO2)
srs

#SRS-simple random sampling
#gives simple random sampling with 10 rows

#Systematic Sampling
View(CO2)
set.seed(49464)
Sys=sample(1:4,1)
start

sys.samp = seq(start, start + 4*(42-1), 42)
sys.samp
#n=84-number of observations in CO2

#Stratfied Sampling
set.seed(123)
Chilledd=subset(CO2,Treatment=="chilled")
Chilledd
#Gives subset i.e. strata of treatment chilled

set.seed(123)
nonChilledd=subset(CO2,Treatment=="nonchilled")
nonChilledd
#Gives subset i.e. strata of treatment nonchilled

chilled.samp=popsamp(3,Chilledd)
chilled.samp
#Gives random set of 3 from strata chilled

nonchilled.samp=popsamp(5,nonChilledd)
nonchilled.samp
#Gives random set 5 from strata nonchilled

stratafied = rbind(chilled.samp, nonchilled.samp)
stratafied 
#Merge two dataset

#Cluster sampling
#make this example reproducible
set.seed(1)

#create data frame
df <- data.frame(tour = rep(1:10, each=20),experience = rnorm(200, mean=7, sd=1))

#view first six rows of data frame
head(df)

#randomly choose 4 tour groups out of the 10
clusters <- sample(unique(df$tour), size=4, replace=F)

#define sample as all members who belong to one of the 4 tour groups
cluster_sample <- df[df$tour %in% clusters, ]

#view how many customers came from each tour
table(cluster_sample$tour)
