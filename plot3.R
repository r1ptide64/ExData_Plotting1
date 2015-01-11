df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,colClasses="character")
df<-df[df$Date %in% c("1/2/2007","2/2/2007"),]
df$Date<-as.Date(df$Date,"%d/%m/%Y")
df$t<-strptime(paste(df$Date,df$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
colors<-c("black","red","blue")
for(i in 7:9)
{
        df[,i]<-as.numeric(df[,i])
}
png("plot3.png")
par(bg="transparent")
plot(range(df$t),range(df[,7:9]),type="n",xlab="",ylab="Energy sub metering")
for(i in 7:9)
{
        lines(df$t,df[,i],col=colors[i-6])
}
legend("topright",legend=names(df[,7:9]),lty=1,col=colors)
dev.off()