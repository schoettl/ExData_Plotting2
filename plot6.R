library(ggplot2)

codes = readRDS("Source_Classification_Code.rds")
data  = readRDS("summarySCC_PM25.rds")

fips_bc  = 24510 # Baltimore City
fips_lac = 06037 # Los Angeles County

motor_vehicles_codes = codes$SCC[grepl("Mobile Sources", codes$SCC.Level.One) & grepl("[Vv]ehicle", codes$Short.Name)]
emissions = subset(data, (fips == fips_bc | fips == fips_lac) & (SCC %in% motor_vehicles_codes))

# Any nicer solution? The switch function is for length 1 vector as EXPR only.
emissions$county = NA
emissions$county[emissions$fips == fips_bc] = "Baltimore City"
emissions$county[emissions$fips == fips_lac] =  "Los Angeles County"

png("plot6.png")
ggplot(emissions, aes(year, Emissions)) +
  stat_summary(geom="point", fun.y=sum) +
  facet_grid(. ~ county) +
  ggtitle("Emissions from motor vehicle sources") +
  ylab("emissions (in tons)")
dev.off()
