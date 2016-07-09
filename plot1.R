#### DAVID PRICE ##### 
#### EDA COURSE PROJECT 1 PLOT 1######

# Read in and subset the data (same for all plots)
power<-read.table("household_power_consumption.txt",sep=";",na.strings=c("?"),header=TRUE)

power <- subset(power, Date == "1/2/2007" | Date=="2/2/2007")


#Fix up the types of date and time, combine into one field (same for all plots)
power$DateTime<-paste(power$Date,power$Time)

power$DateTime<-strptime(power$DateTime,format="%d/%m/%Y %H:%M:%S")

# Open png graphics device

png(filename="plot1.png")


# Make plot 1, a histogram of Global active power usage
hist(power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red",breaks=20)

# Turn off graphics device

dev.off()