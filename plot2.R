# change current working directory. The data is in this directory
setwd("C:/Users/Jorge - work/github-repos/ExploratoryData")


# read data
initial <- read.table("household_power_consumption.txt", 
	nrows = 5, header = TRUE, sep=";", na.strings = "?")
classes <- sapply(initial , class)

dataAll <- read.table("household_power_consumption.txt", 
	header = TRUE, sep=";", na.strings = "?", colClasses = classes)

# clean and organize data from dataAll
dataAll$Date = as.Date(dataAll$Date, format = "%d/%m/%Y")
# setnames(dataAll, old=c("Global_active_power"), new=c("Global Active Power (kilowatts)"))
# summary(dataAll)
# str(dataAll) --> shows the data type of each column

filteredData <- (subset(dataAll, Date == "2007-02-01" | Date == "2007-02-02"))

# change current directory. The png will be saved here, as well as the r file.
setwd("C:/Users/Jorge - work/github-repos/ExploratoryData/ExData_Plotting1")

#png(filename = "plot1.png",
#    width = 480, height = 480)

plot(filteredData$time,filteredData$Global_active_power,
	main="Global Active Power",  
	xlab="Global Active Power (kilowatts)")

#dev.off()