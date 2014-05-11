# open file, read required subset of data, restore headings and convert times & dates
data <- read.table("../household_power_consumption.txt", header=T, sep=";", na.strings="?", strip.white=T, as.is=c(1,2), skip=66636, nrows=2880)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# draw the plot
png("plot2.png")
plot(data$datetime, data$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')
dev.off()
