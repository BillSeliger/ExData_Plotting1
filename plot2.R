## Exploratory Data Analysis
## Project 1 Script

## Please refer to the script project1data.R in the same repository which downloads the data from the original assignment 
## source and performs all data manipulations required to create plots1-4 - such as subsetting, as.numeric, and 
## date-time manipulations - and creates the power datatable in the global environment

## Plot 2 script

plot2 <- function() {
  
  png(filename="C:/Users/rr046302/Documents/Bill's Stuff/Coursera/Exploratory Data Analysis/ExData_Plotting1/plot2.png", 
      width = 480, height = 480, bg = NA)

plot(power$dateTime, power$Global_active_power, type = "l", 
     mar = c(2, 1, 1, 1), 
     ylab = "Global Active Power (kilowatts)",
     xlab = " ")

dev.off()  ## Don't forget to close the PNG device!
}