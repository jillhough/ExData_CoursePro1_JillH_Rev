## Week 1 Course Project - exploratory data

## 11/20/2014

HPC <- read.csv("household_power_consumption.txt", 
                colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                sep = ";", na.strings = "?")
HPC <- subset(HPC, as.character(HPC$Date) == '1/2/2007' | as.character(HPC$Date) == '2/2/2007')
DateTime <- paste(HPC$Date, HPC$Time)
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")

HPC$Date = as.Date(HPC$Date, format="%d/%m/%Y %H:%M:%S")


## histogram of Global active Power
png(filename="plot1.png", width=480, height=480, units="px")
hist(HPC$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

## line graph of Global active Power

HPC <- read.csv("household_power_consumption.txt", 
                colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                sep = ";", na.strings = "?")
HPC <- subset(HPC, as.character(HPC$Date) == '1/2/2007' | as.character(HPC$Date) == '2/2/2007')
DateTime <- paste(HPC$Date, HPC$Time)
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
HPC2 <- cbind(DateTime,HPC[,3:9])


png(filename="plot2.png", width=480, height=480, units="px")
plot(HPC2$DateTime, HPC2$Global_active_power, typ="l", 
     main="Global Active Power (Kilowatts)",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

HPC <- read.csv("household_power_consumption.txt", 
                colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                sep = ";", na.strings = "?")
HPC <- subset(HPC, as.character(HPC$Date) == '1/2/2007' | as.character(HPC$Date) == '2/2/2007')
DateTime <- paste(HPC$Date, HPC$Time)
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
HPC3 <- cbind(DateTime,HPC[,3:9])

png(filename="plot3.png", width=480, height=480, units="px")
plot(HPC3$DateTime, HPC3$Sub_metering_1, col="black", xlab="Time",
     type = "l", ylab = "Energy sub metering")
lines(HPC3$DateTime, HPC3$Sub_metering_2, col="red", xlab=NULL,type = "l")
lines(HPC3$DateTime, HPC3$Sub_metering_3, col="blue", xlab=NULL,type = "l")
legend("topright", c("sub metering 1","sub metering 2","sub metering 3"),
         lty=1, col= c('black','red','blue'))
dev.off()


HPC <- read.csv("household_power_consumption.txt", 
                colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                sep = ";", na.strings = "?")
HPC <- subset(HPC, as.character(HPC$Date) == '1/2/2007' | as.character(HPC$Date) == '2/2/2007')
DateTime <- paste(HPC$Date, HPC$Time)
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
HPC4 <- cbind(DateTime,HPC[,3:9])

png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(HPC4$DateTime, HPC2$Global_active_power, typ="l", 
      xlab = "",
      ylab = "Global Active Power (kilowatts)")

plot(HPC4$DateTime, HPC4$Voltage)
lines(HPC4$DateTime, lab = c(3,5,7),
      ylab = "Voltage")

plot(HPC4$DateTime, HPC4$Sub_metering_1, col="black", xlab=NULL,
     type = "l", ylab = "Energy sub metering", xlim = c(Thurs, Fri, Sat))
plot(HPC4$DateTime, HPC4$Sub_metering_2, col="red", xlab=NULL,
     type = "l")
plot(HPC4$Time, HPC4$Sub_metering_3, col="blue", xlab=NULL,
     type = "l")
legend("topright", c("sub metering 1","sub metering 2","sub metering 3"),
       lty=1, col= c('black','red','blue'))

plot(HPC4$DateTime, HPC4$Global_reactive_power)
lines(HPC4$Date, lab = c(3,5,7),
      ylab = "Global Reactive Power",
      xlab = "Date/Time")


dev.off()

