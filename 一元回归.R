data_groupmean <- read.table ("groupmean_5.csv",sep=",",header = T )
data_groupmean <- data_groupmean[-1,]  
library(ggplot2)
library(ggpubr)
line<-lm(TIME_MOVE ~ ID ,data = data_groupmean)

ggplot(data_groupmean,aes(x=ID,y=TIME_MOVE)) + 
  geom_point() + 
  ylab("TIME_MOVE(ms)")+
  ylim(100,600)+
  geom_smooth(method='lm',formula = y~x,colour='red')+
  stat_regline_equation(label.x = 2,label.y = 550,aes(label=..eq.label..))+
  #stat_regline_equation(label.x = 2,label.y = 500,aes(label=..adj.rr.label..))+
  stat_cor(aes(label = paste(..rr.label.., gsub("p", "P", ..p.label..), sep = "~`,`~")),
           label.x = 2,label.y = 500,
  )+
  theme_bw()