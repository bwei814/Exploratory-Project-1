#Import and Data Wrangle
y <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
y <- subset(y, Date %in% c("1/2/2007", "2/2/2007"))
y$Global_active_power <- as.numeric(levels(y$Global_active_power)[y$Global_active_power])
y$Date <- as.Date(y$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(y$Date), y$Time)
y$Datetime <- as.POSIXct(datetime)
y$Sub_metering_1 <- as.numeric(levels(y$Sub_metering_1)[y$Sub_metering_1])
y$Sub_metering_2 <- as.numeric(levels(y$Sub_metering_2)[y$Sub_metering_2])
y$Global_intensity <- as.numeric(levels(y$Global_intensity)[y$Global_intensity])
y$Global_reactive_power <- as.numeric(levels(y$Global_reactive_power)[y$Global_reactive_power])
y$Voltage <- as.numeric(levels(y$Voltage)[y$Voltage])

# Plot 2
plot(y$Global_active_power~y$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
