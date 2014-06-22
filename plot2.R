NEI <- readRDS("summarySCC_PM25.rds")
NNEI <- NEI[NEI$fips == "24510",]
totalPM25 <- tapply(NNEI$Emissions,NNEI$year,sum)

png("plot2.png",width = 480, height = 480, units = "px")
par(mar=c(5,6,3,2),mgp=c(3.5,0.5,0),cex.lab=1.5)
barplot(totalPM25,las=1,col="red",space=0.6,
        xlab="Year",ylab = "Total emissions from PM 2.5 (tons)",
        main="Baltimore City, Maryland"
        )
dev.off()