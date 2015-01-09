## Exploratory Data Analysis
## Project 1

## Plot 1 Script

plot1 <- function() {
require(data.table)
require(lubridate)
require(dplyr)

setwd("C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/ExData_Plotting1")

power_raw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

power_one <- tbl_df(power_raw)
power_one$Date <- dmy(power_one$Date)
power <- subset(power_one, Date >"2007-01-31" & Date < "2007-02-02")

power$Global_active_power <- as.numeric(power$Global_active_power)

## Plot 1 on the screen device

windows()    ## opens the screen device to view the plot on screen

hist(power$Global_active_power, xaxt="n",                   ## removes x axis                            
     col = "red1",                              ## sets the bars to red
     bg = NA,
     main = "Global Active Power",             ## main label for the histogram
     xlab = "Global Active Power (kilowatts)"  ## x-axis label
)
axis (side = 1, at = seq(0, 6, by = 2))                     ## x-axis marks even numbers from 0 to 6

## duplicate plot 1 to a png file

png(filename="C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/ExData_Plotting1/plot1.png", 
         width = 480, height = 480)

hist(power$Global_active_power, xaxt="n",                   ## removes x axis                            
     bg = NA,
     col = "red1",                              ## sets the bars to red
     main = "Global Active Power",             ## main label for the histogram
     xlab = "Global Active Power (kilowatts)"  ## x-axis label
)
axis (side = 1, at = seq(0, 6, by = 2))                     ## x-axis marks even numbers from 0 to 6

dev.off()   ## Don't forget to close the PNG device!

}
