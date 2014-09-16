# Plot 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

suppressWarnings(library(data.table))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

umSCC = unique(grep("mobile", SCC$EI.Sector, ignore.case=TRUE, value =TRUE)) 
mobileSCC = SCC[SCC$EI.Sector == umSCC,]
str(mobileSCC)

subMergeMobile = merge(mobileSCC, NEI, by = "SCC" )
str(subMergeMobile)

baltMobileMerge = subMergeMobile[subMergeMobile$fips == "24510",]
str(baltMobileMerge)

yaxisPlot5 = tapply(baltMobileMerge$Emissions, baltMobileMerge$year,sum)

op = par(mfrow=c(1,1), mar=c(4,4,2,2))

barplot(yaxisPlot5,
        main="Motor Vehicle Baltimore City Emissions",
        xlab = "Year",
        ylab = "Emissions",
        col= rainbow(4), 
        space = F,
        cex.lab=1.2)
par(op)

## Saving to file
dev.copy(png, file="plot5.png")
dev.off()


