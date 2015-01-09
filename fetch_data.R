# Matt Narrell (mnarrell@gmail.com) 
# fetch_data.R 
#
# Helper script to fetch and clean data used for the plots.

# Fetch/clean the data unless the data frame is in our environment
if (!exists("power_consumption")) {
  dataSrcUri <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  if (!file.exists("./data/household_power_consumption.txt")) {
    temp <- tempfile()
    download.file(dataSrcUri, temp, method = "curl")
    unzip(temp, exdir = "./data")
    unlink(temp)
    rm(temp)
  }
  
  library("sqldf")
  library("dplyr")
  library("lubridate")
  # Only read the data for the dates we're interested in
  power_consumption <- tbl_df(read.csv.sql(file = "./data/household_power_consumption.txt", 
                                           sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", 
                                           stringsAsFactors = FALSE, header = TRUE, sep = ";"))
  
  power_consumption <- power_consumption %>% 
    # Build a Timestamp variable from the Date and Time variables
    mutate(Timestamp = dmy_hms(paste(power_consumption$Date, power_consumption$Time))) %>% 
    # Drop the Date and Time variables in favor of the Timestamp
    select(Timestamp, (Global_active_power:Sub_metering_3))
} 
