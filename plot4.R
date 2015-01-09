## Exploratory Data Analysis
## Project 1 Script

## Plot 4 script

require(data.table)
require(lubridate)
require(dplyr)

setwd("C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/Project 1")

## figure out how to make fread read in only certain observations (from the data.table package)
##  power <- fread("household_power_consumption.txt", sep = ";", header = TRUE)

power_raw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

power_one <- tbl_df(power_raw)
power_one$Date <- dmy(power_one$Date)
power <- subset(power_one, Date >"2007-01-31" & Date < "2007-02-02")

power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

power$dateTime <- ymd_hms(paste(power$Date, power$Time, sep = " "))

windows()

par(mfrow = c(2, 2))
mar = c(4, 4, 3, 1)

with(power, {
  plot(dateTime, Global_active_power, type = "l", xlab = "")

  plot(dateTime, Voltage, type = "l", xlab = "datetime")

  plot(power$dateTime, power$Sub_metering_1, type = "l",                                        
     ylab = "Energy sub metering",
     xlab = " ", 
     mar = c(2, 1, 1, 0.5)
)
    lines(power$dateTime,power$Sub_metering_2, lwd=2, col="red")
    lines(power$dateTime,power$Sub_metering_3, lwd=2, col="blue")
    legend("topright", bty = "n", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black","red","blue"))

  plot(dateTime, Global_reactive_power, type = "l", xlab = "datetime")
})

## copy the plot to the plot4.png file

dev.copy(png,filename="C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/Project 1/plot4.png", 
         width = 480, height = 480)

dev.off()   ## Don't forget to close the PNG device!

