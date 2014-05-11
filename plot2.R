setwd("/Users/teyongliuwong/Desktop/John Hopkins University Data Science Specialization/4 Exploratory Data Analysis/Peer Assignment 1")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip", "household_power_consumption.txt")

data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007", ]
data$Date <- strptime(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
rownames(data) <- NULL

png(file="plot2.png")
with(data, plot(Global_active_power, type="l", ylab="Gloabal Active Power (kilowatts)", xlab="", xaxt="n"))
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()

