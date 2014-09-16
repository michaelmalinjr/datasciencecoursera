# Plot 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

suppressWarnings(library(data.table))
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltNEI = NEI[NEI$fips == "24510",]
yaxisPlot2 = tapply(baltNEI$Emissions, baltNEI$year,sum)

op = par(mfrow=c(1,1), mar=c(4,4,2,2))

barplot(yaxisPlot2, 
        main="Total Emissions in Baltimore",
        xlab = "Year",
        ylab = "Emissions",
        col= rainbow(4), 
        space = F,
        cex.lab=1.2)
par(op)

## Saving to file
dev.copy(png, file="plot2.png")
dev.off()