#load the dataset
electric <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
electric$Time = paste(electric$Date, electric$Time)
electric$Time = as.POSIXlt(electric$Time,format="%d/%m/%Y %H:%M:%S")
electric$Date = NULL

subs <- subset(electric,Time$year==107 & Time$mon==1 & (Time$mday==1 | Time$mday==2))

#plot
png("plot3.png")
plot(x=(subs$Time),y=subs$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subs$Time),y=subs$Sub_metering_2,col="red")
lines(x=(subs$Time),y=subs$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()