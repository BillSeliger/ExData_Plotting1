## Exploratory Data Analysis
## Project 1 Script

## Plot 2 script

plot2 <- function() {
  
  require(data.table)
  require(lubridate)
  require(dplyr)
  
  setwd("C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/ExData_Plotting1")
  
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  power_raw <- read.table((unz(temp,"household_power_consumption.txt")), sep = ";", header = TRUE, stringsAsFactors = FALSE)
  unlink(temp)
power_one <- tbl_df(power_raw)
power_one$Date <- dmy(power_one$Date)
power <- subset(power_one, Date >"2007-01-31" & Date < "2007-02-02")

power$Global_active_power <- as.numeric(power$Global_active_power)
power$dateTime <- ymd_hms(paste(power$Date, power$Time, sep = " "))

windows()    ## opens the screen device to view the plot on screen

plot(power$dateTime, power$Global_active_power, type = "l", 
     mar = c(2, 1, 1, 1), 
     ylab = "Global Active Power (kilowatts)",
     xlab = " ")

## copy the plot to the plot2.png file

dev.copy(png,filename="C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/ExData_Plotting1/plot2.png", 
         width = 480, height = 480)

dev.off()  ## Don't forget to close the PNG device!
}