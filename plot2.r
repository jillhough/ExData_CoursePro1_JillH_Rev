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
