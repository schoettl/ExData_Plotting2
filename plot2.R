data = readRDS("summarySCC_PM25.rds")

baltimore_city_data = subset(data, fips == 24510)
emissions = aggregate(baltimore_city_data$Emissions, list(year=baltimore_city_data$year), sum)

png("plot2.png")
with(emissions, plot(year, x,
  main="Total emissions in Baltimore City",
  ylab="total emissions (in tons)"))
dev.off()
