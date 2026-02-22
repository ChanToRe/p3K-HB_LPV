library(ggplot2)
library(here)

df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "UTF-8")
df <- subset(df, df$시기 != "-" & df$형식 != "D")

########## 문화권-시기 비율 ##########
ggplot(df, aes(x=df$문화권, fill=df$시기)) +
    geom_bar(stat="count") +
    scale_fill_grey() +
    xlab("문화권") +
    ylab("개수") +
        theme_bw() + 
        theme(legend.position = "right", plot.title = element_text(hjust = 0.5,size=12,face='bold')) +
        theme(text = element_text(family = "NanumGothic"),
            legend.title=element_blank(),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("문화권별 시기")

ggsave(here("./Graph/Barplot(문화권별시기).tiff"), dpi=300, width=3, height=3, units='in')
ggsave(here("./Graph/Barplot(문화권별시기).jpeg"), dpi=300, width=3, height=3, units='in')

########## 문화권-형식 비율 ###########
ggplot(df, aes(x=df$문화권, fill=df$형식)) +
    geom_bar(stat="count") +
    xlab("문화권") +
    ylab("개수") +
        theme_bw() + 
        theme(legend.position = "right", plot.title = element_text(hjust = 0.5,size=12,face='bold')) +
        theme(text = element_text(family = "NanumGothic"),
            legend.title=element_blank(),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("문화권별 형식")

ggsave(here("./Graph/Barplot(문화권별형식).tiff"), dpi=300, width=3, height=3, units='in')
ggsave(here("./Graph/Barplot(문화권별형식).jpeg"), dpi=300, width=3, height=3, units='in')

########## 유역-시기 비율###########
ggplot(df, aes(x=df$유역, fill=df$시기)) +
    geom_bar(stat="count") +
    scale_fill_grey() +
    xlab("유역") +
    ylab("개수") +
        theme_bw() + 
        theme(legend.position = "top", plot.title = element_text(hjust = 0.5,size=12,face='bold')) +
        theme(text = element_text(family = "NanumGothic"),
            legend.title=element_blank(),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("유역별 시기")

ggsave(here("./Graph/Barplot(유역별시기).tiff"), dpi=300, width=10, height=3, units='in')
ggsave(here("./Graph/Barplot(유역별시기).jpeg"), dpi=300, width=10, height=3, units='in')

########## 유역-형식 비율###########
ggplot(df, aes(x=df$유역, fill=df$형식)) +
    geom_bar(stat="count") +
    xlab("유역") +
    ylab("개수") +
        theme_bw() + 
        theme(legend.position = "top", plot.title = element_text(hjust = 0.5,size=12,face='bold')) +
        theme(text = element_text(family = "NanumGothic"),
            legend.title=element_blank(),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("유역별 형식")

ggsave(here("./Graph/Barplot(유역별형식).tiff"), dpi=300, width=10, height=3, units='in')
ggsave(here("./Graph/Barplot(유역별형식).jpeg"), dpi=300, width=10, height=3, units='in')