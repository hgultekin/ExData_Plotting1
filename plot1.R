###  Loading data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
### Getting data from "1/2/2007" - "2/2/2007"
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

### For english drawing on day names
Sys.setlocale(category = "LC_ALL", locale = "english")

### get the numbers for plot
globalActivePower <- as.numeric(subSetData$Global_active_power)
### Create pdf device 480x480
png("plot1.png", width=480, height=480)
### Create a histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
### Close the device
dev.off()
