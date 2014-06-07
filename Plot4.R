file_path = "household_power_consumption.txt"
# Replace with appropriate path of file "household_power_consumption.txt"

data <- read.table(file_path, sep = ";", header = TRUE, stringsAsFactors=FALSE)

data <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename = "plot4.png")

par(mfrow = c(2, 2))

plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type="l")

plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type="l")

plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l")

points(data$DateTime, data$Sub_metering_2, col = "red", type="l")

points(data$DateTime, data$Sub_metering_3, col = "blue", type="l")

legend("topright", col = c("black", "red", "blue"),lty=c(1,1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")

dev.off()