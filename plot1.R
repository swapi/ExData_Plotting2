NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


tpm25 <- tapply(NEI$Emissions, NEI$year, sum)

png('plot1.png')

plot(names(tpm25), tpm25, type='n', xlab='Year', ylab='PM 2.5 Emission in ton', main='Total PM from all sources')
lines(names(tpm25), tpm25)

dev.off()
