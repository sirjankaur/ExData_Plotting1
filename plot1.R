
#Loading the file into a data frame
fileData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Convert Date column from character type to Date type
fileData$Date <- as.Date(fileData$Date, format = "%d/%m/%Y")

#Subsetting the fileData between "2007-02-01" and "2007-02-02"
data <- subset(fileData, Date == "2007-02-01" | Date == "2007-02-02")

#Calling Hist function with required parameters
hist(as.numeric(as.character(data$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Export to PNG format
dev.copy(png, file = "plot1.png")

#Close the device
dev.off()