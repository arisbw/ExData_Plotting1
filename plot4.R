#load the dataset
electric <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
electric$Time = paste(electric$Date, electric$Time)
electric$Time = as.POSIXlt(electric$Time,format="%d/%m/%Y %H:%M:%S")
electric$Date = NULL

subs <- subset(electric,Time$year==107 & Time$mon==1 & (Time$mday==1 | Time$mday==2))

#plot
png("plot4.png")
par(mfrow=c(2,2))
#plot 1
plot(x=(subs$Time),y=subs$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#plot 2
plot(x=(subs$Time),y=subs$Voltage,type="l",ylab="Voltage",xlab="Time")
#plot 3
plot(x=(subs$Time),y=subs$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subs$Time),y=subs$Sub_metering_2,col="red")
lines(x=(subs$Time),y=subs$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)
#plot 4
plot(subs$Time, subs$Global_reactive_power, type = "l", main = "", xlab = "Time")
dev.off()