library("data.table")

setwd("C:/Users/moj_2/Documents/Moj_Docs/courses/Coursera/ExploratoryDataAnalysis/Projects/Project1/data")

#Reads in data from file 
#NOTE: Note that in this dataset missing values are coded as ?
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

#combinig Date and Time and making a POSIXct date
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


# Subset Dates between 2007-02-01 and 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


# Create plot 3 in .png format
png("plot3.png", width=480, height=480)
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2],col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
        ,lty=1, lwd=1)

dev.off()