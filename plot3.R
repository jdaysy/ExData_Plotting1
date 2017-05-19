library(data.table)
library(dplyr)
powerdata <- fread("household_power_consumption.txt", na.strings="?")

powerdata <- mutate(powerdata, DateTime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))
twodays <- filter(powerdata, DateTime >= as.POSIXct("2007-02-01"), DateTime < as.POSIXct("2007-02-03") )

twodays <- as.data.table(twodays)


## plot 3
png("plot3.png")
plot(twodays$DateTime, twodays$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(twodays$DateTime, twodays$Sub_metering_2, col="red")
lines(twodays$DateTime, twodays$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1 )
dev.off()

