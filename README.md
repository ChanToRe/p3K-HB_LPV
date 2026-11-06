<img src="https://github.com/user-attachments/assets/b2260acf-e144-4d41-a786-e73cce6d226a" height=65> <br>
---

# 백제 한성기 중부지역 대호의 편년과 전개

---

## 소개
이 레포지토리는 아래의 논문에 활용된 데이터, 그래프, 코드를 정리한 레포지토리입니다. 해당 논문은 아래에서 확인하실 수 있습니다. <br>

[주찬혁, 2026, ｢백제 한성기 중부지역 대호의 편년과 전개｣, 『한국고고학보』 140, 한국고고학회.](http://doi.org/10.47439/JKRAS.2026.3.785)

레포지토리는 크게 5개의 디렉토리로 구성되어 있습니다. `Data`에는 연구에 사용된 데이터가 있고, `LPV_RAW`에는 대호 도면 원본이, `LPV_Rescale`에는 축척을 조정한 대호 도면이 있습니다. `Script`에는 분석 및 그래프 산출을 위한 R코드가 있으며, `Graph`에는 최종적으로 산출된 도면이 있습니다.

`Data`의 파일은 다음과 같이 구분됩니다.

| 파일 | 내용 |
|---|---|
| `LPV_Measurement.csv`, `.xlsx` | 대호 143점의 출토맥락, 계측값, 형식, 시기, 출전 |
| `PV_Height.csv`, `.xlsx` | 호류 342점의 기고 (기고 분포 히스토그램에 사용) |
| `LPV_Landmarks.TPS` | 대호 143점의 랜드마크 55개 좌표 |
| `LPV_Landmarks_Curves.TPS` | 대호 143점의 곡선 4개 좌표 |
| `LPV_LM.TPS` | CVA에 사용한 대호 118점의 랜드마크 55개 좌표 |

TPS 파일의 좌표는 `LPV_Rescale`의 도면을 기준으로 합니다. `LPV_RAW`와 `LPV_Rescale`의 파일명은 `유적명_유구명_도면번호` 형식입니다.

---

## 파일구조

```
📦p3K-HB_LPV
 ┣ 📂Data
 ┃ ┣ 📜LPV_LM.TPS
 ┃ ┣ 📜LPV_Landmarks.TPS
 ┃ ┣ 📜LPV_Landmarks_Curves.TPS
 ┃ ┣ 📜LPV_Measurement.csv
 ┃ ┣ 📜LPV_Measurement.xlsx
 ┃ ┣ 📜PV_Height.csv
 ┃ ┗ 📜PV_Height.xlsx
 ┣ 📂Graph
 ┃ ┣ 📜Barplot(문화권-세부기종).jpeg
 ┃ ┣ 📜Barplot(문화권-세부기종).tiff
 ┃ ┣ 📜Barplot(문화권별시기).jpeg
 ┃ ┣ 📜Barplot(문화권별시기).tiff
 ┃ ┣ 📜Barplot(문화권별형식).jpeg
 ┃ ┣ 📜Barplot(문화권별형식).tiff
 ┃ ┣ 📜Barplot(세부기종-유구성격)(보정).jpg
 ┃ ┣ 📜Barplot(세부기종-유구성격)(보정).tif
 ┃ ┣ 📜Barplot(세부기종-유구성격).jpeg
 ┃ ┣ 📜Barplot(세부기종-유구성격).tiff
 ┃ ┣ 📜Barplot(유역별시기).jpeg
 ┃ ┣ 📜Barplot(유역별시기).tiff
 ┃ ┣ 📜Barplot(유역별형식).jpeg
 ┃ ┣ 📜Barplot(유역별형식).tiff
 ┃ ┣ 📜Boxplot(원형,유구성격-경부잘록도).jpeg
 ┃ ┣ 📜Boxplot(원형,유구성격-경부잘록도).tiff
 ┃ ┣ 📜Boxplot(유견형,유구성격-경부잘록도).jpeg
 ┃ ┣ 📜Boxplot(유견형,유구성격-경부잘록도).tiff
 ┃ ┣ 📜Boxplot(유견형경부길이).jpeg
 ┃ ┣ 📜Boxplot(유견형경부길이).tiff
 ┃ ┣ 📜Boxplot(유구성격-경부경).jpeg
 ┃ ┣ 📜Boxplot(유구성격-경부경).tiff
 ┃ ┣ 📜Boxplot(유구성격-경부잘록도).jpeg
 ┃ ┣ 📜Boxplot(유구성격-경부잘록도).tiff
 ┃ ┣ 📜Boxplot(유구성격-구경).jpeg
 ┃ ┣ 📜Boxplot(유구성격-구경).tiff
 ┃ ┣ 📜Boxplot(장동형,유구성격-경부잘록도).jpeg
 ┃ ┣ 📜Boxplot(장동형,유구성격-경부잘록도).tiff
 ┃ ┣ 📜CVA.jpeg
 ┃ ┣ 📜CVA.tiff
 ┃ ┣ 📜Histogram(호류 기고).jpeg
 ┃ ┣ 📜Histogram(호류 기고).tiff
 ┃ ┣ 📜Scatter(마한).jpeg
 ┃ ┣ 📜Scatter(마한).tiff
 ┃ ┣ 📜Scatter(전체).jpeg
 ┃ ┣ 📜Scatter(전체).tiff
 ┃ ┣ 📜Scatter(중도).jpeg
 ┃ ┗ 📜Scatter(중도).tiff
 ┣ 📂LPV_RAW
 ┃ ┣ 📜가평 대성리 Ⅱ_10호 주거지_54.pdf
 ┃ ┣ 📜가평 대성리 Ⅱ_4호 주거지_16.pdf
 ┃ ┣ ⋮ (도면 116건)
 ┃ ┗ 📜Scale.eps
 ┣ 📂LPV_Rescale
 ┃ ┣ 📜가평 대성리 Ⅱ_10호 주거지_54.tif
 ┃ ┣ 📜가평 대성리 Ⅱ_4호 주거지_16.tif
 ┃ ┣ ⋮ (도면 144건)
 ┃ ┗ 📜횡성 읍하리_삼국시대 4호 주거지_30-58.tif
 ┣ 📂Script
 ┃ ┣ 📜Barplot(세부기종-유구성격).R
 ┃ ┣ 📜Barplot.R
 ┃ ┣ 📜Boxplot(유견형경부길이).R
 ┃ ┣ 📜Boxplot(유구성격-경부경or구경).R
 ┃ ┣ 📜CVA.R
 ┃ ┣ 📜Histogram.R
 ┃ ┗ 📜Scatter.R
 ┣ 📜.gitignore
 ┗ 📜README.md
```

---

## 패키지 및 버전

분석에는 R과 아래의 패키지를 사용했습니다. 그래프의 한글 표기에는 `NanumGothic` 글꼴이 필요합니다.

```
R version 4.5.2 (2025-10-31)
Platform: aarch64-apple-darwin20
Running under: macOS 27.0.1

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
LAPACK: /Library/Frameworks/R.framework/Versions/4.5-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.1

locale:
[1] C.UTF-8/C.UTF-8/C.UTF-8/C/C.UTF-8/C.UTF-8

time zone: Asia/Seoul
tzcode source: internal

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] ggrepel_0.9.6 here_1.0.2    ggplot2_4.0.2

loaded via a namespace (and not attached):
 [1] generics_0.1.4     lattice_0.22-7     digest_0.6.39      magrittr_2.0.4    
 [5] evaluate_1.0.5     grid_4.5.2         RColorBrewer_1.1-3 iterators_1.0.14  
 [9] fastmap_1.2.0      foreach_1.5.2      doParallel_1.0.17  rprojroot_2.1.1   
[13] jsonlite_2.0.0     Matrix_1.7-4       processx_3.8.6     mclust_6.1.2      
[17] ps_1.9.1           sess_3.2.1         scales_1.4.0       codetools_0.2-20  
[21] cli_3.6.5          rlang_1.1.7        base64enc_0.1-6    withr_3.0.2       
[25] otel_0.2.0         colorRamps_2.3.4   tools_4.5.2        parallel_4.5.2    
[29] Rvcg_0.25          dplyr_1.1.4        vctrs_0.7.1        R6_2.6.1          
[33] lifecycle_1.0.5    htmlwidgets_1.6.4  MASS_7.3-65        pkgconfig_2.0.3   
[37] pillar_1.11.1      later_1.4.8        gtable_0.3.6       glue_1.8.0        
[41] Rcpp_1.1.1         xfun_0.56          tibble_3.3.1       tidyselect_1.2.1  
[45] rstudioapi_0.19.0  knitr_1.51         farver_2.1.2       htmltools_0.5.9   
[49] labeling_0.4.3     bezier_1.1.2       compiler_4.5.2     S7_0.2.1  
```