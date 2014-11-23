NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

scc <- SCC$SCC[grepl("Coal", SCC$EI.Sector)]

scc_nei <- NEI[NEI$SCC %in% scc, ]
tpm25 <- tapply(scc_nei$Emissions, scc_nei$year, sum)

png('plot4.png')

plot(names(tpm25), tpm25, type='n', xlab='Year', ylab='PM 2.5 Emission in ton', main='Total PM from coal combustion in USA')
lines(names(tpm25), tpm25)

dev.off()
