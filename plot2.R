source("loadData.R")

plot2 <- function() {
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
  png("plot2.png", width=480, height=480)   
  
  #plot(subDates$Time, subDates$Global_act)
  
  plot(subDates$Time, subDates$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  dev.off()
  #par() ##reset display device to rstudioGD
}