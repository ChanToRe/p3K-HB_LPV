library(ggplot2)
library(here)
library(ggrepel)

df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "UTF-8")
df$세부기종[df$세부기종 == "중도, 마한"] <- "중도"
df <- subset(df, df$형식 != "D")
#df$세부기종[df$동최대경높이비 <= 0.675 & df$동최대경/df$동체부길이 <= 0.95] <- "장동형"
#df$세부기종[df$동최대경높이비 <= 0.675 & df$동최대경/df$동체부길이 >= 0.95] <- "원형"
#df$세부기종[df$동최대경높이비 >= 0.675] <- "유견형"

########## 전체 ##########
ggplot(df, aes(x = 동체세장도, y = 동최대경높이비, color = 세부기종, shape = 세부기종)) +
    stat_ellipse(linetype = "dashed", linewidth = 0.4) +
    geom_point(size = 2, alpha = 0.6) +
    scale_color_manual(values = c("유견형" = "green", "원형" = "red", "장동형" = "blue")) +
    scale_shape_manual(values = c("유견형" = 16, "원형" = 15, "장동형" = 17)) +
#    geom_text_repel(aes(label = 코드), size = 3, family = "NanumGothic", max.overlaps = 20) +
#    scale_color_brewer(palette = "Set1") +
#    guides(color = guide_legend(title = "세부기종")) +
    xlab("동체세장도") +
    ylab("동최대경높이비") +
        theme_bw() + 
        theme(text = element_text(family = "NanumGothic"),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold'))
ggsave(here("./Graph/Scatter(전체).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Scatter(전체).jpeg"), dpi=300, width=5, height=5, units='in')


########## 중도 ########## 
df_a <- subset(df, df$세부기종 != "기타" & df$문화권 == "중도")

ggplot(df_a, aes(x = 동체세장도, y = 동최대경높이비, color = 세부기종)) +
    stat_ellipse(linetype = "dashed", linewidth = 0.4) +
    geom_point(size = 2, alpha = 0.6) +
#    geom_text_repel(aes(label = 코드), size = 3, family = "NanumGothic", max.overlaps = 20) +
#    scale_color_brewer(palette = "Set1") +
#    guides(color = guide_legend(title = "세부기종")) +
    xlab("동체세장도") +
    ylab("동최대경높이비") +
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

ggplot(df_b, aes(x = 동체세장도, y = 동최대경높이비, color = 세부기종)) +
    stat_ellipse(linetype = "dashed", linewidth = 0.4) +
    geom_point(size = 2, alpha = 0.6) +
#    geom_text_repel(aes(label = 코드), size = 3, family = "NanumGothic", max.overlaps = 20) +
#    scale_color_brewer(palette = "Set1") +
#    guides(color = guide_legend(title = "세부기종")) +
    xlab("동체세장도") +
    ylab("동최대경높이비") +
        theme_bw() + 
        theme(text = element_text(family = "NanumGothic"),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("마한문화권")

ggsave(here("./Graph/Scatter(마한).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Scatter(마한).jpeg"), dpi=300, width=5, height=5, units='in')