#HW6 exercises on discrimination and classification

#1-1
setosa <- data.frame(
  SL = c(
    5.1,4.9,4.7,4.6,5.0,5.4,4.6,5.0,4.4,4.9,
    5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,
    5.4,5.1,4.6,5.1,4.8,5.0,5.0,5.2,5.2,4.7,
    4.8,5.4,5.2,5.5,4.9,5.0,5.5,4.9,4.4,5.1,
    5.0,4.5,4.4,5.0,5.1,4.8,5.1,4.6,5.3,5.0
  ),
  SW = c(
    3.5,3.0,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,
    3.7,3.4,3.0,3.0,4.0,4.4,3.9,3.5,3.8,3.8,
    3.4,3.7,3.6,3.3,3.4,3.0,3.4,3.5,3.4,3.2,
    3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3.0,3.4,
    3.5,2.3,3.2,3.5,3.8,3.0,3.8,3.2,3.7,3.3
  ),
  PL = c(
    1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,
    1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,
    1.7,1.5,1.0,1.7,1.9,1.6,1.6,1.5,1.4,1.6,
    1.6,1.5,1.5,1.4,1.5,1.2,1.3,1.4,1.3,1.5,
    1.3,1.3,1.3,1.6,1.9,1.4,1.6,1.4,1.5,1.4
  ),
  PW = c(
    0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,
    0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,
    0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2,
    0.2,0.4,0.1,0.2,0.2,0.2,0.2,0.1,0.2,0.2,
    0.2,0.3,0.2,0.6,0.4,0.3,0.2,0.2,0.2,0.2
  ),
  cla = factor(rep(1,50))
)

versicolor <- data.frame(
  SL = c(
    7.0,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,
    5.0,5.9,6.0,6.1,5.6,6.7,5.6,5.8,6.2,5.6,
    5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6.0,5.7,
    5.5,5.5,5.8,6.0,5.4,6.0,6.7,6.3,5.6,5.5,
    5.5,6.1,5.8,5.0,5.6,5.7,5.7,6.2,5.1,5.7
  ),
  SW = c(
    3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,
    2.0,3.0,2.2,2.9,2.9,3.1,3.0,2.7,2.2,2.5,
    3.2,2.8,2.5,2.8,2.9,3.0,2.8,3.0,2.9,2.6,
    2.4,2.4,2.7,2.7,3.0,3.4,3.1,2.3,3.0,2.5,
    2.6,3.0,2.6,2.3,2.7,3.0,2.9,2.9,2.5,2.8
  ),
  PL = c(
    4.7,4.5,4.9,4.0,4.6,4.5,4.7,3.3,4.6,3.9,
    3.5,4.2,4.0,4.7,3.6,4.4,4.5,4.1,4.5,3.9,
    4.8,4.0,4.9,4.7,4.3,4.4,4.8,5.0,4.5,3.5,
    3.8,3.7,3.9,5.1,4.5,4.5,4.7,4.4,4.1,4.0,
    4.4,4.6,4.0,3.3,4.2,4.2,4.2,4.3,3.0,4.1
  ),
  PW = c(
    1.4,1.5,1.5,1.3,1.5,1.3,1.6,1.0,1.3,1.4,
    1.0,1.5,1.0,1.4,1.3,1.4,1.5,1.0,1.5,1.1,
    1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1.0,
    1.1,1.0,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,
    1.2,1.4,1.2,1.0,1.3,1.2,1.3,1.3,1.1,1.3
  ),
  cla = factor(rep(2,50))
)

