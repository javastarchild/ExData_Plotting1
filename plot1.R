png(filename="plot1.png", height=480, width=480, bg="white")
# Data file must be one dirctory up in file system or change line below with location of data file
data <- read.table("../household_power_consumption.txt", header=TRUE, sep=";")
data$Date2 <- as.Date( as.character(data$Date), "%d/%m/%Y")
febonetwo_data <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02") )
n <- length(febonetwo_data$Global_active_power)
plot1values <- as.numeric(as.character(febonetwo_data$Global_active_power[2:n]))
hist(plot1values, breaks = 12, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()