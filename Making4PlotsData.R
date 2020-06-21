## file loading and assigning classes
fileload <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
    colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
fileload$Date <- as.Date(fileload$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007 and remove incomplate observation
fileload <- subset(fileload,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
fileload <- fileload[complete.cases(fileload),]

## Combine Date and Time column and assigning name
dateTime <- paste(fileload$Date, fileload$Time)
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column and adding DateTime column
fileload <- fileload[ ,!(names(fileload) %in% c("Date","Time"))]
fileload <- cbind(dateTime, fileload)

## Format dateTime Column
fileload$dateTime <- as.POSIXct(dateTime)

## Ready to plot



