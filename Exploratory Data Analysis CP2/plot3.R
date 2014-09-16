# Plot 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

suppressWarnings(library(ggplot2))
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

type = NEI$type
Emissions = NEI$Emissions
year = NEI$year

baltNEI = NEI[NEI$fips == "24510",]
op = par(mfrow=c(1,1), mar=c(4,4,2,2))

qplot(year, log(Emissions), data = baltNEI, color = type, outliners=FALSE, geom = "boxplot")
par(op)

## Saving to file
dev.copy(png, file="plot3.png")
dev.off()

