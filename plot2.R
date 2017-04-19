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



##Create Plot 2

#Open #PNG
png(file = "plot2.png",width = 480, height = 480)

#built blank plot
plot(x = data$DateTime,y = data$Global_active_power, main="",ylab = "Global Active Power (kilowatts)",type = "n")

#add lines
lines(x = data$DateTime,y = data$Global_active_power)

#close png
dev.off()