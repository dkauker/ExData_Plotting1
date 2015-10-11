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
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Setting the layout for 2 plots in 2 rows
par (mfrow = c(2, 2))

# Make the first plot with lines, and titles
plot (data_plot$fulldate, data_plot$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Making the second plot with titles
plot (data_plot$fulldate, data_plot$Voltage, type = "l", xlab = "datatime", ylab = "Voltage")


# Making the third plot with lines and titles
plot (data_plot$fulldate, data_plot$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

# Making the other two lines in the third plot with different colors
lines (data_plot$fulldate, data_plot$Sub_metering_2, col = "red")
lines (data_plot$fulldate, data_plot$Sub_metering_3, col = "blue")

# Adding the legend to the third plot
legend ("topright", bty = "n" , lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Making the fourth plot with titles
plot (data_plot$fulldate, data_plot$Global_reactive_power, type = "l", xlab = "datatime", ylab = "Global_reactive_power")


# Exiting graphic device
dev.off()