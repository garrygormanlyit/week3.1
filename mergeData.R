new_managers_data <- read.csv("MoreData.csv")
str(new_managers_data)

str(managers)
managers

df = subset(new_managers_data, select = -c(Name, Address, Status))
str(df)

#
# create a new row where all 
df[nrow(df) + 1,] <- NA

# print all rows the contain NA
df[rowSums(is.na(df)) > 0, ] 

# convert date field to a date datatype
df$Date <- as.Date(df$Date, "%m/%d/%Y")

banistor <- subset(managers, select = -c(AgeCat, Summary, Mean))
str(banistor)
str(df)

# reorder columns
col_order <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")
df <- df[, col_order]
banistor <- banistor[, col_order]
str(df)
str(banistor)

# combine two dataframes
combind_df <- rbind(df, banistor)
str(combind_df)

# create new AgeCat column
combind_df$AgeCat[combind_df$Age >= 45] <- "Elder"
combind_df$AgeCat[combind_df$Age >= 26 & combind_df$Age <= 44] <- "Middle Aged"
combind_df$AgeCat[combind_df$Age <= 25] <- "Young"
combind_df$AgeCat[is.na(combind_df$Age)] <- "Elder"

# categories age categories
agecat <- factor(combind_df$AgeCat, 
                 order=TRUE,
                 levels = c("Young", "Middle Aged", "Elder"))

str(combind_df)
class(combind_df$AgeCat) 