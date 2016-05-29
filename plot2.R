

#load data
all_data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")

#filter data
selected_data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007",]

# generate datetime column
selected_data$datetime <- strptime(paste(selected_data$Date, selected_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")



# generate image
png(filename = "plot2.png")
with(selected_data, plot(datetime, Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = ""))
dev.off()