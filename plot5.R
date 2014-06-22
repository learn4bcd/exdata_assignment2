NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.motor <- SCC[SCC[,4] %in% grep("Mobile - On-Road",unique(SCC[,4]),value = T),]
NEI.motor <- NEI[NEI[,2] %in% SCC.motor[,1] & NEI[,1] == "24510",]

totalPM25 <- tapply(NEI.motor$Emissions,NEI.motor$year,sum)

png("plot5.png",width = 480, height = 480, units = "px")
par(mar=c(5,6,3,2),mgp=c(3.5,0.5,0),cex.lab=1.5)

barplot(totalPM25,las=1,col="red",space=0.6,
        xlab="Year",ylab = "Total emissions from PM 2.5 (tons)",
        main = "Emissions from motor vehicle sources in Baltimore City"
)

dev.off()