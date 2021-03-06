# change current working directory. The data is in this directory
setwd("C:/Users/Jorge - work/github-repos/ExploratoryData")


# read data
initial <- read.table("household_power_consumption.txt", 
                      nrows = 5, header = TRUE, sep=";", na.strings = "?")
classes <- sapply(initial , class)

dataAll <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep=";", na.strings = "?", colClasses = classes)

# clean and organize data from dataAll
dataAll$DateTime <- paste(dataAll$Date, dataAll$Time)
dataAll$DateTime <- strptime(dataAll$DateTime, format = "%d/%m/%Y %H:%M:%S")

filteredData <- (subset(dataAll, as.Date(DateTime) == "2007-02-01" | as.Date(DateTime) == "2007-02-02"))

# change current directory. The png will be saved here, as well as the r file.
setwd("C:/Users/Jorge - work/github-repos/ExploratoryData/ExData_Plotting1")

png(filename = "plot2.png", width = 480, height = 480)

plot(filteredData$DateTime,filteredData$Global_active_power, 
	ylab="Global Active Power (kilowatts)", xlab="", type = "l")

dev.off()

