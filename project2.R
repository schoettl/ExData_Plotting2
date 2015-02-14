codes = readRDS("Source_Classification_Code.rds")
data  = readRDS("summarySCC_PM25.rds")

# Check the data
str(data)
str(codes)

# Make R files for plots in Bash:
# for (( i = 1; i <= 6; i++ )); do sed "s/plotx/plot$i/" plotx.R > "plot$i.R"; done