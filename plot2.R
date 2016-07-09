#### DAVID PRICE ##### 
#### EDA COURSE PROJECT 1 PLOT 2 ######

# Read in and subset the data (same for all plots)
power<-read.table("household_power_consumption.txt",sep=";",na.strings=c("?"),header=TRUE)

power <- subset(power, Date == "1/2/2007" | Date=="2/2/2007")

#Fix up the types of date and time, combine into one field (same for all plots)
power$DateTime<-paste(power$Date,power$Time)

power$DateTime<-strptime(power$DateTime,format="%d/%m/%Y %H:%M:%S")

# Open graphics device
png(filename="plot2.png")

# Make plot 2 by first plotting empty scatterplot and then adding the time series.
plot(power$DateTime,power$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="n")

lines(power$DateTime,power$Global_active_power)

# Turn off graphics device
dev.off()