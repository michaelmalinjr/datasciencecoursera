# Plot 3 for course project 1 in Exploratory Data Analysis class
# Code by: Mike Malin on 09/06/2014

suppressWarnings(require(sqldf))
data3 <- read.csv.sql( file='household_power_consumption.txt',
                       sep=";",
                       sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                       header=TRUE)

Timestamp = as.POSIXct(paste(data3$Date, data3$Time), format = "%d/%m/%Y %T")

x = data3$Sub_metering_1
y = data3$Sub_metering_2
z = data3$Sub_metering_3

with(data3, plot(Timestamp, x, type="n", xlab = "", ylab = "Energy sub metering"))
with(subset(data3), points(Timestamp, x, type = "l", col = "black")) 
with(subset(data3), points(Timestamp, y, type = "l", col = "red")) 
with(subset(data3), points(Timestamp, z, type = "l", col = "blue")) 

legend("topright", 
       pch = c(NA,NA,NA),
       col = c("black", "red", "blue"),
       lwd = 2, cex = 1.2,
       lty = c(1, 1, 1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png(file = "plot3.png")
dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off()