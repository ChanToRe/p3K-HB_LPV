library(ggplot2)
library(here)

df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "CP949")
df_a <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "CP949")
df_a[df_a$세부기종 != "원형", "세부기종"] <- "비원형"
df_b <- subset(df, df$세부기종 != "원형")

ggplot(df, aes(x=경부축약도)) +
    geom_histogram(binwidth=0.035, color="black", alpha=0.7, position="identity") +
    geom_vline(aes(xintercept=0.35), color="blue",linetype="dashed") +
#    geom_density(alpha=0.3) +
    xlab("경부축약도") +
    ylab("빈도수") +
    theme_bw() + 
    theme(plot.title = element_text(hjust = 0.5,size=12,face='bold'),
    axis.title.x = element_text(size=12, colour="black", face='bold'),
    axis.title.y = element_text(size=12, colour="black", face='bold')) +
    ggtitle("백제 한성기 대호 경부축약도 히스토그램")

ggsave(here("./Graph/Histogram(경부축약도).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Histogram(경부축약도).jpeg"), dpi=300, width=5, height=5, units='in')

ggplot(df, aes(x=동체원형도), fill=세부기종) +
    geom_histogram(binwidth=0.01795, color="black", alpha=0.7, position="identity") +
    geom_vline(aes(xintercept=0.79), color="blue",linetype="dashed") +
#    geom_density(alpha=0.3) +
    xlab("동체원형도") +
    ylab("빈도수") +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5,size=12,face='bold'),
    axis.title.x = element_text(size=12, colour="black", face='bold'),
    axis.title.y = element_text(size=12, colour="black", face='bold')) +
    ggtitle("백제 한성기 대호 동체원형도 히스토그램")
    
ggsave(here("./Graph/Histogram(동체원형도).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Histogram(동체원형도).jpeg"), dpi=300, width=5, height=5, units='in')


ggplot(df_b, aes(x=동최대경위치)) +
    geom_histogram(binwidth=0.01855, color="black", alpha=0.7, position="identity") +
#    geom_density(alpha=0.3) +
    geom_vline(aes(xintercept=0.64), color="blue",linetype="dashed") +
    xlab("동최대경위치") +
    ylab("빈도수") +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5,size=12,face='bold'),
    axis.title.x = element_text(size=12, colour="black", face='bold'),
    axis.title.y = element_text(size=12, colour="black", face='bold')) +
    ggtitle("백제 한성기 대호 동최대경위치 히스토그램")
    
ggsave(here("./Graph/Histogram(동최대경위치).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Histogram(동최대경위치).jpeg"), dpi=300, width=5, height=5, units='in')