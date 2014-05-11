x<-read.delim("household_power_consumption.txt", 
              header = TRUE, 
              sep = ";", quote = "\"",
              dec = ".", 
              fill = TRUE, comment.char = "")

dates<-x[as.Date(x$Date,format="%d/%m/%Y")=="2007-02-01" |
           as.Date(x$Date,format="%d/%m/%Y")=="2007-02-02",]

dates$Sub_metering_1<- as.numeric(levels(dates$Sub_metering_1))[dates$Sub_metering_1]
dates$Sub_metering_2<- as.numeric(levels(dates$Sub_metering_2))[dates$Sub_metering_2]
##dates$Sub_metering_3<- as.numeric(levels(dates$Sub_metering_3))[dates$Sub_metering_3]

plot( 
  dates$Sub_metering_1,
  type="l",
  ylab= "Energy sub metering",
  xlab= "",
  xaxt="n",
  col="black"
  )

lines( 
  dates$Sub_metering_2,
  col="red")

lines( 
  dates$Sub_metering_3,
  col="blue")


axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

legend("topright",
      c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
      col=c("black","red","blue"),
      lty=c(1,1,1),
      cex=0.8, pt.cex = 1)

dev.copy(png, file="plot3.png",width = 480, height = 480, units = "px")
dev.off()
