# Matt Narrell (mnarrell@gmail.com)
# plot2.R
#
# Draws the Plot 2 image.

# Gather the cleaned data as necessary
source("fetch_data.R")

# Output PNG
png("plot2.png")

# Line graph
plot(power_consumption$Timestamp, power_consumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
