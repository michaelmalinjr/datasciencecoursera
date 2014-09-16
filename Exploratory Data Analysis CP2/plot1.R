# Plot 1 

suppressWarnings(library(data.table))
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yaxisPlot1 = tapply(NEI$Emissions,NEI$year,sum)

op = par(mfrow=c(1,1), mar=c(4,4,4,2))

barplot(log(yaxisPlot1), 
        main = "Total Emissions",
        xlab = "Year",
        ylab = "LOG of Emissions",
        ylim=c(0,20),
        cex.axis=1.2,
        
        space = F,
        col = rainbow(4))
par(op)

## Saving to file
dev.copy(png, file="plot1.png")
dev.off()