# open file, read required subset of data, restore headings and convert times & dates
data <- read.table("../household_power_consumption.txt", header=T, sep=";", na.strings="?", strip.white=T, as.is=c(1,2), skip=66636, nrows=2880)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# draw the plot
png("plot3.png")
with(data, plot(datetime, Sub_metering_1, ylab='Energy sub metering', xlab='', type='n'))
with(data, points(datetime, Sub_metering_1, type='l'))
with(data, points(datetime, Sub_metering_2, col='red', type='l'))
with(data, points(datetime, Sub_metering_3, col='blue', type='l'))
legend("topright", lwd='1', col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
