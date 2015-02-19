library(ggplot2)

data = readRDS("summarySCC_PM25.rds")

baltimore_city_data = subset(data, fips == "24510")
emissions = aggregate(baltimore_city_data$Emissions, baltimore_city_data[, c("year", "type")], sum)

png("plot3.png")
qplot(year, x, data=emissions, facets=.~type, geom=c("point", "line"),
  main="Total emissions in Baltimore City",
  ylab="total emissions (in tons)")
dev.off()
