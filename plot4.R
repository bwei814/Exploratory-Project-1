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

#plot 4
par(mfrow = c(2,2))




plot(y$Global_active_power ~ y$Datetime, ylab = "Global Active Power", type = "l", xlab = "")
plot(y$Voltage ~ y$Datetime, ylab = "Voltage", xlab = "datetime", type = "l")
plot(y$Sub_metering_1 ~ y$Datetime, type = "l", 
     ylab = "Energy sub metering", col = "black", xlab = " ")
lines(y$Sub_metering_2 ~ y$Datetime, col = "red")
lines(y$Sub_metering_3 ~ y$Datetime, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2" , "Sub_metering_3"), lty = 1, bty = "n",
       lwd = c(2, 2, 2), col = c("black", "red", "black"))
plot(y$Global_reactive_power ~ y$Datetime, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()