virginica <- data.frame(
  SL = c(
    6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,
    6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6.0,
    6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,
    7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6.0,6.9,
    6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9
  ),
  SW = c(
    3.3,2.7,3.0,2.9,3.0,3.0,2.5,2.9,2.5,3.6,
    3.2,2.7,3.0,2.5,2.8,2.7,3.0,2.6,3.8,2.2,
    3.2,2.8,2.8,2.7,3.3,3.2,2.8,3.0,2.8,3.0,
    2.8,3.8,2.8,2.8,2.6,3.0,2.5,2.8,3.0,3.1,
    3.1,3.1,2.7,3.2,3.3,3.0,2.5,3.0,3.4,3.0
  ),
  PL = c(
    6.0,5.1,5.9,5.6,5.8,6.6,4.5,6.3,5.8,6.1,
    5.1,5.3,5.5,5.0,5.1,5.3,5.5,6.7,6.9,5.0,
    5.7,4.9,6.7,4.9,5.7,6.0,4.8,4.9,5.6,5.8,
    6.1,6.4,5.6,5.1,5.6,6.1,5.0,5.2,4.8,5.4,
    5.6,5.1,5.1,5.9,5.7,5.2,5.0,5.2,5.4,5.1
  ),
  PW = c(
    2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,
    2.0,1.9,2.1,2.0,2.4,1.9,1.8,2.2,2.3,1.5,
    2.3,2.0,2.0,1.8,2.1,1.8,1.8,1.8,2.1,1.6,
    1.9,2.0,2.2,1.5,1.4,2.3,1.9,2.0,1.8,2.1,
    2.4,2.3,1.9,2.3,2.5,2.3,1.9,2.0,2.3,1.8
  ),
  cla = factor(rep(3,50))
)

irises <- rbind(setosa, versicolor, virginica)
str(irises)

library(MASS)

# LDA
ld_iri <- lda(cla ~ SL+SW+PL+PW, data=irises)
ld_iri

# QDA
qd_iri <- qda(cla ~ SL+SW+PL+PW, data=irises)
qd_iri

#1-2
new <- data.frame(SL=6.0, SW=2.5, PL=4.0, PW=1.1)
predict(ld_iri, new)$class

#2-1
# ===============================
# Table 11.4 Bankruptcy Data
# ===============================

bank <- data.frame(
  X1 = c(
    -0.45,-0.56, 0.06,-0.07,-0.10,-0.14, 0.04,-0.06, 0.07,-0.13,
    -0.23, 0.07, 0.01,-0.28, 0.15, 0.37,-0.08, 0.05, 0.01, 0.12,-0.28,
     0.51, 0.08, 0.38, 0.19, 0.32, 0.31, 0.12,-0.02, 0.22, 0.17,
     0.15,-0.10, 0.14, 0.14, 0.15, 0.16, 0.29, 0.54,-0.33, 0.48,
     0.56, 0.20, 0.47, 0.17, 0.58
  ),

  X3 = c(
    1.09,1.51,1.01,1.45,1.56,0.71,1.50,1.37,1.37,1.42,
    0.33,1.31,2.15,1.19,1.88,1.99,1.51,1.68,1.26,1.14,1.27,
    2.049,2.01,3.27,2.25,4.24,4.45,2.52,2.05,2.35,1.80,
    2.17,2.50,0.46,2.61,2.23,2.31,1.84,2.33,3.01,1.24,
    4.29,1.99,2.92,2.45,5.06
  ),

  group = factor(c(
    rep(0,21),  # bankrupt
    rep(1,25)   # non-bankrupt
  ))
)

# 집단 평균
xbar <- aggregate(cbind(X1, X3) ~ group, bank, mean)

xbar1 <- as.matrix(xbar[1, 2:3])  # π1: bankrupt
xbar2 <- as.matrix(xbar[2, 2:3])  # π2: non-bankrupt

xbar1 <- t(xbar1)   
xbar2 <- t(xbar2)
# 공분산
S1 <- cov(bank[bank$group == 0, c("X1","X3")])
S2 <- cov(bank[bank$group == 1, c("X1","X3")])

n1 <- sum(bank$group == 0)
n2 <- sum(bank$group == 1)

Spooled <- ((n1-1)*S1 + (n2-1)*S2)/(n1+n2-2)



# Fisher 계수 a = S_pooled^{-1}(x̄1 − x̄2)
a <- solve(Spooled) %*% (xbar1 - xbar2)
a

MD1 <- mahalanobis(bank[,c("X1","X3")], xbar1, Spooled)
MD2 <- mahalanobis(bank[,c("X1","X3")], xbar2, Spooled)

pred <- ifelse(MD1 < MD2, 0, 1)

table(bank$group, pred)

APER <- mean(pred != bank$group)
APER

# 절편 m̂
mhat <- 0.5 * as.numeric(t(a) %*% (xbar1 + xbar2))
mhat

# scatter
plot(bank$X1, bank$X3,
     col=as.numeric(bank$group)+1, pch=19,
     xlab="X1 (CF/TD)", ylab="X3 (CA/CL)")

