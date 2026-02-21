library(ggplot2)
library(here)

df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "UTF-8")
df <- subset(df, df$시기 != "-")

ggplot(df, aes(y=df$경부축약도, df$문화권)) +
    geom_boxplot() +
    xlab("문화권") +
    ylab("경부축약도") +
        theme_bw() + 
        theme(text = element_text(family = "NanumGothic"),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("문화권별 경부축약도")

ggsave(here("./Graph/Boxplot(경부축약도).tiff"), dpi=300, width=3, height=3, units='in')
ggsave(here("./Graph/Boxplot(경부축약도).jpeg"), dpi=300, width=3, height=3, units='in')