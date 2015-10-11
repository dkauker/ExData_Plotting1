# I presume that the file is in the working directory

# Read the file
power<- read.table ("household_power_consumption.txt", header = T ,sep = ";" ,  na.strings = "?")

# Subset the required data from the file
data_plot<- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# Create a full date with date and time
data_plot$fulldate<- paste (data_plot$Date, data_plot$Time)

#Create R compatible date and time format (POSIXlt) 
data_plot$fulldate<- strptime (data_plot$fulldate, "%d/%m/%Y %H:%M:%S")

# I am not American, so I set time locale to North American, to get
# english weekday names
Sys.setlocale("LC_TIME", "C")

#set the graphic device to create external file

png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Making the plot with lines and the titles
plot (data_plot$fulldate, data_plot$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

# Making the other two lines in the plot with different colors
lines (data_plot$fulldate, data_plot$Sub_metering_2, col = "red")
lines (data_plot$fulldate, data_plot$Sub_metering_3, col = "blue")

# Adding the legend to the plot
legend ("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Exiting graphic device
dev.off()