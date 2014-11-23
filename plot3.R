library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png('plot3.png')

Baltimore_NEI <- NEI[NEI$fips == "24510",]
Baltimore_Agr_by_year <- aggregate(Emissions ~ year + type, Baltimore_NEI, sum)
ggplot(Baltimore_Agr_by_year, aes(year, Emissions)) + geom_line(aes(color = type))

dev.off()
