library(ggplot2)

codes = readRDS("Source_Classification_Code.rds")
data  = readRDS("summarySCC_PM25.rds")

get_motor_vehicle_codes = function(codes) {
  
  # Select level 1 from: levels(codes$SCC.Level.One)
  level1 = c("Internal Combustion Engines", "Storage and Transport", "Mobile Sources")
  
  # Select level 2 from: subset_at_lev1 = subset(codes, SCC.Level.One %in% level1); levels(factor(subset_at_lev1$SCC.Level.Two))
  level2 = c("Engine Testing", "Highway Vehicles - Diesel", "Highway Vehicles - Gasoline", "Off-highway 2-stroke Gasoline Engines",
      "Off-highway 4-stroke Gasoline Engines", "Off-highway Diesel Engines", "Off-highway LPG-fueled Engines", "Off-highway Vehicle Diesel",
      "Off-highway Vehicle Gasoline, 2-Stroke", "Off-highway Vehicle Gasoline, 4-Stroke", "Unpaved Roads")
  
  subset_at_lev12 = subset(codes, SCC.Level.One %in% level1 & SCC.Level.Two %in% level2)
  matching_at_lev3 = grep("auto|gasoline|vehicle|road", subset_at_lev12$SCC.Level.Three, ignore.case=TRUE)
  
  subset_at_lev12[matching_at_lev3, "SCC"]
}

motor_vehicle_codes = get_motor_vehicle_codes(codes)
emissions = subset(data, fips == "24510" & (SCC %in% motor_vehicle_codes))

png("plot5.png")
ggplot(emissions, aes(year, Emissions)) +
  stat_summary(geom="point", fun.y=sum) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City") +
  ylab("emissions (in tons)")
dev.off()
