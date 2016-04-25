download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip", method = "curl")
unzip("data.zip")

power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
power <- power[which(power$Date %in% c("1/2/2007","2/2/2007")),]

png("plot1.png", width = 480, height = 480)
hist(power$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()