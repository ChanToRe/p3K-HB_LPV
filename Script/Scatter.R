library(ggplot2)
library(here)
library(ggrepel)

df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "UTF-8")
df$세부기종[df$세부기종 == "중도, 마한"] <- "중도"
#df$세부기종[df$동최대경위치 <= 0.675 & df$동최대경/df$동체부길이 <= 0.95] <- "장동형"
#df$세부기종[df$동최대경위치 <= 0.675 & df$동최대경/df$동체부길이 >= 0.95] <- "원형"
#df$세부기종[df$동최대경위치 >= 0.675] <- "유견형"


########## 중도 ########## 
df_a <- subset(df, df$세부기종 != "기타" & df$문화권 == "중도")

ggplot(df_a, aes(x = 동최대경/동체부길이, y = 동최대경위치, color = 세부기종)) +
    geom_point(size = 2, alpha = 0.6) +
#    geom_text_repel(aes(label = 코드), size = 3, family = "NanumGothic", max.overlaps = 20) +
#    scale_color_brewer(palette = "Set1") +
#    guides(color = guide_legend(title = "세부기종")) +
    xlab("동최대경/동체부길이") +
    ylab("동최대경위치") +
        theme_bw() + 
        theme(text = element_text(family = "NanumGothic"),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("중도문화권")

ggsave(here("./Graph/Scatter(중도).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Scatter(중도).jpeg"), dpi=300, width=5, height=5, units='in')

########## 마한 ##########
df_b <- subset(df, df$세부기종 != "기타" & df$문화권 == "마한")

ggplot(df_b, aes(x = 동최대경/동체부길이, y = 동최대경위치, color = 세부기종)) +
    geom_point(size = 2, alpha = 0.6) +
#    geom_text_repel(aes(label = 코드), size = 3, family = "NanumGothic", max.overlaps = 20) +
#    scale_color_brewer(palette = "Set1") +
#    guides(color = guide_legend(title = "세부기종")) +
    xlab("동최대경/동체부길이") +
    ylab("동최대경위치") +
        theme_bw() + 
        theme(text = element_text(family = "NanumGothic"),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("마한문화권")

ggsave(here("./Graph/Scatter(마한).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Scatter(마한).jpeg"), dpi=300, width=5, height=5, units='in')