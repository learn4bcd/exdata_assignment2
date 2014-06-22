library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
NNEI <- NEI[NEI$fips == "24510",]

png("plot3.png",width = 600, height = 600, units = "px")

fig <- qplot(as.factor(year), fill = type, data = NNEI, 
             xlab="Year",ylab = "Total emissions from PM 2.5 (tons)",
             main="Baltimore City, Maryland", geom="bar",weight=Emissions) + 
    facet_wrap(  ~ type, scales = "free" ) + 
    theme(axis.title = element_text(face="bold",size=11), 
          plot.title = element_text(face="bold",size=12))

print(fig)

dev.off()