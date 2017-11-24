t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date & filter for the right dates
t$Date <- as.Date(t$Date, "%d/%m/%Y")
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  
## Remove incomplete observation
t <- t[complete.cases(t),]

## Combine Date and Time
dateTime <- paste(t$Date, t$Time)
  
## Vector name
dateTime <- setNames(dateTime, "DateTime")
  
## Remove Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]
  
## Add DateTime column
t <- cbind(dateTime, t)
  
## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)

  ## Create the histogram
  hist(t$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
  
  ## Save file and close device
  #dev.copy(png,"plot1.png", width=480, height=480)
  #dev.off()
