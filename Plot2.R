##   Explanatory data analysis
##------- assignment 2
## --------- Question 2 -----------
NEI <- readRDS("summarySCC_PM25.rds")

NEIS <- NEI[which(NEI$fips == "24510"), ]
y<- aggregate(NEIS$Emissions, by=list(NEIS$year), FUN=sum)

png('plot2.png')

barplot(height=y$x, names.arg=y$Group.1, ylab = expression("Total Emissions, PM"[2.5]), 
        xlab = "Year", main = "Total Baltimor PM_2.5 Emissions", col="red",,border="blue")

##plot(y,type="o", ylab = expression("Total Emissions, PM"[2.5]), 
##     xlab = "Year", main = "Total Baltimor PM_2.5 Emissions")
dev.off()