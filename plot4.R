# Matt Narrell (mnarrell@gmail.com)
# plot4.R
#
# Draws the Plot 4 image.

# Gather the cleaned data as necessary
source("fetch_data.R")

# Output PNG
png("plot4.png")

# Output four plots, 2x2
par(mfrow = c(2, 2))

# Top left, single line graph
plot(power_consumption$Timestamp, power_consumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Top right, single line graph
plot(power_consumption$Timestamp, power_consumption$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom left, composition line graph with legend
plot(power_consumption$Timestamp, power_consumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power_consumption$Timestamp, power_consumption$Sub_metering_2, type = "l", col = "red")
lines(power_consumption$Timestamp, power_consumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"))

# Bottom right, line graph
plot(power_consumption$Timestamp, power_consumption$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off() 
