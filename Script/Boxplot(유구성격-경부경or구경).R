library(ggplot2)
library(here)

# 데이터 로드
df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "UTF-8")

# 필터링: 형식 'D' 제외, 유구성격 '주거지'와 '수혈'만 포함
df_sub <- subset(df, 형식 != "D" & (유구성격 == "주거지" | 유구성격 == "수혈"))

# 경부잘록도
ggplot(df_sub, aes(x = 유구성격, y = 경부잘록도, fill = 유구성격)) +
    geom_boxplot(fatten = 2) +
    scale_fill_manual(values = c("주거지" = "grey90", "수혈" = "grey80")) +
    xlab("유구성격") +
    ylab("경부잘록도") +
    theme_bw() + 
    theme(legend.position = "none") + # 박스플롯에서는 x축과 중복되므로 범례 생략
    theme(text = element_text(family = "NanumGothic"),
          plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
          axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
          axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("유구성격별 경부잘록도 박스플롯")

# 그래프 저장
ggsave(here("./Graph/Boxplot(유구성격-경부잘록도).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Boxplot(유구성격-경부잘록도).jpeg"), dpi=300, width=5, height=5, units='in')


# 경부경
ggplot(df_sub, aes(x = 유구성격, y = 경부경, fill = 유구성격)) +
    geom_boxplot(fatten = 2) +
    scale_fill_manual(values = c("주거지" = "grey90", "수혈" = "grey80")) +
    xlab("유구성격") +
    ylab("경부경") +
    theme_bw() + 
    theme(legend.position = "none") + # 박스플롯에서는 x축과 중복되므로 범례 생략
    theme(text = element_text(family = "NanumGothic"),
          plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
          axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
          axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("유구성격별 경부경 박스플롯")

# 그래프 저장
ggsave(here("./Graph/Boxplot(유구성격-경부경).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Boxplot(유구성격-경부경).jpeg"), dpi=300, width=5, height=5, units='in')

# 구경
ggplot(df_sub, aes(x = 유구성격, y = 구경, fill = 유구성격)) +
    geom_boxplot(fatten = 2) +
    scale_fill_manual(values = c("주거지" = "grey90", "수혈" = "grey80")) +
    xlab("유구성격") +
    ylab("구경") +
    theme_bw() + 
    theme(legend.position = "none") + # 박스플롯에서는 x축과 중복되므로 범례 생략
    theme(text = element_text(family = "NanumGothic"),
          plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
          axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
          axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("유구성격별 구경 박스플롯")

# 그래프 저장
ggsave(here("./Graph/Boxplot(유구성격-구경).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Boxplot(유구성격-구경).jpeg"), dpi=300, width=5, height=5, units='in')