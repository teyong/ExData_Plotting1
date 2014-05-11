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

png(file="plot3.png")
with(data, plot(Sub_metering_1, type="l", col="black", ylab="Engergy sub metering", xlab="", xaxt="n"))
with(data, {lines(Sub_metering_2, col="red")
            lines(Sub_metering_3, col="blue")})
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", lwd=2, lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

