NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore_NEI <- NEI[NEI$fips == "24510",]
tpm25 <- tapply(Baltimore_NEI$Emissions, Baltimore_NEI$year, sum)

png('plot2.png')

plot(names(tpm25), tpm25, type='n', xlab='Year', ylab="PM 2.5 Emission in ton", main='Total PM from all sources in Baltimore')
lines(names(tpm25), tpm25)

dev.off()
