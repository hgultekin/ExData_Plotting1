###  Loading data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
### Getting data from "1/2/2007" - "2/2/2007"
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


### Get date time info
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
### Get data for active power,reactive power, voltage and submeterings
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

### For english drawing on day names
Sys.setlocale(category = "LC_ALL", locale = "english")

### Create plot device 480x480
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

### plot the graph 1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

### plot the graph 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

### plot the graph 3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
### Add Lines
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
### Add Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## plot the graph 4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

### close the device
dev.off()
