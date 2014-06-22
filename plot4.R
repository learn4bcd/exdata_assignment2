NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.coal <- SCC[SCC[,4] %in% grep("Coal",unique(SCC[,4]),value = T),]
NEI.coal <- NEI[NEI[,2] %in% SCC.coal[,1],]

totalPM25 <- tapply(NEI.coal$Emissions,NEI.coal$year,sum)

png("plot4.png",width = 480, height = 480, units = "px")
par(mar=c(5,6,3,2),mgp=c(3.5,0.5,0),cex.lab=1.5)

barplot(totalPM25,las=1,col="red",space=0.6,
        xlab="Year",ylab = "Total emissions from PM 2.5 (tons)",
        main = "Emissions from coal combustion-related sources in US"
)

dev.off()