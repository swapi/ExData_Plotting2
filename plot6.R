NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

scc <- SCC$SCC[grepl("Vehicle", SCC$EI.Sector)]

b_scc_nei <- NEI[NEI$SCC %in% scc & NEI$fips == "24510", ]
b_tpm25 <- tapply(b_scc_nei$Emissions, b_scc_nei$year, sum)

la_scc_nei <- NEI[NEI$SCC %in% scc & NEI$fips == "06037", ]
la_tpm25 <- tapply(la_scc_nei$Emissions, la_scc_nei$year, sum)

png('plot6.png')

par(mfrow=c(2,1))

plot(names(b_tpm25), b_tpm25, type='n', xlab='Year', ylab='PM 2.5 Emission in ton', main='Total PM from motor vehicle in Baltimore City')
lines(names(b_tpm25), b_tpm25)


plot(names(la_tpm25), la_tpm25, type='n', xlab='Year', ylab='PM 2.5 Emission in ton', main='Total PM from motor vehicle in Los Angeles County')
lines(names(la_tpm25), la_tpm25)

dev.off()
