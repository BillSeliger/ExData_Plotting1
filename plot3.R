## Exploratory Data Analysis
## Project 1 Script

## Please refer to the script project1data.R in the same repository which downloads the data from the original assignment 
## source and performs all data manipulations required to create plots1-4 - such as subsetting, as.numeric, and 
## date-time manipulations - and creates the power dataframe in the global environment

## Plot 3 script

plot3 <- function() {
  
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
    width = 480, height = 480, bg = NA)

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
