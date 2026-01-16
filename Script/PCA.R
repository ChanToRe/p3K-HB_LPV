library(httr)
library(devtools)
library(ggplot2)
library(ggbiplot)
library(car)
library(here)

#Data processing
df <- read.csv(here("./Data/LPV_Measurement.csv"), fileEncoding = "CP949")
df <- subset(df, df$세부기종 != "")

df_category <- df$세부기종
df_name <- df$코드

df_All <- df[, (7:16)]
df_M1 <- df[, (7:12)]
df_M2 <- df[, (13:16)]

#Check Multicollinearity
#cor(df)
#pairs(df, panel=panel.smooth)

##### PCA_All #####
prcomp_df <- prcomp(df_All, center=T, scale=T)
summary(prcomp_df)
prcomp_df$rotation[,1:2]

ggbiplot(prcomp_df,
         choices = c(1, 2),
         obs.scale = 1,
         var.scale = 1) +
  theme_bw() +
  stat_ellipse(data = data.frame(prcomp_df$x[,1:2], group = df_category),
               aes(x = PC1, y = PC2, fill = group),
               geom = "polygon", level = 0.95, alpha = 0.2, inherit.aes = FALSE, show.legend = FALSE) +
  scale_color_discrete(name = '') +
  geom_point(aes(color = df_category), size = 3, shape = 16) +
  theme(plot.title = element_text(hjust = 0.5,size=12,face='bold'),
        legend.position = c(0.12, 0.80),
        legend.background = element_rect(size=0.1, colour="black"),
        legend.margin = margin(5, 10, 5, 5),
        legend.title=element_blank(),
        legend.text=element_text(size=9),
        axis.text = element_text(size=9, colour="black"),
        axis.title.x = element_text(size=12, colour="black", face='bold'),
        axis.title.y = element_text(size=12, colour="black", face='bold')) +
  ggtitle("백제 한성기 대호 PCA(전체 지표)")

ggsave(here("./Graph/PCA_All.tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/PCA_All.jpg"), dpi=300, width=5, height=5, units='in')

##### PCA_M1 #####
prcomp_df <- prcomp(df_M1, center=T, scale=T)
summary(prcomp_df)
prcomp_df$rotation[,1:2]

ggbiplot(prcomp_df,
         choices = c(1, 2),
         obs.scale = 1,
         var.scale = 1) +
  theme_bw() +
  stat_ellipse(data = data.frame(prcomp_df$x[,1:2], group = df_category),
               aes(x = PC1, y = PC2, fill = group),
               geom = "polygon", level = 0.95, alpha = 0.2, inherit.aes = FALSE, show.legend = FALSE) +
  geom_point(aes(color = df_category), size = 3, shape = 16) +
  scale_shape_manual(values=c(15, 16, 17)) +
  theme(plot.title = element_text(hjust = 0.5,size=12,face='bold'),
        legend.position = c(0.12, 0.80),
        legend.background = element_rect(size=0.1, colour="black"),
        legend.margin = margin(5, 10, 5, 5),
        legend.title=element_blank(),
        legend.text=element_text(size=9),
        axis.text = element_text(size=9, colour="black"),
        axis.title.x = element_text(size=12, colour="black", face='bold'),
        axis.title.y = element_text(size=12, colour="black", face='bold')) +
  ggtitle("백제 한성기 대호 PCA(기존 지표)")

ggsave(here("./Graph/PCA_M1.tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/PCA_M1.jpg"), dpi=300, width=5, height=5, units='in')

##### PCA_M2 #####
prcomp_df <- prcomp(df_M2, center=T, scale=T)
summary(prcomp_df)
prcomp_df$rotation[,1:2]

ggbiplot(prcomp_df,
         choices = c(1, 2),
         obs.scale = 1,
         var.scale = 1) +
  theme_bw() +
  stat_ellipse(data = data.frame(prcomp_df$x[,1:2], group = df_category),
               aes(x = PC1, y = PC2, fill = group),
               geom = "polygon", level = 0.95, alpha = 0.2, inherit.aes = FALSE, show.legend = FALSE) +
  scale_color_discrete(name = '') +
  geom_point(aes(color = df_category), size = 3, shape = 16) +
  theme(plot.title = element_text(hjust = 0.5,size=12,face='bold'),
        legend.position = c(0.12, 0.85),
        legend.background = element_rect(size=0.1, colour="black"),
        legend.margin = margin(5, 10, 5, 5),
        legend.title=element_blank(),
        legend.text=element_text(size=9),
        axis.text = element_text(size=9, colour="black"),
        axis.title.x = element_text(size=12, colour="black", face='bold'),
        axis.title.y = element_text(size=12, colour="black", face='bold')) +
  ggtitle("백제 한성기 대호 PCA(개선된 지표)")

ggsave(here("./Graph/PCA_M2.tiff"), dpi=300, width=5, height=5, units='in')
ggsave(here("./Graph/PCA_M2.jpg"), dpi=300, width=5, height=5, units='in')
