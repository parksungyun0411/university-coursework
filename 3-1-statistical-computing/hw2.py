import pandas as pd
import numpy as np
import scipy as sp

 

#(3.)

A=np.array([[1,-1,4],[-1,1,3],[4,3,2]])

B=np.array([[3,-2,4],[-2,1,0],[4,0,5]])

x=np.array([1,-2,4])

y=np.array([3,2,1])

 

#(a)

A+B

#(b)

A.transpose()

#(c)

np.matmul(np.matmul(x.transpose(),A),y)

#(d)

np.dot(x,x)

#(e)

np.matmul(np.matmul(x.transpose(),A),x)

#(f)

np.dot(x,y)

#(g)

np.matmul(A.transpose(),A)

#(h)

np.matmul(A,B)

#(i)

np.matmul(y.transpose(),B)

#(j)

np.matmul(x,x.transpose())

#(k)

x+y

#(l)

x-y

#(m)

(x-y).transpose()

#(n)

np.matmul(x,y.transpose())

#(o)

A-B

#(p)

A.transpose() + B.transpose()

#(q)

(A+B).transpose()

#(r)

3*x

#(s)
np.dot(x,y)**2

#(t)

np.matmul(B,A)

#(u)

invA=np.linalg.inv(A)

invA

 

4.

#(a)

a=np.tile("a",8)

#(b)

b=np.repeat(np.arange(1,6),3)

#(c)

c=np.arange(start=1,stop=100,step=2)

#(d)

d=np.array([1,5,19,30])

#(e)

e=np.arange(start=-10,stop=10,step=1)

 

5.

x=np.arange(start=1,stop=11,step=1)

#(a)

len(x)

#(b)

np.sum(x)

#(c)

np.average(x)

#(d)

np.var(x,ddof=1)

np.std(x,ddof=1)

#(e)

odd=x[x%2==1]

#(f)
result = 0
for i in range(1,len(x)+1):
    result += x[i-1]/i

result