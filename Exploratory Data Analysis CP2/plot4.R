# Plot 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
suppressWarnings(library(data.table))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

uSCC = unique(grep("coal", SCC$EI.Sector, ignore.case=TRUE, value =TRUE)) 

coalSCC = SCC[SCC$EI.Sector == uSCC,]
names(coalSCC)

subMerge = merge(coalSCC, NEI, by = "SCC" )
str(subMerge)

yaxisPlot4 = tapply(subMerge$Emissions, subMerge$year,sum)

op = par(mfrow=c(1,1), mar=c(4,4,2,2))

barplot(yaxisPlot4,
        main="Emissions From Coal",
        xlab = "Year",
        ylab = "Emissions",
        col= rainbow(4), 
        space = F,
        cex.lab=1.2)
par(op)

## Saving to file
dev.copy(png, file="plot4.png")
dev.off()

