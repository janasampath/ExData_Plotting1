## Coursera Course - Exploratory Data Analysis 
## Course Project 1

## This assignment uses the data set - "Individual household electric power consumption Data Set" 
## provided by UC Irvine Machine Learning Repository. This is a huge dataset with 2,075,259 rows and 9 columns. 
## For this assignment only data from the dates 2007-02-01 and 2007-02-02 will be used.
## The data file should be in the working directory of R

## The goal of this assignment is to examine how household energy usage varies over a 
## 2-day period in February, 2007. 
## Four plots will be generated using the base plotting system.
## These four plots will be saved as PNG files of 480x480 pixel resolution in the working directory

## Plot 4 - Four plots in one grid

## Read the big data set
powerData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Subset the data only for "1/2/2007" and "2/2/2007" 
startDate <- "1/2/2007"
endDate <- "2/2/2007"
powerSubData <- subset(powerData, powerData$Date == startDate | powerData$Date == endDate)

## Combine the Date and Time columns to create Tims Stamp
powerSubData$timeStamp <- strptime(paste(powerSubData$Date,powerSubData$Time), format="%d/%m/%Y %H:%M:%S")

## Open the device for PNG and give file name Plot1.png
png(file="plot4.png")

## Set the grid for 2 x 2 plots 
par(mfrow=c(2,2))

## Plot 1 - Time Stamp Vs Global Active Power
## Setup the empty plot 
plot(x=powerSubData$timeStamp, y=powerSubData$Global_active_power, 
     type='n', xlab='', ylab='Global Active Power')
## Plot the lineTime Stamp Vs Global Active Power
lines(x=powerSubData$timeStamp, y=powerSubData$Global_active_power, type='l')

## Plot 2 - Time Stamp Vs Voltage
## Setup the empty plot 
plot(x=powerSubData$timeStamp, y=powerSubData$Voltage, 
     type='n', xlab='datetime', ylab='Voltage')
## Plot the line for Time Stamp Vs Voltage
lines(x=powerSubData$timeStamp, y=powerSubData$Voltage, type='l')

## Plot 3 - Time Stamp Vs Energy Sub metering 
## Setup the empty plot 
plot(x=powerSubData$timeStamp, y=powerSubData$Sub_metering_1, 
     type='n', col='blue',
     xlab='', ylab='Energy sub metering')
## Plot the line for Sub Metering 1
lines(x=powerSubData$timeStamp, y=powerSubData$Sub_metering_1, type='l', col='black')
## Plot the line for Sub Metering 2
lines(x=powerSubData$timeStamp, y=powerSubData$Sub_metering_2, type='l', col='red')
## Plot the line for Sub Metering 3
lines(x=powerSubData$timeStamp, y=powerSubData$Sub_metering_3, type='l', col='blue')
## Add the legend for the three lines
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue"), bty="n")

## Plot 4 - Time Stamp Vs Global reactive power
## Setup the empty plot 
plot(x=powerSubData$timeStamp, y=powerSubData$Global_reactive_power, 
     type='n', xlab='datetime', ylab='Global_reactive_power')
## Plot the line Time Stamp Vs Global reactive power
lines(x=powerSubData$timeStamp, y=powerSubData$Global_reactive_power, type='l')

## Close the device and save the PNG file
## The file will be saved in the current working directory
dev.off()