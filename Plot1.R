file_path = "household_power_consumption.txt"
# Replace with appropriate path of file "household_power_consumption.txt"

data <- read.table(file_path, sep = ";", header = TRUE, stringsAsFactors=FALSE)

data <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename = "plot1.png")

par(mfrow = c(1,1))

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off() 