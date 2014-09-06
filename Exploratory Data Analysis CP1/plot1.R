# Plot 1 for course project 1 in Exploratory Data Analysis class
# Code by: Mike Malin on 09/06/2014

require(sqldf)
data <- read.csv.sql( file='household_power_consumption.txt',
                      sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE)

data$Date = as.Date(data$Date, format = "%d/%m/%Y")
str(data)

library(datasets)
hist(data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col = "red")

png(file = "plot1.png")
dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()
