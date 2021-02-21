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

png('plot1.png', 480, 480)

##Create Histogram
hist(feb_dates$Global_active_power2, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     ylab = "Frequency",
     col = "red")


dev.off()
