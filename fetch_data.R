# Matt Narrell (mnarrell@gmail.com) 
# fetch_data.R 
#
# Helper script to fetch and clean data used for the plots.

# Fetch/clean the data unless the data frame is in our environment
if (!exists("power_consumption")) {
  # Fetch
  if (!file.exists("./data/household_power_consumption.txt")) {
    dataSrcUri <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    temp <- tempfile()
    download.file(dataSrcUri, temp, method = "curl")
    unzip(temp, exdir = "./data")
    unlink(temp)
    rm(temp)
  }
  
  # Only read the data for the dates we're interested in
  library("dplyr")
  library("sqldf")  
  power_consumption <- tbl_df(read.csv.sql(file = "./data/household_power_consumption.txt", 
                                           sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", 
                                           stringsAsFactors = FALSE, header = TRUE, sep = ";"))
  
  # Date time
  # Build a Timestamp variable from the Date and Time variables
  # Drop the Date and Time variables in favor of the Timestamp
  library("lubridate")
  power_consumption <- power_consumption %>%     
    mutate(Timestamp = dmy_hms(paste(power_consumption$Date, power_consumption$Time))) %>% 
    select(Timestamp, (Global_active_power:Sub_metering_3))
} 