# 판별직선
xseq <- seq(min(bank$X1), max(bank$X1), length=100)
yseq <- (mhat - a[1]*xseq)/a[2]
lines(xseq, yseq, lwd=2)

legend("topright",
       legend=c("bankrupt","non-bankrupt"),
       col=c(2,3), pch=19)

#2-2-1
# bankrupt row 16 제거
bank_m16 <- bank[-16, ]

# 집단 평균
xbar_m16 <- aggregate(cbind(X1, X3) ~ group, bank_m16, mean)

xbar1_m16 <- t(as.matrix(xbar_m16[1,2:3]))  # bankrupt
xbar2_m16 <- t(as.matrix(xbar_m16[2,2:3]))  # non-bankrupt

# 공분산
S1_m16 <- cov(bank_m16[bank_m16$group==0, c("X1","X3")])
S2_m16 <- cov(bank_m16[bank_m16$group==1, c("X1","X3")])

n1 <- sum(bank_m16$group==0)
n2 <- sum(bank_m16$group==1)

Spooled_m16 <- ((n1-1)*S1_m16 + (n2-1)*S2_m16)/(n1+n2-2)

# Fisher 계수
a_m16 <- solve(Spooled_m16) %*% (xbar1_m16 - xbar2_m16)

# 절편
mhat_m16 <- 0.5 * as.numeric(t(a_m16) %*% (xbar1_m16 + xbar2_m16))

# 분류 + APER
MD1_m16 <- mahalanobis(bank_m16[,c("X1","X3")], xbar1_m16, Spooled_m16)
MD2_m16 <- mahalanobis(bank_m16[,c("X1","X3")], xbar2_m16, Spooled_m16)

pred_m16 <- ifelse(MD1_m16 < MD2_m16, 0, 1)
APER_m16 <- mean(pred_m16 != bank_m16$group)

a_m16
mhat_m16
APER_m16

# non-bankrupt row 13 제거
bank_m13 <- bank[-(21+13), ]

# 집단 평균
xbar_m13 <- aggregate(cbind(X1, X3) ~ group, bank_m13, mean)

xbar1_m13 <- t(as.matrix(xbar_m13[1,2:3]))
xbar2_m13 <- t(as.matrix(xbar_m13[2,2:3]))

# 공분산
S1_m13 <- cov(bank_m13[bank_m13$group==0, c("X1","X3")])
S2_m13 <- cov(bank_m13[bank_m13$group==1, c("X1","X3")])

n1 <- sum(bank_m13$group==0)
n2 <- sum(bank_m13$group==1)

Spooled_m13 <- ((n1-1)*S1_m13 + (n2-1)*S2_m13)/(n1+n2-2)

# Fisher 계수
a_m13 <- solve(Spooled_m13) %*% (xbar1_m13 - xbar2_m13)

# 절편
mhat_m13 <- 0.5 * as.numeric(t(a_m13) %*% (xbar1_m13 + xbar2_m13))

# 분류 + APER
MD1_m13 <- mahalanobis(bank_m13[,c("X1","X3")], xbar1_m13, Spooled_m13)
MD2_m13 <- mahalanobis(bank_m13[,c("X1","X3")], xbar2_m13, Spooled_m13)

pred_m13 <- ifelse(MD1_m13 < MD2_m13, 0, 1)
APER_m13 <- mean(pred_m13 != bank_m13$group)

a_m13
mhat_m13
APER_m13

plot(bank$X1, bank$X3,
     col=as.numeric(bank$group)+1, pch=19,
     xlab="X1 (CF/TD)", ylab="X3 (CA/CL)")

xseq <- seq(min(bank$X1), max(bank$X1), length=100)

# 원래
y0 <- (mhat - a[1]*xseq)/a[2]
lines(xseq, y0, lwd=2)

# row 16 제거
y16 <- (mhat_m16 - a_m16[1]*xseq)/a_m16[2]
lines(xseq, y16, lwd=2, lty=2)

# row 13 제거
y13 <- (mhat_m13 - a_m13[1]*xseq)/a_m13[2]
lines(xseq, y13, lwd=2, lty=3)

legend("topright",
       legend=c("original","remove row 16","remove row 13"),
       lwd=2, lty=c(1,2,3))


