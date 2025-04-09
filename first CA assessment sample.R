View(ufo)
ufo_data <- read.csv("ufo.csv", stringsAsFactors = FALSE)
ufo_data
str(ufo_data)
head(ufo_data, 15)
nrow(ufo_data)
# answer 2
ufo_data$datetime <- as.Date(ufo_data$datetime, format = "%m/%d/%y")
ufo_data$datetime
class(ufo_data$datetime)
#answer 3
str(ufo_data$datetime)
#answer 4
names(ufo_data)
names(ufo_data)[6] <- "DurationSeconds"
names(ufo_data)[7] <- "DurationHrsMins"
names(ufo_data)[9] <- "DatePosted"
names(ufo_data)
#answer 5
class(ufo_data$latitude)
ufo_data$latitude <- as.numeric(ufo_data$latitude)
ufo_data$latitude
class(ufo_data$latitude)
str(ufo_data)
#answer 6
library(mice)
library(VIM)
md.pattern(ufo_data)
missing_values <- aggr(ufo_data, prop = FALSE, numbers = TRUE)
summary(missing_values)
matrixplot(ufo_data)
png("missingvars.png")
#sub questions :
complete_data <- complete.cases(ufo_data)
complete_data
sum(complete_data)
#another way
complete_cases <- sum(complete.cases(ufo_data))
complete_cases
sum(is.na(ufo_data$datetime))
colSums(is.na(ufo_data))
round(complete_data / nrow(ufo_data) * 100, 2)
#The data frame has missing values across multiple variables. 
#The variable with the most missing entries appears to be either 
#durationHrsMins or latitude. Approximately X% of the data is fully 
#complete.

#answer 7
ufo_data_clean <- na.omit(ufo_data)
ufo_data_clean
deleted_records <- nrow(ufo_data) - nrow(ufo_data_clean)
deleted_records

#answer 8
ufo_sorted <- ufo_data[order(ufo_data$shape, ufo_data$city), ]
ufo_sorted
ufo_sorted1 <- ufo_data_clean[order(ufo_data_clean$shape, ufo_data_clean$city), ]
ufo_sorted1
include_list <- names(ufo_data) %in% c("datetime", "city", "country", "shape")
include_list
sorted_ufo_data <- ufo_data[(include_list)]
sorted_ufo_data
head(sorted_ufo_data, 15)
str(sorted_ufo_data)

#answer 9
ufo_gb_disk <- subset(ufo_data, ufo_data$country == "gb" & ufo_data$shape == "disk")
ufo_gb_disk
ufo_gb_disk <- subset(ufo_data, country == "gb" & shape == "disk")
nrow(ufo_gb_disk)

#answer 10
write.csv(ufo_data_clean, file = "modified_ufo.csv")
write.csv(ufo_gb_disk , file = "ufo_gb.csv")
write.csv(sorted_ufo_data , file = "sorted_ufo.csv")
