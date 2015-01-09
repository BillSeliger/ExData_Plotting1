## Exploratory Data Analysis
## Project 1 Script

## Plot 4 script
## I took the approach of downloading the opriginal zip file, manipulating the data  for plotting purposes and 
## prepariing both a screen plot and writing the duplicate file to a png file using a duplication of the code 
## rather than dev.copy

plot4 <- function() {

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

power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

power$dateTime <- ymd_hms(paste(power$Date, power$Time, sep = " "))  ## concatenate Date and Time into a single field for line plots

windows()  ## open the screen device

par(mfrow = c(2, 2))  ## set parameters for the 2 x 2 plots
mar = c(2, 1.5, 1, 1)

with(power, {
  plot(dateTime, Global_active_power, type = "l", xlab = "")
  plot(dateTime, Voltage, type = "l", xlab = "datetime")
  plot(power$dateTime, power$Sub_metering_1, type = "l",                                        
       ylab = "Energy sub metering",
       xlab = " "
  )
  lines(power$dateTime,power$Sub_metering_2, lwd=1, col="red")
  lines(power$dateTime,power$Sub_metering_3, lwd=1, col="blue")
  legend("topright", bty = "n", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black","red","blue"))
  
  plot(dateTime, Global_reactive_power, type = "l", xlab = "datetime")
})

## create the same plot in the plot4.png file

png(filename="C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/ExData_Plotting1/plot4.png", 
    width = 480, height = 480)

par(mfrow = c(2, 2))     ## set parameters for the 2 x 2 plots
mar = c(2, 1.5, 1, 1)
bg = NA

with(power, {
  plot(dateTime, Global_active_power, type = "l", xlab = "") 
  plot(dateTime, Voltage, type = "l", xlab = "datetime")
  plot(power$dateTime, power$Sub_metering_1, type = "l",                                        
       ylab = "Energy sub metering",
       xlab = " "
  )
  lines(power$dateTime,power$Sub_metering_2, lwd=1, col="red")
  lines(power$dateTime,power$Sub_metering_3, lwd=1, col="blue")
  legend("topright", bty = "n", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black","red","blue"))
  
  plot(dateTime, Global_reactive_power, type = "l", xlab = "datetime")
})

dev.off()   ## Don't forget to close the PNG device!

}
