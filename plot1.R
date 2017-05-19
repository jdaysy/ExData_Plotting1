library(data.table)
library(dplyr)
powerdata <- fread("household_power_consumption.txt", na.strings="?")

powerdata <- mutate(powerdata, DateTime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))
twodays <- filter(powerdata, DateTime >= as.POSIXct("2007-02-01"), DateTime < as.POSIXct("2007-02-03") )

twodays <- as.data.table(twodays)

## plot 1
png("plot1.png")
hist(twodays$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()