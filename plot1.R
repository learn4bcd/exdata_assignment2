NEI <- readRDS("summarySCC_PM25.rds")
totalPM25 <- tapply(NEI$Emissions,NEI$year,sum)

png("plot1.png",width = 480, height = 480, units = "px")
par(mar=c(5,6,3,2),mgp=c(3.5,0.5,0),cex.lab=1.5)
barplot(totalPM25,las=1,col="red",space=0.6,
        xlab="Year",ylab = "Total emissions from PM 2.5 (tons)",
		main = "United States"
        )
dev.off()