data <- read.table("household_power_consumption.txt", sep = ";", header = T)
relevant.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

conv.time <- strptime(paste(relevant.data$Date, relevant.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# Dividing by 1000 to get the desired graph output as given in Coursera website
plot(conv.time, (as.numeric(relevant.data$Global_active_power)/1000), type="l", xlab="", ylab="Global Active Power")

plot(conv.time, as.numeric(relevant.data$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(conv.time, as.numeric(relevant.data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab = "")
lines(conv.time, as.numeric(relevant.data$Sub_metering_2), type="l", col="red")
lines(conv.time, as.numeric(relevant.data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1, col=c("black", "red", "blue"))

plot(conv.time, as.numeric(relevant.data$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()