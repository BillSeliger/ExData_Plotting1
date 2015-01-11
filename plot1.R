## Exploratory Data Analysis
## Project 1

## two separate functions are created below - project1data() and plot1()

## The project1data() function downloads the dataset from the original location we were given for the assignment
## manipulates the data as required for all 4 plots and creates the dataframe in the global environment

project1data <- function() {
  
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
  power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
  power$Voltage <- as.numeric(power$Voltage)
  power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
  power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
  power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
  
  power$dateTime <- ymd_hms(paste(power$Date, power$Time, sep = " "))  ## concatenate Date and Time into a single field for line plots
  
  assign("power", power, envir = .GlobalEnv)
  
  print("Project 1 Data Ready!")
}

## Plot 1 Script
## the plot1() function creates a png file per the rubric provided

plot1 <- function() {

png(filename="C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/ExData_Plotting1/plot1.png", 
         width = 480, height = 480, bg = NA)

hist(power$Global_active_power, xaxt="n",                   ## removes x axis                            
     col = "red1",                              ## sets the bars to red
     main = "Global Active Power",             ## main label for the histogram
     xlab = "Global Active Power (kilowatts)"  ## x-axis label
)
axis (side = 1, at = seq(0, 6, by = 2))                     ## x-axis marks even numbers from 0 to 6

dev.off()   ## Don't forget to close the PNG device!

}
