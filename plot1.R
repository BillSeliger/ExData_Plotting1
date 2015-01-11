## Exploratory Data Analysis
## Project 1

## Please refer to the script project1data.R in the same repository which downloads the data from the original assignment 
## source and performs all data manipulations required to create plots1-4 - such as subsetting, as.numeric, and 
## date-time manipulations - and creates the power datatable in the global environment

## Plot 1 Script

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
