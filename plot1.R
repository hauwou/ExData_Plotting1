source("loadData.R")

plot1 <- function() {
  #loadData()
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
  str(subDates)
  
  # when reading file, the metering columns got converted into integers from numeric (not sure if it will effect the plot)
  # convert column classes again (may not be necessary)
#   subDates <- transform(subDates,
#                         
#                         Global_active_power = as.numeric(Global_active_power),
#                         Global_reactive_power = as.numeric(Global_reactive_power),
#                         Voltage = as.numeric(Voltage),
#                         Global_intensity = as.numeric(Global_intensity),
#                         Sub_metering_1 = as.numeric(Sub_metering_1),
#                         Sub_metering_2 = as.numeric(Sub_metering_2),
#                         Sub_metering_3 = as.numeric(Sub_metering_3)
#   )
  
  #str(subDates)
  
  #open png device
  png("plot1.png", width=480, height=480)   
  hist(
    subDates$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       col="red"
    )
   
  dev.off()
  par() ##reset display device to rstudioGD
}