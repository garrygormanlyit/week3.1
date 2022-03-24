# import csv file to rStudio
readfile <- read.csv("Building_Permits.csv")
class(readfile)
str(readfile)
summary(readfile)

# store full rows into new_data
new_data <- na.omit(readfile)
summary(new_data)
str(new_data)
new_data
#
# store rows with missing data
missing_data <- readfile[!complete.cases(readfile),]

# store rows with complete data
complete_data <- readfile[complete.cases(readfile),]
str(missing_data) # 177217 obs
str(complete_data) # 21683 obs
str(readfile) # 198900 obs

nrow(complete_data) # 21683 rows in complete_data
dim(complete_data) # 21683 rows and 43 columns in complete_data

d <- rnorm(10)
d



