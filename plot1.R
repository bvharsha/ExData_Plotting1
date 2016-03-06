data <- read.table("household_power_consumption.txt", sep = ";", header = T)
relevant.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width = 480, height = 480)

# Dividing by 1000 to get the desired graph output as given in Coursera website

hist((as.numeric(relevant.data$Global_active_power)/1000), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()