png(filename="plot2.png", height=480, width=480, bg="white")
# Data file must be one dirctory up in file system or change line below with location of data file
data <- read.table("../household_power_consumption.txt", header=TRUE, sep=";")
data$Date2 <- as.Date( as.character(data$Date), "%d/%m/%Y")
data$DateTime <- strptime(paste(as.character(data$Date), as.character(data$Time)), "%d/%m/%Y %H:%M:%S")
febonetwo_data <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02") )
n <- length(febonetwo_data$Global_active_power)
plot2values <- as.numeric(as.character(febonetwo_data$Global_active_power[2:n]))
datetimevalues <- febonetwo_data$DateTime[2:n]
plot(datetimevalues, plot2values, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()