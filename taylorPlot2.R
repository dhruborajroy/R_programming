library(openair)


data<-read.csv("G:/R Programming/Introduction To R/taylor/taylor_sample_data.csv")

data

TaylorDiagram(data,obs = "obs",mod = "mod" ,group = "models", main="",
              key=TRUE,key.title = "Models",cex=2,fontsize=15)


ggsave("taylor.png",width = 1200,units = "px", dpi=600)
