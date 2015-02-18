# Course Project 2

in Exploratory Data Analysis at [Coursera](https://coursera.org/)

Data comes from the [EPA National Emissions Inventory web site](http://www.epa.gov/ttn/chief/eiinformation.html).  Download ZIP file [here](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip) (two files: `summarySCC_PM25.rds` and `Source_Classification_Code.rds`).

You can load the files like this:

    codes = readRDS("Source_Classification_Code.rds")
    data  = readRDS("summarySCC_PM25.rds")

