plot2 <- function(){
  #Load libraries  
  library(datasets)
  library(lubridate)
  
  #Set working Directory
  setwd("C:/Users/kstelter/Desktop/DS/Exploring Data/Week 1/exdata-data-household_power_consumption")
 
  #read in entire data set
  mydata <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
  
  #Using the libridate library, concatanate the date and time together, and put in the column "Time"
  mydata$Time <-dmy(mydata$Date)+hms(mydata$Time)

  #Only take data between 2/1/2007 and 2/2/2007
  mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y") 
  date1 <- as.Date('2007-02-01')
  date2 <- as.Date('2007-02-02')
  mydata <- subset(mydata, (mydata$Date >= date1 & mydata$Date <= date2))
  
  #open device
  png(filename='plot2.png',width=480,height=480,units='px')
  
  #plot data and output to plot2.png
  plot(x = mydata$Time,y = mydata$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
  
  #turn off device
  dev.off()
}