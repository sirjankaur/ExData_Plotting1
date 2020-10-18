#Loading the file into a data frame
fileData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Convert Date and Time column from character type to Date type
fileData$Date <- as.Date(fileData$Date, format = "%d/%m/%Y")

#Subsetting the fileData between "2007-02-01" and "2007-02-02"
data <- subset(fileData, Date == "2007-02-01" | Date == "2007-02-02")

##Create a new column in Data frame and merge the values of
##Date and Time.
data$TimeNew <- paste(as.character(data$Date), data$Time)
data$TimeNew <- strptime(data$TimeNew, format = "%Y-%m-%d %H:%M:%S", tz= "")

#Plot the graph with required parameters
plot(data$TimeNew, as.numeric(as.character(data$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", 
     main="Global Active Power and Time")

#Export to PNG format
dev.copy(png, file = "plot2.png")

#Close the device
dev.off()