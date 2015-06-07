data <- read.table("household_power_consumption.txt", sep = ";", header = T)
relevant.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

conv.time <- strptime(paste(relevant.data$Date, relevant.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png")

# Dividing by 1000 to get the desired graph output as given in Coursera website

plot(conv.time, (as.numeric(relevant.data$Global_active_power)/1000), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()