library(ggplot2)

codes = readRDS("Source_Classification_Code.rds")
data  = readRDS("summarySCC_PM25.rds")

coal_combustion_codes = codes$SCC[grepl("[Cc]ombustion", codes$SCC.Level.One) & grepl("[Cc]oal", codes$SCC.Level.Three)]
coal_combustion_data = subset(data, SCC %in% coal_combustion_codes)

png("plot4.png")
ggplot(coal_combustion_data, aes(year, Emissions)) +
  stat_summary(geom="point", fun.y=sum) +
  ggtitle("Emissions from coal combustion-related sources in the US") +
  ylab("emissions (in tons)")
dev.off()
