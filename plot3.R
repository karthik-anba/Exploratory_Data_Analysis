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


##Plot3
names(y)
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(y$DateTime, y$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black" )
lines(y$DateTime, y$Sub_metering_2, type = "l", col = "red")
lines(y$DateTime, y$Sub_metering_3, type = "l", col = "blue")
legend("topright",col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)
dev.off()

