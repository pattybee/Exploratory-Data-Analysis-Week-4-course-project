  
setwd("C:/Users/patty/OneDrive/Desktop/Coursera/Exploratry_data_analysis")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "FNEI_data.csv")
library(dplyr)
library(bindrcpp)
library(ggplot2)

# Load the NEI & SCC data frames.
NEI <- data.table::as.data.table(x = readRDS("summarySCC_PM25.rds"))
SCC <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))

# aggregating NEI emmissions by year
yearly_emmissions <- aggregate(Emissions ~ year, NEI_data, sum)

# plot1.ng
cols <- c("maroon", "orange", "yellow", "Aquamarine")
barplot(height=yearly_emmissions$Emissions/1000, names.arg=yearly_emmissions$year, xlab="Year", ylab=expression('Aggregated
Emission'),main=expression('Aggregated PM'[2.5]*' Emmissions by Year'), col = cols)
