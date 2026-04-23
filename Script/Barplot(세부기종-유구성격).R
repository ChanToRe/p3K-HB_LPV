library(ggplot2)
library(here)

# 데이터 로드
df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "UTF-8")

# 필터링 및 데이터 전처리
df_sub <- subset(df, 형식 != "D" & 유구성격 != "-")

# 유구성격 통합: 수혈/저장시설 -> 저장시설, 구상유구/성곽 -> 기타
df_sub$유구성격[df_sub$유구성격 %in% c("수혈", "저장시설")] <- "저장시설"
df_sub$유구성격[df_sub$유구성격 %in% c("구상유구", "성곽")] <- "기타"

# 막대플롯 생성 (문화권별 세부기종 분포)
ggplot(df_sub, aes(x = 세부기종, fill = 유구성격)) +
    geom_bar(stat = "count") +
    scale_fill_grey() +
    xlab("세부기종") +
    ylab("개수") +
    theme_bw() + 
    theme(legend.position = "right",
          text = element_text(family = "NanumGothic"),
          legend.title = element_blank(),
          plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
          axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
          axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("세부기종별 출토유구의 성격")

# 그래프 저장
ggsave(here("./Graph/Barplot(세부기종-유구성격).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Barplot(세부기종-유구성격).jpeg"), dpi=300, width=5, height=5, units='in')
