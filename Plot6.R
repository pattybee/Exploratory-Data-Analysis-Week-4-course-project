setwd("C:/Users/patty/OneDrive/Desktop/Coursera/Exploratry_data_analysis")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "FNEI_data.csv")
library(dplyr)
library(bindrcpp)
library(ggplot2)

# Load the NEI & SCC data frames.
NEI <- data.table::as.data.table(x = readRDS("summarySCC_PM25.rds"))
SCC <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))

# Comparing Baltimore, MD-24510 and Los Angeles, CA-06037
baltYrTypEmmFips <- summarise(group_by(filter(NEI_data, NEI_data$fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
laYrTypEmmFips <- summarise(group_by(filter(NEI_data, NEI_data$fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))

baltYrTypEmmFips$County <- "Baltimore City, MD"
laYrTypEmmFips$County <- "Los Angeles County, CA"

baltLaEmissions <- rbind(baltYrTypEmmFips, laYrTypEmmFips)
# plot6.png
# Type: ON-ROAD, Fips = 24510 for Baltimore, MD Motor Vehicle PM[2.5]* Emissions Against Los Angeles, CA Fips = 06037  from 1999 to 2008
ggplot(baltLaEmissions, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
    geom_bar(stat="identity") + 
    facet_grid(County~., scales="free") +
    ylab(expression("total PM"[2.5]*" emissions in tons")) + 
    xlab("year") +
    ggtitle(expression("Baltimore City vs Los Angeles County Motor vehicle emission in tons"))+
    geom_label(aes(fill = County),colour = "yellow", fontface = "bold")
