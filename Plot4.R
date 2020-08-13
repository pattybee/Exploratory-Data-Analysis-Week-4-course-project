  
setwd("C:/Users/patty/OneDrive/Desktop/Coursera/Exploratry_data_analysis")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "FNEI_data.csv")
library(dplyr)
library(bindrcpp)
library(ggplot2)

# Load the NEI & SCC data frames.
NEI <- data.table::as.data.table(x = readRDS("summarySCC_PM25.rds"))
SCC <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))

# plot4.png
chart1 <- ggplot(baltYrTypEmm, aes(factor(year), Emissions))
chart1 <- chart + geom_bar(stat="identity") +
  xlab("year") +  
  ylab(expression('Total Emissions')) +
  ggtitle('Total [2.5]* Coal Emissions From 1999 to 2008')
print(chart1)
