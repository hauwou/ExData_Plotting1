source("loadData.R")

plot4 <- function() {
  if(file.exists("subDates.txt")) {
    message("found subset text file")
    subDates <- read.table("subDates.txt",  sep=";", na.strings = "?", header=TRUE, stringsAsFactors=FALSE)
    
  }
  else {
    
    message("no subDates.txt")
    subDates <- loadData()
  }
  #MUST do this strptime conversion because reading table from text file will not retain the Posxlt time class 
  subDates$Time <- strptime(paste(subDates$Date, subDates$Time), format = "%Y-%m-%d %H:%M:%S")
  
  #head(subDates)
  #str(subDates)
  
  
  
  #open png device
  png("plot4.png", width=480, height=480)   
  
  #plot(subDates$Time, subDates$Global_act)
  
  par(mfcol=c(2,2)) #set parameter for multi plots 2x2, fill by columns, can use mfrow to fill by row
  
  #Plot 1 - top left
  plot(subDates$Time, subDates$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  #Plot 2 - bottom left
  plot(subDates$Time, subDates$Sub_metering_1,
       type="l",
       xlab="",
       ylab="Energy sub metering",
       col="black")
  
  #the lines function acts the same as the type param in the plot function,
  #substitute p for l will convert lines to points
  #The lines() adds lines to the preceding plot()
  #points(subDates$Time, subDates$Sub_metering_2, col="red")
  lines(subDates$Time, subDates$Sub_metering_2,
        col="red")
  lines(subDates$Time, subDates$Sub_metering_3,
        col="blue")
  legend("topright",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"),
         lty=1,
  )
  
  
  #Plot 3 - top right  
  
  plot(subDates$Time, subDates$Voltage,
       type="l",
       xlab="datetime",
       ylab="Voltage")
  
  #Plot 4 - bottom right
  
  plot(subDates$Time, subDates$Global_reactive_power,
       type="l",
       xlab="datetime",
       ylab="Global_reactive_power"
       ) #if omit ylab, then label will be the column name attached to table name (subDates$Global_reactive_power)
  
  dev.off()
  #par() ##reset display device to rstudioGD
}