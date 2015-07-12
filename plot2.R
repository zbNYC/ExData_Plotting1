## Read data in memory first
All_data <- read.table("household_power_consumption.txt", header = TRUE, sep=';', na.strings="?")

## Data subset - data from the dates 2007-02-01 and 2007-02-02
All_data$Date <- as.Date(All_data$Date, format="%d/%m/%Y") 
DateRange_data <- subset(All_data, All_data$Date=="2007-02-01" | All_data$Date=="2007-02-02") 
 
## Converting the Date and Time variables to Date/Time classes in R 
datetime <- paste (as.Date(DateRange_data$Date), DateRange_data$Time) 
DateRange_data$DateTime <- strptime(datetime, "%Y-%m-%d %H:%M:%S") 

## Plotting
png("plot2.png", width=480, height=480)
plot(DateRange_data$DateTime, DateRange_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" ) 
dev.off()