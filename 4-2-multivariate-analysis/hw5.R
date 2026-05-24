# Problem 4: Factor Analysis 

# 0. 패키지 로드 
install.packages("psych")
library(psych)

# 1. 상관행렬 
cors <- matrix(c(
  1,     0.738, 0.731, 0.828, 0.681, 0.712, 0.625, 0.604,
  0.738, 1,     0.520, 0.688, 0.831, 0.543, 0.322, 0.303,
  0.731, 0.520, 1,     0.652, 0.513, 0.826, 0.579, 0.617,
  0.828, 0.688, 0.652, 1,     0.887, 0.867, 0.639, 0.563,
  0.681, 0.831, 0.513, 0.887, 1,     0.692, 0.419, 0.352,
  0.712, 0.543, 0.826, 0.867, 0.692, 1,     0.608, 0.610,
  0.625, 0.322, 0.579, 0.639, 0.419, 0.608, 1,     0.937,
  0.604, 0.303, 0.617, 0.563, 0.352, 0.610, 0.937, 1
), nrow = 8, byrow = TRUE)

colnames(cors) <- rownames(cors) <- c("HRA","HRE","HRS",
                                      "RRA","RRE","RRS","Q","REV")

# 2. (1) PC method: 고유값, 누적분산, scree plot

# 고유값
eigvals <- eigen(cors)$values
eigvals           
eigvals / sum(eigvals)  
cumsum(eigvals / sum(eigvals))  

# scree plot 
pc <- princomp(covmat = cors)
screeplot(pc, type = "lines", main = "Scree plot for profitability data")

# 3. (2) m = 3, varimax 회전 factor 분석
fa3 <- principal(r = cors, nfactors = 3, rotate = "varimax")
print(fa3$loadings, cutoff = 0.0)    
     

# 4. (3) Communality와 Ψ 계산
Lhat <- as.matrix(fa3$loadings)  
h2   <- rowSums(Lhat^2)           
psi  <- 1 - h2                    
Psi  <- diag(psi)                 

h2    
psi   
Psi

# 5. (4) 잔차행렬: R - L L^T - Ψ 
Rhat  <- Lhat %*% t(Lhat) + Psi  
resid <- cors - Rhat              
round(resid, 3)                 

# 6. (5) 요인 해석
print(fa3$loadings, cutoff = 0.4)
#    Factor 1: accounting-based profitability
#    Factor 2: market-value based profitability
#    Factor 3: sales/turnover oriented profitability

