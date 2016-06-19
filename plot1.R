#load the dataset
electric <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
electric$Time = paste(electric$Date, electric$Time)
electric$Time = as.POSIXlt(electric$Time,format="%d/%m/%Y %H:%M:%S")
electric$Date = NULL

subs <- subset(electric,Time$year==107 & Time$mon==1 & (Time$mday==1 | Time$mday==2))

#plot
png('plot1.png')
hist(subs$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
dev.off()
