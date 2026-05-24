#HW4 202012349 스마트ICT융합공학과 박성윤
# 1-(a) Parametric bootstrap

data(faithful)
eru <- faithful$eruptions
n <- length(eru)
B <- 1000   

hatmu  <- mean(eru)
hatsig <- sd(eru)
Vec <- numeric(B)

set.seed(123)
for (i in 1:B){
  Xb <- rnorm(n, hatmu, hatsig)   
  Vec[i] <- mean(Xb)              
}

MSE_par <- mean((Vec - hatmu)^2)
MSE_par


# 1-(b) Nonparametric bootstrap

data(faithful)
eru <- faithful$eruptions
n <- length(eru)
B <- 1000

hatmean <- mean(eru)
Vec <- numeric(B)

set.seed(123)
for (i in 1:B){
  Xb <- sample(eru, size=n, replace=TRUE)  
  Vec[i] <- mean(Xb)
}

MSE_nonpar <- mean((Vec - hatmean)^2)
MSE_nonpar


# 2-(a) Plot time as predictor and acceleration as a dependent variable
library(MASS)
data(mcycle)

plot(mcycle$time, mcycle$accel,
     xlab = "Time (ms)",
     ylab = "Acceleration (g)",
     main = "Motorcycle Accident Data: Time vs Acceleration")


# 2-(b) Local regression + Kernel regression

library(MASS)
data(mcycle)

# 1)local regression
loess.gcv <- function(x, y){
  nobs <- length(y)
  xs <- sort(x, index.return = TRUE)
  x <- xs$x
  y <- y[xs$ix]
  tune.loess <- function(s){
    lo <- loess(y ~ x, span = s)
    mean((lo$fitted - y)^2) / (1 - lo$trace.hat/nobs)^2
  }
  os <- optimize(tune.loess, interval = c(0.01, 1))$minimum
  lo <- loess(y ~ x, span = os)
  list(x = x, y = lo$fitted, df = lo$trace.hat, span = os)
}

locreg <- with(mcycle, loess.gcv(times, accel))
plot(mcycle$times, mcycle$accel, pch=19, col="gray",
     xlab="Times (ms)", ylab="Acceleration (g)",
     main="Local Regression")
lines(locreg$x, locreg$y, col="red", lwd=2)


# 2)Kernel regression
ksmooth.gcv <- function(x, y){
  nobs <- length(y)
  xs <- sort(x, index.return = TRUE)
  x <- xs$x
  y <- y[xs$ix]
  xdif <- outer(x, x, "-")
  tune.ksmooth <- function(h){
    xden <- dnorm(xdif / h)
    xden <- xden / rowSums(xden)
    df <- sum(diag(xden))
    fit <- xden %*% y
    mean((fit - y)^2) / (1 - df/nobs)^2
  }
  xrng <- diff(range(x))
  oh <- optimize(tune.ksmooth, interval = c(xrng/length(x), xrng))$minimum
  xden <- dnorm(xdif / oh)
  xden <- xden / rowSums(xden)
  df <- sum(diag(xden))
  fit <- xden %*% y
  list(x = x, y = fit, df = df, h = oh)
}

kern <- with(mcycle, ksmooth.gcv(times, accel))
plot(mcycle$times, mcycle$accel, pch=19, col="gray",
     xlab="Times (ms)", ylab="Acceleration (g)",
     main="Kernel Regression")
lines(kern$x, kern$y, col="blue", lwd=2)


# 3)Plot
plot(mcycle$times, mcycle$accel, pch=19, col="gray",
     xlab="Times (ms)", ylab="Acceleration (g)",
     main="Local Regression vs Kernel Regression")

lines(locreg$x, locreg$y, col="red", lwd=2)
lines(kern$x, kern$y, col="blue", lwd=2)
legend("topleft",
       legend=c("Local regression", "Kernel regression"),
       col=c("red","blue"), lwd=2)

