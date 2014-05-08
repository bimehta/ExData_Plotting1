##Step1 - Setting the working directory to the path where file is present.
setwd("C:\\Users\\bimehta\\Desktop\\R_Prog\\EXDA")
##Step2 - Loading the sqldf package library. This package performs SQL selects on data frames.
## This package will be used to read data from file for specific dates.
library(sqldf)
##Step3 - Creating the SQL for selective read from file based on dates
myfile <- "household_power_consumption.txt"
mysql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
##Step4 - Reading selective data from the file using below command
meters<-read.csv.sql(file=myfile, sql=mysql, header = TRUE, sep = ";")
##Step5 - Converting the Date column to datetime format.
meters$Date<-strptime(paste(meters$Date,meters$Time), format='%d/%m/%Y %H:%M:%S')

##Step6 - Creating the line plot by using plot() function and plotting each line seperately.
##plot3 is saved as png file. This is done by printing to png file to png file using png() function.
png(filename="plot3.png", width = 480, height = 480)
##Creating empty plot
plot(meters$Date,meters$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering")
##Plotting lines and labels on the empty plot
lines(meters$Date,meters$Sub_metering_1,lwd=1)
lines(meters$Date,meters$Sub_metering_2,lwd=1, col="red")
lines(meters$Date,meters$Sub_metering_3,lwd=1, col="blue")
legend("topright", legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"))
dev.off()