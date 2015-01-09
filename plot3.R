## Exploratory Data Analysis
## Project 1 Script

## Plot 3 script

plot3 <- function() {
  
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

power$dateTime <- ymd_hms(paste(power$Date, power$Time, sep = " "))

windows()

plot(power$dateTime, power$Sub_metering_1, type = "l",                                        
     ylab = "Energy sub metering",
     xlab = " ", 
     mar = c(2, 1, 1, 0.5),
     cex.lab = 0.75,
)
lines(power$dateTime,power$Sub_metering_2, lwd=2, col="red")
lines(power$dateTime,power$Sub_metering_3, lwd=2, col="blue")
legend("topright", bty = "10", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black","red","blue"))

## create the plot in a png file

png(filename="C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/ExData_Plotting1/plot3.png", 
    width = 480, height = 480)

plot(power$dateTime, power$Sub_metering_1, type = "l",                                        
     ylab = "Energy sub metering",
     xlab = " ", 
     mar = c(.5, .1, .1, .1),
     bg = "NA"
)
lines(power$dateTime,power$Sub_metering_2, lwd=1, col="red")
lines(power$dateTime,power$Sub_metering_3, lwd=1, col="blue")
legend("topright", bty = "10", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black","red","blue"))

dev.off() ## Don't forget to close the PNG device!

}
