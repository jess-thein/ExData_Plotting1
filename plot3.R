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

## Create PNG

png('plot3.png', 480, 480)


## Plot the three lines
plot(feb_dates$datetime, feb_dates$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(feb_dates$datetime, feb_dates$Sub_metering_2, col='red')
lines(feb_dates$datetime, feb_dates$Sub_metering_3, col='blue')

## Legend box
legend('topright', lwd = 1, col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()
