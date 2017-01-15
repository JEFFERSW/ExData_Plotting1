##########DOWNLOAD DATA TO WORKING DIRECTORY 


# read table raw
#Set NA Strings to take account of missings being a ?

mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)

#Checked structure looked ok
#str(mydata)
#subset the data to the two days needed
mydata2<-subset(mydata,Date=="2/2/2007" | Date=="1/2/2007")
#join date and time 
mydata2$NEWDT<-as.character(paste(mydata2$Date, mydata2$Time, sep = ""))

#mydata2$newdate<-as.Date(mydata2$Date, "%d/%m/%Y")
#convert text to dates 
mydata2$newdate2<-strptime(mydata2$NEWDT, "%d/%m/%Y %H: %M: %S")
#Set one by one graph
par(mfrow=c(1,1))
####################
png(file="plot3.pdf",width=480,height=480)

plot(mydata2$newdate2,mydata2$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
lines(mydata2$newdate2,mydata2$Sub_metering_1,col="black")
lines(mydata2$newdate2,mydata2$Sub_metering_2,col="red")
lines(mydata2$newdate2,mydata2$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1 )
dev.off()
