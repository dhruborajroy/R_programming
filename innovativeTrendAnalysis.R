setwd("G:\\R Programming\\Introduction To R\\")
library(trendchange)
data=read.csv("ITA\\ITA.csv",header = TRUE,stringsAsFactors = F)
head(data)
#ITA
annual=data$SeasonalRainfall
x=data$SeasonalRainfall
xbar=mean(annual)
n<-length(annual)
fh<-sort(x[1:(n/2)]) #first half
sh<- sort(x[((n/2)+1):n])#second half
ts=(2* (mean(sh)-mean(fh)))/n
#95 CI
ten_LB_95 <- fh-0.05*mean(fh)
ten_UB_95 <- fh-0.05*mean(fh)
#90 CI
ten_LB_90 <- fh-0.1*mean(fh)
ten_UB_90 <- fh-0.1*mean(fh)
write.csv(cbind(fh,sh,ten_LB_95,ten_UB_95,ten_LB_90,ten_UB_90), "ITA_Barishal.csv")
#information
S<- (2*mean(sh)-mean(fh))/length(x)
D<- mean((sh-fh)*10)/mean(fh)
ssd<- (2*sqrt(2)*sd(x)*sqrt(1-cor(sh,fh))/length(x)/sqrt(length(x)))
CLlower90<- 0-1.645*ssd
CLupper90<- 0+1.645*ssd
CLlower95<- 0-1.96*ssd
CLupper95<- 0+1.96*ssd
#
write.csv(cbind(S,D,ssd,CLlower90,CLupper90,CLlower95,CLupper95), "ITA/Info_ITA_Barishal1.csv")
##########plot#################


innovtrend<-function(x){
  xbar<-mean(x)
  n<-length(x)
  fh<-sort(x[1:(n/2)]) #first half
  sh<- sort(x[((n/2)+1):n])#second half
  ts=(2* (mean(sh)-mean(fh)))/n
  
  #plot(fh,sh,pch=1,main="ITA for yearly historical precipitation", xlab="first half",xlim=c(min(x),max(x)), ylim=c(min(x),max(x)))
  
  # color points based on value of fh
  cols <- ifelse(fh > mean(fh), "red", "green")
  
  plot(fh, sh, pch=16, col=cols,
       main="ITA for yearly historical precipitation",
       xlab="first half",
       xlim=c(min(x),max(x)), ylim=c(min(x),max(x)))
  
  
  abline(a=0,b=1,lty=1, lw=1) -> net
  
  S<- (2*mean(sh)-mean(fh))/length(x)
  
  D<- mean((sh-fh)*10)/mean(fh)
  
  
  
  ssd<- (2*sqrt(2)*sd(x)*sqrt(1-cor(sh,fh))/length(x)/sqrt(length(x)))
  
  CLlower90<- 0-1.645*ssd
  CLupper90<- 0+1.645*ssd
  CLlower95<- 0-1.96*ssd
  CLupper95<- 0+1.96*ssd
  lines(fh,ten_LB_95,lty=2,col="blue",lwd=2)
  lines(fh,ten_UB_95,lty=2,col="blue",lwd=2)
  ten_LB_90=fh-0.1*mean(fh)
  ten_UB_90=fh-0.1*mean(fh)
  lines(fh,ten_LB_90,lty=2,col="darkblue",lwd=2)
  lines(fh,ten_UB_90,lty=2,col="darkgreen",lwd=2)
  legend(
    "topleft", 
    legend = c("No Trend", "QQ 5Percentile", "QQ 10Percentile"),
    lty = c(1, 2, 3),
    col = c("red", "darkblue", "darkgreen"),
    lwd = 1,
    cex = 0.5   # adjust legend size (0.7 smaller, 1 default, 1.2 larger)
  )
  return(c(S="Trendslope",D="Trend Indicator", "Lower Confidence limit"=CLlower95, "Upper Confidence limit"=CLupper95))
}


innovtrend(x)
