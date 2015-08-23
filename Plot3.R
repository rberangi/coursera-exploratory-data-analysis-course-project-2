##   Explanatory data analysis
##------- assignment 2
## --------- Question 3 -----------
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")

NEIST <- ddply(NEIS, .(type, year), summarize, Emissions = sum(Emissions))

png('plot3.png')
qplot(year, Emissions, data = NEIST, group =type, color = type, 
      geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), 
      xlab = "Year", main = "Total US Emissions for different pollutant sources")
dev.off()