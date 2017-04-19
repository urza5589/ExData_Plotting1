library(readr)

##reads in original data
hpc <- read_delim("./Assgn1Data/household_power_consumption.txt",";", escape_double = FALSE, na = "?", trim_ws = TRUE)

## Convert date to proper r class
hpc$DateOld <- hpc$Date
hpc$Date <- as.Date(hpc$DateOld,"%d/%m/%Y")

##Subset to specific data for use in assigment
data <- subset(hpc,hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02")

##Combine Date and Time into single proper format field
data$DateTime <- with(data, as.POSIXct(paste(as.Date(Date, format="%m/%d/%y"), Time)))





##Create Plot 4

#Open PNG
png(file = "plot4.png",width = 480, height = 480)

#build rows/columns for plot
par(mfrow=c(2,2))

#generate first plot
plot(x = data$DateTime,y = data$Global_active_power, main="",ylab = "Global Active Power",type = "n")
lines(x = data$DateTime,y = data$Global_active_power)

#generate second plot
plot(x = data$DateTime,y = data$Voltage, main="",xlab="datetime",ylab = "Voltage",type = "n")
lines(x = data$DateTime,y = data$Voltage)

#generate third plot
plot(x = data$DateTime,y = data$Sub_metering_1, main="",xlab="",ylab = "Energy sub metering",type = "n")
lines(x = data$DateTime,y = data$Sub_metering_1)
lines(x = data$DateTime,y = data$Sub_metering_2,col = "red")
lines(x = data$DateTime,y = data$Sub_metering_3,col = "blue")
legend('topright',legend = (c("Sub_metering_1","Sub_metering_2","Sub_metering_3")),col=c('black', 'red', 'blue'),lty = c(1, 1, 1))

#generate fourth plot
plot(x = data$DateTime,y = data$Global_reactive_power, main="",xlab="datetime",ylab = "Global_reactive_power",type = "n")
lines(x = data$DateTime,y = data$Global_reactive_power)

#close PNG
dev.off()