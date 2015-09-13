###  Loading data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
### Getting data from "1/2/2007" - "2/2/2007"
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


### Get date time info
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
### Get data for active power and submetering
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

### For english drawing on day names
Sys.setlocale(category = "LC_ALL", locale = "english")

### Create plot device 480x480
png("plot3.png", width=480, height=480)
### plot the graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
### Add Lines
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
### Add Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
### close the device
dev.off()
