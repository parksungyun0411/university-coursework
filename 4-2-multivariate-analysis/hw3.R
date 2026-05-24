# 데이터
X <- c(7.1, 7.4, 7.2, 8.3, 9.4, 10.5, 11.4)
Y <- c(2.8, 2.9, 2.7, 2.6, 3.5, 4.6, 5.0)
n <- length(X)

# 관측 Kendall's tau
tau.obs <- cor(X, Y, method = "kendall")

# 1-c 비모수 부트스트랩
B <- 10000
tau.star <- numeric(B)
Z <- cbind(X, Y)

set.seed(123)
for (b in 1:B) {
  Zb <- Z[sample(1:n, size = n, replace = TRUE), ]
  tau.star[b] <- cor(Zb[,1], Zb[,2], method = "kendall")
}

# one-side p-value
p.boot <- mean(tau.star <= 0)

# percentile 95% CI
ci.boot <- quantile(tau.star, probs = c(0.025, 0.975))

tau.obs
p.boot
ci.boot


# 1-d permcor 함수 정의
permcor <- function(x,y,method="kendall",nsamp=10000,
                    alternative=c("two.sided","less","greater")){
  n = length(x)
  if(n!=length(y)) stop("lengths of x and y must match")
  theta.hat = cor(x,y,method=method)
  gmat = replicate(nsamp,sample.int(n))
  theta.mc = apply(gmat,2,function(g){cor(x,y[g],method=method)})
  if(alternative[1]=="less"){
    aslperm = sum(theta.mc <= theta.hat) / nsamp
  } else if(alternative[1]=="greater"){
    aslperm = sum(theta.mc >= theta.hat) / nsamp
  } else{
    aslperm = sum(abs(theta.mc) >= abs(theta.hat)) / nsamp
  }
  list(theta.hat=theta.hat,theta.mc=theta.mc,asl=aslperm)
}


# Kendall's tau permutation test
set.seed(123)
ptest <- permcor(X, Y, method = "kendall",
                 nsamp = 10000,
                 alternative = "greater")

ptest$theta.hat  # 관측 Kendall's tau
ptest$asl        # permutation p-value (one-sided)



# 2-(a) Fisher's Exact Test
# 2x2 table 
xtab <- matrix(c(29, 21,  
                 7,  30),  
               nrow = 2, byrow = TRUE)

colnames(xtab) <- c("Yes", "No")
rownames(xtab) <- c("Battered", "NonBattered")

xtab

# Fisher's exact test (two-sided)
fisher.test(xtab, alternative = "two.sided")
