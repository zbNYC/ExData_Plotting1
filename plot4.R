## Read data in memory first
All_data <- read.table("household_power_consumption.txt", header = TRUE, sep=';', na.strings="?")

## Data subset - data from the dates 2007-02-01 and 2007-02-02
All_data$Date <- as.Date(All_data$Date, format="%d/%m/%Y") 
DateRange_data <- subset(All_data, All_data$Date=="2007-02-01" | All_data$Date=="2007-02-02") 
 
## Converting the Date and Time variables to Date/Time classes in R 
datetime <- paste (as.Date(DateRange_data$Date), DateRange_data$Time) 
DateRange_data$DateTime <- strptime(datetime, "%Y-%m-%d %H:%M:%S") 

## Plotting
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(DateRange_data$DateTime, DateRange_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(DateRange_data$DateTime, DateRange_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DateRange_data$DateTime, DateRange_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DateRange_data$DateTime, DateRange_data$Sub_metering_2, col='red')
lines(DateRange_data$DateTime, DateRange_data$Sub_metering_3, col='blue')
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2)
plot(DateRange_data$DateTime, DateRange_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 
