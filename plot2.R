household_power_consumption <- read.delim('household_power_consumption.txt', sep = ';')
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format = '%d/%m/%Y')


filt <- household_power_consumption[household_power_consumption$Date%in%c('2007-02-01','2007-02-02'),]
filt$Time <- as.factor(filt$Time)
filt$datetime <- paste(filt$Date,filt$Time,sep = ' ')
filt$datetime <- as.factor(filt$datetime)


#plot2
plot(y = filt$Global_active_power,x = filt$datetime,type='l',lty=1, xaxt = "n", ylab = 'Global Active Power (kilowatts)',xlab='')
axis(1, c(1,length(filt$datetime)/2,length(filt$datetime)),labels =  c('Thu','Fri','Sat'))


png('plot%d.png',width = 480,height = 480,res=1)
dev.off()






