data = readRDS("summarySCC_PM25.rds")

emissions = aggregate(data$Emissions, list(year=data$year), sum)

png("plot1.png")
with(emissions, plot(year, x,
  main="Total emissions in the US",
  ylab="total emissions (in tons)"))
dev.off()
