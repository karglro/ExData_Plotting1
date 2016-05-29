


#load data
all_data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")

#filter data
selected_data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007",]

# generate datetime column
selected_data$datetime <- strptime(paste(selected_data$Date, selected_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")





png(filename = "plot4.png")

# setting for  4 images
par(mfrow = c(2, 2))


# generate plot1
with(selected_data, plot(datetime, Global_active_power,type = "l",ylab = "Global Active Power",xlab = ""))

# generate plot2
with(selected_data, plot(datetime, Voltage,type = "l",ylab = "Voltage"))

# generate plot3
with(selected_data, plot(datetime, Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering"))
with(selected_data, points(datetime, Sub_metering_1, col="black", type = "l"))
with(selected_data, points(datetime, Sub_metering_2, col="red", type = "l"))
with(selected_data, points(datetime, Sub_metering_3, col="blue", type = "l"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n")

# generate plot4
with(selected_data, plot(datetime, Global_reactive_power,type = "l",ylab = "Global_reactive_power"))

dev.off()