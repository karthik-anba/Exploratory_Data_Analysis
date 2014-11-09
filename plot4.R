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


##Plot4
png(filename = "plot4.png",width = 480, height = 480,units = "px", bg = "transparent")
par(mfrow = c(2, 2))


#P1-LeftTop
plot(y$DateTime, y$Global_active_power,xlab = "", ylab = "Global Active Power", type = "l")

#P2-RightTop
plot(y$DateTime, y$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

#P3-LeftBottom
plot(y$DateTime, y$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black" )
lines(y$DateTime, y$Sub_metering_2, type = "l", col = "red")
lines(y$DateTime, y$Sub_metering_3, type = "l", col = "blue")

#P4-RightBottom
plot(y$DateTime, y$Global_reactive_power, col = "black", xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
