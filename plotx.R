codes = readRDS("Source_Classification_Code.rds")
data  = readRDS("summarySCC_PM25.rds")

emissions = aggregate(data$Emissions, list(year=data$year), sum)

png("plotx.png")
with(emissions, plot(year, x, ylab="total emissions"))
dev.off()
