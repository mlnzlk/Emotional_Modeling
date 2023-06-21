dat<-subset(dataset, A1Name=="카카오톡" | A2name=="카카오톡" | A3name=="카카오톡")
dat<-dat[,c(3,12,15,16,19,20,23)]
student<-subset(dat, Job == "대학생" | Job == "대학원생" | Job == "학생")
noStudent<-subset(dat, Job != "대학생" & Job != "대학원생" & Job != "학생")
student<-cbind(kakaoHour, rep(0, nrow(student)))
noStudent<-cbind(kakaoHour, rep(0, nrow(noStudent)))

for(i in 1:nrow(student)){
  if(student$A1Name[i] == "카카오톡") {
    student$kakaoHour[i]<-student$A1hour[i]
  } else if (student$A2name[i] == "카카오톡") {
    student$kakaoHour[i] <- student$A2hour[i]
  } else {
    student$kakaoHour[i] <- student$A3hour[i]
  }
}

for(i in 1:nrow(noStudent)){
  if(noStudent$A1Name[i] == "카카오톡") {
    noStudent$kakaoHour[i]<-noStudent$A1hour[i]
  } else if (noStudent$A2name[i] == "카카오톡") {
    noStudent$kakaoHour[i] <- noStudent$A2hour[i]
  } else {
    noStudent$kakaoHour[i] <- noStudent$A3hour[i]
  }
}

student$kakaoHour <- as.integer(student$kakaoHour)
student$kakaoHour[is.na(student$kakaoHour)] <- 0
noStudent$kakaoHour <- as.integer(noStudent$kakaoHour)
noStudent$kakaoHour[is.na(noStudent$kakaoHour)] <- 0

barplot(c(mean(student$kakaoHour), mean(noStudent$kakaoHour)), main="세대별 카카오톡 평균 사용시간", names.arg = c("학생", "학생X"))