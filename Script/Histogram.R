library(ggplot2)
library(here)

df <- read.csv(here("./Data/PV_Height.csv"), fileEncoding = "UTF-8")
df <- subset(df, df$Height != "-")
df$Height <- as.numeric(df$Height)

ggplot(df, aes(x=Height)) +
    geom_histogram(binwidth = 1, color="black", fill="grey") +
    geom_vline(xintercept = 36.5, color = "red") +
    xlab("기고") +
    ylab("개수") +
        theme_bw() + 
        theme(legend.position = "right", plot.title = element_text(hjust = 0.5,size=12,face='bold')) +
        theme(text = element_text(family = "NanumGothic"),
            legend.title=element_blank(),
            plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'),
            axis.title.x = element_text(size = 12, colour = "black", face = 'bold'),
            axis.title.y = element_text(size = 12, colour = "black", face = 'bold')) +
    ggtitle("백제 한성기 호류 기고 분포")

ggsave(here("./Graph/Histogram(호류 기고).tiff"), dpi=300, width=3, height=3, units='in')
ggsave(here("./Graph/Histogram(호류 기고).jpeg"), dpi=300, width=3, height=3, units='in')