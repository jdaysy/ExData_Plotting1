library(data.table)
library(dplyr)
powerdata <- fread("household_power_consumption.txt", na.strings="?")

powerdata <- mutate(powerdata, DateTime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))
twodays <- filter(powerdata, DateTime >= as.POSIXct("2007-02-01"), DateTime < as.POSIXct("2007-02-03") )

twodays <- as.data.table(twodays)

# plot 4
png("plot4.png")
par(mfrow=c(2,2))
plot(twodays$DateTime, twodays$Global_active_power, ylab="Global Active Power", xlab="", type="l")
plot(twodays$DateTime, twodays$Voltage, ylab="Voltage", xlab="datetime", type="l")
plot(twodays$DateTime, twodays$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(twodays$DateTime, twodays$Sub_metering_2, col="red")
lines(twodays$DateTime, twodays$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n" )
plot(twodays$DateTime, twodays$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()


