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
    theme_bw()

ggsave(here("./Graph/Histogram(경부축약도).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Histogram(경부축약도).jpeg"), dpi=300, width=5, height=5, units='in')

ggplot(df, aes(x=동체원형도)) +
    geom_histogram(binwidth=0.035, color="black", alpha=0.7, position="identity") +
    geom_vline(aes(xintercept=0.79), color="blue",linetype="dashed") +
#    geom_density(alpha=0.3) +
    xlab("동체원형도") +
    ylab("빈도수") +
    theme_bw()
    
ggsave(here("./Graph/Histogram(동체원형도).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Histogram(동체원형도).jpeg"), dpi=300, width=5, height=5, units='in')


ggplot(df, aes(x=동최대경위치)) +
    geom_histogram(binwidth=0.015, color="black", alpha=0.7, position="identity") +
#    geom_density(alpha=0.3) +
    geom_vline(aes(xintercept=0.64), color="blue",linetype="dashed") +
    xlab("동최대경위치") +
    ylab("빈도수") +
    theme_bw()
    
ggsave(here("./Graph/Histogram(동최대경위치).tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/Histogram(동최대경위치).jpeg"), dpi=300, width=5, height=5, units='in')