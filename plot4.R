## Exploratory Data Analysis
## Project 1 Script

## Please refer to the script project1data.R in the same repository which downloads the data from the original assignment 
## source and performs all data manipulations required to create plots1-4 - such as subsetting, as.numeric, and 
## date-time manipulations - and creates the power dataframe in the global environment

## Plot 4 script

plot4 <- function() {
  
  ## Plot 4 on the screen device
  
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
    width = 480, height = 480, bg = NA)

par(mfrow = c(2, 2))     ## set parameters for the 2 x 2 plots
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

dev.off()   ## Don't forget to close the PNG device!

}
