# Matt Narrell (mnarrell@gmail.com)
# plot1.R
#
# Draws the Plot 1 image.

# Gather the cleaned data as necessary
source("fetch_data.R")

# Output PNG
png("plot1.png")

# Histogram
hist(power_consumption$Global_active_power, col = "red2", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

