library(data.table)
library(dplyr)
powerdata <- fread("household_power_consumption.txt", na.strings="?")

powerdata <- mutate(powerdata, DateTime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))
twodays <- filter(powerdata, DateTime >= as.POSIXct("2007-02-01"), DateTime < as.POSIXct("2007-02-03") )

twodays <- as.data.table(twodays)


## plot 2
png("plot2.png")
plot(twodays$DateTime, twodays$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()
