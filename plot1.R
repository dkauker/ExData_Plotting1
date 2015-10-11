
# Assume that the file is in the working directory

# Read the file, and subset the required data
power<- read.table ("household_power_consumption.txt", header = T ,sep = ";" ,  na.strings = "?")

# Subset the required data from the file
data_hist<- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# Set the graphic device, and details of the file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Make the histogramm and the titles
hist (data_hist$Global_active_power, freq = T, breaks = 11, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Exiting graphic device
dev.off()