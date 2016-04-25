download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip", method = "curl")
unzip("data.zip")

library(lubridate)
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
power <- power[which(power$Date %in% c("1/2/2007","2/2/2007")),]
power$DateTime <- as.POSIXct(paste(dmy(power$Date), power$Time))

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(power$DateTime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(power$DateTime, power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(power$DateTime, power$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, type = "l", col = "red")
lines(power$DateTime, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")
plot(power$DateTime, power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
