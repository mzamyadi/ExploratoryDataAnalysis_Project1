library("data.table")

setwd("C:/Users/moj_2/Documents/Moj_Docs/courses/Coursera/ExploratoryDataAnalysis/Projects/Project1/data")

#Reads in data from file 
#NOTE: Note that in this dataset missing values are coded as ?
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")


# Change Date Column from char type to Date Type
# NOTE: .SD is a data.table containing the Subset of x's Data for each group, 
# NOTE 2: DT[, .SD, .SDcols=x:y]   means select columns 'x' and 'y'
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Subset Dates between 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Create plot 1 in .png format
png("plot1.png", width=480, height=480)
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()