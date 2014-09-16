# Plot 6
# Compare emissions from motor vehicle sources in Baltimore City 
#with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?
suppressWarnings(library(data.table))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Baltimore
umSCC = unique(grep("mobile", SCC$EI.Sector, ignore.case=TRUE, value =TRUE)) 
mobileSCC = SCC[SCC$EI.Sector == umSCC,]
str(mobileSCC)

subMergeMobile = merge(mobileSCC, NEI, by = "SCC" )
str(subMergeMobile)

baltMobileMerge = subMergeMobile[subMergeMobile$fips == "24510",]
yaxisBaltPlot6 = tapply(baltMobileMerge$Emissions, baltMobileMerge$year,sum)

# Los Angeles County
losMobileMerge = subMergeMobile[subMergeMobile$fips == "06037",]
yaxisLosPlot6 = tapply(losMobileMerge$Emissions, losMobileMerge$year,sum)

# compare plots

op = par(mfrow=c(2,1), mar=c(4,4,2,2))
barplot(yaxisBaltPlot6,
        main="Baltimore County Emissions",
        xlab = "Year",
        ylab = "Emissions",
        col= rainbow(4), 
        space = F,
        cex.lab=1.2)
barplot(yaxisLosPlot6,
        main="Los Angeles County Emissions",
        xlab = "Year",
        ylab = "Emissions",
        col= rainbow(4), 
        space = F,
        cex.lab=1.2)
par(op)

## Saving to file
dev.copy(png, file="plot6.png")
dev.off()

