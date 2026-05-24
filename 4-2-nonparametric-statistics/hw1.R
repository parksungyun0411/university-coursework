#202012349 스마트ICT융합공학과 박성윤
#1 Consider trees data in R. You can load the data by data(trees) 
#(a)Compute mean and variance of Girth, Height and Volume.
mean(trees$Girth)
var(trees$Girth)
mean(trees$Height)
var(trees$Height)
mean(trees$Volume)
var(trees$Volume)

#(b) Create histogram of Girth. 
hist(trees$Girth, main="Girth histogram")

#(c) Create boxplot of Height.
boxplot(trees$Height, main="Height boxplot")

#2. Consider the sleep deprivation example we discussed in the class.
#(a) Compute mean and variance of Wilcoxon signed rank statistics under H0.
pre = c(1.83,0.50,1.62,2.48,1.68,1.88,1.55,3.06,1.30) 
post = c(0.878,0.647,0.598,2.050,1.060,1.290,1.060,3.140,1.290) 
z = post- pre

#(b) Compute the median estimator from Walsh’s averages and 95% two-sided confidence interval for
median H0.
#3. Consider junior and senior example in the class. Compute Wilcoxon rank sum statistics under H0 
#and do the hypothesis testing with H1 : θ ̸= 0.