##   Explanatory data analysis
##------- assignment 2
## --------- Question 4 -----------
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


coalindex <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
coalSource <- SCC[coalindex, ]
SCCID <- as.character(coalSource$SCC)

NEI$SCC <- as.character(NEI$SCC)
coal <- NEI[NEI$SCC %in% SCCID, ]

sumcoal <- with(coal, aggregate(Emissions, by = list(year), sum))
colnames(sumcoal) <- c("year", "Emissions")

png('plot4.png')
barplot(height=sumcoal$Emissions, names.arg=sumcoal$year, ylab = expression("Total Emissions, PM"[2.5]), 
        xlab = "Year", main = "Total Emissions from Vehicles in Baltimore", col="red",,border="blue")

##plot(sumcoal, type = "o", ylab = expression("Total Emissions, PM"[2.5]), 
     ##xlab = "Year", main = "Total US Coal Combustion")
dev.off()