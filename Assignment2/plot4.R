#4.Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Loading the dataset ##
NEI <- readRDS("summarySCC_PM25.rds")
Source <- readRDS("Source_Classification_Code.rds")

## plot ##
library(reshape)
library(ggplot2)
sources<-aggregate(NEI$Emissions[NEI$SCC %in% Source$SCC[grep("Coal",Source$Short.Name)]] ~ NEI$year[NEI$SCC %in% Source$SCC[grep("Coal",Source$Short.Name)]] , NEI, sum)
colnames(sources)<-c("year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions)) + geom_bar(stat = "identity") + ggtitle("Emissions by Coal Combustion") + labs(x = "Years", y="Emissions")

## convert plot to png ##
png("plot4.png") 
ggplot(sources, aes(x=factor(year),y=emissions)) + geom_bar(stat = "identity") + ggtitle("Emissions by Coal Combustion") + labs(x = "Years", y="Emissions")
dev.off()
