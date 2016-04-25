download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip", method = "curl")
unzip("data.zip")

library(lubridate)
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
power <- power[which(power$Date %in% c("1/2/2007","2/2/2007")),]
power$DateTime <- as.POSIXct(paste(dmy(power$Date), power$Time))

png("plot2.png", width = 480, height = 480)
plot(power$DateTime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()