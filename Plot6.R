##   Explanatory data analysis
##------- assignment 2
## --------- Question 6 -----------

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Baltimor emissions
motorindex <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
motorsource <- SCC[motorindex, ]
SCCID <- as.character(motorsource$SCC)
NEI$SCC <- as.character(NEI$SCC)
motor <- NEI[NEI$SCC %in% SCCID, ]
NEImotor <- motor[which(NEI.motor$fips == "24510"), ]
summotorBAL <- with(NEImotor, aggregate(Emissions, by = list(year), sum))
summotorBAL$group <- rep("Baltimore County", length(summotorBAL[,1]))

## Los Angeles emmisions

NEImotor <- motor[which(motor$fips == "06037"), ]
summotorLA <- with(NEImotor, aggregate(Emissions, by = list(year),sum))
summotorLA$group  <- rep("LOS Angeles County", length(summotorLA [,1]))
                                                                                      

Bindboth <- rbind(summotorBAL, summotorLA)
Bindboth$group <- as.factor(Bindboth$group)

colnames(Bindboth) <- c("Year", "Emissions", "Group")



png('plot6.png')
qplot(Year, Emissions, data = Bindboth, group = Group, color = Group, 
      geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), 
      xlab = "Year", main = "Total Emissions of LA and Baltimore")
dev.off()