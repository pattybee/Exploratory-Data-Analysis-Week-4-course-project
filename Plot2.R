setwd("C:/Users/patty/OneDrive/Desktop/Coursera/Exploratry_data_analysis")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "FNEI_data.csv")
library(dplyr)
library(bindrcpp)
library(ggplot2)

# forming Baltimore data which will be NEI_data subset
baltdata <- NEI_data[NEI_data$fips=="24510", ]

# Baltimore yearly emmisisons data
baltYrEmm <- aggregate(Emissions ~ year, baltdata, sum)

# plot2.png
cols1 <- c("maroon", "yellow", "orange", "Aquamarine")
barplot(height=baltYrEmm$Emissions/1000, names.arg=baltYrEmm$year, xlab="Year", ylab=expression('Aggregated Emission'),
main=expression('Baltimore Aggregated PM'[2.5]*' Emmissions by Year'), col = cols1)
