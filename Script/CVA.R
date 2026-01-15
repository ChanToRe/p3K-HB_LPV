library(Morpho)
#options(rgl.useNULL = TRUE)
library(geomorph)
library(here)
library(ggplot2)

#Data Load & Processing
data <- readland.tps("./Data/LPV_Landmarks_Curve.TPS", specID = "ID")
gpa <- gpagen(data)
TypeData  <- read.csv("./Data/LPV_Measurement.csv", header=T) 
classifier <- TypeData$Type

PCA <- gm.prcomp(data)
summary(PCA)
plot(PCA, main = "PCA")
pc_scores<-PCA[[10]]
PCA[[10]]
classifier_pca <- cbind(classifier, pc_scores)

CVA <- CVA(classifier_pca[3:48], group=classifier$Type)
CVA$Grandm
ggplot(classifier_pca, aes(x=CVA$CVscores[,1], y=CVA$CVscores[,2])) +
    stat_ellipse(aes(fill=Type), type="norm", level=0.95,
                 geom="polygon", alpha=0.15, color=NA) +
    geom_point(aes(shape=Type, color=Type), size=3) +
    geom_rug(aes(color=Type)) +
    xlim(-15, 15) +
    ylim(-15, 15) +
    scale_shape_manual(values=c(15, 16, 17)) +
    scale_color_manual(values=c('red', 'blue', 'green')) +
    scale_fill_manual(values=c('red', 'blue', 'green')) +
    xlab("Canonical Variate 1") +
    ylab("Canonical Variate 2") +
    coord_fixed() +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5,size=12,face='bold'),
        legend.position = c(0.15, 0.15),
        legend.background = element_rect(size=0.1, colour="black"),
        legend.margin = margin(5, 10, 5, 5),
        legend.title=element_blank(),
        legend.text=element_text(size=9),
        axis.text = element_text(size=9, colour="black"),
        axis.title.x = element_text(size=12, colour="black", face='bold'),
        axis.title.y = element_text(size=12, colour="black", face='bold')) +
    ggtitle("백제 한성기 대옹 CVA 결과")

ggsave(here("./Graph/CVA.tiff"), dpi=300, width=6, height=6, units='in')
ggsave(here("./Graph/CVA.jpeg"), dpi=300, width=6, height=6, units='in')

########## Mahalanobis distance ##########
cv_scores <- as.matrix(CVA$CVscores)        # specimens x CVs
groups <- factor(classifier$Type)

centroids_df <- aggregate(as.data.frame(cv_scores), by=list(group=groups), FUN=mean)
centroids_mat <- as.matrix(centroids_df[ , -1])
rownames(centroids_mat) <- centroids_df$group
group_levels <- rownames(centroids_mat)

pairwise_maha <- matrix(0, nrow=length(group_levels), ncol=length(group_levels),
                        dimnames=list(group_levels, group_levels))
for(i in seq_along(group_levels)) {
  for(j in seq_along(group_levels)) {
    if(i < j) {
      g1 <- group_levels[i]; g2 <- group_levels[j]
      combined_idx <- which(groups %in% c(g1, g2))
      pooled_cov <- cov(cv_scores[combined_idx, , drop=FALSE])
      d2 <- mahalanobis(centroids_mat[i, ], centroids_mat[j, ], pooled_cov)
      pairwise_maha[i, j] <- pairwise_maha[j, i] <- sqrt(d2)
    }
  }
}

pairwise_p <- matrix(1, nrow=length(group_levels), ncol=length(group_levels),
                     dimnames=list(group_levels, group_levels))
nperm <- 999
set.seed(123)
for(i in seq_along(group_levels)) {
  for(j in seq_along(group_levels)) {
    if(i < j) {
      g1 <- group_levels[i]; g2 <- group_levels[j]
      idx <- which(groups %in% c(g1, g2))
      obs_d <- pairwise_maha[i, j]
      perms <- numeric(nperm)
      combined_scores <- cv_scores[idx, , drop=FALSE]
      n1 <- sum(groups[idx] == g1)
      for(k in 1:nperm) {
        perm_labels <- sample(length(idx))
        perm1_idx <- perm_labels[1:n1]
        perm2_idx <- perm_labels[(n1+1):length(idx)]
        perm_cent1 <- colMeans(combined_scores[perm1_idx, , drop=FALSE])
        perm_cent2 <- colMeans(combined_scores[perm2_idx, , drop=FALSE])
        pooled_cov_perm <- cov(combined_scores[c(perm1_idx, perm2_idx), , drop=FALSE])
        d2p <- mahalanobis(perm_cent1, perm_cent2, pooled_cov_perm)
        perms[k] <- sqrt(d2p)
      }
      pval <- (sum(perms >= obs_d) + 1) / (nperm + 1)
      pairwise_p[i, j] <- pairwise_p[j, i] <- pval
    }
  }
}

print(pairwise_maha)
print(pairwise_p)