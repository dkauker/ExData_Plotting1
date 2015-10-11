
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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Make the plot with lines, and titles
plot (data_plot$fulldate, data_plot$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Exiting graphic device
dev.off()

