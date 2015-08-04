png("plot4.png")

par(mfrow = c(2,2))

hpc <- read.table("household_power_consumption.txt", header=FALSE, sep=";", na.strings = "?", skip=66637, nrows=2880,colClasses = c("character", "character", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL"))
hpc <- list(strptime(paste(hpc$V1,hpc$V2), format="%d/%m/%Y %H:%M:%S"), hpc$V3)
names(hpc) <- c("DateTime", "GlobalActivePower")
plot(hpc$DateTime, hpc$GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

hpc <- read.table("household_power_consumption.txt", header=FALSE, sep=";", na.strings = "?", skip=66637, nrows=2880,colClasses = c("character", "character", "NULL", "NULL", "numeric", "NULL", "NULL", "NULL", "NULL"))
hpc <- list(strptime(paste(hpc$V1,hpc$V2), format="%d/%m/%Y %H:%M:%S"), hpc$V5)
names(hpc) <- c("DateTime", "Voltage")
plot(hpc$DateTime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")

hpc <- read.table("household_power_consumption.txt", header=FALSE, sep=";", na.strings = "?", skip=66637, nrows=2880,colClasses = c("character", "character", "NULL", "NULL", "NULL", "NULL", "numeric", "numeric", "numeric"))
hpc <- list(strptime(paste(hpc$V1,hpc$V2), format="%d/%m/%Y %H:%M:%S"), hpc$V7, hpc$V8, hpc$V9)
names(hpc) <- c("DateTime", "SubMetering1", "SubMetering2", "SubMetering3")
plot(hpc$DateTime, hpc$SubMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$DateTime, hpc$SubMetering2, type="l", col="red")
lines(hpc$DateTime, hpc$SubMetering3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), xjust=1, lty=1, col=c("black","red","blue"), bty="n")

hpc <- read.table("household_power_consumption.txt", header=FALSE, sep=";", na.strings = "?", skip=66637, nrows=2880,colClasses = c("character", "character", "NULL", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL"))
hpc <- list(strptime(paste(hpc$V1,hpc$V2), format="%d/%m/%Y %H:%M:%S"), hpc$V4)
names(hpc) <- c("DateTime", "GlobalReactivePower")
plot(hpc$DateTime, hpc$GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", lwd=1)

dev.off()