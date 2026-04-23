library(ggplot2)
library(here)

# 데이터 로드
df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "UTF-8")

# 필터링: 형식 'C1'과 'C2'만 포함
df_sub <- subset(df, 형식 == "C1" | 형식 == "C2")

# 경부길이 계산 (기고 - 동체부길이)
df_sub$경부길이 <- df_sub$기고 - df_sub$동체부길이

# 박스플롯 생성
ggplot(df_sub, aes(x = 형식, y = 경부길이, fill = 형식)) +
    geom_boxplot(fatten = 2) +
    scale_fill_manual(values = c("C1" = "grey90", "C2" = "grey80")) +
    xlab("형식") +
    ylab("경부길이") +
    theme_bw() + 
    theme(legend.position = "none",
          text = element_text(family = "NanumGothic"),
          plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
          axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
          axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("유견형 대호 형식별 경부길이 비교")

# 그래프 저장
ggsave(here("./Graph/Boxplot(유견형경부길이).tiff"), dpi=300, width=4, height=4, units='in')
ggsave(here("./Graph/Boxplot(유견형경부길이).jpeg"), dpi=300, width=4, height=4, units='in')
