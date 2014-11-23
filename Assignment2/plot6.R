6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Loading the dataset ##
NEI <- readRDS("summarySCC_PM25.rds")
Source <- readRDS("Source_Classification_Code.rds")

## plot ##
library(reshape)
library(ggplot2)
sources<-aggregate(NEI$Emissions[NEI$SCC %in% Source$SCC[grep("Veh",Source$Short.Name)] & (NEI$fips==24510 | NEI$fips=="06037")] ~ NEI$year[NEI$SCC %in% Source$SCC[grep("Veh",Source$Short.Name)] & (NEI$fips==24510 | NEI$fips=="06037")] + NEI$fips[NEI$SCC %in% Source$SCC[grep("Veh",Source$Short.Name)] & (NEI$fips==24510 | NEI$fips=="06037")], NEI, sum)
colnames(sources)<-c("year","fips","emissions")
ggplot(sources, aes(x=factor(year),y=emissions,group=fips)) + geom_line(aes(colour=fips)) + ggtitle("Emissions by vehicle sources") + labs(x = "Years", y="Emissions") + scale_colour_manual (values=c("orange","black"), labels=c("Los Angeles County","Baltimore City"))

## convert plot to png ##
png("plot6.png") 
ggplot(sources, aes(x=factor(year),y=emissions,group=fips)) + geom_line(aes(colour=fips)) + ggtitle("Emissions by vehicle sources") + labs(x = "Years", y="Emissions") + scale_colour_manual (values=c("orange","black"), labels=c("Los Angeles County","Baltimore City"))
dev.off()
