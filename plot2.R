##Loading the data
data <- read.table(file.choose(), header = TRUE, sep = ";", na.strings= "?")
attach(data)
str((data))
y<-data[(Date == "1/2/2007" | Date == "2/2/2007"),]
str((y))
detach(data)
attach(y)
z <- paste(Date, Time)
y$DateTime <- strptime(z, "%d/%m/%Y %H:%M:%S")
head(y)
y$Date <- as.Date(y$Date, format = "%d/%m/%Y")
str((y))



##Plot2
names(y)
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(y$DateTime, y$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")
dev.off()

