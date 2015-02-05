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

## Plot 1 - Histogram of Global Active Power.

## Read the big data set
powerData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Subset the data only for "1/2/2007" and "2/2/2007" 
startDate <- "1/2/2007"
endDate <- "2/2/2007"
powerSubData <- subset(powerData, powerData$Date == startDate | powerData$Date == endDate)

## Combine the Date and Time columns to create Tims Stamp
powerSubData$timeStamp <- strptime(paste(powerSubData$Date,powerSubData$Time), format="%d/%m/%Y %H:%M:%S")

## Open the device for PNG and give file name Plot1.png
png(file="plot1.png")

## Histogram of the Global Active Power in Kilowatts
hist(powerSubData$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power",
     col="red")

## Close the device and save the PNG file
## The file will be saved in the current working directory
dev.off()
