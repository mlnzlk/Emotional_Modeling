dt_kakao1 = subset(hci_h2, A1Name == '1')  # 첫번째 어플이 카톡인 서브셋
dt_kakao2 = subset(hci_h2, A2name == '1')  # 두번째 어플이 카톡인 서브셋
dt_kakao3 = subset(hci_h2, A3name == '1')  # 세번째 어플이 카톡인 서브셋

dt_kakao <- rbind(dt_kakao1, dt_kakao2, dt_kakao3)  # 카톡 사용자들을 모두 모아놓은 dataframe

dt_nokakao = subset(hci_h2, A1Name == '0' & A2name == '0' & A3name == '0')  # 카톡을 아예 사용하지 않는 사람들 dataframe


user_kakao = nrow(dt_kakao)  # 카톡 사용자 수
notuser_kakao = nrow(dt_nokakao)  # 카톡 비사용자 수

kakao_cnt = 0  # 카톡 이용횟수 변수
no_kakao_cnt = 0  # 카톡 외의 어플 이용횟수 변수

for(i in 1:nrow(dt_kakao1)){  # 첫번째 어플 카톡 데이터프레임에서
  kakao_cnt = kakao_cnt + dt_kakao1$A1number[i]  # 카톡 이용횟수 카운트
  no_kakao_cnt = no_kakao_cnt + dt_kakao1$A2number[i] + dt_kakao1$A3number[i]  # 카톡 외의 어플 카운트
}

for(i in 1:nrow(dt_kakao2)){
  kakao_cnt = kakao_cnt + dt_kakao2$A1number[i]
  no_kakao_cnt = no_kakao_cnt + dt_kakao2$A1number[i] + dt_kakao2$A3number[i]
}

for(i in 1:nrow(dt_kakao3)){
  kakao_cnt = kakao_cnt + dt_kakao3$A1number[i]
  no_kakao_cnt = no_kakao_cnt + dt_kakao3$A1number[i] + dt_kakao3$A2number[i]
}

for(i in 1:nrow(dt_nokakao)){  # 카톡 비사용자 데이터프레임에서 
  no_kakao_cnt = no_kakao_cnt + dt_nokakao$A1number[i] + dt_nokakao$A2number[i] + dt_nokakao$A3number[i]  # 카톡 외의 어플 카운트
}


kakao_cnt_avr = kakao_cnt / (nrow(dt_kakao1) + nrow(dt_kakao2) + nrow(dt_kakao3))  # 카톡 사용자의 카톡 이용횟수 평균
no_kakao_cnt_avr = no_kakao_cnt / (nrow(dt_kakao1)*2 + nrow(dt_kakao2)*2 + nrow(dt_kakao3)*2 + nrow(dt_nokakao))  # 카톡 외의 어플 이용횟수 평균

## 새로운 dataframe을 위한 배열 생성
app <- c('kakao_talk', 'others')  # 어플: 카톡, 그 외
freq <- c(kakao_cnt_avr, no_kakao_cnt_avr)  # 이용횟수: 카톡 이용횟수 평균, 카톡 외 어플 이용횟수 평균

d1 <- data.frame(app=app, '이용횟수'=freq)  # dataframe 생성

barplot(freq, names=app)  # 막대그래프 표시
