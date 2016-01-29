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
