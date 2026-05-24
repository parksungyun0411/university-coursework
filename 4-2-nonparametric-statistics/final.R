#final exam for nonparametric statistics
#202012349 Park sung yun

#1-a
y <- c(1232,751,339,848,447,542,302,57,521,278,176,201,839,342,473,1128,242,475)
treat <- c(rep("A",6),rep("B",6),rep("C",6))
dataa <- data.frame(y=y, treat=treat)
kruskal.test(y,treat)

#1-b
result <- lm(y~as.factor(treat),data=dataa)
summary(result)

#2-a
library(MASS)
data(Boston)
result <- lm(medv ~ crim + age + dis + tax + black, data=Boston)
summary(result)

#2-b
summary(result)

#2-c
library(MASS)
data(Boston)

set.seed(123)
B <- 200
n <- nrow(Boston)
Z <- Boston
Vec <- matrix(NA, nrow=B, ncol=6)
for (i in 1:B){
	Zb <- Z[sample(1:n, size=n, replace=TRUE),]
	fitb <- lm(medv ~ crim + age  +dis + tax + black, data=Zb)
	Vec[i,] <- coef(fitb)
}
boot_se <- apply(Vec, 2, sd)
boot_se

#3-a
ethanol <- read.csv("C:/Users/psyreo/Desktop/ethanol.csv")
ethanol$NOx <- ethanol$NOx[order(ethanol$E)] 
ethanol$E <- sort(ethanol$E)

result = lm(NOx ~ E, data=ethanol)
summary(result) 

#3-b
loess.gcv <- function(x,y){
	nobs <- length(y)
	xs <- sort(x, index.return = TRUE)
	x <- xs$x
	y <- y[xs$ix]
	tune.loess <- function(s){
		lo <- loess(y~x, span = s)
		mean((lo$fitted - y)^2) / (1-lo$trace.hat/nobs)^2
	}
	os <- optimize(tune.loess, interval = c(0.01, 0.99))$minimum
	lo <- loess(y~x, span = os)
	list(x=x, y=lo$fitted, df = lo$trace.hat, span=os)
}

locreg <- loess.gcv(ethanol$E, ethanol$NOx)
locreg$y
locreg$span

#3-c
ksmooth.gcv <- function(x,y){
	nobs <- length(y)
	xs <- sort(x, index.return = TRUE)
	x <- xs$x
	y <- y[xs$ix]
	xdif <- outer(x,x,FUN="-")
	tune.ksmooth <- function(h){
		xden <- dnorm(xdif / h)
		xden <- xden / rowSums(xden)
		df <- sum(diag(xden))
		fit <- xden %*% y
		mean((fit - y)^2) / (1-df/nobs)^2
	}
	xrng <- diff(range(x))
	oh <- optimize(tune.ksmooth, interval = c(xrng/nobs, xrng))$minimum
	xden <- dnorm(xdif/oh)
	xden <- xden/rowSums(xden)
	df <- sum(diag(xden))
	fit <- xden %*% y
	list(x=x, y=fit, df=df, h=oh)
}

kern <- ksmooth.gcv(ethanol$E, ethanol$NOx)
kern$h

#3-d
result <- lm(NOx ~ E, data=ethanol)

plot(ethanol$E, ethanol$NOx, xlab="E", ylab="NOx", main = "Linear, Local Linear and Kernel Regression")

abline(result, lwd=2)

lines(locreg$x, locreg$y, lwd =2, col = "red", lty = 2)

lines(kern$x, kern$y, lwd=2, col="blue", lty=3)

legend("topright", legend =c("Linear regression", "Loess", "Ksmooth"),
	lwd=2, lty=1:3, col=c("black", "red","blue"), bty="n")

#4-a
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
data(ptitanic)

fit <- rpart(survived ~ pclass + sex + age + sibsp + parch, data=ptitanic, method="class")
rpart.plot(fit)

#4-b
printcp(fit)
plotcp(fit)
