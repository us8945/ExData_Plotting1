###
## Code to generate graphs for Project 1 of Exploratory Data Analisys class
## Graph #3
##########################################################################

setwd("F:/Coursera/Exploratory Data Analysis March 2015 Cert/Project 1")
tab5rows = read.csv("household_power_consumption.txt", sep=";", nrows = 5,na.strings="?")
classes = sapply(tab5rows, class)
classes[1] = "character"
classes[2] = "character"
h_consumption_All = read.csv("household_power_consumption.txt", sep=";", colClasses = classes,na.strings="?")

#Selectting two relevant days
h_consumption_select = h_consumption_All[h_consumption_All$Date == "1/2/2007" | h_consumption_All$Date == "2/2/2007", ]

##Convert to Date-time by adding new field
h_consumption_select$datetime=as.POSIXct(strptime(paste(h_consumption_select$Date, h_consumption_select$Time), "%d/%m/%Y %H:%M:%S"))


##Plot 3
png(file="plot3.png",width=480,height=480)
plot(h_consumption_select$datetime,h_consumption_select$Sub_metering_1,col="Black",xlab="",ylab="Energy sub metering",pch=".",cex.axis=1,cex.lab=1)
lines(h_consumption_select$datetime,h_consumption_select$Sub_metering_1,col="Black",type='l')
lines(h_consumption_select$datetime,h_consumption_select$Sub_metering_2,col="Red",type='l')
lines(h_consumption_select$datetime,h_consumption_select$Sub_metering_3,col="Blue",type='l')
legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
