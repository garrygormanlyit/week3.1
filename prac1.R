man_data <- read.csv("managers.csv")
md.pattern(man_data)
man_data
my_na

# convert date field to a date datatype
man_data$Date <- as.Date(man_data$Date, "%m/%d/%y") 
man_data
str(man_data)

selRec <- man_data[man_data$Date <= "2018-10-15" & man_data$Date >= "2018-01-11", ] # why do i need the comma
selRec

# drop columns Q3 and Q4 from dataframe
df = subset(man_data, select = -c(Q3,Q4))
df
#
young <- man_data[man_data$Age >= 23 & man_data$Age <= 35, ]
young <- young[, c("Q1", "Q4")]
young <- na.omit(young$Q1)
young

oldMen <- man_data[man_data$Gender == "M" & man_data$Age > 25, ]
oldMen <- oldMen[, c(4:9)]
oldMen

randData <- man_data[sample(1:nrow(man_data), 3), ]
randData

library(dplyr)

# select random 4 rows of the dataframe 
mydata1 <- sample_n(man_data,3)
mydata2 <- sample_n(man_data,3)
mydata3 <- sample_n(man_data,3)
mydata4 <- sample_n(man_data,1)

# bind 4 dataframes into 1 - works if the dataframes have the same variables
rand10 <- rbind(mydata1, mydata2, mydata3, mydata4)
rand10

# sort by age
sortedAge <- man_data[order(man_data$Age),]
sortedAge

#Sort Managers data frame by Gender and then by age within each gender
sortedGenAge <- man_data[order(man_data$Gender, man_data$Age),]
sortedGenAge

# save rand10 df to csv. file name. keep row names
write.csv(rand10,"randomTen.csv", row.names = TRUE)
