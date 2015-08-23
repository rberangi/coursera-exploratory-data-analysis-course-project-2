##   Explanatory data analysis
##------- assignment 2
## --------- Question 1 -----------

NEI <- readRDS("summarySCC_PM25.rds")

y<- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)


png('Plot1.png')

barplot(height=y$x, names.arg=y$Group.1, ylab = expression("Total Emissions, PM"[2.5]), 
  xlab = "Year", main = "Total US PM_2.5 Emissions", col="red",,border="blue")

## plot(y,type="o", ylab = expression("Total Emissions, PM"[2.5]), 
##     xlab = "Year", main = "Total US PM_2.5 Emissions")

dev.off()