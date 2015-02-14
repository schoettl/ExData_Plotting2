library(ggplot2)

codes = readRDS("Source_Classification_Code.rds")
data  = readRDS("summarySCC_PM25.rds")

motor_vehicles_codes = codes$SCC[grep("Mobile Sources", codes$SCC.Level.One)]
emissions = subset(data, fips == "24510" & (SCC %in% motor_vehicles_codes))

png("plot5.png")
ggplot(emissions, aes(year, Emissions)) +
  stat_summary(geom="point", fun.y=sum) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City") +
  ylab("emissions (in tons)")
dev.off()
