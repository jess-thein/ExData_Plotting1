setwd("~/R/coursera_exploratory")
library(tidyverse)
library(ggplot2)
library(datasets)


## Read in Data
full_data<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";")
str(full_data)
summary(full_data)
full_data$Date2<-as.Date(full_data$Date)
full_data$Date3<-as.Date(full_data$Date, format = "%d/%m/%Y")

##Subset data 

feb_dates<-full_data[(full_data$Date3 > "2007-01-31" & full_data$Date3 < "2007-02-03"),]
feb_dates$Global_active_power2<-as.numeric(feb_dates$Global_active_power)


## Create a png device
png('plot4.png', 480, 480)

## Set parameter for 2x2 plots
par(mfrow = c(2, 2))


  
  ## Line plot 1
  plot(feb_dates$datetime, feb_dates$Global_active_power2, type = 'l', xlab = '', ylab = 'Global Active Power')
  
  ## Line plot 2
  plot(feb_dates$datetime, feb_dates$Voltage, type = 'l')
  
  ## Line plot 3
  plot(feb_dates$datetime, feb_dates$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
  lines(feb_dates$datetime, feb_dates$Sub_metering_2, col='red')
  lines(feb_dates$datetime, feb_dates$Sub_metering_3, col='blue')
  legend('topright', bty = 'n', lwd = 1, col = c('black', 'red', 'blue'), 
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  
  ## Line plot 4
  plot(feb_dates$datetime, feb_dates$Global_reactive_power, type = 'l')


dev.off()
