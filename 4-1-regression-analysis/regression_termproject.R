#필요한 패키지 설치 및 로드
install.packages(c("readxl", "dplyr", "ggplot2", "GGally", "UsingR"))
library(readxl); library(dplyr); library(ggplot2); library(GGally); library(UsingR)

setwd("C:/R")

# 1)데이터 불러오기
df <- read_excel("회귀분석.xlsx")
names(df)

# 분석에 사용할 변수만 선택
df1 <- df %>% dplyr::select(Pts, GD, shots_pg, Goals, Possession = `Possession%`,Pass = `Pass%`, AerialsWon)

# 요약 통계 확인
summary(df1)

# 2) 히스토그램 저장 (각 변수 분포 확인)
p=ggplot(df1, aes(x = Pts)) +
  geom_histogram(binwidth = 1) + theme_minimal()
ggsave(
  filename = "histogram1.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = p,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)

p = ggplot(df1, aes(x = GD)) +
  geom_histogram(binwidth = 1) + theme_minimal()
ggsave(
  filename = "histogram2.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = p,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)
p=ggplot(df1, aes(x = shots_pg)) +
  geom_histogram(binwidth = 1) + theme_minimal()
ggsave(
  filename = "histogram3.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = p,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)
p=ggplot(df1, aes(x = Goals)) +
  geom_histogram(binwidth = 1) + theme_minimal()
ggsave(
  filename = "histogram4.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = p,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)
p=ggplot(df1, aes(x = Possession)) +
  geom_histogram(binwidth = 1) + theme_minimal()
ggsave(
  filename = "histogram5.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = p,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)
p=ggplot(df1, aes(x = Pass)) +
  geom_histogram(binwidth = 1) + theme_minimal()
ggsave(
  filename = "histogram6.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = p,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)
p=ggplot(df1, aes(x = AerialsWon)) +
  geom_histogram(binwidth = 1) + theme_minimal()
ggsave(
  filename = "histogram7.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = p,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)

# 3) 박스플롯 저장 (이상치 시각화)
q=ggplot(df1, aes(y = Pts)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red") +
  labs(
    y = "Points (Pts)",
    title = "Distribution of Season Points"
  ) +
  theme_minimal()
ggsave(
  filename = "boxplot1.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = q,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)

q=ggplot(df1, aes(y = GD)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red") +
  labs(
    y = "GD",
    title = "Distribution of Season Points"
  ) +
  theme_minimal()
ggsave(
  filename = "boxplot2.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = q,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)

q=ggplot(df1, aes(y = shots_pg)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red") +
  labs(
    y = "shots_pg",
    title = "Distribution of Season Points"
  ) +
  theme_minimal()
ggsave(
  filename = "boxplot3.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = q,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)

q=ggplot(df1, aes(y = Goals)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red") +
  labs(
    y = "Goals",
    title = "Distribution of Season Points"
  ) +
  theme_minimal()
ggsave(
  filename = "boxplot4.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = q,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)

q=ggplot(df1, aes(y = Possession)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red") +
  labs(
    y = "Possession",
    title = "Distribution of Season Points"
  ) +
  theme_minimal()
ggsave(
  filename = "boxplot5.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = q,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)

q=ggplot(df1, aes(y = Pass)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red") +
  labs(
    y = "Pass",
    title = "Distribution of Season Points"
  ) +
  theme_minimal()
ggsave(
  filename = "boxplot6.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = q,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)

q=ggplot(df1, aes(y = AerialsWon)) +
  geom_boxplot(fill = "lightblue", outlier.color = "red") +
  labs(
    y = "AerialsWon",
    title = "Distribution of Season Points"
  ) +
  theme_minimal()
ggsave(
  filename = "boxplot7.jpg",  # 저장할 파일명 (작업 디렉토리 기준)
  plot     = q,                # 저장할 ggplot 객체
  width    = 6,                # 가로 길이 (단위: inch)
  height   = 4,                # 세로 길이
  dpi      = 300               # 해상도 (dot per inch)
)


# 4) 변수별 단항회귀 및 산점도
# GD vs Pts
jpeg("GD_vs_Pts.jpg", width = 800, height = 600, quality = 90)
cor1 <- data.frame(x = df1$GD, y = df1$Pts)
lm.fit <- lm(formula = y ~ x, data = cor1)
summary(lm.fit)
plot(cor1, xlab = "GD", ylab= "Pts")
abline(coef = lm.fit$coefficients, lty = 2, col="red")
cor(df1$GD, df1$Pts)
dev.off()
# shots_pg vs Pts
jpeg("shots_pg_vs_Pts.jpg", width = 800, height = 600, quality = 90)
cor2 <- data.frame(x = df1$shots_pg, y = df1$Pts)
lm.fit <- lm(formula = y ~ x, data = cor2)
summary(lm.fit)
plot(cor2,xlab = "shots_pg", ylab= "Pts")
abline(coef = lm.fit$coefficients, lty = 2, col="red")
cor(df1$shots_pg, df1$Pts)
dev.off()

# Goals vs Pts
jpeg("Goals_vs_Pts.jpg", width = 800, height = 600, quality = 90)
cor3 <- data.frame(x = df1$Goals, y = df1$Pts)
lm.fit <- lm(formula = y ~ x, data = cor3)
summary(lm.fit)
plot(cor3, xlab = "Goals", ylab= "Pts")
abline(coef = lm.fit$coefficients, lty = 2, col="red")
cor(df1$Goals, df1$Pts)
dev.off()


# Possession vs Pts
jpeg("Possession_vs_Pts.jpg", width = 800, height = 600, quality = 90)
cor4 <- data.frame(x = df1$Possession, y = df1$Pts)
lm.fit <- lm(formula = y ~ x, data = cor4)
summary(lm.fit)
plot(cor4,xlab = "Possession", ylab= "Pts")
abline(coef = lm.fit$coefficients, lty = 2, col="red")
cor(df1$Possession, df1$Pts)
dev.off()


# Pass vs Pts
jpeg("Pass_vs_Pts.jpg", width = 800, height = 600, quality = 90)
cor5 <- data.frame(x = df1$Pass, y = df1$Pts)
lm.fit <- lm(formula = y ~ x, data = cor5)
summary(lm.fit)
plot(cor5,xlab = "Pass", ylab= "Pts")
abline(coef = lm.fit$coefficients, lty = 2, col="red")
cor(df1$Pass, df1$Pts)
dev.off()


# AerialsWon vs Pts
jpeg("AerialsWon_vs_Pts.jpg", width = 800, height = 600, quality = 90)
cor6 <- data.frame(x = df1$AerialsWon, y = df1$Pts)
lm.fit <- lm(formula = y ~ x, data = cor6)
summary(lm.fit)
plot(cor6,xlab = "AerialsWon", ylab= "Pts")
abline(coef = lm.fit$coefficients, lty = 2, col="red")
cor(df1$AerialsWon, df1$Pts)
dev.off()

install.packages("corrplot")    # 이미 설치했다면 생략
library(corrplot)

# 상관행렬 계산 (결측값 있는 관측치는 제외)
vars <- c("Pts", "shots_pg", "Goals", "Possession", "Pass", "AerialsWon")
cor_mat <- cor(df1[, vars])

# 히트맵 그리기
jpeg("heatmap.jpg", width = 800, height = 600, quality = 90)
corrplot(
  cor_mat,
  method      = "color",       # 색상으로 표시
  type        = "full",       
  addCoef.col = "black",       # 셀 위에 상관계수 숫자 표시
  tl.col      = "black",       # 변수 이름 색상
  tl.srt      = 45,            # 변수 이름 회전 각도
  diag        = TRUE,         # 대각선(자기 자신)은 생략
  order       = "hclust",      # 유사도 기반 클러스터링 순서
  col         = colorRampPalette(c("navy", "white", "firebrick3"))(200)
)
dev.off()



# 다중회귀 분석 - backward elimination
library(car)
fit = lm(Pts~GD + Goals + shots_pg + Possession + Pass + AerialsWon,data = df1)
summary(fit)
vif(fit) # 다중공선성 진단

# 가장 p-value 높은 변수부터 단계별 제거
fit1 <- update(fit, . ~ . - AerialsWon)
summary(fit1)

fit2 <- update(fit1, . ~ . - Possession)
summary(fit2)

fit3 <- update(fit2, . ~ . -shots_pg)
summary(fit3)

fit4 <- update(fit3, . ~ . -Goals)
summary(fit4)

fit5 <- update(fit4, . ~ . -Pass)
summary(fit5)

# 최종 모델 진단 (잔차 정규성, 등분산성, 이상치·영향치)
vif(fit)
qqnorm(resid(fit5)); qqline(resid(fit5))
shapiro.test(resid(fit5))

plot(fit5, which=1)

std.resid <- rstandard(fit5)
which(abs(std.resid) > 3)

cd <- cooks.distance(fit5)
which(cd > 4/nrow(df1))

lev <- hatvalues(fit5)
threshold <- 2 * (length(coef(fit5))) / nrow(df1)
which(lev > threshold)


#GD제외 다중회귀모델
fit = lm(Pts~Goals + shots_pg + Possession + Pass + AerialsWon,data = df1)
summary(fit)
vif(fit)

# 가장 p-value 높은 변수부터 단계별 제거
fit1 <- update(fit, . ~ . - Possession)
summary(fit1)

# 최종 모델 진단 (잔차 정규성, 등분산성, 이상치·영향치)
vif(fit1)

qqnorm(resid(fit1)); qqline(resid(fit1))
shapiro.test(resid(fit1))

plot(fit1, which=1)

std.resid <- rstandard(fit1)
which(abs(std.resid) > 3)
cd <- cooks.distance(fit1)
which(cd > 4/nrow(df1))
lev <- hatvalues(fit1)
threshold <- 2 * (length(coef(fit1))) / nrow(df1)
which(lev > threshold)


# PCA 기반 회귀 모델
# 1) 주성분 찾아내기
pca_res <- prcomp(df1[, c("GD", "Goals")], scale. = TRUE)

# 2) 제1주성분(PC1) 추출하여 새로운 변수로 추가
df1$PC1_GDGoals <- pca_res$x[, 1]

# 3) PC1을 포함한 회귀모델 적합
fit_pca <- lm(Pts ~ PC1_GDGoals + shots_pg + Possession + Pass + AerialsWon, data = df1)

# 4) 가장 p-value 높은 변수부터 단계별 제거
summary(fit_pca)
vif(fit_pca)

fit1 <- update(fit_pca, . ~ . - Possession)
summary(fit1)

fit2 <- update(fit1, . ~ . -shots_pg)
summary(fit2)

fit3 <- update(fit2, . ~ . -Pass)
summary(fit3)

# 최종 모델 진단 (잔차 정규성, 등분산성, 이상치·영향치)
qqnorm(resid(fit3)); qqline(resid(fit3))
shapiro.test(resid(fit3))

plot(fit3, which=1)

std.resid <- rstandard(fit3)
which(abs(std.resid) > 3)
cd <- cooks.distance(fit3)
which(cd > 4/nrow(df1))
lev <- hatvalues(fit3)
threshold <- 2 * (length(coef(fit3))) / nrow(df1)
which(lev > threshold)