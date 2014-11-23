5.How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Loading the dataset ##
NEI <- readRDS("summarySCC_PM25.rds")
Source <- readRDS("Source_Classification_Code.rds")

## plot ##
library(reshape)
library(ggplot2)
sources<-aggregate(NEI$Emissions[NEI$SCC %in% Source$SCC[grep("Veh",Source$Short.Name)] & NEI$fips==24510] ~ NEI$year[NEI$SCC %in% Source$SCC[grep("Veh",Source$Short.Name)] & NEI$fips==24510] , NEI, sum)
colnames(sources)<-c("year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions)) + geom_bar(stat = "identity") + ggtitle("Emissions by vehicle sources in Baltimore City") + labs(x = "Years", y="Emissions")

## convert plot to png ##
png("plot5.png") 
ggplot(sources, aes(x=factor(year),y=emissions)) + geom_bar(stat = "identity") + ggtitle("Emissions by vehicle sources in Baltimore City") + labs(x = "Years", y="Emissions")
dev.off()
