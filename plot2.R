ry("data.table")
library("data.table")

setwd("C:/Users/moj_2/Documents/Moj_Docs/courses/Coursera/ExploratoryDataAnalysis/Projects/Project1/data")


#Reads in data from file 
#NOTE: Note that in this dataset missing values are coded as ?
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")


#combinig Dat and Time and making a POSIXct date
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


# Subset Dates between 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]


# Create plot 2 in .png format
png("plot2.png", width=480, height=480)
plot(x = powerDT[, dateTime]
     , y = powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()