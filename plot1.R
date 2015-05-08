# Course Project 1. PLOT 1
# Exploratory Data Analysis
# Data Science Specialization
# May 7, 2015
# Carlos Patino

## Setup data for EDA (Make sure txt file with data is in your current working
## directory)

# Read table (nrows is set to 70000 since it covers up to 2007-02-03, which is
# more than enough to get the dates we need):
test <- read.table("household_power_consumption.txt", header=T, sep=";",
                   na.strings="?", nrows=70000,
                   colClasses="character")

# Adjust classes for all the columns:
test$Date <- as.Date(test$Date, format="%d/%m/%Y")
test$Time <- paste(test$Date, test$Time, sep=" ")
test$Time <- as.POSIXct(test$Time, format="%Y-%m-%d %H:%M:%S")
for (i in 3:9) {test[,i] <- as.numeric(test[,i])}

# Subset file to get only data for 2007-02-01 and 2007-02-02:
library(dplyr)
finalDF <- filter(test, Date == "2007-02-01" | Date == "2007-02-02")
rm(test)

## Plot using the Base System

# Plot 1
png(filename="plot1.png", width=480, height=480)
par(mfrow=c(1,1))
hist(finalDF$Global_active_power, breaks=20,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()