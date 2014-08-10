png(filename="plot4.png", height=480, width=480, bg="white")
# Data file must be one dirctory up in file system or change line below with location of data file
data <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data$Date2 <- as.Date( as.character(data$Date), "%d/%m/%Y")
data$DateTime <- strptime(paste(as.character(data$Date), as.character(data$Time)), "%d/%m/%Y %H:%M:%S")
febonetwo_data <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02") )
n <- length(febonetwo_data$Global_active_power)
datetimevalues <- febonetwo_data$DateTime[2:n]
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
# first subplot
first_sub_plotvalues <- as.numeric(febonetwo_data$Global_active_power[2:n])
plot(datetimevalues, first_sub_plotvalues, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
# 2nd sub plot
sec_sub_plotvalues <- as.numeric(febonetwo_data$Voltage[2:n])
plot(datetimevalues, sec_sub_plotvalues, type = "l", xlab = "datetime", ylab = "Voltage")
# 3rd sub plot
Sub_metering_1 <- as.numeric(febonetwo_data$Sub_metering_1[2:n])
Sub_metering_2 <- as.numeric(febonetwo_data$Sub_metering_2[2:n])
Sub_metering_3 <- as.numeric(febonetwo_data$Sub_metering_3[2:n])
plot(datetimevalues, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(datetimevalues, Sub_metering_1, col="black", type="l")
lines(datetimevalues, Sub_metering_2, col="red", type="l")
lines(datetimevalues, Sub_metering_3, col="blue", type="l")
legend("topright", box.lwd = 0, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# 4th sub plot
fourth_sub_plotvalues <- as.numeric(febonetwo_data$Global_reactive_power[2:n])
plot(datetimevalues, fourth_sub_plotvalues, type = "l", xlab = "datetime", ylab="Global_reactive_power")
dev.off()