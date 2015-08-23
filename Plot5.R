##   Explanatory data analysis
##------- assignment 2
## --------- Question 5 -----------

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorindex <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
motorsource <- SCC[motorindex, ]
SCCID <- as.character(motorsource$SCC)
NEI$SCC <- as.character(NEI$SCC)
motor <- NEI[NEI$SCC %in% SCCID, ]

NEImotor <- motor[which(motor$fips == "24510"), ]

summotor <- with(NEImotor, aggregate(Emissions, by = list(year), 
                                                         sum))
png('plot5.png')
barplot(height=summotor$x, names.arg=summotor$Group.1, ylab = expression("Total Emissions, PM"[2.5]), 
        xlab = "Year", main = "Total Emissions from Vehicles in Baltimore", col="red",,border="blue")

##plot(summotor, type = "o", ylab = expression("Total Emissions, PM"[2.5]), 
     ##xlab = "Year", main = "Total Emissions from Vehicles in Baltimore")
dev.off()