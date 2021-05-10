library("data.table")

setwd("C:/Users/moj_2/Documents/Moj_Docs/courses/Coursera/ExploratoryDataAnalysis/Projects/Project1/data")

#Reads in data from file 
#NOTE: Note that in this dataset missing values are coded as ?
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

#combinig Date and Time and making a POSIXct date
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


# Subset Dates between 2007-02-01 and 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


# Create plot 4 in .png format
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2),bty="n")

# top left
plot(powerDT[, dateTime], powerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# top right
plot(powerDT[, dateTime],powerDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# bottom right
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2], col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=1
       , bty="n"
       , cex=.5) 

# bottom left
plot(powerDT[, dateTime], powerDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()