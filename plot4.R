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

par(mfcol =c(2,2), mar = c(4,4,2,2))

#Plot the graph with required parameters
plot(data$TimeNew, as.numeric(as.character(data$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power")

plot(data$TimeNew, data$Sub_metering_1,
     type = "n", xlab = "", ylab = "Energy sub metering")
with(data, lines(TimeNew, as.numeric(as.character(Sub_metering_1))))
with(data, lines(TimeNew, as.numeric(as.character(Sub_metering_2)),col="red"))
with(data, lines(TimeNew, as.numeric(as.character(Sub_metering_3)),col="blue"))

legend("topright", lty=1, col=c("black","red","blue"), bty = "n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex=0.6
)

plot(data$TimeNew,as.numeric(as.character(data$Voltage)), type="l",xlab="datetime",ylab="Voltage")
plot(data$TimeNew,as.numeric(as.character(data$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")

#Export to PNG format
dev.copy(png, file = "plot4.png")

#Close the device
dev.off()