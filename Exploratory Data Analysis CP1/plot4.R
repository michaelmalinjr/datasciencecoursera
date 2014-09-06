# Plot 4 for course project 1 in Exploratory Data Analysis class
# Code by: Mike Malin on 09/06/2014

suppressWarnings(require(sqldf))
data4 <- read.csv.sql( file='household_power_consumption.txt',
                       sep=";",
                       sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                       header=TRUE)

Timestamp = as.POSIXct(paste(data4$Date, data4$Time), format = "%d/%m/%Y %T")
str(data4)

windows()

par(mfrow = c(2, 2))

# Declare variables
g = data4$Global_reactive_power
v = data4$Voltage 
x = data3$Sub_metering_1
y = data3$Sub_metering_2
z = data3$Sub_metering_3

# Box topleft; code for Global active power

with(data4, plot(Timestamp, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))

# Box topright; code for Voltage
with(data4, plot(Timestamp, v, type="l", xlab = "datetime", ylab = "Voltage"))

# Box bottomleft; code for Engery sub metering 

with(data4, plot(Timestamp, x, type="n", xlab = "", ylab = "Energy sub metering"))
with(subset(data4), points(Timestamp, x, type = "l", col = "black")) 
with(subset(data4), points(Timestamp, y, type = "l", col = "red")) 
with(subset(data4), points(Timestamp, z, type = "l", col = "blue")) 

legend("topright", 
       pch = c(NA,NA,NA),
       col = c("black", "red", "blue"),
       bty="n",
       # lwd = 2, cex = 1.2,
       lty = c(1, 1, 1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Box bottomright; code for Global_reactive_power

with(data4, plot(Timestamp, g, type="l", xlab = "datetime", ylab = "Global_reactive_power"))

# Copies plot4 to png

png(file = "plot4.png")
dev.copy(png, file = "plot4.png")  ## Copy my plot to a PNG file
dev.off()