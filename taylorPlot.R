library(chron)
library(lattice)
library(ggplot2)
library(plotrix)
library(graphics)

data<-read.csv(choose.files())



#Dhruboraj Roy
#Dhruborajroy3@gmai.com
#+
#+
#+

library(readr)
Access <- read_csv("G:/R Programming/Introduction To R/taylor/Access.txt")
Access1 <- read_csv("G:/R Programming/Introduction To R/taylor/Access1.txt")
Access2 <- read_csv("G:/R Programming/Introduction To R/taylor/Access2.txt")
CCSM4 <- read_csv("G:/R Programming/Introduction To R/taylor/CCSM4.txt")
CCSM41 <- read_csv("G:/R Programming/Introduction To R/taylor/CCSM41.txt")
CCSM42 <- read_csv("G:/R Programming/Introduction To R/taylor/CCSM42.txt")
ESMLR1 <- read_csv("G:/R Programming/Introduction To R/taylor/ESMLR1.txt")
ESMLR <- read_csv("G:/R Programming/Introduction To R/taylor/ESMLR.txt")
ESMLR2 <- read_csv("G:/R Programming/Introduction To R/taylor/ESMLR2.txt")
Hadgem <- read_csv("G:/R Programming/Introduction To R/taylor/Hadgem.txt")
Hadgem21 <- read_csv("G:/R Programming/Introduction To R/taylor/Hadgem21.txt")
Hadgem22 <- read_csv("G:/R Programming/Introduction To R/taylor/Hadgem22.txt")
Maximumreference <- read_csv("G:/R Programming/Introduction To R/taylor/Maximumreference.txt")
mirocESM <- read_csv("G:/R Programming/Introduction To R/taylor/mirocESM.txt")
mirocESM1 <- read_csv("G:/R Programming/Introduction To R/taylor/mirocESM1.txt")
mirocESM2 <- read_csv("G:/R Programming/Introduction To R/taylor/mirocESM2.txt")



ref <-as.numeric(Maximumreference[[1]])
Access <-as.numeric(Access[[1]])
ccsm4 <-as.numeric(CCSM4[[1]])
LR<-as.numeric(ESMLR[[1]])
ESM <-as.numeric(mirocESM[[1]])
Hadgem2 <-as.numeric(Hadgem[[1]])
Accessr <-as.numeric(Access1[[1]])
ccsm4r <-as.numeric(CCSM41[[1]])
LRr<-as.numeric(ESMLR1[[1]])
ESMr <-as.numeric(mirocESM1[[1]])
Hadgem2r <-as.numeric(Hadgem21[[1]])
Accesst <-as.numeric(Access2[[1]])
ccsm4t <-as.numeric(CCSM42[[1]])
LRt<-as.numeric(ESMLR2[[1]])
ESMt <-as.numeric(mirocESM2[[1]])
Hadgem2t <-as.numeric(Hadgem22[[1]])
taylor.diagram(ref,Accesst,add=FALSE,col="red",pch=19,pos.cor=TRUE,
               xlab="Standard Deviation",ylab="",main="Taylor Diagram",
               show.gamma=TRUE,ngamma=6,gamma.col=5,sd.arcs=8,
               ref.sd=TRUE,sd.method="sample",grad.corr.lines=c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.95,0.99),
               pcex=1,cex.axis=1,normalize=FALSE,mar=c(2,8,2,8),)
taylor.diagram(ref,Access,add=TRUE,col="red",pch=19,pcex=1)
taylor.diagram(ref,ccsm4,add=TRUE,col="red",pch=8,pcex=1)
taylor.diagram(ref,ESM,add=TRUE,col="red",pch=17,pcex=1)
taylor.diagram(ref,LR,add=TRUE,col="red",pch=15,pcex=1)
taylor.diagram(ref,Hadgem2,add=TRUE,col="red",pch=9,pcex=1)
taylor.diagram(ref,Accessr,add=TRUE,col="blue",pch=19,pcex=1)
taylor.diagram(ref,ccsm4r,add=TRUE,col="blue",pch=8,pcex=1)
taylor.diagram(ref,ESMr,add=TRUE,col="blue",pch=17,pcex=1)
taylor.diagram(ref,LRr,add=TRUE,col="blue",pch=15,pcex=1)
taylor.diagram(ref,Hadgem2r,add=TRUE,col="blue",pch=9,pcex=1)
taylor.diagram(ref,Accesst,add=TRUE,col="darkgreen",pch=19,pcex=1)
taylor.diagram(ref,ccsm4t,add=TRUE,col="darkgreen",pch=8,pcex=1)
taylor.diagram(ref,ESMt,add=TRUE,col="darkgreen",pch=17,pcex=1)
taylor.diagram(ref,LRt,add=TRUE,col="darkgreen",pch=15,pcex=1)
taylor.diagram(ref,Hadgem2t,add=TRUE,col="darkgreen",pch=9,pcex=1)
legend(15,13.5,cex=0.8,pt.cex=1,legend=c("ACCESS","CCSM4","MirocESM","ESMLR","HadGEM2"),pch=c(19,8,17,15,9),col=c(1,1,1,1,1))
