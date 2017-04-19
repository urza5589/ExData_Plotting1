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



##Create Plot 3

#Open PNG
png(file = "plot3.png",width = 480, height = 480)

#build blank plot
plot(x = data$DateTime,y = data$Sub_metering_1, main="",xlab="",ylab = "Energy sub metering",type = "n")

#generate individual lines with distinct coloring
lines(x = data$DateTime,y = data$Sub_metering_1)
lines(x = data$DateTime,y = data$Sub_metering_2,col = "red")
lines(x = data$DateTime,y = data$Sub_metering_3,col = "blue")

#generate legend in top right
legend('topright',legend = (c("Sub_metering_1","Sub_metering_2","Sub_metering_3")),col=c('black', 'red', 'blue'),lty = c(1, 1, 1))

#close png
dev.off()