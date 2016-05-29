
#load data

all_data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")
selected_data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007",]


# generate image
png(filename = "plot1.png")
hist(selected_data$Global_active_power, xlab = "Global Active Power (kilowatts)",main = "Global Active Power", col = "red")
dev.off()
