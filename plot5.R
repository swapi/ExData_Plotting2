NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

scc <- SCC$SCC[grepl("Vehicle", SCC$EI.Sector)]

scc_nei <- NEI[NEI$SCC %in% scc & NEI$fips == "24510", ]
tpm25 <- tapply(scc_nei$Emissions, scc_nei$year, sum)

png('plot5.png')

plot(names(tpm25), tpm25, type='n', xlab='Year', ylab='PM 2.5 Emission in ton', main='Total PM from motor vehicle in Baltimore City')
lines(names(tpm25), tpm25)

dev.off()
