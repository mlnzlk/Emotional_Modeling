dat<-sns3[,c(4,24)]
barplot(dat$sum,names.arg = dat$PhoneModel,main="아이폰 유저",las=2)
x1<-sns3$sum
x2<-sns3$PhoneModel
set.seed(1000)
sidx<- sample(5000,replace=F)
dat_s<-dat[sidx,]
head(dat_s)
x<-aggregate(ID ~ Job,dat_s,length)
head(x)
m1<-aggregate(x1,dat,mean)
barplot(m1)
barplot(t(as.matrix(m1[,-1])),beside=T,names.arg=m1$x2,
        xlab="휴대폰기종",ylab="사용시간",col=2:3)
dim(dat)

a<-mean(x1)
a
median(x1)
min(x1)
max(x1)
range(x1)
aggregate(dat, list(standard=dat$PhoneModel),mean)
