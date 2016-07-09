#### DAVID PRICE ##### 
#### EDA COURSE PROJECT 1 PLOT 4 ######

# Read in and subset the data (same for all plots)
power<-read.table("household_power_consumption.txt",sep=";",na.strings=c("?"),header=TRUE)

power <- subset(power, Date == "1/2/2007" | Date=="2/2/2007")

#Fix up the types of date and time, combine into one field (same for all plots)
power$DateTime<-paste(power$Date,power$Time)

power$DateTime<-strptime(power$DateTime,format="%d/%m/%Y %H:%M:%S")

# Open graphics device
png(filename="plot4.png")

# Set up plot window to hold four panels
par(mfrow=c(2,2))

# First panel
plot(power$DateTime,power$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="n")

lines(power$DateTime,power$Global_active_power)

# Second panel
plot(power$DateTime,power$Voltage, xlab="datetime",ylab="Voltage",type="n")
lines(power$DateTime,power$Voltage)

# Third panel
plot(power$DateTime,power$Sub_metering_1,xlab="",ylab="Energy sub metering", type="n")
lines(power$DateTime,power$Sub_metering_1,col="black")
lines(power$DateTime,power$Sub_metering_2,col="red")
lines(power$DateTime,power$Sub_metering_3,col="blue")


legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=c(1,1,1),
       cex=1,
       bty="n"
)

# Fourth panel
plot(power$DateTime,power$Global_reactive_power, xlab="datetime",type="n")
lines(power$DateTime,power$Global_reactive_power)

# Turn off graphics device
dev.off()