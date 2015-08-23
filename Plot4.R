##   Explanatory data analysis
##------- assignment 2
## --------- Question 4 -----------
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


coalindex <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
coalSource <- SCC[coalindex, ]
SCC.identifiers <- as.character(coalSource$SCC)

NEI$SCC <- as.character(NEI$SCC)
NEI.coal <- NEI[NEI$SCC %in% SCC.identifiers, ]

aggregate.coal <- with(NEI.coal, aggregate(Emissions, by = list(year), sum))
colnames(aggregate.coal) <- c("year", "Emissions")

png('plot4.png')
plot(aggregate.coal, type = "o", ylab = expression("Total Emissions, PM"[2.5]), 
     xlab = "Year", main = "Total US Coal Combustion")
dev.off()