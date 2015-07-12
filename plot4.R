plot4 <- function(){
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
  png(filename='plot4.png',width=480,height=480,units='px')
  
  # make 4 plots
  par(mfrow=c(2,2))
  
  # plot data on top left (1,1)
  plot(x = mydata$Time,y = mydata$Global_active_power,ylab='Global Active Power', xlab='', type='l')
  
  # plot data on top right (1,2)
  plot(x = mydata$Time,y = mydata$Voltage,xlab = 'datetime', ylab='Voltage', type='l')
  
  # plot data on bottom left (2,1)
  lncol<-c('black','red','blue')
  lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
  plot(x = mydata$Time, y = mydata$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
  lines(x = mydata$Time,y = mydata$Sub_metering_2,col=lncol[2])
  lines(x = mydata$Time,y = mydata$Sub_metering_3,col=lncol[3])
  
  # add legend
  legend('topright',legend=lbls,col=lncol,lty='solid')
  
  
  # plot data on bottom right (2,2)
  plot(x = mydata$Time,y = mydata$Global_reactive_power,xlab = 'datetime' ,ylab='Global_reactive_power', type='l')
  
  #turn off device
  dev.off()
}