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

png(filename = "plot3.png", width = 480, height = 480)

plot(filteredData$DateTime,filteredData$Sub_metering_3, 
     ylab="Energy sub metering", xlab="", type = "l", col = "blue", ylim=c(0,39))
lines(filteredData$DateTime,filteredData$Sub_metering_2, type = "l", col = "red")
lines(filteredData$DateTime,filteredData$Sub_metering_1, type = "l", col = "black")
legend(x = "topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

