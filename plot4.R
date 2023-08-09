household_power_consumption <- read.delim('household_power_consumption.txt', sep = ';')
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format = '%d/%m/%Y')


filt <- household_power_consumption[household_power_consumption$Date%in%c('2007-02-01','2007-02-02'),]
filt$Time <- as.factor(filt$Time)
filt$datetime <- paste(filt$Date,filt$Time,sep = ' ')
filt$datetime <- as.factor(filt$datetime)


layout_matrix_1 <- matrix(1:4, ncol = 2)                  # Define position matrix
layout(layout_matrix_1)                                   # Specify layout


plot(y = filt$Global_active_power,x = filt$datetime,type='l',lty=1, xaxt = "n", ylab = 'Global Active Power (kilowatts)',xlab='');axis(1, c(1,length(filt$datetime)/2,length(filt$datetime)),labels =  c('Thu','Fri','Sat'))
plot(y = filt$Sub_metering_1,x = filt$datetime,type='l',lty=1, xaxt = "n", ylab = 'Energy sub metering',xlab='');lines(y = filt$Sub_metering_2,x = filt$datetime,type='l',lty=1, xaxt = "n", ylab = 'Energy sub metering',xlab='', col='red');lines(y = filt$Sub_metering_3,x = filt$datetime,type='l',lty=1, xaxt = "n", ylab = 'Energy sub metering',xlab='',col='blue');legend(x = "topright",          # Position
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),  # Legend texts
       lty = 1, cex=0.3,
       col = c(1,'red','blue'));axis(1, c(1,length(filt$datetime)/2,length(filt$datetime)),labels =  c('Thu','Fri','Sat'))
plot(y = filt$Voltage,x = filt$datetime,type='l',lty=1, xaxt = "n",xlab='',ylab='Voltage');axis(1, c(1,length(filt$datetime)/2,length(filt$datetime)),labels =  c('Thu','Fri','Sat'))
plot(y = filt$Global_reactive_power,x = filt$datetime,type='l',lty=1, xaxt = "n",xlab='',ylab='Global_reactive_power');axis(1, c(1,length(filt$datetime)/2,length(filt$datetime)),labels =  c('Thu','Fri','Sat'))


png('plot4.png',width = 480,height = 480)
dev.off()
