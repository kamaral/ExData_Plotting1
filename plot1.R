plot1 <- function(){
  
  #Load libraries  
  library(datasets)
  
  #Set working Directory
  setwd("C:/Users/kstelter/Desktop/DS/Exploring Data/Week 1/exdata-data-household_power_consumption")
  
  #read in entire data set
  mydata <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
  
  #Only take data between 2/1/2007 and 2/2/2007
  mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
  date1 <- as.Date('2007-02-01')
  date2 <- as.Date('2007-02-02')
  mydata <- subset(mydata, (mydata$Date >= date1 & mydata$Date <= date2))
  
  #open device
  png(filename='plot1.png',width=480,height=480,units='px')
  
  #plot data and output to plot1.png
  hist(mydata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#turn off device
dev.off()
}