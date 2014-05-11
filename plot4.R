# x<-read.delim("household_power_consumption.txt", 
#               header = TRUE, 
#               sep = ";", quote = "\"",
#               dec = ".", 
#               fill = TRUE, comment.char = "")
# 
# dates<-x[as.Date(x$Date,format="%d/%m/%Y")=="2007-02-01" |
#            as.Date(x$Date,format="%d/%m/%Y")=="2007-02-02",]
# 
# dates$Global_active_power<- as.numeric(levels(dates$Global_active_power))[dates$Global_active_power]
# dates$Voltage<- as.numeric(levels(dates$Voltage))[dates$Voltage]
# dates$Sub_metering_1<- as.numeric(levels(dates$Sub_metering_1))[dates$Sub_metering_1]
# dates$Sub_metering_2<- as.numeric(levels(dates$Sub_metering_2))[dates$Sub_metering_2]
# ##dates$Sub_metering_3<- as.numeric(levels(dates$Sub_metering_3))[dates$Sub_metering_3]
# dates$Global_reactive_power<- as.numeric(levels(dates$Global_reactive_power))[dates$Global_reactive_power]


par(mfrow = c(2,2), mar=c(4,4,2,2))

plot( 
  dates$Global_active_power,
  type="l",
  ylab= "Global Active Power",
  xlab= "",
  xaxt="n",
  yaxt="n",
  cex.lab=0.7)

axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),cex.axis=0.5)
axis(2,cex.axis=0.5)

plot( 
  dates$Voltage,
  type="l",
  ylab= "Voltage",
  xlab= "datetime",
  xaxt="n",
  yaxt="n",
  cex.lab=0.7)

axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),cex.axis=0.5)
axis(2,cex.axis=0.5)

plot( 
  dates$Sub_metering_1,
  type="l",
  ylab= "Energy sub metering",
  xlab= "",
  xaxt="n",
  yaxt="n",
  col="black",
  cex.lab=0.7
)

lines( 
  dates$Sub_metering_2,
  col="red")

lines( 
  dates$Sub_metering_3,
  col="blue")


axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),,cex.axis=0.5)
axis(2,cex.axis=0.5)

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=c(1,1,1),
       cex=0.5, pt.cex = 1, bty="n")

plot( 
  dates$Global_reactive_power,
  type="l",
  ylab= "Global_reactive_power",
  xlab= "",
  xaxt="n",
  yaxt="n",
  cex.lab=0.7)

axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),cex.axis=0.5)
axis(2,cex.axis=0.5)

dev.copy(png, file="plot4.png",width = 480, height = 480, units = "px")
dev.off()


