df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,colClasses="character")
df<-df[df$Date %in% c("1/2/2007","2/2/2007"),]
df$Date<-as.Date(df$Date,"%d/%m/%Y")
df$t<-strptime(paste(df$Date,df$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
df[,3]<-as.numeric(df[,3])
png("plot2.png")
par(bg="transparent")
plot(df$t,df[,3],type="l",xlab="",ylab="Global Activer Power (kilowatts)")
dev.off()