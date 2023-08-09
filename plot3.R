household_power_consumption <- read.delim('household_power_consumption.txt', sep = ';')
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format = '%d/%m/%Y')


filt <- household_power_consumption[household_power_consumption$Date%in%c('2007-02-01','2007-02-02'),]
filt$Time <- as.factor(filt$Time)
filt$datetime <- paste(filt$Date,filt$Time,sep = ' ')
filt$datetime <- as.factor(filt$datetime)


#plot3
plot(y = filt$Sub_metering_1,x = filt$datetime,type='l',lty=1, xaxt = "n", ylab = 'Energy sub metering',xlab='')
lines(y = filt$Sub_metering_2,x = filt$datetime,type='l',lty=1, xaxt = "n", ylab = 'Energy sub metering',xlab='', col='red')
lines(y = filt$Sub_metering_3,x = filt$datetime,type='l',lty=1, xaxt = "n", ylab = 'Energy sub metering',xlab='',col='blue')
legend(x = "topright",          # Position
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),  # Legend texts
       lty = 1,           # Line types
       col = c(1,'red','blue'),           # Line colors
       lwd = 2)                 # Line width
axis(1, c(1,length(filt$datetime)/2,length(filt$datetime)),labels =  c('Thu','Fri','Sat'))



png('plot%d.png',width = 480,height = 480,res = 1)
dev.off()

