#3.Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

## Loading the dataset ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## plot ##
library(reshape)
library(ggplot2)
sources<-aggregate(NEI$Emissions[NEI$fips==24510] ~ NEI$type[NEI$fips==24510]+NEI$year[NEI$fips==24510] , NEI, sum)
colnames(sources)<-c("type","year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions,group=type)) + geom_line(aes(colour=type)) + ggtitle("Emissions in Baltimore City") + labs(x = "Years", y="Emissions")

## convert plot to png ##
png("plot3.png") 
ggplot(sources, aes(x=factor(year),y=emissions,group=type)) + geom_line(aes(colour=type)) + ggtitle("Emissions in Baltimore City") + labs(x = "Years", y="Emissions")
dev.off()
