# Plot 2 for course project 1 in Exploratory Data Analysis class
# Code by: Mike Malin on 09/06/2014

suppressWarnings(require(sqldf))
data2 <- read.csv.sql( file='household_power_consumption.txt',
                       sep=";",
                       sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                       header=TRUE)


Timestamp = as.POSIXct(paste(data2$Date, data2$Time), format = "%d/%m/%Y %T")
str(data2)

library(datasets)
with(data2, plot(Timestamp, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

png(file = "plot2.png")
dev.copy(png, file = "plot2.png")  ## Copy my plot to a PNG file
dev.off()