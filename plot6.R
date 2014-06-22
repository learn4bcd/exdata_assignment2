library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.motor <- SCC[SCC[,4] %in% grep("Mobile - On-Road",unique(SCC[,4]),value = T),]
NEI.motor <- NEI[NEI[,2] %in% SCC.motor[,1] & NEI[,1] %in% c("24510","06037"),]
NEI.motor$City <- ifelse(NEI.motor[,1] == "24510", "Baltimore", "Los Angeles")

png("plot6.png",width = 600, height = 600, units = "px")

fig <- qplot(as.factor(year), fill = City, data = NEI.motor, 
             xlab="Year",ylab = "Total emissions from PM 2.5 (tons)",
             main="Comparison of emissions from motor vehicle sources ", 
             geom="bar",weight=Emissions) + 
    facet_wrap(  ~ City, scales = "free" ) + 
    theme(axis.title = element_text(face="bold",size=11), 
          plot.title = element_text(face="bold",size=12))

print(fig)

dev.off()