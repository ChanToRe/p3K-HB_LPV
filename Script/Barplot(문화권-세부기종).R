library(ggplot2)
library(here)

# 데이터 로드
df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "UTF-8")

# 필터링: 형식 'D' 제외
df_sub <- subset(df, 형식 != "D")

# 막대플롯 생성 (문화권별 세부기종 분포)
ggplot(df_sub, aes(x = 문화권, fill = 세부기종)) +
    geom_bar(stat = "count") +
    scale_fill_grey() +
    xlab("문화권") +
    ylab("개수") +
    theme_bw() + 
    theme(legend.position = "right",
          text = element_text(family = "NanumGothic"),
          legend.title = element_blank(),
          plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
          axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
          axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("문화권별 세부기종")

# 그래프 저장
ggsave(here("./Graph/Barplot(문화권-세부기종).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Barplot(문화권-세부기종).jpeg"), dpi=300, width=5, height=5, units='in')
