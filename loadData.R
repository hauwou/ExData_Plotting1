## load data function
## Please note, this repo does not contain the household_power_consumption.txt file due to size, download your own

loadData <- function ( ){
  message("load data")
  electData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=F)
  ##head(newFile)
  electData$Date <- as.Date(electData$Date, format = "%d/%m/%Y")
  
  #don't convert Time here yet, convert in plot1/2/3/4() functions
  #because after saving the subDates file and re-read it in, the column class will change
  #electData$Time <- strptime(paste(electData$Date, electData$Time), "%Y-%m-%d %H:%M:%S")
  #str(electData)
  
  subDates <-  electData[electData$Date >= "2007-02-01" & electData$Date <= "2007-02-02", ]
  #head(subDates)
  #nrow(subDates)
  
  #str(subDates)
  
  # transform is necessary if columns are not of type numeric
  subDates <- transform(subDates,
                         
                         Global_active_power = as.numeric(Global_active_power),
                         Global_reactive_power = as.numeric(Global_reactive_power),
                         Voltage = as.numeric(Voltage),
                         Global_intensity = as.numeric(Global_intensity),
                         Sub_metering_1 = as.numeric(Sub_metering_1),
                         Sub_metering_2 = as.numeric(Sub_metering_2),
                         Sub_metering_3 = as.numeric(Sub_metering_3)
  )
  
  write.table(subDates, "subDates.txt", sep=";")
  return (subDates)
}