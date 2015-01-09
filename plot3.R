# Matt Narrell (mnarrell@gmail.com)
# plot3.R
#
# Draws the Plot 3 image.

# Gather the cleaned data as necessary
source("fetch_data.R")

# Output PNG
png("plot3.png")

# A plot of three line graphs drawn atop each other
plot(power_consumption$Timestamp, power_consumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power_consumption$Timestamp, power_consumption$Sub_metering_2, type = "l", col = "red")
lines(power_consumption$Timestamp, power_consumption$Sub_metering_3, type = "l", col = "blue")
# Draw the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"))
dev.off() 
