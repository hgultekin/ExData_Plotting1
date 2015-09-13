###  Loading data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
### Getting data from "1/2/2007" - "2/2/2007"
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

### For english drawing on day names
Sys.setlocale(category = "LC_ALL", locale = "english")

### Get date time info
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
### Get data for active power 
globalActivePower <- as.numeric(subSetData$Global_active_power)
### Create plot device 480x480
png("plot2.png", width=480, height=480)
### plot the graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
### close the device
dev.off()
